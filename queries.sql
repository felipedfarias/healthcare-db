-- Listar consultas com nome do paciente e médico
SELECT 
    p.nome AS paciente,
    m.nome AS medico,
    c.data_consulta,
    c.status
FROM consultas c
JOIN pacientes p ON c.paciente_id = p.id
JOIN medicos m ON c.medico_id = m.id;

-- Consultas futuras
SELECT * FROM consultas
WHERE data_consulta > NOW();

-- Quantidade de consultas por médico
SELECT 
    m.nome,
    COUNT(c.id) AS total_consultas
FROM medicos m
LEFT JOIN consultas c ON m.id = c.medico_id
GROUP BY m.nome;