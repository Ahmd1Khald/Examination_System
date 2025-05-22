------------------------calc Fun Max degrees-------------

CREATE OR ALTER FUNCTION CalculateMaxGrade_Fun
(
    @ExamID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @MaxGrade INT;

    SELECT @MaxGrade = MAX(StdExamDegree)
    FROM StudentExam
    WHERE ExamID = @ExamID;

    RETURN ISNULL(@MaxGrade, 0); 
END;

--------------------------check fun-----------------------------
SELECT dbo.CalculateMaxGrade_Fun(2) AS [Max Degree];
