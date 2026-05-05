INSERT INTO pacientes (nome, cpf, data_nascimento, telefone)
VALUES 
('João Silva', '123.456.789-00', '1990-05-10', '81999999999'),
('Maria Souza', '987.654.321-00', '1985-08-20', '81988888888');

INSERT INTO medicos (nome, especialidade, crm)
VALUES
('Dr. Carlos', 'Clínico Geral', 'CRM12345'),
('Dra. Ana', 'Pediatra', 'CRM67890');

INSERT INTO consultas (paciente_id, medico_id, data_consulta, status)
VALUES
(1, 1, '2026-05-10 10:00:00', 'Agendada'),
(2, 2, '2026-05-11 14:00:00', 'Realizada');