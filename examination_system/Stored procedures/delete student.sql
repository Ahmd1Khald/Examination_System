CREATE OR ALTER PROCEDURE DeleteStudent_Prc
    @StudentID INT 
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (SELECT 1 FROM person.Student WHERE ID = @StudentID)
        BEGIN
            RAISERROR('Student not found!', 16, 1);
            RETURN;
        END;

        DELETE FROM StudentExam 
        WHERE StdID = @StudentID;

        
        DELETE FROM person.Student 
        WHERE ID = @StudentID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;


-------check------------------------

EXEC DeleteStudent_Prc @StudentID = 74;