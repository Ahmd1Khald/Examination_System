



create or alter proc GetExamByCourse @CourseID int
as
	begin
		Select ID 'Exam ID', [Year], Start_Time, End_Time,TotalDegree,[Date]
		from Exam
		where CourseID = @CourseID
	end

exec GetExamByCourse 8