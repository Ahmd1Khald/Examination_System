
-- view users of database
SELECT name AS UserName, type_desc AS UserType
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G') -- S = SQL user, U = Windows user, G = Windows group
  AND name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys');
go


create proc sp_StudentExam @fname nvarchar(20),@lname nvarchar(20),@examID int,@date date,@start_time Time(0),@end_time Time(0)
as
begin
	select FName = @fname, LName = @lname, E.ID = @examID, E.[Date] = @date,E.Start_Time = @start_time ,E.End_Time = @end_time
	from Person.Student S inner join StudentExam SE
	on S.ID = SE.StdID
	inner join Exam E
	on E.ID = SE.ExamID
end
go



-- f
create function GetExamQSForStd_FN(@StdID int)
returns table
as
return
(
		select Q.Question
		from QuestionPool Q inner join QuestionPick QP
		on Q.ID = QP.QuestionID
		inner join Exam E
		on E.ID = QP.ExamID
		inner join StudentExam SE
		on E.ID = SE.ExamID
		where SE.StdID = @StdID
)
go

create or alter proc AllowStdToExam @StdID int
as
	begin
			if exists(
			select 1 
			from Exam E
			inner join StudentExam SE on E.ID = SE.ExamID
			where SE.StdID = 58
			  and E.[Date] = CAST(GETDATE() as date)
			  and CAST(GETDATE() as Time(0)) between E.Start_Time and E.End_Time
		)

			begin
				select * from GetExamQSForStd_FN(@StdID)
			end
		else
			begin 
				print 'Outside of exam time window.'
			end
	end

AllowStdToExam 58

