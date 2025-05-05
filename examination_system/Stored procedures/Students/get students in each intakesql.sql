CREATE OR ALTER PROCEDURE PC_GetStudentsInIntake(@IntakeNum int)
AS
BEGIN
    SELECT 
        S.ID, 
        S.FName + ' ' + S.LName AS 'Student Name',
		I.Number AS 'Intake Number',
        B.[Name] AS 'Branch Name',
        B.[Location] AS 'Branch Location',
        T.[Name] AS 'Training Manager Name'
    FROM 
        Person.Student AS S
        JOIN Branch AS B ON S.BranchID = B.ID
        JOIN Intake AS I ON S.IntakeID = I.ID
        JOIN Person.TrainingManager AS T ON T.ID = B.TMID
    WHERE 
        I.Number = @IntakeNum;
END;


PC_GetStudentsInIntake 43
