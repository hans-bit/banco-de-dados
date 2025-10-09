CREATE database faculdade;
USE faculdade;
CREATE TABLE departamento(
nome varchar(255) NOT NULL,
local varchar(255),
id INT NOT NULL auto_increment,
primary key(id));
CREATE TABLE alunos(
nome varchar(255) NOT NULL,
data_nascimento date,
matricula varchar(10) NOT NULL,
endereço varchar(255),
PRIMARY KEY (matricula));
CREATE TABLE disciplina(
nome varchar(100) NOT NULL,
carga_horaria int NOT NULL DEFAULT 30,
ementa text,
PRIMARY KEY (nome));
CREATE TABLE professor(
inicio_contrato DATE,
nome varchar(255) NOT NULL,
cpf varchar(11) NOT NULL,
depto_id int,
PRIMARY KEY (cpf),
FOREIGN KEY (depto_id) REFERENCES departamento(id));
CREATE TABLE professor_contato(
prof_cpf varchar(11),
contato varchar(14),
FOREIGN KEY (prof_cpf) REFERENCES professor(cpf),
CONSTRAINT PK_professor_contato PRIMARY KEY (prof_cpf, contato));
CREATE TABLE avaliaçao(
prof_cpf varchar(11) NOT NULL,
data_hora datetime NOT NULL,
comentario varchar(500),
nota int,
FOREIGN KEY (prof_cpf) REFERENCES professor (cpf),
PRIMARY KEY (prof_cpf, data_hora));
ALTER TABLE departamento
ADD prof_chefe_cpf varchar(11),
ADD FOREIGN KEY(prof_chefe_cpf) REFERENCES professor(cpf);
ALTER TABLE disciplina
ADD disc_pre_requisito varchar(100),
ADD FOREIGN KEY (disc_pre_requisito) REFERENCES disciplina (nome);
CREATE TABLE aluno_disciplina(
matricula varchar(10) NOT NULL,
nome varchar(100) NOT NULL,
PRIMARY KEY(matricula,nome),
FOREIGN KEY (matricula) REFERENCES alunos(matricula),
FOREIGN KEY(nome) REFERENCES disciplina(nome));
CREATE TABLE professor_disciplina(
cpf varchar(11) NOT NULL,
nome varchar(100) NOT NULL,
PRIMARY KEY (cpf,nome),
FOREIGN KEY (cpf) REFERENCES professor(cpf),
FOREIGN KEY (nome) REFERENCES disciplina(nome));

INSERT INTO departamentos (nome,local) values ('matematica', 'bom despacho');

INSERT INTO alunos values('lucas', '1994/05/05', 'asdd123445', 'rua b');

 


