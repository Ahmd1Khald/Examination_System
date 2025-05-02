---------------------------Create Exam-----------------------
CREATE OR ALTER PROCEDURE usp_CreateExam
    @Year INT,
    @CourseID INT,
    @TotalDegree INT,
    @StartTime DATETIME,
    @EndTime DATETIME,
	@Date DATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaxDegree INT = (SELECT MaxDegree FROM Course WHERE ID = @CourseID);

        IF @TotalDegree > @MaxDegree
        BEGIN
            RAISERROR('Exam degree exceeds course limit!', 16, 1);
            RETURN;
        END;

     
        INSERT INTO Exam ([Year],CourseID, TotalDegree, Start_Time, End_Time,[Date])
        VALUES (@Year, @CourseID, @TotalDegree, @StartTime, @EndTime, @Date);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

------------------------check---------------------------------------