CREATE VIEW View_Exam_Summary 
AS
SELECT 
    E.ID AS ExamID,
    C.Name,
    COUNT(DISTINCT SA.StdID) AS TotalStudents,
    SUM(CASE WHEN SA.Answer = Q.correctAnswer THEN 1 ELSE 0 END) AS CorrectAnswers,
    SUM(CASE WHEN SA.Answer != Q.correctAnswer THEN 1 ELSE 0 END) AS WrongAnswers
FROM Exam E
JOIN StudentAnswer SA ON SA.ExamID = E.ID
JOIN QuestionPool Q ON Q.ID = SA.QuestionID
JOIN Course C ON C.ID = E.CourseID
GROUP BY E.ID, C.Name

select * from View_Exam_Summary 