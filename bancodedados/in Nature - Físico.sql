/* in Nature - L�gico: */

CREATE TABLE USUARIO (
    cod_usr serial PRIMARY KEY,
    nome varchar(180),
    email varchar(256),
    senha varchar(20),
    permissao varchar(1)
);

CREATE TABLE PLANTA (
    cod_plt serial PRIMARY KEY,
    nome varchar(80),
    imagem varchar(80)
);

CREATE TABLE PREPARO (
    cod_prp serial PRIMARY KEY,
    descricao varchar(2000)
);

CREATE TABLE INDICACAO (
    cod_inc serial PRIMARY KEY,
    descricao varchar(200)
);

CREATE TABLE CONTRAINDICACAO (
    cod_cinc serial PRIMARY KEY,
    descricao varchar(200)
);

CREATE TABLE EFEITO_COLATERAL (
    cod_eftcol serial PRIMARY KEY,
    descricao varchar(600)
);

CREATE TABLE USUARIO_PLANTA (
    FK_USUARIO_cod_usr serial,
    FK_PLANTA_cod_plt serial
);

CREATE TABLE PLANTA_PREPARO (
    FK_PLANTA_cod_plt serial,
    FK_PREPARO_cod_prp serial
);

CREATE TABLE PREPARO_INDICACAO (
    FK_INDICACAO_cod_inc serial,
    FK_PREPARO_cod_prp serial
);

CREATE TABLE PREPARO_CONTRAINDICACAO (
    FK_CONTRAINDICACAO_cod_cinc serial,
    FK_PREPARO_cod_prp serial
);

CREATE TABLE PREPARO_EFEITO_COLATERAL (
    FK_EFEITO_COLATERAL_cod_eftcol serial,
    FK_PREPARO_cod_prp serial
);
 
ALTER TABLE USUARIO_PLANTA ADD CONSTRAINT FK_USUARIO_PLANTA_1
    FOREIGN KEY (FK_USUARIO_cod_usr)
    REFERENCES USUARIO (cod_usr)
    ON DELETE SET NULL;
 
ALTER TABLE USUARIO_PLANTA ADD CONSTRAINT FK_USUARIO_PLANTA_2
    FOREIGN KEY (FK_PLANTA_cod_plt)
    REFERENCES PLANTA (cod_plt)
    ON DELETE SET NULL;
 
ALTER TABLE PLANTA_PREPARO ADD CONSTRAINT FK_PLANTA_PREPARO_1
    FOREIGN KEY (FK_PLANTA_cod_plt)
    REFERENCES PLANTA (cod_plt)
    ON DELETE SET NULL;
 
ALTER TABLE PLANTA_PREPARO ADD CONSTRAINT FK_PLANTA_PREPARO_2
    FOREIGN KEY (FK_PREPARO_cod_prp)
    REFERENCES PREPARO (cod_prp)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_INDICACAO ADD CONSTRAINT FK_PREPARO_INDICACAO_1
    FOREIGN KEY (FK_INDICACAO_cod_inc)
    REFERENCES INDICACAO (cod_inc)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_INDICACAO ADD CONSTRAINT FK_PREPARO_INDICACAO_2
    FOREIGN KEY (FK_PREPARO_cod_prp)
    REFERENCES PREPARO (cod_prp)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_CONTRAINDICACAO ADD CONSTRAINT FK_PREPARO_CONTRAINDICACAO_1
    FOREIGN KEY (FK_CONTRAINDICACAO_cod_cinc)
    REFERENCES CONTRAINDICACAO (cod_cinc)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_CONTRAINDICACAO ADD CONSTRAINT FK_PREPARO_CONTRAINDICACAO_2
    FOREIGN KEY (FK_PREPARO_cod_prp)
    REFERENCES PREPARO (cod_prp)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_EFEITO_COLATERAL ADD CONSTRAINT FK_PREPARO_EFEITO_COLATERAL_1
    FOREIGN KEY (FK_EFEITO_COLATERAL_cod_eftcol)
    REFERENCES EFEITO_COLATERAL (cod_eftcol)
    ON DELETE SET NULL;
 
ALTER TABLE PREPARO_EFEITO_COLATERAL ADD CONSTRAINT FK_PREPARO_EFEITO_COLATERAL_2
    FOREIGN KEY (FK_PREPARO_cod_prp)
    REFERENCES PREPARO (cod_prp)
    ON DELETE SET NULL;

-- Inserts na tabela USUARIO
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES
    ('Jo�o Pedro', 'joaopedro@example.com', 'senha123', 'A'),
    ('Carlos', 'carlos@example.com', 'senha456', 'B'),
    ('Maria Silva', 'mariasilva@example.com', 'senha789', 'A'),
    ('Ana Souza', 'anasouza@example.com', 'senha321', 'B'),
    ('Pedro Henrique', 'pedrohenrique@example.com', 'senha654', 'A');

