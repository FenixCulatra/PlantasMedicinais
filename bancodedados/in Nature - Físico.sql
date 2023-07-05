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
    ('João Pedro', 'joaopedro@example.com', 'senha123', 'A'),
    ('Carlos', 'carlos@example.com', 'senha456', 'B'),
    ('Maria Silva', 'mariasilva@example.com', 'senha789', 'A'),
    ('Ana Souza', 'anasouza@example.com', 'senha321', 'B'),
    ('Pedro Henrique', 'pedrohenrique@example.com', 'senha654', 'A');

-- Inserts na tabela PLANTA
INSERT INTO PLANTA (nome, imagem)
VALUES
    ('Capim Limão', 'https://fenixculatra.github.io/PlantasMedicinais/imagens/capim-limao.jpg'),
    ('Camomila', 'https://fenixculatra.github.io/PlantasMedicinais/imagens/camomila.jpg'),
    ('Hortelã', 'https://fenixculatra.github.io/PlantasMedicinais/imagens/hortela.jpg'),
    ('Erva-Cidreira', 'https://fenixculatra.github.io/PlantasMedicinais/imagens/erva-cidreira.jpg'),
    ('Chá Verde', 'https://fenixculatra.github.io/PlantasMedicinais/imagens/cha-verde.jpg');

INSERT INTO USUARIO_PLANTA (FK_USUARIO_cod_usr, FK_PLANTA_cod_plt)
VALUES
    (1, 1), -- João Pedro: Capim Limão
    (1, 3), -- João Pedro: Hortelã
    (2, 2), -- Carlos: Camomila
    (2, 4), -- Carlos: Erva-Cidreira
    (3, 1), -- Maria Silva: Capim Limão
    (4, 2), -- Ana Souza: Camomila
    (5, 3); -- Ana Maria: Hortelã

-- Inserts na tabela PREPARO
INSERT INTO PREPARO (descricao)
VALUES
    ('Chá de Capim Limão: Ferver as folhas de capim limão em água por 10 minutos.'),
    ('Chá de Camomila: Colocar as flores de camomila em água quente por 5 minutos.'),
    ('Chá de Hortelã: Adicionar folhas de hortelã em água fervente por 3 minutos.'),
    ('Chá de Erva-Cidreira: Infundir folhas de erva-cidreira em água quente por 7 minutos.'),
    ('Chá Verde: Preparar o chá verde em água quente por 2 minutos.'),
    ('Coloque 1 colher de sopa de capim limão em uma xícara de água fervente. Deixe em infusão por 5 minutos e coe antes de consumir.'),
    ('Adicione 2 colheres de sopa de camomila em uma xícara de água quente. Deixe descansar por 10 minutos e coe antes de beber.'),
    ('Pegue algumas folhas de hortelã fresca e amasse suavemente. Coloque as folhas em uma xícara de água fervente e deixe em infusão por 5 minutos. Coe antes de servir.'),
    ('Coloque 1 colher de sopa de erva-cidreira em uma xícara de água quente. Deixe em infusão por 10 minutos e coe antes de tomar.'),
    ('Aqueça uma xícara de água, mas não deixe ferver. Adicione 1 colher de chá verde e deixe em infusão por 2-3 minutos. Coe antes de consumir.');

-- Inserts na tabela INDICACAO
INSERT INTO INDICACAO (descricao)
VALUES
    ('Alívio de estresse'),
    ('Alívio de ansiedade'),
    ('Auxilia na digestão'),
    ('Promove relaxamento'),
    ('Promove sono tranquilo'),
    ('Ajuda a aliviar dores de cabeça'),
    ('Auxilia na perda de peso'),
    ('Ajuda com diabetes'),
    ('Ajuda com diarreia'),
    ('Promove a saúde cardiovascular'),
    ('Ajuda a aliviar sintomas de gripe e resfriado'),
    ('Contribui para o alívio de dores musculares'),
    ('Auxilia na digestão de alimentos pesados'),
    ('Melhora o sistema imunológico');

