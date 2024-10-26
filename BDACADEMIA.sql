CREATE TABLE CLIENTE (
    ID_cliente          INT             PRIMARY KEY NOT NULL,
    cliente_nome        VARCHAR(20)     NOT NULL, 
    cliente_IDade       INT             NOT NULL,
    cliente_genero      VARCHAR(20)     NOT NULL,
    cliente_plano       VARCHAR(20)     NOT NULL, 
    cliente_telefone    VARCHAR(20)     NOT NULL, 
    cliente_status      VARCHAR(20)     NOT NULL
);

INSERT INTO CLIENTE 
VALUES (1, 'lucas', 18, 'masculino', 'basico', '958212986', 'ativo');

CREATE TABLE funcionario (
    ID_funcionario          INT             PRIMARY KEY NOT NULL, 
    funcionario_nome        VARCHAR(20)     NOT NULL,
    funcionario_IDade       INT             NOT NULL,
    funcionario_genero      VARCHAR(20)     NOT NULL,
    funcionario_cargo       VARCHAR(20)     NOT NULL,
    funcionario_hora_inicio VARCHAR(20)     NOT NULL,
    funcionario_hora_fim    VARCHAR(20)     NOT NULL
);

INSERT INTO funcionario 
VALUES (1, 'kevin', 18, 'masculino', 'atendente', '17:00', '23:00');

CREATE TABLE feedback (
    ID_feedback             INT             PRIMARY KEY NOT NULL,
    feedback_avaliacao      VARCHAR(20)     NOT NULL,
    feedback_sugestão       VARCHAR(50)     NOT NULL,
    ID_cliente              INT             NOT NULL,
    FOREIGN KEY (ID_cliente) REFERENCES CLIENTE (ID_cliente)
);

INSERT INTO feedback 
VALUES (1, 'boa', 'melhorar o atendimento', 1);

CREATE TABLE planos (
    ID_planos        INT             IDENTITY PRIMARY KEY,
    nome             VARCHAR(50)     NOT NULL,
    preco            DECIMAL(10, 2),
    duracao_meses    INT
);

INSERT INTO planos (nome, preco, duracao_meses)
VALUES ('basico', 100, 12);

CREATE TABLE treino (
    ID                 INT             IDENTITY PRIMARY KEY,
    cliente_fk         INT,
    funcionario_fk     INT, 
    planos_fk          INT, 
    data_treino        DATE, 
    FOREIGN KEY (cliente_fk) REFERENCES CLIENTE (ID_cliente),
    FOREIGN KEY (funcionario_fk) REFERENCES funcionario (ID_funcionario),
    FOREIGN KEY (planos_fk) REFERENCES planos (ID_planos)
);

CREATE TABLE aulas (
    ID                 INT             IDENTITY PRIMARY KEY, 
    nome               VARCHAR(100)    NOT NULL,
    funcionario_fk     INT, 
    dia_semana         VARCHAR(10),
    horario            TIME, 
    FOREIGN KEY (funcionario_fk) REFERENCES funcionario (ID_funcionario)
);

INSERT INTO aulas (nome, funcionario_fk, dia_semana, horario)
VALUES ('zumba', 1, 'segunda', '18:00:00');

CREATE TABLE equipamentos (
    ID                INT             IDENTITY PRIMARY KEY,
    nome              VARCHAR(100)    NOT NULL,
    quantIDade        INT,
    tipo              VARCHAR(50)
);

INSERT INTO equipamentos (nome, quantIDade, tipo) 
VALUES ('supino', 1, 'força');

CREATE TABLE pagamentos (
    ID                INT             IDENTITY PRIMARY KEY,
    cliente_fk        INT,
    planos_fk         INT,
    data_pagamento    DATE,
    valor             DECIMAL(10, 2),
    statuss           VARCHAR(20) CHECK (statuss IN ('PAGO', 'PENDENTE', 'CANCELADO')),
    FOREIGN KEY (cliente_fk) REFERENCES CLIENTE (ID_cliente),
    FOREIGN KEY (planos_fk) REFERENCES planos (ID_planos)
);

INSERT INTO pagamentos (cliente_fk, planos_fk, data_pagamento, valor, statuss)
VALUES (1, 1, '1999-12-19', 100, 'PAGO');
