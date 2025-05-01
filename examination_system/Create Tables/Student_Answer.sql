create table StudentAnswer
(
	QuestionID int not null,
	ExamID int not null,
	StdID int not null,
	Answer nvarchar(Max) null,

	constraint PK_StudentAnswer primary key (QuestionID,ExamID,StdID),

	constraint FK_StudentAnswer_QuestionPool_QuestionID foreign key (QuestionID) 
	references QuestionPool(ID) on delete cascade,

	constraint FK_StudentAnswer_Exam_ExamID foreign key (ExamID) 
	references Exam(ID) on delete cascade,

	constraint FK_StudentAnswer_Student_StdID foreign key (StdID) 
	references Student(ID) on delete cascade

)