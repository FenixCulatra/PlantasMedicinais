/* CRIAÇÃO DE TABELAS */


--Tabela de Usuário
CREATE TABLE USUARIO (
    nome varchar(80),
    senha varchar(20) PRIMARY KEY,
    email varchar(80),
    FK_TIPO_USUARIO_id integer,
	foreign key(fk_tipo_usuario_id) references TIPO_USUARIO(id)
);


--Tabela de Planta
CREATE TABLE PLANTA (
    nome varchar(80),
    cod_planta integer PRIMARY KEY,
    imagem varchar(600)
);


--Tabela de Indicação
CREATE TABLE INDICACAO (
    descricao varchar(600),
	cod_indicacao integer PRIMARY KEY
);


--Tabela de Preparo
CREATE TABLE PREPARO (
    descricao varchar(2000),
    cod_preparo integer PRIMARY KEY,
    FK_TIPO_PREPARO_cod_tipo integer
);

--Tabela Tipo de preparo
CREATE TABLE TIPO_PREPARO (
    nome_tipo varchar(80),
    cod_tipo integer PRIMARY KEY
);

--Tabela de Efeitos Adversos
CREATE TABLE EFEITOS_ADVERSOS (
    codigo_efeito integer PRIMARY KEY,
    descricao varchar(600)
);


--Tabela de Tipo de usuário
CREATE TABLE TIPO_USUARIO (
    id integer PRIMARY KEY,
    descricao varchar(500)
);

--Tabela de Contraindicação
CREATE TABLE CONTRAINDICACAO (
    cod_contraind integer PRIMARY KEY,
    descricao varchar(600)
);

--Tabela de Favoritos
CREATE TABLE Favorita (
    fk_USUARIO_senha varchar(20),
    fk_PLANTA_cod_planta integer
);


--Tabela de relacionamento entre planta e indicação
CREATE TABLE Possui_Planta (
    fk_PLANTA_cod_planta integer,
	fk_INDICACAO_cod_indicacao integer
);

--Tabela de relacionamento entre planta e preparo
CREATE TABLE Possui_Preparo (
    fk_PLANTA_cod_planta integer,
    fk_PREPARO_cod_preparo integer
);

--Tabela de relacionamento entre planta com efeitos adversos
CREATE TABLE Contem (
    fk_PLANTA_cod_planta integer,
    fk_EFEITOS_ADVERSOS_codigo_efeito integer
);


--Tabela de relacionamento entre indicacao e preparo
CREATE TABLE Depende (
	fk_INDICACAO_cod_indicacao integer,
    fk_PREPARO_cod_preparo integer
);

--Tabela de relacionamento entre planta e contraindicacao
CREATE TABLE Possui_Contraindicacao (
    fk_PLANTA_cod_planta integer,
    fk_CONTRAINDICACAO_cod_contraind integer
);
 
------------------------------------------------
/*ALTERAÇÃO DE TABELAS*/

ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_2
    FOREIGN KEY (FK_TIPO_USUARIO_id)
    REFERENCES TIPO_USUARIO (id)
    ON DELETE CASCADE;
 
ALTER TABLE PREPARO ADD CONSTRAINT FK_PREPARO_2
    FOREIGN KEY (FK_TIPO_PREPARO_cod_tipo)
    REFERENCES TIPO_PREPARO (cod_tipo)
    ON DELETE CASCADE;
 
ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_1
    FOREIGN KEY (fk_USUARIO_senha)
    REFERENCES USUARIO (senha)
    ON DELETE SET NULL;
 
ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_2
    FOREIGN KEY (fk_PLANTA_cod_planta)
    REFERENCES PLANTA (cod_planta)
    ON DELETE SET NULL;
 
ALTER TABLE Possui_Planta ADD CONSTRAINT FK_Possui_Planta_1
    FOREIGN KEY (fk_PLANTA_cod_planta)
    REFERENCES PLANTA (cod_planta)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui_Preparo ADD CONSTRAINT FK_Possui_Preparo_1
    FOREIGN KEY (fk_PLANTA_cod_planta)
    REFERENCES PLANTA (cod_planta)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui_Preparo ADD CONSTRAINT FK_Possui_Preparo_2
    FOREIGN KEY (fk_PREPARO_cod_preparo)
    REFERENCES PREPARO (cod_preparo)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_PLANTA_cod_planta)
    REFERENCES PLANTA (cod_planta)
    ON DELETE SET NULL;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_EFEITOS_ADVERSOS_codigo_efeito)
    REFERENCES EFEITOS_ADVERSOS (codigo_efeito)
    ON DELETE SET NULL;
 
