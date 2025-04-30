

create table Exam
(
	ExamID int identity(1,1),
	Year int not null,
	Start_Time Time(0) not null,
	End_Time Time(0) not null,
	TotalDegree int not null,
	CourseID int not null,

	constraint PK_Exam primary key (ExamID),
	constraint FK_Exam_Course foreign key (CourseID) 
					references Course(CourseID) on delete cascade
)
go