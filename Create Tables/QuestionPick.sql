

create table QuestionPick
(
	QuestionID int not null,
	ExamID int not null,
	InstID int not null,
	Degree int not null,

	constraint PK_QuestionPick primary key (QuestionID,ExamID,InstID),
	constraint FK_Question_Exam_Instructor foreign key (QuestionID) 
					references Question(QuestionID) on delete cascade,
	--constraint FK_Exam_Instructor_Question foreign key (ExamID) 
				--	references Exam(ExamID) on delete cascade,
	constraint FK_Instructor_Question_Exam foreign key (InstID) 
					references Instructor(InstID) on delete cascade,
	constraint Check_Degree check(Degree >= 0)

)
go