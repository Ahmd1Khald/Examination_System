Create table InstructorTable(
instructorID int identity(1,1),
instructorName nvarchar(20),
userID int null,

constraint pk_InstructorTable_instructorID primary key(instructorID),
constraint FK_InstructorTable_UserTable_userID foreign key (userID) references UserTable(userID)
)