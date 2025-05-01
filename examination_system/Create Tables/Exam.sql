create table Exam
(
	ID int identity(1,1),
	[Year] int not null,
	Start_Time Time(0) not null,
	End_Time Time(0) not null,
	TotalDegree int not null,
	CourseID int not null,

	constraint PK_Exam_ID primary key (ID),
	constraint FK_Exam_Course_CourseID 
	foreign key (CourseID) 
	references Course(ID) on delete cascade
)
