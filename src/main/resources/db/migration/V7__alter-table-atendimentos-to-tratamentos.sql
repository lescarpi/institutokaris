alter table atendimentos rename to tratamentos;
alter table tratamentos
drop column data,
add column data_inicio date,
add column data_fim date;