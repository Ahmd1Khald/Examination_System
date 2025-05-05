CREATE OR ALTER PROCEDURE dbo.sp_GetInstructorLoad
    @InstructorID INT
AS
BEGIN
    SELECT 
        i.Name AS InstructorName,
        c.ID AS CourseID,
        c.Name AS CourseName,
        COUNT(DISTINCT sc.StudentID) AS TotalStudents
    FROM dbo.Course c
    JOIN Person.Instructor i ON c.InstructorID = i.ID
    LEFT JOIN dbo.StudentCourse sc ON c.ID = sc.CourseID
    WHERE c.InstructorID = @InstructorID
    GROUP BY i.Name, c.ID, c.Name;
END;


exec dbo.sp_GetInstructorLoad @InstructorID = 3;