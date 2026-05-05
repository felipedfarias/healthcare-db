CREATE TABLE pacientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    cpf TEXT UNIQUE,
    data_nascimento DATE,
    telefone TEXT
);

CREATE TABLE medicos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    especialidade TEXT,
    crm TEXT UNIQUE
);

CREATE TABLE consultas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER,
    medico_id INTEGER,
    data_consulta DATETIME,
    status TEXT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

CREATE TABLE prontuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    consulta_id INTEGER,
    descricao TEXT,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);