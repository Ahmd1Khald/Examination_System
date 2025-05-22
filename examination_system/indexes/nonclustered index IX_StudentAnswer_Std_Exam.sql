create nonclustered index IX_StudentAnswer_Std_Exam 
ON StudentAnswer (StdID, ExamID);

select *
from StudentAnswer
where StdID = 48 and ExamID = 1


create nonclustered index IX_StudentAnswer_Question 
ON StudentAnswer (QuestionID);

select *
from StudentAnswer
where QuestionID = 1