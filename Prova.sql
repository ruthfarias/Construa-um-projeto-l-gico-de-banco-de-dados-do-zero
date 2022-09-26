create schema prova;
use prova;
create table professores(
id int primary key,
nome varchar(45),
telefone varchar(11),
email varchar(45),
endereço varchar(100),
matricula varchar(10)
);

insert into professores values (1,'Ohashi','3333-0505', 'ohashi@gmail.com','Rua nova,nº 03','2017009054');
insert into professores values (2,'joão','3333-0506', 'joao@gmail.com','Rua nova,nº 05','2017009056');
insert into professores values (3,'Klissiomara','3333-0504', 'joao@gmail.com','Rua nova,nº 06','2017009057');

create table questionarios(
id int primary key,
nome varchar(45),
descricao text,
abertura date,
fechamento date,
professores_id int,
foreign key (professores_id) references professores (id)
);
insert into questionarios values (1,'Banco','Qual o nome da disciplina','2019-09-25','2019-09-25',1);
insert into questionarios values (2,'Pyhon','Qual o nome da linguagem','2019-09-26','2019-09-26',2);
insert into questionarios values (3,'Engenharia de software','Qual o assunto','2019-09-27','2019-09-27',3);

create table questoes(
id int primary key,
enunciado text,
aux text,
tipo int,
questionarios_id int,
foreign key (questionarios_id) references questionarios(id)
);

insert into questoes values (1,'Certa ou errada','Imagine que é ...',1,1);
insert into questoes values (2,'Certa ou errado','Imagine que não é ...',2,2);

create table alternativas(
id int primary key,
texto varchar(45),
correta boolean,
questoes_id int,
foreign key (questoes_id) references questoes(id)
);

insert into alternativas values (1,'B', true,2);
insert into alternativas values (2,'c', false,1);

create table alunos(
id int primary key,
nome varchar(45),
matricula varchar(12),
endereço varchar(100),
telefone varchar(11),
email varchar(45)
);


insert into alunos values (1,'Ruth','2018005047','Rua Dez,nº 05','3333-0509', 'ruth@gmail.com');
insert into alunos values (2,'Arthur','2018004123','Rua sete,nº 07','3323-0507', 'arthur@gmail.com');

create table respostas(
id int primary key,
horario datetime,
alunos_id int,
questionarios_id int,
foreign key (alunos_id) references alunos(id),
foreign key (questionarios_id) references questionarios(id)
);

insert into respostas values (1,'2019-09-25-06-10',1,1);

create table resp_alt(
respostas_id int,
alternativas_id int,
foreign key (respostas_id) references respostas(id),
foreign key (alternativas_id) references alternativas(id)
);
