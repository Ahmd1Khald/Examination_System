Create table StudentCourse(
courseID int,
studentID int,
studentDegree int,

constraint PK_StudentCourseTable primary key(courseID,studentID),

constraint FK_StudentCourse_Course_courseID foreign key (courseID)
references Course(ID),

constraint FK_StudentCourse_Student_studentID foreign key (studentID)
references Student(ID),

)