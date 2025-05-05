
-----------------------Add Permisions to Instructor to studentExam---------------------
GRANT SELECT ON StudentExam TO db18494_Instructor;


---------------------------Create Exam-----------------------
CREATE OR ALTER PROCEDURE CreateExam_Prc
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

EXECUTE AS USER = 'db18494_Instructor';
EXEC CreateExam_Prc
    @Year=2025,
    @CourseID=12,
    @TotalDegree=80,
    @StartTime='10:16:00',
    @EndTime='12:15:00',
	@Date='2025-05-2'
  
   REVERT;