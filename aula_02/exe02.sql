CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_pizzas   (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR(255) NOT NULL,
    massa VARCHAR(100) NOT NULL,
    tipo_de_queijo VARCHAR(100) NOT NULL,
    molho VARCHAR(100) NOT NULL
);

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    valor varchar(50) NOT NULL,
    tamanho VARCHAR(255) NOT NULL
);

INSERT INTO tb_categorias(valor, tamanho) VALUES
("R$ 79.90","Familia"),
("R$ 69.90","Extra Grande"),
("R$ 59.90","Grande"),
("R$ 49.90","Pequena"),
("R$ 39.90","Brotinho");

SELECT * FROM tb_pizzas;

ALTER TABLE tb_pizzas ADD classifica_id BIGINT;
ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias 
FOREIGN KEY (classifica_id) REFERENCES tb_categorias (id);

UPDATE tb_pizzas SET classifica_id = 1 WHERE id = 1;
UPDATE tb_pizzas SET classifica_id = 2 WHERE id = 3;
UPDATE tb_pizzas SET classifica_id = 3 WHERE id = 5;
UPDATE tb_pizzas SET classifica_id = 4 WHERE id = 1;
UPDATE tb_pizzas SET classifica_id = 5 WHERE id = 5;
UPDATE tb_pizzas SET classifica_id = 6 WHERE id = 2;
UPDATE tb_pizzas SET classifica_id = 7 WHERE id = 4;
UPDATE tb_pizzas SET classifica_id = 8 WHERE id = 1;

INSERT INTO tb_pizzas (sabor, massa, tipo_de_queijo, molho, classifica_id) VALUES
('Margherita', 'Fina', 'Mussarela', 'Tomate', 1),
('Pepperoni', 'Pan', 'Parmesão', 'Molho de Tomate', 3),
('Quatro Queijos', 'Grossa', 'Gorgonzola', 'Molho Branco', 5),
('Calabresa', 'Fina', 'Mussarela', 'Molho de Tomate', 1),
('Frango com Catupiry', 'Fina', 'Catupiry', 'Molho de Tomate', 5),
('Vegetariana', 'Integral', 'Mussarela', 'Molho de Tomate', 2),
('Quatro Estações', 'Pan', 'Mussarela', 'Molho de Tomate', 4),
('Portuguesa', 'Fina', 'Mussarela', 'Molho de Tomate', 1);

SELECT * FROM tb_pizzas;

SELECT 
    tb_pizzas.sabor, 
    tb_pizzas.massa, 
    tb_pizzas.tipo_de_queijo, 
    tb_pizzas.molho, 
    tb_categorias.valor, 
    tb_categorias.tamanho
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.classifica_id = tb_categorias.id;

SELECT * FROM tb_categorias WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) > 45.00;

SELECT * FROM tb_categorias WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) between 50.00 and 100.00;

SELECT * FROM tb_pizzas WHERE sabor LIKE "%M%";


SELECT 
    tb_pizzas.sabor, 
    tb_pizzas.massa, 
    tb_pizzas.tipo_de_queijo, 
    tb_pizzas.molho, 
    tb_categorias.valor, 
    tb_categorias.tamanho
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.classifica_id = tb_categorias.id
where tb_categorias.valor = "R$ 79.90"
and tb_categorias.tamanho = "Familia";