ALTER TABLE Depende ADD CONSTRAINT FK_Depende_1
    FOREIGN KEY (fk_PREPARO_cod_preparo)
    REFERENCES PREPARO (cod_preparo)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui_Contraindicacao ADD CONSTRAINT FK_Possui_Contraindicacao_1
    FOREIGN KEY (fk_PLANTA_cod_planta)
    REFERENCES PLANTA (cod_planta)
    ON DELETE RESTRICT;
 
ALTER TABLE Possui_Contraindicacao ADD CONSTRAINT FK_Possui_Contraindicacao_2
    FOREIGN KEY (fk_CONTRAINDICACAO_cod_contraind)
    REFERENCES CONTRAINDICACAO (cod_contraind)
    ON DELETE RESTRICT;
	
-------------------------------------------------------------------------------

/*INSERÇÃO DE DADOS DE CADA TABELA*/

--Tabela de TIPO DE USUÁRIO

INSERT INTO TIPO_USUARIO (id, descricao) VALUES (1, 'ADMINISTRADOR');
INSERT INTO TIPO_USUARIO (id, descricao) VALUES (2, 'USUÁRIO');
INSERT INTO TIPO_USUARIO (id, descricao) VALUES (4, 'COLABORADOR');

select * from TIPO_USUARIO;

-- Tabela de USUÁRIO

INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Fernanda', 'fernada145@gmail.com', '25478', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Carla', 'carlinha458@gmail.com', '65874', 2);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Luíza', 'luli@gmail.com', '325478', 4);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Carlos', 'carlos7854@gmail.com', '4554216', 3);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Henrique', 'Hique_457@gmail.com', '85211589', 2);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Carolina', 'carolzinha@gmail.com', '54879651', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Gustavo', 'gust45gmail.com', '3265478', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Heitor', 'Heitor478@gmail.com', '65847210', 3);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Vítor', 'vito4715gmail.com', '14587*/8521', 2);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Luara', 'lua5588@gmail.com', '98547fernada', 3);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Creuza', 'creuzaOliveira@gmail.com', '10/04/2002', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Lúcia', 'LucinhaPagung_lu123@gmail.com', '154782', 4);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Fernando', 'fernandinho4578@gmail.com', '23658', 2);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Carolina', 'Carol54@gmail.com', 'Carolina5478', 3);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Eduarda', 'pipoca14eduarda@gmail.com', 'pipocadoce2514', 3);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Eduardo', 'eduardotorres@gmail.com', 'raster2546', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Eliane', 'eli1245@gmail.com', 'Azimute#1245', 1);
INSERT INTO USUARIO (nome, email, senha, fk_tipo_usuario_id) VALUES ('Glória', 'glorinharamos@gmail.com', 'glorinha332', 4);

SELECT * FROM USUARIO;

--Tabela de PLANTA

INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (1, 'Capim Limão', 'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/898/193/products/capim-limao21-b1f36a2e652a87983616431246540750-640-0.webp');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (2, 'Gengibre', 'https://saude.abril.com.br/wp-content/uploads/2017/05/gengibre.jpg?quality=85&strip=info&w=680&h=453&crop=1');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (3, 'Camomila', 'https://emporioquatroestrelas.vteximg.com.br/arquivos/ids/157746-1000-1000/Camomila-100g.png?v=636913646662170000');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (4, 'Aroeira', 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Schinus_terebinthifolius_fruits.JPG');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (5, 'Trançagem', 'https://www.saintvinsaint.com.br/wp-content/uploads/2018/09/img_2482-600x450.jpg');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (6, 'erva doce', 'https://s2.glbimg.com/frqx0WLnE137vvZdoi06NeobCb4=/e.glbimg.com/og/ed/f/original/2019/07/22/gettyimages-157606208.jpg');
INSERT INTO PLANTA (cod_planta, nome, imagem) VALUES (7, 'cidreira', 'https://cdn.awsli.com.br/600x450/1202/1202212/produto/172081869/d27f5c627d.jpg');

select * from PLANTA;

--Tabela de FAVORITA

INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('25478', 1);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('65874', 2);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('325478', 3);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('4554216', 4);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('85211589', 5);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('54879651', 6);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('3265478', 7);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('65847210', 1);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('14587*/8521', 5);
INSERT INTO FAVORITA (fk_Usuario_senha, fk_Planta_cod_planta) VALUES ('98547fernada', 6);

SELECT * FROM FAVORITA;

--Tabela de Indicação

INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (1, 'Perda de peso');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (2, 'Auxilia no tratamento de candidíase');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (3, 'Tratamento de gastrite');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (4, 'Dor de cabeça');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (5, 'Dor de barriga');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (6, 'Diminuição colesterol LDL');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (7, 'Controle da pressão arterial');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (8, 'Combate de insônia');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (9, 'Ansiedade');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (10, 'Sintomas de gripe');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (11, 'Infecção na garganta');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (12, 'Digestão');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (13, 'Prisão de ventre');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (14, 'Cólicas');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (15, 'Sintomas da menopausa');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (16, 'Tratamento de convulsões');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (17, 'Prevenção de doenças do coração');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (18, 'Insônia');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (19, 'Estresse');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (20, 'Úlcera gástrica');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (21, 'Resfriado');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (22, 'Inflamação vaginal');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (23, 'Infecção vaginal');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (24, 'Infecção urinária');
INSERT INTO INDICACAO (cod_indicacao, descricao) VALUES (25, 'Cicatrizante');

SELECT * FROM INDICACAO;


--TABELA DE POSSUI_PLANTA

INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (1, 1);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (2, 2);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (3, 3);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (4, 4);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (5, 5);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (6, 6);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (7, 7);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (7, 8);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (6, 9);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (5, 10);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (4, 11);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (3, 12);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (2, 13);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta, fk_INDICACAO_cod_indicacao) VALUES (1, 14);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (2, 15);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (5, 16);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (6, 17);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (7, 18);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (1, 19);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (3, 20);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (4, 21);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (1, 22);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (2, 23);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (3, 24);
INSERT INTO Possui_Planta (fk_PLANTA_cod_planta,fk_INDICACAO_cod_indicacao) VALUES (4, 25);

SELECT * FROM Possui_Planta;


--TABELA DE CONTRAINDICAÇÃO

INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (1, 'Ter hiperestrogenismo');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (2, 'Mulheres grávidas');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (3, 'Mulheres que amamentam');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (4, 'Não consumir com remédios para dormir ou calmantes');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (5, 'Uso de medicamentos anticoagulantes');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (6, 'Problemas de coagulação');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (7, 'Problemas gastrointestinais');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (8, 'Não utilizar com medicamentos para tratamento de tireoide');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (9, 'Com medicamentos para hipertensão');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (10, 'Possuir alergia a camomila ou a plantas de mesma família');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (11, 'Chá para menores de 6 meses');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (12, 'Inalação para menores de 6 anos');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (13, 'Pessoas que têm problemas de pele');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (14, 'Chá para crianças');
INSERT INTO CONTRAINDICACAO (cod_contraind, descricao) VALUES (15, 'Com utilização de remédios para hipertensão');

SELECT * FROM CONTRAINDICACAO;
--TABELA DE POSSUI_CONTRAINDICAÇÃO

INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (6, 1);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (6, 2);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (6, 3);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (6, 5);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (2, 15);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (2, 5);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 10);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 6);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 5);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 11);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 12);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (3, 2);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (4, 3);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (4, 14);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (4, 13);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (4, 2);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (4, 7);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (7, 8);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (7, 4);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (1, 4);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (1, 2);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (1, 3);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (5, 2);
INSERT INTO Possui_Contraindicacao (fk_PLANTA_cod_planta, fk_CONTRAINDICACAO_cod_contraind) VALUES (5, 3);

SELECT * FROM Possui_Contraindicacao;


 --Tabelas de EFEITOS_ADVERSOS

INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (1, 'Náuseas');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (2, 'Irritação de pele');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (3, 'Sonolência');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (4, 'Vômitos');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (5, 'Alergia respiratória');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (6, 'Paralisia muscular');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (7, 'Confusão mental');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (8, 'Convulsões');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (9, 'Aumento do risco de hemorragias');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (10, 'Hipertensão');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (11, 'Hipotensão');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (12, 'Fraqueza');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (13, 'Dor abdominal');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (14, 'Bradicardia');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (15, 'Diarreia');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (16, 'Irritação na boca');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (17, 'Irritação na garganta');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (18, 'Dermatite');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (19, 'Dor de estômago');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (20, 'Cólica');
INSERT INTO EFEITOS_ADVERSOS (codigo_efeito, descricao) VALUES (21, 'Desidratação');

select * from EFEITOS_ADVERSOS;

--Tabela de CONTEM

INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 1);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (3, 2);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (5, 3);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 4);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 5);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 6);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 7);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (7, 6);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (2, 9);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (1, 10);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (7, 11);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (1, 12);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (5, 13);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (7, 14);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (4, 15);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (4, 16);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (4, 17);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (4, 18);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (4, 19);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (5, 20);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (3, 21);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (7, 1);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (1, 3);
INSERT INTO CONTEM (fk_PLANTA_cod_planta, fk_EFEITOS_ADVERSOS_codigo_efeito) VALUES (6, 5);

select * from CONTEM;

--Tabela de tipos de preparo

INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (9, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (10, 'Compressa');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (11, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (12, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (13, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (14, 'Compressa');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (15, 'Banho');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (17, 'Banho');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (18, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (19, 'Gargarejos');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (20, 'Chá');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (21, 'Inalação');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (22, 'Banho');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (23, 'Compressa');
INSERT INTO Tipo_preparo (cod_tipo, nome_tipo) VALUES (24, 'Pomada');

select * from Tipo_preparo;

--Tabela de Preparo

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Colocar as folhas frescas picadas numa xícara e cobrir com água fervente. Tampar, deixar descansar por 5 a 10 minutos, coar e beber em seguida.', 111, 9);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Mergulhar um pedaço de gaze ou pano limpo no chá de capim-santo e aplicar sobre a ferida ou região dolorida. Deixar atuar por pelo menos 15 minutos. Misture 3 gotas do óleo essencial em 1 colher de sopa de óleo vegetal, como coco, jojoba ou azeite, e aplique sobre a micose ou ferida. Deve-se evitar a exposição ao sol por até 6 horas após a aplicação deste óleo, para evitar irritação na pele.', 122, 10);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('1. Aqueça 200 ml de água filtrada até formar bolhas; sem ferver; 2. Numa xícara, coloque o gengibre cortado em rodelas bem finas; 3. Despeja a água quente na xícara, mexa bem e tampe-a; 4. Deixe em infusão por 5 minutos; 5. Após os 5 minutos, o chá de gengibre já está pronto para beber. Caso prefira gelado, basta levar à geladeira até esfriar. Ah, é importante lembrar que, com o passar do tempo, o chá de gengibre vai perdendo suas propriedades e benefícios. Por isso, o ideal é consumi-lo no mesmo dia da preparação.', 133, 11);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Utilize entre 1 e 4 gramas de folhas da planta preferencialmente fresca para cerca de 150 ml de água. Ferva a água, depois a coloque sobre as folhas em um recipiente e deixe abafando entre cinco e dez minutos. Coe e aguarde. Tome o chá morno, entre 10 e 15 minutos após o preparo, preferencialmente sem adoçá-lo.', 144, 12);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Em 1 litro adicione 100g do pó da casca de aroeira na água fervente, misturar e depois tomar cerca de 3 colheres de sopa por dia.', 155, 13);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Em 1 litro adicione 100g do pó da casca de aroeira na água fervente, misturar e espere esfriar de 5 a 10, ou espere chegar a uma temperatura agradável para a pele. Mergulhe uma faixa ou gaze limpa no chá e coloque sobre a área desejada.', 166, 14);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque 20 gramas de aroeira em 1 litro de água. Coloque os ingredientes para ferver em um recipiente tampado, por cerca de 5 minutos. Coe, espere mornar e tome banho, evitando que o líquido caia sobre os olhos.', 177, 15);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Ferva 1 litro de água, depois coloque 10 gramas de aroeira, deixe ferver por 10 minutos em um recipiente tampado. Coe, coloque em uma bacia ou um recipiente que possa sentar-se, espere esfriar um pouco e sente-se dentro da bacia, lavando toda a região íntima.', 188, 17);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque de 3 a 4 gramas das folhas em 250 ml de água. Ferva a água, desligue o fogo, adicione as folhas de trançagem e espere cerca de 3 minutos, coe e beba. O chá deve ser bebido pelo menos 3 vezes ao dia.', 199, 18);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque entre 4 e 7 folhas para 500 ml de água. Ferva a água e coloque as folhas dentro do recipiente com água. Espere o líquido ficar morno e faça gargarejos de 3 a 4 vezes ao dia.', 200, 19);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque de 0,5 a 4 g de camomila em 240 ml de água fervente, tampe e espere esfriar de 5 a 10 minutos, coe e beba entre 1 e 4 vezes ao dia. O chá pode ser feito com a combinação de camomila com outras ervas.', 211, 20);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque 6 colheres de sopa de camomila em 1,5 l de água. Ferva a água e adicione a camomila. Espere entre 5 e 10 minutos e, em seguida, coloque o rosto sobre o recipiente tampando a cabeça e o recipiente, de modo que o vapor vá de encontro ao seu rosto. Respire o vapor profundamente, por cerca de 10 minutos. Repita o processo de 2 a 3 vezes ao dia.', 222, 21);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque 1 litro de água para ferver com 3 colheres de sopa de camomila. Coe, espere esfriar e coloque-o dentro de uma bacia ou banheira. Permaneça dentro do recipiente com o líquido por cerca de 5 a 10 minutos. O processo deve ser feito 1 vez ao dia.', 233, 22);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque em 500 ml de água fervente, de 20 a 30 g de camomila. Desligue o fogo e tampe, espere 15 minutos, mergulhe o algodão, gaze ou qualquer tecido limpo no líquido, depois aplique sobre a área desejada. A compressa deve ser aplicada pelo menos 2 vezes ao dia.', 244, 23);

