
create or alter proc sp_CreateExamAndType
	@ExamType nvarchar(20),
	@date date,
	@start_time Time(0),
	@end_time Time(0),
	@TotalDegree int,
	@CourseName nvarchar(30)
as
begin
	DECLARE @DurationMinutes INT = DATEDIFF(MINUTE, @start_time, @end_time);

	if(@DurationMinutes < 0)
	begin
		RAISERROR('End Time should by after Start Time', 16, 1);
		RETURN;
	end

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
	@ExamType = 'Exam',
	@date = '2025-05-2',
	@start_time = '09:15:00',
	@end_time = '07:15:00',
	@TotalDegree = 20,
	@CourseName = 'AI and Machine Learning'





