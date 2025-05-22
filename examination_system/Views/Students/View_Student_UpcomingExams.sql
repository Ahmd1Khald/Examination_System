CREATE or alter VIEW View_Student_UpcomingExams AS
SELECT 
    E.ID AS ExamID,
    E.CourseID,
    E.Start_Time,
    E.End_Time,
    E.Date,
    CAST(
        CONVERT(VARCHAR(10), E.Date, 120) + ' ' + 
        CONVERT(VARCHAR(8), E.Start_Time, 108)
    AS DATETIME) AS ExamStartDateTime
FROM Exam E
WHERE GETDATE() < CAST(
    CONVERT(VARCHAR(10), E.Date, 120) + ' ' + 
    CONVERT(VARCHAR(8), E.Start_Time, 108)
AS DATETIME)




select * from View_Student_UpcomingExams


