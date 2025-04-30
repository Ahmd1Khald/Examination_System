Create table ExamTypeTable(
examID int identity(1,1),
examType nvarchar(20),

constraint pk_ExamTypeTable_examID primary key(examID),
)