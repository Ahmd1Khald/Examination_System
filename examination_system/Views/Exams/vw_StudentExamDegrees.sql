CREATE OR ALTER VIEW Person.vw_StudentExamDegrees 
AS
SELECT 
	S.ID,
   S.FName + ' ' + S.LName AS [Student Full Name], 
   SE.StdExamDegree AS [Exam Degree],
   Course.Name
FROM Person.Student S
JOIN StudentExam SE ON SE.StdID = S.ID
JOIN Course ON SE.CourseID = Course.ID


select * from Person.vw_StudentExamDegrees