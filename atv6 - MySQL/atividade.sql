 -- 1º
 CREATE TABLE Gravadora (
    codigo_gravadora INT PRIMARY KEY,
    nome_gravadora VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    contato VARCHAR(100),
    URL VARCHAR(255)
);

CREATE TABLE CD (
    codigo_cd INT PRIMARY KEY,
    codigo_gravadora INT,
    nome VARCHAR(100),
    preco_venda DECIMAL(10, 2),
    data_lancamento DATE,
    cd_indicado BOOLEAN,
    FOREIGN KEY (codigo_gravadora) REFERENCES Gravadora(codigo_gravadora)
);

CREATE TABLE Musica (
    codigo_musica INT PRIMARY KEY,
    nome_musica VARCHAR(100),
    duracao TIME
);

CREATE TABLE Faixa (
    codigo_cd INT,
    codigo_musica INT,
    numero_faixa INT,
    PRIMARY KEY (codigo_cd, codigo_musica),
    FOREIGN KEY (codigo_cd) REFERENCES CD(codigo_cd),
    FOREIGN KEY (codigo_musica) REFERENCES Musica(codigo_musica)
);

CREATE TABLE Autor (
    codigo_autor INT PRIMARY KEY,
    nome_autor VARCHAR(100)
);

CREATE TABLE Musica_Autor (
    codigo_musica INT,
    codigo_autor INT,
    PRIMARY KEY (codigo_musica, codigo_autor),
    FOREIGN KEY (codigo_musica) REFERENCES Musica(codigo_musica),
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo_autor)
);

CREATE TABLE CD_Categoria (
    codigo_categoria INT PRIMARY KEY,
    menor_preco DECIMAL(10, 2),
    maior_preco DECIMAL(10, 2)
);


-- 2º
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_livro INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro),
    CONSTRAINT unico_emprestimo UNIQUE (id_livro)
);

-- 3ª
CREATE DATABASE University;
USE University;

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    birth_date DATE,
    start_date DATE
);

CREATE TABLE lecturer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    degree VARCHAR(32),
    email VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE academic_semester (
    id INT PRIMARY KEY AUTO_INCREMENT,
    calendar_year INT NOT NULL,
    term VARCHAR(128) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE course_edition (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    academic_semester_id INT,
    lecturer_id INT,
    FOREIGN KEY (academic_semester_id) REFERENCES academic_semester(id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturer(id)
);


-- 4º
CREATE DATABASE ClinicaVeterinaria;
USE ClinicaVeterinaria;

CREATE TABLE pessoa (
    cod_pes INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf NUMERIC(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE responsavel (
    cod_res INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_pes INTEGER,
    dia_venc NUMERIC(2),
    FOREIGN KEY (cod_pes) REFERENCES pessoa(cod_pes)
);

CREATE TABLE pet (
    cod_pet INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_res INTEGER,
    nome VARCHAR(100) NOT NULL,
    dt_nasc DATE,
    rga NUMERIC(10),
    cor VARCHAR(50),
    especie VARCHAR(50),
    FOREIGN KEY (cod_res) REFERENCES responsavel(cod_res)
);

CREATE TABLE veterinario (
    cod_vet INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_pes INTEGER,
    crmv NUMERIC(20) NOT NULL UNIQUE,
    especialidade VARCHAR(30),
    FOREIGN KEY (cod_pes) REFERENCES pessoa(cod_pes)
);

CREATE TABLE consulta (
    cod_con INTEGER PRIMARY KEY AUTO_INCREMENT,
    cod_pet INTEGER,
    cod_vet INTEGER,
    horario TIME,
    dt_consulta DATE,
    FOREIGN KEY (cod_pet) REFERENCES pet(cod_pet),
    FOREIGN KEY (cod_vet) REFERENCES veterinario(cod_vet)
);


-- 5º
CREATE DATABASE PlataformaCursos;
USE PlataformaCursos;

CREATE TABLE instrutores (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    nome_instrutor VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(150) NOT NULL,
    carga_horaria INT NOT NULL,
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE
);

CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    CONSTRAINT aluno_unico_por_curso UNIQUE (id_aluno, id_curso)
);

-- 6º
ALTER TABLE instrutores 
ADD telefone VARCHAR(20) NULL;

ALTER TABLE cursos 
MODIFY carga_horaria DECIMAL(5,2);

ALTER TABLE cursos 
ADD CONSTRAINT chk_carga_horaria CHECK (carga_horaria > 0);

CREATE TABLE certificados (
    id_certificado INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    data_emissao DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

ALTER TABLE matriculas 
ADD status ENUM('ativa', 'concluída', 'cancelada') NOT NULL;

ALTER TABLE alunos 
DROP COLUMN data_nascimento;

ALTER TABLE instrutores 
CHANGE nome_instrutor nome_completo VARCHAR(100);

DELIMITER //
CREATE TRIGGER instrutores_prevent_email_update
BEFORE UPDATE ON instrutores
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'O e-mail dos instrutores não pode ser alterado após o cadastro.';
    END IF;
END;
//
DELIMITER ;
