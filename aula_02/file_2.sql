CREATE DATABASE loja_praia_viva;

USE loja_praia_viva;


CREATE TABLE loja_praia_viva(
id bigint AUTO_INCREMENT PRIMARY KEY,
nome varchar(255) NOT NULL,
cor varchar(80) NOT NULL, 
preco decimal(6,2) NOT NULL,
quantidade INT NOT NULL, 
tamanho varchar(255) NOT NULL
);

INSERT INTO loja_praia_viva(nome, cor, preco, quantidade, tamanho) values
("Guarda sol","Azul e Branco", 250.00, 10,"Maior"), 
("Toalha de Praia","Abóbora", 89.99, 6,"Único"),
("Cadeira de Praia","zul e Braco", 89.99, 10,"Maior"),
("Chinelo","Branco", 59.00, 15,"39"),
("Óculos de Sol", "Preto", 250.00, 8,"Único"),
("Bolsa Térmica","Cinza", 85.00, 4,"Grande"),
("Protetor Solar","-", 120.00, 7,"-"),
("Rancha de Surf","Verde e Branco", 1245.00, 5,"213cm");


SELECT * FROM loja_praia_viva WHERE preco > 500.00;

SELECT * FROM loja_praia_viva WHERE preco < 500.00;

UPDATE loja_praia_viva SET quantidade = 3  WHERE id = 8;





