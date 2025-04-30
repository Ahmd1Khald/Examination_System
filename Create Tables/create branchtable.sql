Create table BranchTable(
branchID int identity(1,2),
branchName nvarchar(20),
branchLocation nvarchar(20),
tmID int null,

constraint pk_BranchTable_branchID primary key(branchID),

constraint FK_BranchTable_TrainingManager_tmID foreign key (tmID) 
references TrainingManager(ID)

)