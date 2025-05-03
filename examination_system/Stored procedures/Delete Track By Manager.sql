---------------------------Delete Track-------------------------------
CREATE OR ALTER PROCEDURE usp_DeleteTrack
    @track_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF USER!='db18494_TrainingManager'
        BEGIN
            PRINT('Access Denied! Only Training Managers can delete tracks.');
            RETURN;
        END;

        DELETE FROM TRACKCOURSE 
        WHERE TrackID = @track_id;


        DELETE FROM Track 
        WHERE ID = @track_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

----------------------check delete---------------------------------

EXEC usp_DeleteTrack @StudentID = 74;