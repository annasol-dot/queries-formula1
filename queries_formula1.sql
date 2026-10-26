-- =====================================================
-- Trabalho DML - Modelagem de Dados - Cenário Fórmula 1
-- =====================================================

DROP DATABASE IF EXISTS db_formula1;
CREATE DATABASE db_formula1;
USE db_formula1;

CREATE TABLE paises (
    codigo INT          NOT NULL,
    nome   VARCHAR(50)  NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE equipes (
    sigla    CHAR(3)     NOT NULL,
    nome     VARCHAR(50) NOT NULL,
    cod_pais INT         NOT NULL,
    PRIMARY KEY (sigla),
    FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);

CREATE TABLE pilotos (
    numero       INT         NOT NULL,
    nome         VARCHAR(60) NOT NULL,
    cod_pais     INT         NOT NULL,
    sigla_equipe CHAR(3)     NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (cod_pais)     REFERENCES paises (codigo),
    FOREIGN KEY (sigla_equipe) REFERENCES equipes (sigla)
);

CREATE TABLE corridas (
    sigla_gp   CHAR(3)     NOT NULL,
    nome_gp    VARCHAR(60) NOT NULL,
    cod_pais   INT         NOT NULL,
    qtd_voltas INT         NOT NULL,
    PRIMARY KEY (sigla_gp),
    FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);

CREATE TABLE participantes (
    sigla_gp        CHAR(3) NOT NULL,
    num_piloto      INT     NOT NULL,
    posicao_largada INT     NOT NULL,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp)   REFERENCES corridas (sigla_gp),
    FOREIGN KEY (num_piloto) REFERENCES pilotos (numero)
);


-- Países
INSERT INTO paises (codigo, nome) VALUES
    (1, 'Brasil'),
    (2, 'Itália'),
    (3, 'França'),
    (4, 'Reino Unido'),
    (5, 'Alemanha'),
    (6, 'Mônaco'),
    (7, 'Bélgica'),
    (8, 'Bahrein'),
    (9, 'Áustria'),
    (10, 'Holanda');

-- Equipes
INSERT INTO equipes (sigla, nome, cod_pais) VALUES
    ('FER', 'Ferrari',         2),
    ('MCL', 'McLaren',         4),
    ('MER', 'Mercedes',        5),
    ('ALP', 'Alpine',          3),
    ('WIL', 'Williams',        4),
    ('RBR', 'Red Bull Racing', 9);

-- Query 1: no mínimo 5 pilotos do Brasil, 3 da Itália e 2 da França
INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
    -- Brasil (5)
    (12, 'Ayrton Senna',        1, 'MCL'),
    (19, 'Felipe Massa',        1, 'FER'),
    (11, 'Rubens Barrichello',  1, 'WIL'),
    (6,  'Nelson Piquet',       1, 'WIL'),
    (5,  'Gabriel Bortoleto',   1, 'RBR'),
    -- Itália (3)
    (21, 'Giancarlo Fisichella', 2, 'FER'),
    (9,  'Jarno Trulli',         2, 'ALP'),
    (24, 'Kimi Antonelli',       2, 'MER'),
    -- França (2)
    (10, 'Pierre Gasly',  3, 'ALP'),
    (31, 'Esteban Ocon',  3, 'ALP');

-- Query 2: popular as demais tabelas
-- Mais pilotos de outros países
INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
    (44, 'Lewis Hamilton',     4,  'MER'),
    (4,  'Lando Norris',       4,  'MCL'),
    (3,  'Michael Schumacher', 5,  'FER'),
    (16, 'Charles Leclerc',    6,  'FER'),
    (33, 'Max Verstappen',     10, 'RBR');

