create table Intake (
ID int not null primary key,
Number int not null,
TMID int not null,

foreign key (ID) references TrainingManager(ID)
)
