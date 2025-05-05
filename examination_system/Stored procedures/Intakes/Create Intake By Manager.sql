CREATE OR ALTER PROCEDURE usp_AddIntake
    @Number INT,
	@TMID INT,
    @TrackID INT 
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

      
      IF USER!='db18494_TrainingManager'
        BEGIN
            print('Access Denied! Only Training Managers can add intakes.');
            RETURN;
        END;
      

    
        IF @TrackID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Track WHERE ID = @TrackID)
        BEGIN
            RAISERROR('Invalid Track ID!', 16, 1);
            RETURN;
        END;


		
     
        IF EXISTS (
            SELECT 1 
            FROM Intake 
            WHERE Number = @Number
         
        )
        BEGIN
            RAISERROR('Intake already exists for this Number and track!', 16, 1);
            RETURN;
        END;

       
        INSERT INTO Intake (Number,TMID)
        VALUES (@Number,@TMID);

       
        DECLARE @NewIntakeID INT = SCOPE_IDENTITY();

    
        IF @TrackID IS NOT NULL
        BEGIN
            INSERT INTO IntakeTrack (IntakeID, TrackID)
            VALUES (@NewIntakeID, @TrackID);
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;



-------------------------Check--------------------------------------
go
EXECUTE AS USER = 'db18494_TrainingManager';
EXEC usp_AddIntake
@Number = 48,
@TrackID = 100,
@TMID=2;