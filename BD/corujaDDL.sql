create database coruja;

use coruja;

create table tb_grupo(
	id bigint auto_increment primary key,
    nome varchar(200),
    descricao varchar(1000)
);

create table tb_usuario(
	id bigint auto_increment primary key,
    login varchar(200),
    senha varchar(200),
    habilitado boolean,
    pessoa bigint
);
alter table tb_usuario add foreign key fk_pessoa(pessoa) 
	references tb_pessoa(id) on delete no action on update no action;

		
create table tb_usuario_grupo(
	usuario bigint not null,
    grupo bigint not null,
    primary key(usuario, grupo)
);
alter table tb_usuario_grupo add foreign key fk_usuario(usuario) 
	references tb_usuario(id) on delete no action on update no action;
alter table tb_usuario_grupo add foreign key fk_grupo(grupo) 
	references tb_grupo(id) on delete no action on update no action;


create table TB_PESSOA(
	id bigint auto_increment primary key ,
    nome varchar(200),
    cpf varchar(15),
    rg varchar(20),
    email varchar(200),
    telefone varchar(15),
    data_nascimento datetime
);

create table TB_ENDERECO(
	id bigint auto_increment primary key ,
    bairro varchar(200),
    cidade varchar(200),
    estado varchar(5),
    logradouro varchar(300),
    numero varchar (9),
    complemento varchar(200),
    id_pessoa bigint,
    foreign key FK_PESSOA_ENDEDECO (id_pessoa) references TB_PESSOA(id) 
    
);
create table TB_TURMA(
	id bigint auto_increment primary key ,
    nome varchar(200)
);


create table TB_ALUNO(
	id bigint auto_increment primary key ,
    matricula varchar(200),
    data_matricula datetime,
    id_responsavel bigint,
    id_pessoa bigint,
    id_turma bigint,
    foreign key FK_PESSOA_ALUNO (id_pessoa) references TB_PESSOA(id),
    foreign key FK_PESSOA_RESPONSAVEL (id_responsavel) references TB_PESSOA(id), 
    foreign key FK_TURMA_ALUNO (id_responsavel) references TB_TURMA(id)
);

create table TB_AVALIACAO(
	id bigint auto_increment primary key ,
    nota float,
    peso int,
    descricao varchar(200),
    data_avaliacao datetime,
    id_disciplina bigint,
    foreign key FK_DISCIPLINA_TURMA (id_disciplina) references TB_DISCIPLINA(id)
); 

create table TB_DISCIPLINA(
	id bigint auto_increment primary key ,
    nome varchar(200),
    media_de_aprovacao float	
);

create table TB_PROFESSOR(
	id bigint auto_increment primary key ,
    id_pessoa bigint,
    foreign key FK_PESSOA_PROFESSOR (id_pessoa) references TB_PESSOA(id),
    titulo varchar(200)
);

create table TB_DISCIPLINA_PROFESSOR(
	id bigint auto_increment primary key,
    id_disciplina bigint,
    id_professor bigint,
    foreign key FK_DISCIPLINA_DISCIPLINA_PROFESSOR (id_disciplina) references TB_DISCIPLINA(id),
    foreign key FK_PROFESSOR_DISCIPLINA_PROFESSOR (id_professor) references TB_PROFESSOR(id)
);

create table TB_HISTORICO(
	id bigint auto_increment primary key ,
    descricao varchar(500),
    observacao varchar(2000),
    id_aluno bigint,
    id_disciplina_professor bigint,
    foreign key FK_HISTORICO_DISCIPLINA_PROFESSOR (id_disciplina_professor) references TB_DISCIPLINA_PROFESSOR(id),
    foreign key FK_HISTORICO_ALUNO (id_aluno) references TB_ALUNO(id)
    
);

create table TB_EVENTO(
	id bigint auto_increment primary key ,
    descricao varchar(500),
    titulo varchar (200),
    tipo varchar (200),
    id_aluno bigint,
    id_responsavel bigint,
    foreign key FK_EVENTO_ALUNO (id_aluno) references TB_ALUNO(id),
    foreign key FK_EVENTO_PESSOA (id_responsavel) references TB_PESSOA(id)
);