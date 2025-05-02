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



-----------------------------------------------------*
/*How This Trigger Works:
It fires AFTER INSERT or UPDATE operations on the StudentExam table.

It checks if any inserted/updated record has a StdExamDegree that exceeds the MaxDegree from the related course (through the Exam table).

If a violation is found:

It gathers details about the violating student and course

Raises a descriptive error message with the student name, attempted degree, max degree, and course name

Rolls back the transaction to prevent the invalid data from being saved

If no violations are found, the operation proceeds normally.

Additional Notes:
The trigger handles multiple row operations (both single and bulk inserts/updates).

It provides a clear error message to help identify and fix the issue.

The rollback ensures data integrity is maintained.

The join logic connects StudentExam → Exam → Course to get the maximum allowed degree.

You can test this trigger with statements like:

sql
-- This should fail if the course max degree is less than 100*/
UPDATE dbo.StudentExam 
SET StdExamDegree = 200 
WHERE ExamID = 1 AND StdID = 60;
