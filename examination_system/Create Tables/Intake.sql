create table Intake (
ID int primary key identity(1,1),
Number int not null,
TMID int not null,

constraint FK_Intake_TrainingManager_ID 
foreign key (TMID)
references TrainingManager(ID)
)
