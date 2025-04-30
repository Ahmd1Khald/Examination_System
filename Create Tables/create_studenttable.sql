Create table StudentTable(
studentID int identity(1,5),
studentFName nvarchar(20),
studentLName nvarchar(20),
userID int null,
intakeID int null,
branchID int null,
TMID int null,

constraint pk_StudentTable_studentID primary key(studentID),

constraint FK_StudentTable_UserTable_userID foreign key (userID) 
references UserTable(userID)

constraint FK_StudentTable_IntakeTable_intakeID foreign key (intakeID) 
references IntakeTable(intakeID)

constraint FK_StudentTable_BranchTable_branchID foreign key (branchID) 
references BranchTable(branchID)
)