#  Sistema de Gestão de Clínica (HealthCare DB)

##  Sobre o projeto

Este projeto consiste na modelagem e implementação de um banco de dados relacional para simular o funcionamento de uma clínica médica.

O objetivo é organizar e gerenciar informações como:

* Pacientes
* Médicos
* Consultas
* Prontuários

Além disso, o projeto foi utilizado para prática de SQL, testes de integridade e simulação de cenários reais de negócio.

---

##  Problema que o projeto resolve

Em clínicas médicas, o controle de atendimentos, histórico de pacientes e agenda de médicos precisa ser organizado e confiável.

Este sistema permite:

* Registrar pacientes e médicos
* Controlar consultas
* Manter histórico de atendimentos
* Garantir integridade dos dados (evitando duplicidade e inconsistências)

---

##  Estrutura do banco de dados

O banco é composto pelas seguintes tabelas:

* **pacientes** → dados pessoais dos pacientes
* **medicos** → informações dos profissionais
* **consultas** → agendamentos e atendimentos
* **prontuarios** → histórico de consultas

###  Relacionamentos

* Um paciente pode ter várias consultas
* Um médico pode atender várias consultas
* Cada consulta pode gerar um prontuário

---

##  Tecnologias utilizadas

* SQL
* SQLite

---

## Como executar o projeto

### 1. Abrir o banco

Utilize o DB Browser for SQLite ou SQLite no terminal.

### 2. Criar as tabelas

Execute o arquivo:

```
schema.sql
```

### 3. Inserir dados

Execute:

```
inserts.sql
```

### 4. Rodar consultas

Execute:

```
queries.sql
```

---

##  Exemplos de consultas

###  Consultas futuras

```sql
SELECT * FROM consultas
WHERE data_consulta > datetime('now');
```

###  Consultas com paciente e médico

```sql
SELECT 
    p.nome AS paciente,
    m.nome AS medico,
    c.data_consulta,
    c.status
FROM consultas c
JOIN pacientes p ON c.paciente_id = p.id
JOIN medicos m ON c.medico_id = m.id;
```

###  Total de consultas por médico

```sql
SELECT 
    m.nome,
    COUNT(c.id) AS total_consultas
FROM medicos m
LEFT JOIN consultas c ON m.id = c.medico_id
GROUP BY m.nome;
```

---

##  Testes realizados (QA)

Foram simulados cenários de erro para validar integridade do sistema:

*  Cadastro de paciente com CPF duplicado
*  Consulta com paciente inexistente
*  Violação de chave estrangeira

Esses testes garantem a consistência dos dados no banco.

---

##  Aprendizados

Durante o desenvolvimento deste projeto, foram praticados:

* Modelagem de banco de dados relacional
* Uso de chaves primárias e estrangeiras
* Criação de consultas SQL com JOIN
* Adaptação de scripts entre MySQL e SQLite
* Testes de integridade e validação de dados

---

##  Autor

Felipe Farias

---

##  Possíveis melhorias

* Integração com API (Node.js)
* Interface web para visualização
* Relatórios mais avançados
* Controle de agenda médica

---
