create table QuestionPick
(
	QuestionID int not null,
	ExamID int not null,
	InstID int not null,
	Degree int not null,

	constraint PK_QuestionPick primary key (QuestionID,ExamID,InstID),

	constraint FK_QuestionPick_QuestionPool_QuestionID foreign key (QuestionID) 
	references QuestionPool(ID) on delete cascade,

	constraint FK_QuestionPick_Exam_ExamID foreign key (ExamID) 
	references Exam(ID) on delete cascade,

	constraint FK_QuestionPick_Instructor_InstID foreign key (InstID) 
	references Instructor(ID) on delete cascade,

	constraint Check_Degree check(Degree >= 0),
)
