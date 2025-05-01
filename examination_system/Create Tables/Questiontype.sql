Create table QuestionType(
QuestionID int,
ExamType nvarchar(20),

constraint FK_QuestionType_QuestionPool_QuestionID foreign key (QuestionID) 
references QuestionPool(ID),
)