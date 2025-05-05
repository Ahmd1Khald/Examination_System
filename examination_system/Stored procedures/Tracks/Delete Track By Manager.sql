---------------------------Delete Track-------------------------------
CREATE OR ALTER PROCEDURE usp_DeleteTrack
    @track_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

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

EXEC usp_DeleteTrack @track_id = 20;