

create or alter function getQSforCourse(@CourseID int)
returns table
as
return
	(
		select Q.ID
		from Course C inner join Exam E
		on C.ID = E.CourseID
		inner join QuestionPick QP
		on E.ID = QP.ExamID
		inner join QuestionPool Q
		on Q.ID = QP.QuestionID
		where C.ID = @CourseID
	)
go