ALTER FUNCTION Is_Student_Passed (@StdID INT, @CourseID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT = 0
    DECLARE @Average FLOAT = dbo.CalculateAverageGrade_Fun(@StdID, @CourseID)
    DECLARE @MinDegree INT

    SELECT @MinDegree = MinDegree FROM Course WHERE ID = @CourseID

    IF @Average >= @MinDegree
        SET @Result = 1

    RETURN @Result
END;



SELECT dbo.Is_Student_Passed(48, 11) AS PassedStatus;

--------------pass or failed
SELECT 
    CASE dbo.Is_Student_Passed(48, 11)
        WHEN 1 THEN 'Pass'
        WHEN 0 THEN 'Failed'
        ELSE 'Unknown'
    END AS Result;

---------------------------------all student status
SELECT 
    S.ID AS StudentID,
    S.FName + ' ' + S.LName AS StudentName,
    C.ID AS CourseID,
    C.Name AS CourseName,
    CASE dbo.Is_Student_Passed(S.ID, C.ID)
        WHEN 1 THEN 'Pass'
        WHEN 0 THEN 'Failed'
        ELSE 'Unknown'
    END AS Result
FROM person.Student S
CROSS JOIN Course C
