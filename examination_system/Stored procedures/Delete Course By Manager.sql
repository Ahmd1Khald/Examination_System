CREATE OR ALTER PROCEDURE usp_DeleteCourse
    @CourseID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        
        IF IS_ROLEMEMBER('TrainingManager') = 0
        BEGIN
            RAISERROR('Access Denied! Only Training Managers can delete courses.', 16, 1);
            RETURN;
        END;

      
        IF NOT EXISTS (SELECT 1 FROM Course WHERE ID = @CourseID)
        BEGIN
            RAISERROR('Course not found!', 16, 1);
            RETURN;
        END;

        DELETE FROM TrackCourse 
        WHERE TrackID = @CourseID;

 
        DELETE FROM Course 
        WHERE ID = @CourseID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


----------------Check Delete--------------------
EXEC usp_DeleteCourse @CourseID = 101;