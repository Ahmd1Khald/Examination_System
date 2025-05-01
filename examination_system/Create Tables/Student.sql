Create table Student(
ID int identity(1,1),
FName nvarchar(20),
LName nvarchar(20),
UserID int null,
IntakeID int null,
BranchID int null,
TMID int null,

constraint pk_Student_ID primary key(ID),

constraint FK_Student_UserTable_userID foreign key (userID) 
references UserTable(ID),

constraint FK_Student_Intake_IntakeID foreign key (IntakeID) 
references Intake(ID),

constraint FK_Student_Branch_branchID foreign key (branchID) 
references Branch(ID),
)