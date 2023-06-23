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

-- Inserts na tabela PREPARO
INSERT INTO PREPARO (descricao)
VALUES
    ('Chá de Capim Limão: Ferver as folhas de capim limão em água por 10 minutos.'),
    ('Chá de Camomila: Colocar as flores de camomila em água quente por 5 minutos.'),
    ('Chá de Hortelã: Adicionar folhas de hortelã em água fervente por 3 minutos.'),
    ('Chá de Erva-Cidreira: Infundir folhas de erva-cidreira em água quente por 7 minutos.'),
    ('Chá Verde: Preparar o chá verde em água quente por 2 minutos.');

-- Inserts na tabela INDICACAO
INSERT INTO INDICACAO (descricao)
VALUES
    ('Alívio de estresse e ansiedade'),
    ('Auxilia na digestão'),
    ('Promove relaxamento e sono tranquilo'),
    ('Ajuda a aliviar dores de cabeça'),
    ('Estimula o metabolismo e auxilia na perda de peso');

-- Inserts na tabela CONTRAINDICACAO
INSERT INTO CONTRAINDICACAO (descricao)
VALUES
    ('Não recomendado para pessoas com alergia a capim limão'),
    ('Pode causar reações alérgicas em pessoas sensíveis à camomila'),
    ('Evitar em casos de refluxo gastroesofágico'),
    ('Não recomendado para pessoas com pressão baixa'),
    ('Em excesso, pode causar insônia e irritabilidade');

-- Inserts na tabela EFEITO_COLATERAL
INSERT INTO EFEITO_COLATERAL (descricao)
VALUES
    ('Nenhum efeito colateral conhecido'),
    ('Possíveis reações alérgicas em algumas pessoas'),
    ('Pode causar irritação estomacal em grandes quantidades'),
    ('Pode causar sonolência em algumas pessoas'),
    ('Em excesso, pode causar nervosismo e palpitações');

-- Inserts na tabela PREPARO_INDICACAO
INSERT INTO PREPARO_INDICACAO (FK_INDICACAO_cod_inc, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Chá de Capim Limão: Alívio de estresse e ansiedade
    (2, 2), -- Chá de Camomila: Auxilia na digestão
    (3, 3), -- Chá de Hortelã: Promove relaxamento e sono tranquilo
    (4, 4), -- Chá de Erva-Cidreira: Ajuda a aliviar dores de cabeça
    (5, 5); -- Chá Verde: Estimula o metabolismo e auxilia na perda de peso

-- Inserts na tabela PREPARO_CONTRAINDICACAO
INSERT INTO PREPARO_CONTRAINDICACAO (FK_CONTRAINDICACAO_cod_cinc, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Chá de Capim Limão: Não recomendado para pessoas com alergia a capim limão
    (2, 2), -- Chá de Camomila: Pode causar reações alérgicas em pessoas sensíveis à camomila
    (3, 3), -- Chá de Hortelã: Evitar em casos de refluxo gastroesofágico
    (4, 4), -- Chá de Erva-Cidreira: Não recomendado para pessoas com pressão baixa
    (5, 5); -- Chá Verde: Em excesso, pode causar insônia e irritabilidade

-- Inserts na tabela PREPARO_EFEITO_COLATERAL
INSERT INTO PREPARO_EFEITO_COLATERAL (FK_EFEITO_COLATERAL_cod_eftcol, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Chá de Capim Limão: Nenhum efeito colateral conhecido
    (2, 2), -- Chá de Camomila: Possíveis reações alérgicas em algumas pessoas
    (3, 3), -- Chá de Hortelã: Pode causar irritação estomacal em grandes quantidades
    (4, 4), -- Chá de Erva-Cidreira: Pode causar sonolência em algumas pessoas
    (5, 5); -- Chá Verde: Em excesso, pode causar nervosismo e palpitações

-- Inserts na tabela PLANTA_PREPARO
INSERT INTO PLANTA_PREPARO (FK_PLANTA_cod_plt, FK_PREPARO_cod_prp)
VALUES
    (1, 1), -- Capim Limão: Chá de Capim Limão
    (2, 2), -- Camomila: Chá de Camomila
    (3, 3), -- Hortelã: Chá de Hortelã
    (4, 4), -- Erva-Cidreira: Chá de Erva-Cidreira
    (5, 5); -- Chá Verde: Chá Verde

-- Inserts na tabela INDICACAO
INSERT INTO INDICACAO (descricao)
VALUES
    ('Promove a saúde cardiovascular'),
    ('Ajuda a aliviar sintomas de gripe e resfriado'),
    ('Contribui para o alívio de dores musculares'),
    ('Auxilia na digestão de alimentos pesados'),
    ('Melhora o sistema imunológico');

-- Inserts na tabela PREPARO_INDICACAO
INSERT INTO PREPARO_INDICACAO (FK_INDICACAO_cod_inc, FK_PREPARO_cod_prp)
VALUES
    (6, 1), -- Chá de Capim Limão: Promove a saúde cardiovascular
    (7, 2), -- Chá de Camomila: Ajuda a aliviar sintomas de gripe e resfriado
    (8, 3), -- Chá de Hortelã: Contribui para o alívio de dores musculares
    (9, 4), -- Chá de Erva-Cidreira: Auxilia na digestão de alimentos pesados
    (10, 5); -- Chá Verde: Melhora o sistema imunológico

-- Inserts na tabela CONTRAINDICACAO
INSERT INTO CONTRAINDICACAO (descricao)
VALUES
    ('Não recomendado para gestantes'),
    ('Evitar em casos de alergia ao ingrediente'),
    ('Não recomendado para pessoas com pressão alta'),
    ('Pode causar irritação gastrointestinal em algumas pessoas'),
    ('Em excesso, pode afetar a absorção de nutrientes');

-- Inserts na tabela PREPARO_CONTRAINDICACAO
INSERT INTO PREPARO_CONTRAINDICACAO (FK_CONTRAINDICACAO_cod_cinc, FK_PREPARO_cod_prp)
VALUES
    (6, 1), -- Chá de Capim Limão: Não recomendado para gestantes
    (7, 2), -- Chá de Camomila: Evitar em casos de alergia ao ingrediente
    (8, 3), -- Chá de Hortelã: Não recomendado para pessoas com pressão alta
    (9, 4), -- Chá de Erva-Cidreira: Pode causar irritação gastrointestinal em algumas pessoas
    (10, 5); -- Chá Verde: Em excesso, pode afetar a absorção de nutrientes

-- Inserts na tabela EFEITO_COLATERAL
INSERT INTO EFEITO_COLATERAL (descricao)
VALUES
    ('Possível irritação na pele'),
    ('Pode causar sonolência em algumas pessoas'),
    ('Podem ocorrer dores de cabeça'),
    ('Pode causar aumento da frequência urinária'),
    ('Pode interferir na qualidade do sono');

-- Inserts na tabela PREPARO_EFEITO_COLATERAL
INSERT INTO PREPARO_EFEITO_COLATERAL (FK_EFEITO_COLATERAL_cod_eftcol, FK_PREPARO_cod_prp)
VALUES
    (6, 1), -- Chá de Capim Limão: Possível irritação na pele
    (7, 2), -- Chá de Camomila: Pode causar sonolência em algumas pessoas
    (8, 3), -- Chá de Hortelã: Podem ocorrer dores de cabeça
    (9, 4), -- Chá de Erva-Cidreira: Pode causar aumento da frequência urinária
    (10, 5); -- Chá Verde: Pode interferir na qualidade do sono
