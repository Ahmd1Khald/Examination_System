


create table StudentAnswer
(
	QuestionID int not null,
	ExamID int not null,
	StdID int not null,
	Answer nvarchar(200) null,

	constraint PK_StudentAnswer primary key (QuestionID,ExamID,StdID),
	constraint FK_Question_Exam_Student foreign key (QuestionID) 
					references Question(QuestionID) on delete cascade,
	constraint FK_Exam_Student_Question foreign key (ExamID) 
					references Exam(ExamID) on delete cascade,
	constraint FK_Student_Question_Exam foreign key (StdID) 
					references Student(StdID) on delete cascade

)