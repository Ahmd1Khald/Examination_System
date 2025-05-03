CREATE or alter FUNCTION Get_Exam_Duration(@ExamID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Duration INT

    SELECT @Duration = DATEDIFF(MINUTE, Start_Time, End_Time)
    FROM Exam
    WHERE ID = @ExamID

    RETURN @Duration
END


SELECT dbo.Get_Exam_Duration(1) as 'Exam_Duration'
