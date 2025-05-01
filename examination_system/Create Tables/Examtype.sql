Create table ExamType(
ExamID int not null,
[Type] nvarchar(20) not null,

constraint PK_ExamType
primary key (ExamID,[Type]),

constraint FK_ExamType_Exam_ExamID
foreign key (ExamID) 
references Exam(ID) on delete cascade
)
