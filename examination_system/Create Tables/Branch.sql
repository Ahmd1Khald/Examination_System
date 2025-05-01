Create table Branch(
ID int identity(1,1),
[Name] nvarchar(20) not null,
[Location] nvarchar(100) not null,
TMID int not null,

constraint pk_Branch_ID primary key(ID),

constraint FK_BranchTable_TrainingManager_TMID 
foreign key (TMID) 
references TrainingManager(ID)
)