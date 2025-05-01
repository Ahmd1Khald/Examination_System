Create table Branch(
ID int identity(1,2),
[Name] nvarchar(20),
[Location] nvarchar(20),
TMID int null,

constraint pk_Branch_ID primary key(ID),

constraint FK_BranchTable_TrainingManager_TMID foreign key (TMID) 
references TrainingManager(ID)

)