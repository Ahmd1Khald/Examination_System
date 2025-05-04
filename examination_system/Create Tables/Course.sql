create table Course 
(
	ID int identity(1,1),
	[Name] nvarchar(30) not null,
	[Description] nvarchar(200) null,
	MaxDegree int not null,
	MinDegree int not null,

	constraint PK_Course_ID primary key (ID),
	constraint Check_Degree_Max_Min check(MinDegree <= MaxDegree)
)

alter table Course 
add
InstructorID int foreign key 
references Person.Instructor(ID)  ;
