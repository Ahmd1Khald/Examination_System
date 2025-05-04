
---fun Calculate_Student_Degree take  @StudentID int, @ExamID int
Select dbo.Calculate_Student_Degree (3,2) AS TotalDegree;

select * from
StudentAnswer SA
     inner join QuestionPool QP on SA.QuestionID =QP.ID
     inner join QuestionPick QPICK on SA.QuestionID =QPICK.QuestionID
	 where StdID = 3


--- Calculate AVG degree for all student degree in specific exam
select dbo.CalculateAverageGrade_Fun(2) AS [Avarage degrees]


----select * from [dbo].[GetBestStudentsPerCourse](2);




