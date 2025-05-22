Create table StudentCourse(
CourseID int,
StudentID int,
StdCrsDegree int,

constraint PK_StudentCourseTable primary key(CourseID,StudentID),

constraint FK_StudentCourse_Course_courseID foreign key (CourseID)
references Course(ID),

constraint FK_StudentCourse_Student_studentID foreign key (StudentID)
references Person.Student(ID),
)