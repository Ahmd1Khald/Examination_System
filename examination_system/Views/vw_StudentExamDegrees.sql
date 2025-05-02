CREATE OR ALTER VIEW Person.vw_StudentExamDegrees
AS
SELECT 
    FName + ' ' + LName AS [Student Full Name], 
    StdExamDegree AS [Exam Degree]
FROM Person.Student
JOIN StudentExam
ON StudentExam.StdID = Person.Student.ID;

select * from Person.vw_StudentExamDegrees