-- Corridas
INSERT INTO corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
    ('BRA', 'Grande Prêmio de São Paulo',     1, 71),
    ('ITA', 'Grande Prêmio da Itália',        2, 53),
    ('FRA', 'Grande Prêmio da França',        3, 53),
    ('GBR', 'Grande Prêmio da Grã-Bretanha',  4, 52),
    ('MON', 'Grande Prêmio de Mônaco',        6, 78),
    ('BEL', 'Grande Prêmio da Bélgica',       7, 44),
    ('BHR', 'Grande Prêmio do Bahrein',       8, 57);

-- Participantes (piloto x corrida x posição de largada)
INSERT INTO participantes (sigla_gp, num_piloto, posicao_largada) VALUES
    ('BRA', 12, 1), ('BRA', 44, 2), ('BRA', 19, 3), ('BRA', 5,  4),
    ('ITA', 16, 1), ('ITA', 24, 2), ('ITA', 21, 3), ('ITA', 33, 4),
    ('FRA', 10, 1), ('FRA', 31, 2), ('FRA', 9,  3),
    ('GBR', 44, 1), ('GBR', 4,  2), ('GBR', 11, 3),
    ('MON', 16, 1), ('MON', 12, 2), ('MON', 3,  3),
    ('BEL', 33, 1), ('BEL', 6,  2), ('BEL', 10, 3),
    ('BHR', 4,  1), ('BHR', 24, 2), ('BHR', 19, 3);

-- Query 3: países que começam com B e terminam com L
SELECT nome
FROM paises
WHERE nome LIKE 'B%l';

-- Query 4: pilotos dos países Brasil, Itália e França
SELECT p.nome AS piloto, pa.nome AS pais
FROM pilotos p
JOIN paises pa ON p.cod_pais = pa.codigo
WHERE pa.nome IN ('Brasil', 'Itália', 'França');

-- Query 5: nome dos pilotos
SELECT nome
FROM pilotos;

-- Query 6: nome dos GPs e quantidade de voltas (com ALIAS)
SELECT nome_gp    AS `Grande Prêmio`,
       qtd_voltas AS `Quantidade de Voltas`
FROM corridas;

-- Query 7: nome dos pilotos e seus países
SELECT p.nome  AS piloto,
       pa.nome AS pais
FROM pilotos p
JOIN paises pa ON p.cod_pais = pa.codigo;

-- Query 8: inserir o atributo salário na tabela piloto
ALTER TABLE pilotos ADD COLUMN salario DECIMAL(10,2);

-- Query 9: popular o atributo salário
UPDATE pilotos SET salario = 95000.00 WHERE numero = 12;
UPDATE pilotos SET salario = 80000.00 WHERE numero = 19;
UPDATE pilotos SET salario = 70000.00 WHERE numero = 11;
UPDATE pilotos SET salario = 65000.00 WHERE numero = 6;
UPDATE pilotos SET salario = 50000.00 WHERE numero = 5;
UPDATE pilotos SET salario = 80000.00 WHERE numero = 21;
UPDATE pilotos SET salario = 60000.00 WHERE numero = 9;
UPDATE pilotos SET salario = 75000.00 WHERE numero = 24;
UPDATE pilotos SET salario = 90000.00 WHERE numero = 10;
UPDATE pilotos SET salario = 85000.00 WHERE numero = 31;
UPDATE pilotos SET salario = 150000.00 WHERE numero = 44;
UPDATE pilotos SET salario = 100000.00 WHERE numero = 4;
UPDATE pilotos SET salario = 120000.00 WHERE numero = 3;
UPDATE pilotos SET salario = 110000.00 WHERE numero = 16;
UPDATE pilotos SET salario = 150000.00 WHERE numero = 33;

-- Query 10: pilotos com salário entre 70 e 100 mil
SELECT nome, salario
FROM pilotos
WHERE salario BETWEEN 70000 AND 100000;

-- Query 11: média salarial por cod_pais
SELECT cod_pais,
       ROUND(AVG(salario), 2) AS media_salarial
FROM pilotos
GROUP BY cod_pais;

-- Query 12: salários distintos em ordem crescente
SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;
