create view Exam_Students 
AS
select 
      SE.ExamID,
	  SE.StdID,
	  S.FName + ' ' +S.LName as 'StudentFullName'
from StudentExam SE
inner join Exam E ON SE.ExamID = E.ID
inner join person.Student S ON SE.StdID = S.ID

select * from  Exam_Students 