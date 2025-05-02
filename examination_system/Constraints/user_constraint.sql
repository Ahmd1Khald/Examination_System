-- constraint for user table 

alter table person.usertable
add constraint unq_usertable_name unique (name);
