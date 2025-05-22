CREATE or alter TRIGGER TRG_Prevent_Answer_After_Time
ON StudentAnswer
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Exam E ON E.ID = i.ExamID
        WHERE GETDATE() > CAST(
        CONVERT(VARCHAR(10), E.Date, 120) + ' ' + 
        CONVERT(VARCHAR(8), End_Time, 108)
        AS DATETIME)
    )
    BEGIN
        RAISERROR('You cannot submit answers after the exam time.', 16, 1);
        RETURN;
    END

    INSERT INTO StudentAnswer (QuestionID, ExamID, StdID, Answer)
    SELECT QuestionID, ExamID, StdID, Answer
    FROM inserted;
END




INSERT INTO StudentAnswer (QuestionID, ExamID, StdID, Answer)
VALUES (1, 1, 48, 'This is a test answer');
