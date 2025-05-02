CREATE OR ALTER PROCEDURE PC_GetStudentsNumInIntack
AS
BEGIN
    SELECT 
	COUNT(S.ID) as 'Students Number',I.Number 'Intake Number'
    FROM 
        Person.Student AS S
        JOIN Intake AS I ON S.IntakeID = I.ID

	group by I.Number
END;


PC_GetStudentsNumInIntack
