-----------------------Add Permisions to Training Manager to Exam---------------------
GRANT SELECT, INSERT, UPDATE ON Track TO db18494_TrainingManager;


----------------------------------Add Track-----------------------------------

CREATE OR ALTER PROCEDURE sp_AddTrack 	
    @track_name NVARCHAR(100),
    @department_id INT,
    @TrainingManager_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

    

     IF EXISTS (SELECT 1 FROM Track WHERE Name = @track_name)
        BEGIN
            PRINT('Track name already exists!');
            RETURN;
        END;

     
        IF NOT EXISTS (SELECT 1 FROM Person.TrainingManager WHERE ID = @TrainingManager_id)
        BEGIN
            PRINT('Invalid Training Manager ID!');
            RETURN;
        END;


        INSERT INTO Track (Name, DeptID, TMID)
        VALUES (@track_name, @department_id, @TrainingManager_id);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

-----------------------Check Only training manager can add user--------------------

EXECUTE AS USER = 'db18494_TrainingManager';
EXEC sp_AddTrack 
    @track_name = 'Software Engineering', 
    @department_id = 12, 
    @TrainingManager_id = 101;
