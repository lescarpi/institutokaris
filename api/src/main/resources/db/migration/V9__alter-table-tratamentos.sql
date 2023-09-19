alter table tratamentos add column status varchar(255);
update tratamentos set status = "EM_ANDAMENTO";