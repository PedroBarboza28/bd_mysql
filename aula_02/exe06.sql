
CREATE DATABASE db_curso_da_minha_vida;
drop DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;


CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    valor VARCHAR(100) NOT NULL,
    duracao_meses varchar(100) NOT NULL
);


CREATE TABLE tb_cursos  (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    objetivo VARCHAR(255),
    requisitos VARCHAR(100)
);

INSERT INTO tb_categorias (valor, duracao_meses) VALUES
('R$ 300.00', '6 meses'),
('R$ 600.00', '12 meses'),
('R$ 400.00', '8 meses'),
('R$ 500.00', '10 meses'),
('R$ 700.00', '9 meses');

INSERT INTO tb_cursos (nome, carga_horaria, objetivo, requisitos, classifica_id) VALUES
('Farmácia Hospitalar', 240, 'Formar profissionais para atuar em farmácias hospitalares', 'Graduação em Farmácia', 4),
('Análises Clínicas', 180, 'Capacitar para análises laboratoriais em saúde', 'Graduação em Farmácia', 4),
('Farmácia Industrial', 300, 'Focar na produção de medicamentos em indústrias farmacêuticas', 'Graduação em Farmácia', 2),
('Farmácia Estética', 120, 'Atuação voltada para produtos cosméticos e estéticos', 'Graduação em Farmácia', 5),
('Farmacotécnica', 200, 'Estudo das técnicas de preparação e manipulação de medicamentos', 'Graduação em Farmácia', 2),
('Farmácia Comunitária', 160, 'Atendimento e orientação farmacêutica à comunidade', 'Graduação em Farmácia', 3),
('Fitoterapia', 150, 'Estudo das plantas medicinais e suas aplicações terapêuticas', 'Graduação em Farmácia', 1),
('Toxicologia Clínica', 220, 'Estudo dos efeitos tóxicos de substâncias no contexto clínico', 'Graduação em Farmácia', 5);

ALTER TABLE tb_cursos ADD classifica_id BIGINT;
ALTER TABLE tb_cursos ADD CONSTRAINT fk_cursos_categorias 
FOREIGN KEY (classifica_id) REFERENCES tb_categorias (id);

UPDATE tb_cursos SET classifica_id = 1 WHERE id = 4;
UPDATE tb_cursos SET classifica_id = 2 WHERE id = 4;
UPDATE tb_cursos SET classifica_id = 3 WHERE id = 2;
UPDATE tb_cursos SET classifica_id = 4 WHERE id = 5;
UPDATE tb_cursos SET classifica_id = 5 WHERE id = 2;
UPDATE tb_cursos SET classifica_id = 6 WHERE id = 3;
UPDATE tb_cursos SET classifica_id = 7 WHERE id = 1;
UPDATE tb_cursos SET classifica_id = 8 WHERE id = 5;


SELECT * FROM tb_categorias WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) > 500.00;

SELECT * FROM tb_categorias WHERE CAST(SUBSTRING(valor, 4) AS DECIMAL(10, 2)) between 600.00 and 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%j%';


SELECT 
    tb_cursos.nome,
    tb_cursos.carga_horaria,
    tb_cursos.objetivo,
    tb_cursos.requisitos,
    tb_categorias.valor,
    tb_categorias.duracao_meses
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.classifica_id = tb_categorias.id;

SELECT 
    tb_cursos.nome,
    tb_cursos.carga_horaria,
    tb_cursos.objetivo,
    tb_cursos.requisitos,
    tb_categorias.valor,
    tb_categorias.duracao_meses
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.classifica_id = tb_categorias.id
WHERE tb_categorias.valor = 'R$ 400.00'
AND tb_categorias.duracao_meses = '8 meses'