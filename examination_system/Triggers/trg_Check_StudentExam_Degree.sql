CREATE OR ALTER TRIGGER [dbo].[trg_Check_StudentExam_Degree]
ON [dbo].[StudentExam]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check if any inserted/updated record has StdExamDegree exceeding the course MaxDegree
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN [dbo].[Exam] e ON i.ExamID = e.ID
        JOIN [dbo].[Course] c ON e.CourseID = c.ID
        WHERE i.StdExamDegree > c.MaxDegree
    )
    BEGIN
        -- Get the violating student and course information for error message
        DECLARE @StudentName NVARCHAR(100);
        DECLARE @CourseName NVARCHAR(30);
        DECLARE @MaxDegree INT;
        DECLARE @AttemptedDegree INT;
        
        SELECT TOP 1
            @StudentName = s.FName + ' ' + s.LName,
            @CourseName = c.Name,
            @MaxDegree = c.MaxDegree,
            @AttemptedDegree = i.StdExamDegree
        FROM inserted i
        JOIN [dbo].[Exam] e ON i.ExamID = e.ID
        JOIN [dbo].[Course] c ON e.CourseID = c.ID
        JOIN [Person].[Student] s ON i.StdID = s.ID
        WHERE i.StdExamDegree > c.MaxDegree;
        
        -- Raise error with details
        RAISERROR(
            'Exam degree validation failed for student "%s". Attempted degree %d exceeds maximum allowed degree %d for course "%s".', 
            16, 
            1, 
            @StudentName, 
            @AttemptedDegree, 
            @MaxDegree, 
            @CourseName
        );
        
        -- Rollback the transaction
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

/*
UPDATE dbo.StudentExam 
SET StdExamDegree = 200 
WHERE ExamID = 1 AND StdID = 60;
*/


