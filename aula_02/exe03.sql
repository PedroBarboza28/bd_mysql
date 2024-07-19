CREATE DATABASE db_farmacia_bem_estar;
DROP DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos    (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor VARCHAR(255) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL
);

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo varchar(50) NOT NULL,
    forma_farmaceutica VARCHAR(255) NOT NULL
);


INSERT INTO tb_categorias (tipo, forma_farmaceutica) VALUES
('Analgésico', 'Comprimido'),
('Antibiótico', 'Cápsula'),
('Antitérmico', 'Xarope'),
('Anti-inflamatório', 'Pomada'),
('Vitaminas', 'Cápsula');

INSERT INTO tb_produtos (nome, valor, descricao, fabricante, classifica_id) VALUES
('Paracetamol 500mg', "R$ 10.50", 'Analgésico para alívio de dores', 'Generic Pharma', 1),
('Amoxicilina 500mg',"R$ 15.75", 'Antibiótico de amplo espectro', 'Medley', 2),
('Dipirona Sódica 1g', "R$ 8.99", 'Analgésico e antitérmico', 'EMS', 1),
('Ibuprofeno 400mg', "R$ 12.30", 'Anti-inflamatório não esteroide', 'Neo Química', 4),
('Vitamina C 1000mg', "R$ 20.00", 'Suplemento vitamínico', 'Aché', 5),
('Dorflex 300mg', "R$ 9.80", 'Analgésico e relaxante muscular', 'Hypera Pharma', 1),
('Omeprazol 20mg', "R$ 18.50", 'Inibidor da bomba de prótons', 'Genérico', 4),
('Xarope para Tosse', "R$ 60.00", 'Expectorante para alívio da tosse', 'Cimed', 3);

ALTER TABLE tb_produtos ADD classifica_id BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (classifica_id) REFERENCES tb_categorias (id);

UPDATE tb_produtos SET classifica_id = 1 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 2 WHERE id = 2;
UPDATE tb_produtos SET classifica_id = 3 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 4 WHERE id = 4;
UPDATE tb_produtos SET classifica_id = 5 WHERE id = 5;
UPDATE tb_produtos SET classifica_id = 6 WHERE id = 1;
UPDATE tb_produtos SET classifica_id = 7 WHERE id = 4;
UPDATE tb_produtos SET classifica_id = 8 WHERE id = 3;

SELECT 
    tb_produtos.nome,
    tb_produtos.valor,
    tb_produtos.descricao,
    tb_produtos.fabricante,
    tb_categorias.tipo,
    tb_categorias.forma_farmaceutica
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id;

SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) > 50.00;

SELECT * FROM tb_produtos WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) between 5.00 and 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%c%';

SELECT 
    tb_produtos.nome,
    tb_produtos.valor,
    tb_produtos.descricao,
    tb_produtos.fabricante,
    tb_categorias.tipo,
    tb_categorias.forma_farmaceutica
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.classifica_id = tb_categorias.id
WHERE tb_categorias.tipo = "Analgésico"
AND tb_categorias.forma_farmaceutica = "Comprimido"
