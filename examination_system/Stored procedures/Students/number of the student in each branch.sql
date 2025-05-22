CREATE OR ALTER PROCEDURE PC_GetStudentsNumInBranch
AS
BEGIN
    SELECT 
	COUNT(S.ID) as 'Students Number',B.[Name] 'Branch Name'
    FROM 
        Person.Student AS S
        JOIN Branch AS B ON S.BranchID = B.ID
	group by B.[Name]
END;


PC_GetStudentsNumInBranch
