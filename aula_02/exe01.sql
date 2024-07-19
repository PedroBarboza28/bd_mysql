CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_personagens  (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    forca DECIMAL(3,1) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL
);

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    habilidade_especial VARCHAR(255) NOT NULL
);

INSERT INTO tb_classes(tipo, habilidade_especial) VALUES
("Usuários de Armas de Fogo","Engenharia"),
("Usuários de Akuma no Mi","combate corpo a corpo"),
("Espadachim","Haki do Armamento e Observação"),
("Capitão dos Piratas do Chapéu de Palha","Gear Second e Gear Third"),
("Habilidade em manobrar","Inteligência e estratégia");

SELECT * FROM tb_personagens;

ALTER TABLE tb_personagens ADD classifica_id BIGINT;
ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes 
FOREIGN KEY (classifica_id) REFERENCES tb_classes (id);

UPDATE tb_personagens SET classifica_id = 1 WHERE id = 4;
UPDATE tb_personagens SET classifica_id = 2 WHERE id = 3;
UPDATE tb_personagens SET classifica_id = 3 WHERE id = 5;
UPDATE tb_personagens SET classifica_id = 4 WHERE id = 1;
UPDATE tb_personagens SET classifica_id = 5 WHERE id = 5;
UPDATE tb_personagens SET classifica_id = 6 WHERE id = 2;
UPDATE tb_personagens SET classifica_id = 7 WHERE id = 2;
UPDATE tb_personagens SET classifica_id = 8 WHERE id = 1;

INSERT INTO tb_personagens(nome, forca, ataque, defesa, classifica_id) VALUES
('Monkey D. Luffy', 9.8, 6000, 5000, 4),
('Roronoa Zoro', 9.5, 5000, 6000, 3),
('Nami', 8.4, 4500, 5000, 5),
('Usopp', 8.0, 3000, 5000, 1),
('Sanji', 9.1, 4600, 5500, 5),
('Tony Tony Chopper', 5.2, 1800, 1300, 2),
('Nico Robin', 9.0, 4000, 1500, 2),
('Franky', 9.3, 5000, 5000, 1);

SELECT * FROM tb_personagens;

SELECT 
    tb_personagens.nome, 
    tb_personagens.forca, 
    tb_personagens.ataque, 
    tb_personagens.defesa, 
    tb_classes.tipo, 
    tb_classes.habilidade_especial
FROM tb_personagens 
INNER JOIN tb_classes 
ON tb_personagens.classifica_id = tb_classes.id;

SELECT * FROM tb_personagens where ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";


SELECT 
    tb_personagens.nome, 
    tb_personagens.forca, 
    tb_personagens.ataque, 
    tb_personagens.defesa, 
    tb_classes.tipo, 
    tb_classes.habilidade_especial
FROM tb_personagens 
INNER JOIN tb_classes 
ON tb_personagens.classifica_id = tb_classes.id
WHERE tb_classes.tipo = 'Usuários de Armas de Fogo'
AND tb_classes.habilidade_especial = 'Engenharia';
