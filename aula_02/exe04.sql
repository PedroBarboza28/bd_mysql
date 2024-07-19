
CREATE DATABASE db_cidade_das_carnes;
drop DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;


CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);


CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor VARCHAR(100) NOT NULL,
    validade DATE NOT NULL,
    origem VARCHAR(100) NOT NULL
);


INSERT INTO tb_categorias (tipo, descricao) VALUES
('Carnes Bovinas', 'Diversos cortes de carne bovina'),
('Carnes Suínas', 'Diversos cortes de carne suína'),
('Frutas', 'Variedades de frutas frescas'),
('Verduras', 'Variedades de verduras frescas'),
('Legumes', 'Variedades de legumes frescos');


INSERT INTO tb_produtos (nome, valor, validade, origem, classifica_id) VALUES
('Picanha Premium', "R$ 59.90", '2024-02-18', 'Brasil', 1),
('Costela Suína', "R$ 29.90", '2024-02-25', 'Brasil', 2),
('Maçã Gala', "R$ 4.99", '2024-02-11', 'Brasil', 3),
('Tomate Italiano', "R$ 3.49", '2024-03-22', 'Brasil', 4),
('Abobrinha Verde', "R$ 2.99", '2024-03-08', 'Brasil', 5),
('Alcatra', "R$ 49.90", '2024-03-19', 'Brasil', 1),
('Laranja Pera', "R$ 3.99", '2024-02-11', 'Brasil', 3),
('Batata Doce', "R$ 3.79", '2024-05-14', 'Brasil', 5);

ALTER TABLE tb_produtos ADD classifica_id BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (classifica_id) REFERENCES tb_categorias (id);

UPDATE tb_produtos SET classifica_id = 1 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 2 WHERE id = 2;
UPDATE tb_produtos SET classifica_id = 3 WHERE id = 3;
UPDATE tb_produtos SET classifica_id = 4 WHERE id = 4;
UPDATE tb_produtos SET classifica_id = 5 WHERE id = 5;
UPDATE tb_produtos SET classifica_id = 6 WHERE id = 2;
UPDATE tb_produtos SET classifica_id = 7 WHERE id = 3;
UPDATE tb_produtos SET classifica_id = 8 WHERE id = 5;


SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) > 50.00;

SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) between 50.00 and 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%c%';

SELECT 
    tb_produtos.nome,
    tb_produtos.valor,
    tb_produtos.validade,
    tb_produtos.origem,
    tb_categorias.tipo,
    tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id;


SELECT 
    tb_produtos.nome,
    tb_produtos.valor,
    tb_produtos.validade,
    tb_produtos.origem,
    tb_categorias.tipo,
    tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id
WHERE tb_categorias.tipo = 'Legumes'
AND tb_categorias.descricao = 'Variedades de legumes frescos'