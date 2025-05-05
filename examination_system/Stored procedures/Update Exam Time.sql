


create or alter proc UpdateExamTime 
			@ExamID int,
			@Start_Time Time(0),
			@End_Time Time(0)
as
	begin
	DECLARE @DurationMinutes INT = DATEDIFF(MINUTE, @start_time, @end_time);
		if(@DurationMinutes > 120)
		print 'The Exam duration must be two hours or less'
		else
			begin
				begin try 
					begin transaction
						update Exam
						set Start_Time = @Start_Time ,
						End_Time = @End_Time,
						[Year] = Year(GETDATE())
						where ID = @ExamID
						commit;
						print 'Exam time updated successfully'
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end

exec UpdateExamTime 
		@ExamID = 10,
		@Start_Time = '09:00:00',
		@End_Time = '10:00:00'