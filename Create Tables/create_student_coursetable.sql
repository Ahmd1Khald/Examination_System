Create table StudentCourseTable(
courseID int null,
studentID int null,
studentDegree int,

constraint pk_StudentCourseTable primary key(courseID,studentID),

constraint FK_StudentCourseTable_CourseTable_courseID foreign key (courseID)
references Course(CourseID)

constraint FK_StudentCourseTable_StudentTable_studentID foreign key (studentID)
references StudentTable(studentID)

)