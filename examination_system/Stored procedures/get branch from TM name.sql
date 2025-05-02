CREATE OR ALTER PROCEDURE PC_GetBranchFromTMName(@TM varchar(50))
AS
BEGIN
    SELECT 
		T.[Name] AS 'Training Manager Name',
        B.[Name] AS 'Branch Name',
        B.[Location] AS 'Branch Location'
        
    FROM 
        Branch AS B
        JOIN Person.TrainingManager as T  ON B.TMID = T.ID
    WHERE 
        T.Name LIKE '%'+ @TM +'%';
END;


PC_GetBranchFromTMName 'ahmed'
