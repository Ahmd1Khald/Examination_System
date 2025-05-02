
-- view users of database
SELECT name AS UserName, type_desc AS UserType
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G') -- S = SQL user, U = Windows user, G = Windows group
  AND name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys');
go

create function getCourseID(@CourseName nvarchar(30))
returns int
as
	begin
		declare @CourseID int
		select @CourseID = ID
		from Course
		where Name = @CourseName;

		return @CourseID;
	end
go

create
create proc sp_CreateExamAndType
	@ExamType nvarchar(20),
	@date date,
	@start_time Time(0),
	@end_time Time(0),
	@TotalDegree int,
	@CourseName nvarchar(30)
as
begin
	IF (USER!='db18494_Instructor' and 
        BEGIN
            RAISERROR('Access Denied! Only Instructors can make an Exam.', 16, 1);
            RETURN;
        END;

	if(@end_time - @start_time > 2)
		print 'The Exam duration must be two hours or less'
	else if(@TotalDegree > 100)
		begin
			RAISERROR('Exam degree exceeds course limit!', 16, 1);
			RETURN;
		end
	else if	(@CourseName not in (select [Name] from Course))
		print 'Please select a valid Course Name'
	else if(@ExamType not in ('Exam','Corrective'))
		print 'The exam Type must be either Exam or Corrective'
	else
	begin
		begin try
			begin transaction
			Insert into Exam
			Values (Year(GETDATE()),@start_time ,@end_time,@date,@TotalDegree,
						dbo.getCourseID(@CourseName))

			declare @ExamID int = SCOPE_IDENTITY();
			insert into ExamType values(@ExamID,@ExamType)
			commit
			print('Exam and ExamType inserted succeffully')
		end try
		begin catch
			rollback
			print 'An error occurred: '+ Error_MESSAGE();
		end catch
	end
end
go

create 


--from Person.Student S inner join StudentExam SE
--	on S.ID = SE.StdID
--	inner join Exam E
--	on E.ID = SE.ExamID


------------------------------------------------------------------------
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

