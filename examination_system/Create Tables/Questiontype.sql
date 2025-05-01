Create table QuestionType(
QuestionID int,
[Type] nvarchar(20),

constraint PK_QuestionType
primary key (QuestionID,[Type]),

constraint FK_QuestionType_QuestionPool_QuestionID 
foreign key (QuestionID) 
references QuestionPool(ID),
)