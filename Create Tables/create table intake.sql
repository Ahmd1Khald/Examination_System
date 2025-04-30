create table intake (
ID int not null primary key,
number int not null,
TrainingManager_id int not null,
foreign key (TrainingManager_id)references TraningManager(id)
)
