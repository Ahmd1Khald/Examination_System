CREATE OR ALTER VIEW Person.vw_StudentExamDegrees 
AS
SELECT 
    S.FName + ' ' + S.LName AS [Student Full Name], 
    SE.StdExamDegree AS [Exam Degree],
    C.Name
FROM Person.Student S
JOIN StudentExam SE ON SE.StdID = S.ID
JOIN StudentCourse SC ON SC.StudentID = S.ID 
JOIN Exam on Exam.CourseID = SC.CourseID
JOIN Course C ON C.ID = SC.CourseID


select * from Person.vw_StudentExamDegrees


