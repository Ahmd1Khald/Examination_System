Create table QuestionTypeTable(
questionID int identity(1,1),
examType nvarchar(20),

constraint pk_QuestionTypeTable_questionID primary key(questionID),
)