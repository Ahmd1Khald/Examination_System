Create table Person.Student(
ID int not Null,
FName nvarchar(20),
LName nvarchar(20),
UserID int not null,
IntakeID int not null,
BranchID int not null,
TMID int not null,

constraint pk_Student_ID primary key(ID),

constraint FK_Student_UserTable_userID foreign key (userID) 
references Person.UserTable(ID),

constraint FK_Student_Intake_IntakeID foreign key (IntakeID) 
references Intake(ID),

constraint FK_Student_Branch_branchID foreign key (branchID) 
references Branch(ID),

constraint FK_Student_TrainingManager_TMID foreign key (TMID) 
references Person.TrainingManager(ID),
)