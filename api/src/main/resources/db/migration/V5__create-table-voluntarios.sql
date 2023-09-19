create table voluntarios(

    id bigint not null auto_increment,
    nome varchar(255) not null,
    cpf varchar(11) not null,
    instituicao varchar(255),
    unique(cpf),
    primary key(id)

);