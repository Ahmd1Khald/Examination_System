

create table Course 
(
	CourseID int identity(1,1),
	CourseName nvarchar(30) not null,
	Description nvarchar(200) null,
	MaxDegree int not null,
	MinDegree int not null,

	constraint PK_Course primary key (CourseID),
	constraint Check_Degree_Max_Min check(MinDegree <= MaxDegree)
)
go