CREATE FUNCTION Count_Student_CorrectAnswers(@ExamID INT, @StdID INT)
RETURNS INT
AS
BEGIN
    DECLARE @CorrectAnswers INT

    SELECT @CorrectAnswers = COUNT(*)
    FROM StudentAnswer SA
    JOIN QuestionPool Q ON Q.ID = SA.QuestionID
    WHERE SA.ExamID = @ExamID AND SA.StdID = @StdID AND SA.Answer = Q.correctAnswer

    RETURN ISNULL(@CorrectAnswers, 0)
END
SELECT dbo.Count_Student_CorrectAnswers(2, 3) AS CorrectAnswersCount;
