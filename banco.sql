CREATE DATABASE biblioteca_1ano;

USE biblioteca_1ano;

#Criando usuário
CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';


#Dar Permissão ao usuário
GRANT ALL PRIVILEGES
ON biblioteca_1ano.*
TO 'biblioteca_user1'@'localhost';


#Atualiza Permissão
FLUSH PRIVILEGES;

#Visualizar todas as bases existentes
SHOW DATABASES;

#Visualizar todos os usuários
SELECT user FROM mysql.user;

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(10) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(30) NOT NULL, -- ex: 'aluno', 'professor', 'bibliotecario'
    status VARCHAR(20) NOT NULL,
    id_aluno INT,
    id_professor INT,
    id_bibliotecario INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

-- Insert aluno (5 registros)
INSERT INTO aluno (nome, serie, turma, telefone) VALUES
('Carlos Silva', '1º Ano', 'A', '11999998888'),
('Ana Souza', '2º Ano', 'B', '11988887777'),
('Bruno Lima', '3º Ano', 'C', '11977776666'),
('Mariana Costa', '1º Ano', 'B', '11966665555'),
('Lucas Rocha', '2º Ano', 'A', '11955554444');

-- Insert bibliotecario (5 registros)
INSERT INTO bibliotecario (nome, email) VALUES
('Fernanda Melo', 'fernanda.biblioteca@escola.com'),
('Roberto Dias', 'roberto.biblioteca@escola.com'),
('Camila Alves', 'camila.biblioteca@escola.com'),
('Ricardo Santos', 'ricardo.biblioteca@escola.com'),
('Juliana Reis', 'juliana.biblioteca@escola.com');

-- Insert professor (5 registros)
INSERT INTO professor (nome, telefone, email) VALUES
('Prof. Marcelo Peixoto', '11944443333', 'marcelo.peixoto@escola.com'),
('Profa. Sandra Regina', '11933332222', 'sandra.regina@escola.com'),
('Prof. Antônio Cruz', '11922221111', 'antonio.cruz@escola.com'),
('Profa. Beatriz Nunes', '11911110000', 'beatriz.nunes@escola.com'),
('Prof. Cláudio Duarte', '11900009999', 'claudio.duarte@escola.com');

-- Insert livro (5 registros)
INSERT INTO livro (titulo, autor, categoria, status) VALUES
('Dom Casmurro', 'Machado de Assis', 'Literatura Brasileira', 'Disponível'),
('O Alquimista', 'Paulo Coelho', 'Ficção', 'Emprestado'),
('Quincas Borba', 'Machado de Assis', 'Literatura Brasileira', 'Disponível'),
('A Hora da Estrela', 'Clarice Lispector', 'Romance', 'Disponível'),
('O Cortiço', 'Aluísio Azevedo', 'Naturalismo', 'Manutenção');

INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista, data_devolucao, status) VALUES
(1, 2, 1, '2026-08-10', '2026-08-17', '2026-08-16', 'Finalizado'),
(2, 1, 2, '2026-08-15', '2026-08-22', NULL, 'Ativo'),
(3, 3, 1, '2026-08-18', '2026-08-25', NULL, 'Ativo'),
(4, 4, 3, '2026-08-20', '2026-08-27', '2026-08-24', 'Finalizado'),
(5, 5, 4, '2026-08-22', '2026-08-29', NULL, 'Atrasado');

INSERT INTO usuario (nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario) VALUES
('Carlos Silva', 'carlos.aluno@escola.com', 'senha123', 'aluno', 'Ativo', 1, NULL, NULL),
('Ana Souza', 'ana.aluno@escola.com', 'senha456', 'aluno', 'Ativo', 2, NULL, NULL),
('Prof. Marcelo Peixoto', 'marcelo.peixoto@escola.com', 'profpwd1', 'professor', 'Ativo', NULL, 1, NULL),
('Profa. Sandra Regina', 'sandra.regina@escola.com', 'profpwd2', 'professor', 'Inativo', NULL, 2, NULL),
('Fernanda Melo', 'fernanda.biblioteca@escola.com', 'bibpwd1', 'bibliotecario', 'Ativo', NULL, NULL, 1);

SELECT * FROM aluno;
SELECT * FROM bibliotecario;
SELECT * FROM professor;
SELECT * FROM livro;
SELECT * FROM emprestimo;
SELECT * FROM usuario;