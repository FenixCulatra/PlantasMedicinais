/* in Nature - Lógico: */

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
    descricao varchar(2000)not
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

CREATE TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL (
    FK_PLANTA_cod_plt serial,
    FK_PREPARO_cod_prp serial,
    FK_INDICACAO_cod_inc serial,
    FK_CONTRAINDICACAO_cod_cinc serial,
    FK_EFEITO_COLATERAL_cod_eftcol serial
);

CREATE TABLE USUARIO_PLANTA (
    FK_USUARIO_cod_usr serial,
    FK_PLANTA_cod_plt serial
);
 
ALTER TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL ADD CONSTRAINT FK_PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL_1
    FOREIGN KEY (FK_PLANTA_cod_plt)
    REFERENCES PLANTA (cod_plt)
    ON DELETE NO ACTION;
 
ALTER TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL ADD CONSTRAINT FK_PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL_2
    FOREIGN KEY (FK_PREPARO_cod_prp)
    REFERENCES PREPARO (cod_prp)
    ON DELETE NO ACTION;
 
ALTER TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL ADD CONSTRAINT FK_PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL_3
    FOREIGN KEY (FK_INDICACAO_cod_inc)
    REFERENCES INDICACAO (cod_inc)
    ON DELETE NO ACTION;
 
ALTER TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL ADD CONSTRAINT FK_PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL_4
    FOREIGN KEY (FK_CONTRAINDICACAO_cod_cinc)
    REFERENCES CONTRAINDICACAO (cod_cinc)
    ON DELETE NO ACTION;
 
ALTER TABLE PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL ADD CONSTRAINT FK_PLANTA_PREPARO_PREPARO_INDICACAO_CONTRAINDICACAO_EFEITO_COLATERAL_5
    FOREIGN KEY (FK_EFEITO_COLATERAL_cod_eftcol)
    REFERENCES EFEITO_COLATERAL (cod_eftcol)
    ON DELETE NO ACTION;
 
ALTER TABLE USUARIO_PLANTA ADD CONSTRAINT FK_USUARIO_PLANTA_1
    FOREIGN KEY (FK_USUARIO_cod_usr)
    REFERENCES USUARIO (cod_usr)
    ON DELETE SET NULL;
 
ALTER TABLE USUARIO_PLANTA ADD CONSTRAINT FK_USUARIO_PLANTA_2
    FOREIGN KEY (FK_PLANTA_cod_plt)
    REFERENCES PLANTA (cod_plt)
    ON DELETE SET NULL;

-- INSERTS

-- Usuário ADMIN
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Admin User', 'admin@example.com', 'admin123', 'A');

-- Usuários COLABORADORES
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('João Pedro', 'joaopedro@example.com', 'colab123', 'C');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Carlos Almeida', 'carlosalmeida@example.com', 'colab456', 'C');

-- Usuários NORMAL
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Mariana Silva', 'marianasilva@example.com', 'user123', 'N');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Ana Santos', 'anasantos@example.com', 'user456', 'N');
-- Usuários NORMAL
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Mariana Silva', 'marianasilva@example.com', 'user123', 'N');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Ana Santos', 'anasantos@example.com', 'user456', 'N');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Pedro Oliveira', 'pedrooliveira@example.com', 'user789', 'N');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Camila Costa', 'camilacosta@example.com', 'user987', 'N');
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES ('Lucas Rodrigues', 'lucasrodrigues@example.com', 'user654', 'N');
-- Adicione mais registros de usuários normais conforme necessário


INSERT INTO PLANTA (nome, imagem)
VALUES ('Capim Limão', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Camomila', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Erva Cidreira', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Hortelã', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Alecrim', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Calêndula', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Valeriana', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Gengibre', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Dente-de-leão', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Melissa', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Hibisco', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Canela', '');
INSERT INTO PLANTA (nome, imagem)
VALUES ('Chá Verde', '');
-- Adicione mais plantas medicinais conforme necessário