-- Inserts na tabela PLANTA
INSERT INTO PLANTA (nome, imagem)
VALUES
    ('Capim Lim�o', 'capim_limao.jpg'),
    ('Camomila', 'camomila.jpg'),
    ('Hortel�', 'hortela.jpg'),
    ('Erva-Cidreira', 'erva_cidreira.jpg'),
    ('Ch� Verde', 'cha_verde.jpg');

-- Inserts na tabela PREPARO
INSERT INTO PREPARO (descricao)
VALUES
    ('Ch� de Capim Lim�o: Ferver as folhas de capim lim�o em �gua por 10 minutos.'),
    ('Ch� de Camomila: Colocar as flores de camomila em �gua quente por 5 minutos.'),
    ('Ch� de Hortel�: Adicionar folhas de hortel� em �gua fervente por 3 minutos.'),
    ('Ch� de Erva-Cidreira: Infundir folhas de erva-cidreira em �gua quente por 7 minutos.'),
    ('Ch� Verde: Preparar o ch� verde em �gua quente por 2 minutos.');

-- Inserts na tabela INDICACAO
INSERT INTO INDICACAO (descricao)
VALUES
    ('Al�vio de estresse e ansiedade'),
    ('Auxilia na digest�o'),
    ('Promove relaxamento e sono tranquilo'),
    ('Ajuda a aliviar dores de cabe�a'),
    ('Estimula o metabolismo e auxilia na perda de peso');

-- Inserts na tabela CONTRAINDICACAO
INSERT INTO CONTRAINDICACAO (descricao)
VALUES
    ('N�o recomendado para pessoas com alergia a capim lim�o'),
    ('Pode causar rea��es al�rgicas em pessoas sens�veis � camomila'),
    ('Evitar em casos de refluxo gastroesof�gico'),
    ('N�o recomendado para pessoas com press�o baixa'),
    ('Em excesso, pode causar ins�nia e irritabilidade');

-- Inserts na tabela EFEITO_COLATERAL
INSERT INTO EFEITO_COLATERAL (descricao)
VALUES
    ('Nenhum efeito colateral conhecido'),
    ('Poss�veis rea��es al�rgicas em algumas pessoas'),
    ('Pode causar irrita��o estomacal em grandes quantidades'),
    ('Pode causar sonol�ncia em algumas pessoas'),
    ('Em excesso, pode causar nervosismo e palpita��es');

-- Inserts na tabela PREPARO_INDICACAO
INSERT INTO PREPARO_INDICACAO (FK_INDICACAO_cod_inc, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Ch� de Capim Lim�o: Al�vio de estresse e ansiedade
    (2, 2), -- Ch� de Camomila: Auxilia na digest�o
    (3, 3), -- Ch� de Hortel�: Promove relaxamento e sono tranquilo
    (4, 4), -- Ch� de Erva-Cidreira: Ajuda a aliviar dores de cabe�a
    (5, 5); -- Ch� Verde: Estimula o metabolismo e auxilia na perda de peso

-- Inserts na tabela PREPARO_CONTRAINDICACAO
INSERT INTO PREPARO_CONTRAINDICACAO (FK_CONTRAINDICACAO_cod_cinc, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Ch� de Capim Lim�o: N�o recomendado para pessoas com alergia a capim lim�o
    (2, 2), -- Ch� de Camomila: Pode causar rea��es al�rgicas em pessoas sens�veis � camomila
    (3, 3), -- Ch� de Hortel�: Evitar em casos de refluxo gastroesof�gico
    (4, 4), -- Ch� de Erva-Cidreira: N�o recomendado para pessoas com press�o baixa
    (5, 5); -- Ch� Verde: Em excesso, pode causar ins�nia e irritabilidade

-- Inserts na tabela PREPARO_EFEITO_COLATERAL
INSERT INTO PREPARO_EFEITO_COLATERAL (FK_EFEITO_COLATERAL_cod_eftcol, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Ch� de Capim Lim�o: Nenhum efeito colateral conhecido
    (2, 2), -- Ch� de Camomila: Poss�veis rea��es al�rgicas em algumas pessoas
    (3, 3), -- Ch� de Hortel�: Pode causar irrita��o estomacal em grandes quantidades
    (4, 4), -- Ch� de Erva-Cidreira: Pode causar sonol�ncia em algumas pessoas
    (5, 5); -- Ch� Verde: Em excesso, pode causar nervosismo e palpita��es

-- Inserts na tabela PLANTA_PREPARO
INSERT INTO PLANTA_PREPARO (FK_PLANTA_cod_plt, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Capim Lim�o: Ch� de Capim Lim�o
    (2, 2), -- Camomila: Ch� de Camomila
    (3, 3), -- Hortel�: Ch� de Hortel�
    (4, 4), -- Erva-Cidreira: Ch� de Erva-Cidreira
    (5, 5); -- Ch� Verde: Ch� Verde
