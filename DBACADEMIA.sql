CREATE DATABASE DBACADEMIA;
USE DBACADEMIA;



-- Queries e seus resultados
SELECT SUM(valor) AS "Total Arrecadado"
FROM PAGAMENTOS WHERE statuss = 'PAGO';

SELECT C.cliente_nome AS "Nome Cliente",
       C.cliente_telefone AS "Cliente Telefone",
       C.cliente_status AS "Status do Cliente",
       P.nome AS "Nome Plano",
       PA.statuss AS "Status Pagamento",
       PA.data_pagamento AS "Data Pagamento"
FROM CLIENTE C 
JOIN PAGAMENTOS PA ON C.ID_cliente = PA.cliente_fk
JOIN PLANOS P ON PA.planos_fk = P.ID_planos;

SELECT C.cliente_nome AS "Nome Cliente",
       C.cliente_status AS "Status Cliente",
       P.nome AS "Plano",
       PA.statuss AS "Status Pagamento"
FROM CLIENTE C 
JOIN PAGAMENTOS PA ON C.ID_cliente = PA.cliente_fk
JOIN PLANOS P ON PA.planos_fk = P.ID_planos
WHERE PA.statuss <> 'PAGO';

SELECT C.cliente_nome AS "Nome Cliente",
       C.cliente_status AS "Status Cliente",
       F.feedback_avaliacao AS "Avaliação",
       F.feedback_sugestao AS "Sugestão"
FROM CLIENTE C 
JOIN FEEDBACK F ON C.ID_cliente = F.ID_cliente;

SELECT funcionario_nome AS "Nome Funcionario", 
       funcionario_hora_inicio AS "Inicio", 
       funcionario_hora_fim
FROM FUNCIONARIO
WHERE '18:00' BETWEEN funcionario_hora_inicio AND funcionario_hora_fim;

SELECT T.data_treino, 
       F.funcionario_nome, 
       P.nome AS plano_nome
FROM TREINO T
JOIN FUNCIONARIO F ON T.funcionario_fk = F.ID_funcionario
JOIN PLANOS P ON T.planos_fk = P.ID_planos
WHERE T.cliente_fk = 1; 

SELECT A.nome AS "Nome da Aula",
       F.funcionario_nome AS "Nome do Instrutor",
       A.dia_semana AS "Dia da Aula",
       A.horario AS "Horário da Aula"
FROM AULAS A
JOIN FUNCIONARIO F ON A.funcionario_fk = F.ID_funcionario;

SELECT tipo AS "Tipo de Equipamento",
       SUM(quantIDade) AS "Total Disponível"
FROM EQUIPAMENTOS
GROUP BY tipo;

SELECT F.funcionario_nome AS "Nome do Funcionário",
       C.cliente_nome AS "Nome do Cliente",
       P.nome AS "Nome do Plano"
FROM FUNCIONARIO F
JOIN TREINO T ON F.ID_funcionario = T.funcionario_fk
JOIN CLIENTE C ON T.cliente_fk = C.ID_cliente
JOIN PAGAMENTOS PA ON C.ID_cliente = PA.cliente_fk
JOIN PLANOS P ON PA.planos_fk = P.ID_planos
WHERE PA.statuss = 'PAGO';

SELECT AVG(cliente_IDade) AS "Média de Idade dos Clientes"
FROM CLIENTE;

