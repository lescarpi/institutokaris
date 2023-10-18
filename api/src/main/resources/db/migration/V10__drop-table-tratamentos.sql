drop table atendimentos;
drop table tratamentos;

create table atendimentos (

    id bigint not null auto_increment,
    paciente_id bigint not null,
    data datetime not null,

    primary key(id),
    constraint fk_atendimentos_paciente_id foreign key(paciente_id) references pacientes(id)

);