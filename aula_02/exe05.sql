
CREATE DATABASE db_construindo_vidas;
drop DATABASE db_construindo_vidas;
USE db_construindo_vidas;


CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);


CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    detalhes VARCHAR(255) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    valor VARCHAR(100) NOT NULL
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
('Ferramentas', 'Ferramentas essenciais para construção e reforma'),
('Materiais Elétricos', 'Componentes elétricos e acessórios'),
('Pisos e Revestimentos', 'Diversidade de pisos e revestimentos para ambientes'),
('Ferragens', 'Itens diversos como dobradiças, fechaduras e parafusos'),
('Tintas e Acabamentos', 'Tintas, vernizes e produtos para acabamento');

INSERT INTO tb_produtos (nome, detalhes, marca, valor, classifica_id) VALUES
('Furadeira de Impacto', 'Ideal para perfurações em concreto e alvenaria', 'Marca A', "R$ 299.99", 1),
('Disjuntor 30A', 'Para proteção do circuito elétrico', 'Marca B', "R$ 49.90", 2),
('Porcelanato Bege', 'Piso porcelanato para áreas internas', 'Marca C', "R$ 69.99", 3),
('Dobradiça 3.5"', 'Para portas de madeira', 'Marca D', "R$ 12.50", 4),
('Tinta Acrílica Branca', 'Para pintura interna e externa', 'Marca E', "R$ 89.90", 5),
('Martelo de Borracha', 'Utilizado para ajustes sem danificar superfícies', 'Marca A', "R$ 19.99", 1),
('Tomada Dupla 10A', 'Tomada para instalações residenciais', 'Marca B', "R$ 9.99", 2),
('Pastilha de Vidro Azul', 'Revestimento decorativo para banheiros', 'Marca C', "R$ 29.99", 3);

ALTER TABLE tb_produtos ADD classifica_id BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (classifica_id) REFERENCES tb_categorias (id);

UPDATE tb_produtos SET classifica_id = 1 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 2 WHERE id = 2;
UPDATE tb_produtos SET classifica_id = 3 WHERE id = 3;
UPDATE tb_produtos SET classifica_id = 4 WHERE id = 4;
UPDATE tb_produtos SET classifica_id = 5 WHERE id = 5;
UPDATE tb_produtos SET classifica_id = 6 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 7 WHERE id = 2;
UPDATE tb_produtos SET classifica_id = 8 WHERE id = 3;


SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) > 100.00;

SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) between 70.00 and 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%c%';


SELECT 
    tb_produtos.nome,
    tb_produtos.detalhes,
    tb_produtos.marca,
    tb_produtos.valor,
    tb_categorias.tipo,
    tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id;

SELECT 
    tb_produtos.nome,
    tb_produtos.detalhes,
    tb_produtos.marca,
    tb_produtos.valor,
    tb_categorias.tipo,
    tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id
WHERE tb_categorias.tipo = 'Materiais elétricos'
AND tb_categorias.descricao = 'Componentes elétricos e acessórios'