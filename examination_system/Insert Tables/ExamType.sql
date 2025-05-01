

INSERT INTO ExamType (ExamID, [Type])
SELECT ID, 'Exam'
FROM Exam;
go 

INSERT INTO ExamType (ExamID, [Type])
SELECT ID, 'Corrective'
FROM Exam
WHERE ID % 3 = 0;
go