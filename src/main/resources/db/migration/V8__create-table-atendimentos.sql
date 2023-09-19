create table atendimentos(

    id bigint not null auto_increment,
    tratamento_id bigint not null,
    data date not null,
    descricao varchar(255),

    primary key(id),
    constraint fk_atendimento_tratamento_id foreign key(tratamento_id) references tratamentos(id)

);