CREATE DATABASE funcionarios;

USE funcionarios;


CREATE TABLE funcionarios(
id bigint AUTO_INCREMENT PRIMARY KEY,
nome varchar(255) NOT NULL,
salario decimal(8,2) not null, 
cargo varchar(80) not null,
departamento varchar(255) NOT NULL, 
data_de_admissao date
);

INSERT INTO funcionarios(nome, salario, cargo, departamento, data_de_admissao) values
("Alan",3000.00, "Gerente", "Gerência","2022-05-01"), 
("Fábio",2250.00, "Analista de RH", "Setor de RH","2022-11-19"),
("Elena",1400.00, "Assistente de Vendas", "Área de Vendas","2022-09-10"),
("Lana",1400.00, "Assistente de Vendas", "Área de Vendas","2022-06-14"),
("Pablo",1800.00, "Operador de Caixa", "Caixa","2022-04-12");

SELECT * FROM funcionarios WHERE salario > 2000.00;

SELECT * FROM funcionarios WHERE salario < 2000.00;

UPDATE funcionarios SET salario = 1550.00  WHERE id = 4;



