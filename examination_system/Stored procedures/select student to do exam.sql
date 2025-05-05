


create or alter proc sp_selectStudentToExam 
		@StdID int,
		@ExamID int,
		@CourseID int
as
	begin 
		if not exists (
				select 1 
				from StudentCourse
				where StudentID = @StdID and CourseID = @CourseID 
			)
			THROW 50000, 'Enter valid Student that takes this course.', 1;
		else
		begin
			begin try
				begin transaction
					insert into StudentExam (ExamID,StdID,courseid)
					Values(@ExamID, @StdID,@CourseID)
					
					commit;
					print 'Student selected to exam successfully'
			end try
			begin catch
				rollback;
				print 'Error Occured:' + ERROR_MESSAGE();
			end catch
		end
	end

	exec sp_selectStudentToExam
			@StdID = 3,
			@ExamID  = 13,
			@CourseID = 2