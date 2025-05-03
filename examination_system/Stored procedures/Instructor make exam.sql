
create or alter proc sp_CreateExamAndType
	@ExamType nvarchar(20),
	@date date,
	@start_time Time(0),
	@end_time Time(0),
	@TotalDegree int,
	@CourseName nvarchar(30),
	@UserType nvarchar(30)
as
begin
	DECLARE @DurationMinutes INT = DATEDIFF(MINUTE, @start_time, @end_time);

	IF ( @UserType != 'Instructor')
        BEGIN
            RAISERROR('Access Denied! Only Instructors can make an Exam.', 16, 1);
            RETURN;
        END;

	if(@DurationMinutes > 120)
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
			Values (Year(GETDATE()),@start_time ,@end_time,@TotalDegree,
						dbo.getCourseID(@CourseName),@date)

			declare @ExamID int = SCOPE_IDENTITY();
			insert into ExamType values(@ExamID,@ExamType)
			commit
			print('Exam and ExamType inserted succefully')
		end try
		begin catch
			rollback
			print 'An error occurred: '+ Error_MESSAGE();
		end catch
	end
end
go


EXEC sp_CreateExamAndType
	'Exam',
	'2025-05-2',
	'10:16:00',
    '12:15:00',
	 80,
	 'AI and Machine Learning',
	 'Instructor'
   REVERT;
   