-- Inserts na tabela CONTRAINDICACAO
INSERT INTO CONTRAINDICACAO (descricao)
VALUES
    ('Não recomendado para pessoas com alergia a capim limão'),
    ('Pode causar reações alérgicas em pessoas sensíveis à camomila'),
    ('Evitar em casos de refluxo gastroesofágico'),
    ('Não recomendado para pessoas com pressão baixa'),
    ('Em excesso, pode causar insônia e irritabilidade'),
    ('Não recomendado para pessoas diabéticas'),
    ('Evitar em saco de gravidez'),
    ('Em excesso, pode causar vômitos'),
    ('Em excesso pode causar diarreias'),
    ('Não recomendado para gestantes'),
    ('Evitar em casos de alergia ao ingrediente'),
    ('Não recomendado para pessoas com pressão alta'),
    ('Pode causar irritação gastrointestinal em algumas pessoas'),
    ('Em excesso, pode afetar a absorção de nutrientes');


-- Inserts na tabela EFEITO_COLATERAL
INSERT INTO EFEITO_COLATERAL (descricao)
VALUES
    ('Nenhum efeito colateral conhecido'),
    ('Possíveis reações alérgicas em algumas pessoas'),
    ('Pode causar irritação estomacal em grandes quantidades'),
    ('Pode causar sonolência em algumas pessoas'),
    ('Em excesso, pode causar nervosismo e palpitações'),
    ('Em excesso, pode causar dores nas articulações'),
    ('Pode levar à insuficiência renal'),
    ('Pode colaborar com a anorexia'),
    ('Pode te dar azar'),
    ('Possível irritação na pele'),
    ('Pode causar sonolência em algumas pessoas'),
    ('Podem ocorrer dores de cabeça'),
    ('Pode causar aumento da frequência urinária'),
    ('Pode interferir na qualidade do sono');

-- Inserts na tabela PREPARO_INDICACAO
INSERT INTO PREPARO_INDICACAO (FK_INDICACAO_cod_inc, FK_PREPARO_cod_prp)
VALUES
    (1, 1),
    (1, 6),
    (1, 7),
    (1, 9),
    (2, 2),
    (2, 4),
    (2, 10),
    (3, 3),
    (3, 7),
    (3, 12),
    (3, 13),
    (3, 14),
    (4, 1),
    (4, 5),
    (4, 6),
    (5, 2),
    (5, 3),
    (5, 9),
    (5, 13),
    (6, 13),
    (6, 14),
    (7, 2),
    (7, 5),
    (7, 6),
    (7, 8),
    (8, 4),
    (8, 5),
    (8, 12),
    (9, 1),
    (9, 2),
    (9, 5),
    (9, 6),
    (9, 7),
    (10, 3),
    (10, 8),
    (10, 10),
    (10, 11),
    (10, 14);

-- Inserts na tabela PREPARO_CONTRAINDICACAO
INSERT INTO PREPARO_CONTRAINDICACAO (FK_CONTRAINDICACAO_cod_cinc, FK_PREPARO_cod_prp)
VALUES
    (1, 1),
    (1, 4),
    (1, 7),
    (1, 8),
    (1, 11),
    (1, 13),
    (2, 3),
    (2, 5),
    (2, 9),
    (3, 3),
    (3, 7),
    (3, 10),
    (3, 11),
    (3, 14),
    (4, 2),
    (4, 3),
    (4, 7),
    (4, 11),
    (5, 1),
    (5, 3),
    (5, 4),
    (5, 6),
    (5, 10),
    (6, 9),
    (6, 11),
    (7, 7),
    (7, 8),
    (7, 10),
    (7, 11),
    (7, 12),
    (8, 12),
    (8, 13),
    (8, 14),
    (9, 1),
    (9, 3),
    (9, 4),
    (9, 12),
    (10, 3),
    (10, 7),
    (10, 10),
    (10, 11),
    (10, 12);

