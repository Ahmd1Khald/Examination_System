----------------------Max Degree------------------------
CREATE TRIGGER CheckMaxDegree_TR
ON Exam
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT e.ID
        FROM Exam e
        JOIN Course c ON e.CourseID = c.ID
        WHERE e.TotalDegree > c.MaxDegree
    )
    BEGIN
        RAISERROR('Total exam degree exceeds course maximum!', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;