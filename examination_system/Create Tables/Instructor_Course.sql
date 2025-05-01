Create table InstructorCourse(
InstructorID int,
CourseID int,

constraint pk_InstructorCourse primary key (InstructorID, CourseID),

constraint FK_InstructorCourse_Instructor_InstructorID foreign key (InstructorID) 
references Instructor(ID),

constraint FK_InstructorCourse_Course_CourseID foreign key (CourseID) 
references Course(ID),
)