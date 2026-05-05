### Caso 1: Cadastro de paciente duplicado
Entrada: CPF já existente
Esperado: Erro de duplicidade

### Caso 2: Consulta sem paciente
Entrada: paciente_id inexistente
Esperado: Erro de chave estrangeira

### Caso 3: Consulta no passado
Entrada: data anterior à atual
Esperado: Sistema deve validar ou permitir conforme regra