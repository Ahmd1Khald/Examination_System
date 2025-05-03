ALTER FUNCTION CalculateAverageGrade_Fun (@StudentID INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @AvgGrade DECIMAL(5,2);

    SELECT @AvgGrade = AVG(student_exam_Degree)
    FROM StudentExam
    WHERE StdID = @StudentID;

    RETURN @AvgGrade;
END;
