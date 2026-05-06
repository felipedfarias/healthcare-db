PRAGMA foreign_keys = ON;

-- =========================
-- TABELA PACIENTES
-- =========================
CREATE TABLE pacientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone TEXT,
    
    CHECK (length(cpf) >= 11)
);

-- =========================
-- TABELA MEDICOS
-- =========================
CREATE TABLE medicos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT NOT NULL,
    crm TEXT UNIQUE NOT NULL
);

-- =========================
-- TABELA CONSULTAS
-- =========================
CREATE TABLE consultas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER NOT NULL,
    medico_id INTEGER NOT NULL,
    data_consulta DATETIME NOT NULL,
    status TEXT NOT NULL DEFAULT 'agendada',

    FOREIGN KEY (paciente_id) 
        REFERENCES pacientes(id) 
        ON DELETE RESTRICT,

    FOREIGN KEY (medico_id) 
        REFERENCES medicos(id) 
        ON DELETE RESTRICT,

    CHECK (status IN ('agendada', 'concluida', 'cancelada'))
);

-- =========================
-- TABELA PRONTUARIOS
-- =========================
CREATE TABLE prontuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    consulta_id INTEGER NOT NULL,
    descricao TEXT NOT NULL,

    FOREIGN KEY (consulta_id) 
        REFERENCES consultas(id)
        ON DELETE CASCADE
);

-- =========================
-- TRIGGER: VALIDAR DATA DA CONSULTA
-- =========================
CREATE TRIGGER validar_update_data_consulta
BEFORE UPDATE ON consultas
FOR EACH ROW
BEGIN
    SELECT
    CASE
        WHEN NEW.data_consulta < datetime('now')
        THEN RAISE(ABORT, 'Data da consulta inválida')
    END;
END;