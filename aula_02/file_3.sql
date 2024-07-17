CREATE DATABASE escola;

USE escola;

CREATE TABLE resultado_final (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    media VARCHAR(200) NOT NULL,
    resultado VARCHAR(55) NOT NULL,
    ano_letivo INT NOT NULL
);

CREATE TABLE alunos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    resultado_final_id BIGINT NOT NULL,
    FOREIGN KEY (resultado_final_id) REFERENCES resultado_final(id)
);

INSERT INTO resultado_final (media, resultado, ano_letivo) VALUES
("6.00 a 10.00", "Aprovado", 2024),
("4.0 a 5.99", "Recuperacao", 2024),
("0.00 a 3.99", "Reprovado", 2024);

INSERT INTO alunos (nome, data_nascimento, nota, resultado_final_id) VALUES
("Roberta", "1996-06-05", 8.00, 1),
("Ana", "1996-08-22", 9.00, 1),
("Maria", "1996-02-18", 5.00, 2),
("Lana","1994-09-01", 4.50, 2),
("Nicole", "1994-04-13", 2.00, 3);

SELECT e.id, e.nome, e.data_nascimento, e.nota, t.resultado AS resultado_final
FROM alunos e
JOIN resultado_final t ON e.resultado_final_id = t.id;

SELECT * FROM alunos WHERE nota > 7.00;

SELECT * FROM alunos WHERE nota < 7.00;

update alunos set nota = 6.00 where id = 3;
















