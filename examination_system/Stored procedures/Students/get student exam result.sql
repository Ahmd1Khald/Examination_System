

create or alter proc GetStudentExamResult @StdID int
as
	begin
		select StdExamDegree
		from StudentExam
		where StdID = @StdID
	end

exec GetStudentExamResult 5
