CREATE or alter  FUNCTION CalculateAverageGrade_Fun  
    (@StudentID INT)  
RETURNS DECIMAL(5,2)  
AS  
BEGIN  
    DECLARE @AvgGrade DECIMAL(5,2);  
    SELECT @AvgGrade = AVG(StdExamDegree)  
    FROM StudentExam  
    WHERE StdID = @StudentID;  
    RETURN @AvgGrade;  
END;  


