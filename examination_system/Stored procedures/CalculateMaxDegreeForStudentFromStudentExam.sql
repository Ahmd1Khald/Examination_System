------------------------calc Fun avarage degrees-------------

CREATE OR ALTER FUNCTION CalculateAverageGrade_Fun  
    (@ExamID INT)  
RETURNS DECIMAL(5,2)  
AS  
BEGIN  
    DECLARE @AvgGrade DECIMAL(5,2);  
    SELECT @AvgGrade = AVG(StdExamDegree)  
    FROM StudentExam  
    WHERE ExamID = @ExamID;  
    RETURN @AvgGrade;  
END;  

--------------------------check fun-----------------------------
select dbo.CalculateAverageGrade_Fun(2) AS [Avarage degrees]