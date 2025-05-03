Create table InstructorCourse(
InstructorID int not null,
CourseID int not null,

constraint pk_InstructorCourse primary key (InstructorID, CourseID),

constraint FK_InstructorCourse_Instructor_InstructorID
foreign key (InstructorID) 
references Person.Instructor(ID),

constraint FK_InstructorCourse_Course_CourseID
foreign key (CourseID) 
references Course(ID),
)