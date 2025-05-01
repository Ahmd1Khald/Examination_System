Create table ExamType(
ExamID int,
ExamType nvarchar(20),

constraint FK_ExamType_Exam_ExamID foreign key (ExamID) 
references Exam(ID),
)