-- Inserts na tabela PREPARO_EFEITO_COLATERAL
INSERT INTO PREPARO_EFEITO_COLATERAL (FK_EFEITO_COLATERAL_cod_eftcol, FK_PREPARO_cod_prp)
VALUES
    (1, 1),
    (1, 6),
    (1, 7),
    (1, 9),
    (1, 13),
    (2, 3),
    (2, 8),
    (3, 1),
    (3, 4),
    (3, 5),
    (3, 6),
    (3, 10),
    (3, 11),
    (3, 14),
    (4, 2),
    (4, 3),
    (4, 9),
    (5, 6),
    (5, 7),
    (6, 8),
    (7, 1),
    (7, 5),
    (7, 10),
    (7, 11),
    (8, 10),
    (8, 11),
    (8, 12),
    (8, 13),
    (8, 14),
    (9, 1),
    (9, 6),
    (9, 7),
    (9, 12),
    (9, 14),
    (10, 2),
    (10, 10),
    (10, 12),
    (10, 13);



    




/* 
-- Inserts na tabela USUARIO
INSERT INTO USUARIO (nome, email, senha, permissao)
VALUES
    ('João Pedro', 'joaopedro@example.com', 'senha123', 'A'),
    ('Carlos', 'carlos@example.com', 'senha456', 'A'),
    ('Maria Silva', 'mariasilva@example.com', 'senha789', 'A'),
    ('Ana Souza', 'anasouza@example.com', 'senha321', 'C'),
    ('Ana Maria', 'anamaria@example.com', 'senha321', 'C'),
    ('Sr. Souza', 'anasouza@example.com', 'senha321', 'C'),
    ('Moraes', 'anasouza@example.com', 'senha321', 'C'),
    ('Jacinto', 'anasouza@example.com', 'senha321', 'N'),
    ('Arares', 'arares@gmail.com', 'arai9023ds', 'N'),
    ('Monteiro', 'monteiro83@gmail.com', 'kdjsa92jn3', 'N'),
    ('Joana', 'joana.filha@hotmail.com', 'luies42', 'N'),
    ('Lobato Ferreira', 'l0bato.ferro@gmail.com', 'Laka8932r', 'N'),
    ('João Vitor', 'joao.vitor.sch@hotmail.com', 'BananaFrita32', 'N'),
    ('Nicolas', 'nicolas@gmail.com', 'L0dsani', 'N'),
    ('Nicole', 'nicole73@gmail.com', 'batataB0azona12345543', 'N'),
    ('Maria socorro', 'maria.scorro@hotmail.com', '328ff98293jfs', 'N'),
    ('Karine dos Santos', 'karine.asnto@gmail.com', 'fçome89wr23', 'N'),
    ('Amanda', 'amanda.hasio@gmail.com', 'Laiosed232', 'N'),
    ('Ajudada Silveira', 'ajudada.silva@gmail.com', 'Maionese23', 'N'),
    ('Manita', 'manita097@gmail.com', 'Mariana43', 'N'),
    ('Sucrilhos', 'kassita@hotmail.com', 'KassitinhaMorena32', 'N'),
    ('Matador de porcos', '0matador.de.porcos@gmail.com', 'VouBomar23', 'N'),
    ('Shaolin Almeida', 'shaolin.almeida@gmail.com', 'Jacossa231', 'N'),
    ('Pedro Farange', 'predin45.farange@hotmail.com', 'QueloPlastek213', 'N'),
    ('Orgeio Savant', 'orgeio.savant@hotmail.com', '231093432', 'N'),
    ('Laione', 'laione.13232@gmail.com', 'gaelGareno23', 'N'),
    ('Lionel', 'lionel.messi@gmail.com', 'odiasj90', 'N'),
    ('Messi', 'messi.lionel@hotmail.com', 'Weorkaste4530', 'N'),
    ('Carlos Henrique', 'anasouza@example.com', 'senha321', 'N'),
    ('Pedro Henrique', 'pedrohenrique@example.com', 'senha654', 'A');
*/
