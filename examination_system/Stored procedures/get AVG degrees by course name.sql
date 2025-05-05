CREATE OR ALTER PROCEDURE dbo.sp_GetAVGDegreesByCrsName
    @CourseName nvarchar(30)
AS
BEGIN
    DECLARE @CourseID int;

    -- Retrieve CourseID based on CourseName
    SELECT top 1 @CourseID = ID 
    FROM dbo.Course 
    WHERE [Name] = @CourseName;

    -- Check if the course exists
    IF @CourseID IS NULL
    BEGIN
        RAISERROR('Course with name ''%s'' does not exist.', 16, 1, @CourseName);
        RETURN;
    END;

    -- Query to get exam summary
    SELECT 
        e.ID AS ExamID,
        COUNT(DISTINCT sa.StdID) AS StudentsTaken,
        AVG(CAST(CASE 
                    WHEN sa.Answer = qp.correctAnswer THEN qpPick.Degree
                    ELSE 0
                 END AS float)) AS AvgScore
    FROM dbo.Exam e
    LEFT JOIN dbo.StudentAnswer sa ON e.ID = sa.ExamID
    LEFT JOIN dbo.QuestionPool qp ON sa.QuestionID = qp.ID
    LEFT JOIN dbo.QuestionPick qpPick ON sa.QuestionID = qpPick.QuestionID 
                                     AND sa.ExamID = qpPick.ExamID
    WHERE e.CourseID = @CourseID
    GROUP BY e.ID;
END;

exec sp_GetAVGDegreesByCrsName @CourseName = 'Network Administration';
