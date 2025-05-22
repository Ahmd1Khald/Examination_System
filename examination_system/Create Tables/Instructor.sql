Create table Person.Instructor(
ID int identity(1,1),
[Name] nvarchar(20),
userID int not null,

constraint pk_InstructorID primary key(ID),

constraint FK_Instructor_UserTable_userID 
foreign key (userID)
references Person.UserTable(ID)
)