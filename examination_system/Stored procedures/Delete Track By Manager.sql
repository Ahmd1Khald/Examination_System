CREATE OR ALTER PROCEDURE usp_DeleteTrack
    @TrackID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

 
        IF IS_ROLEMEMBER('TrainingManager') = 0
        BEGIN
            RAISERROR('Access Denied! Only Training Managers can delete tracks.', 16, 1);
            RETURN;
        END;

        IF NOT EXISTS (SELECT 1 FROM Track WHERE ID = @TrackID)
        BEGIN
            RAISERROR('Track not found!', 16, 1);
            RETURN;
        END;

        DELETE FROM TrackCourse 
        WHERE TrackID = @TrackID;

		DELETE FROM IntakeTrack 
        WHERE TrackID = @TrackID;
  
        DELETE FROM Track 
        WHERE ID= @TrackID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


-------------------------------check delete -------------------------------
EXEC usp_DeleteTrack @TrackID = 101;