INSERT INTO Preparo (descricao, cod_preparo, FK_tipo_preparo_cod_tipo)
VALUES ('Coloque 5 g de cera de abelha e 45 ml de óleo (oliva, coco ou amêndoas doces) numa panela em banho-maria até que a mistura esteja completamente líquida. A seguir, apague o fogo e adicione colheres de sopa de camomila. Deixe os ingredientes dentro da panela por cerca de 2 horas para liberar as substâncias ativas da camomila. Antes de esfriar, coe e armazene a parte líquida em um recipiente de vidro limpo e seco com tampa. Mantenha o vidro sempre em um local seco, escuro e arejado. Esta pomada tem validade de até 1 ano e pode ser aplicada na pele de 2 a 3 vezes por dia.', 255, 24);


select * from Preparo;

--Tabela de Possui Preparo

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (1, 111);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (2, 122);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (3, 133);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (3, 144);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (3, 155);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (3, 166);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (4, 177);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (4, 188);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (4, 199);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (5, 200);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (5, 211);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (6, 222);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (6, 233);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (7, 244);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (7, 255);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (7, 177);

INSERT INTO Possui_Preparo (fk_PLANTA_cod_planta, fk_PREPARO_cod_preparo)
VALUES (6, 200);

select * from possui_preparo;

--Tabela DEPENDE

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (1, 111);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (2, 122);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (3, 133);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (4, 144);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (5, 155);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (6, 166);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (7, 177);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (8, 188);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (9, 199);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (10, 200);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (11, 211);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (12, 222);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (13, 233);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (14, 244);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (15, 255);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (16, 177);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (17, 200);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (18, 111);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (19, 122);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (20, 133);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (21, 144);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (22, 155);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (23, 166);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (24, 177);

INSERT INTO DEPENDE (fk_INDICACAO_cod_indicacao, fk_PREPARO_cod_preparo)
VALUES (25, 188);


select * from depende;


