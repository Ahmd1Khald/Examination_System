



create or alter proc RemoveInstructorCourse
			@InstID int,
			@CourseID int
as
	begin
				if not exists (
				select 1
				from Course
				where ID = @CourseID
				)
			THROW 50000, 'This course is not assigned to an Istructor.', 1;
		else if not exists (
				select 1
				from Person.Instructor
				where ID = @InstID
				)
			THROW 50000, 'Invalid Instructor ID.', 1;
		else if not exists (
				select 1
				from Course
				where InstructorID = @InstID and ID = @CourseID
				)
			THROW 50000, 'There is no Instructor teaches that course.', 1;

		else
			begin
					begin try
						begin transaction
							delete from Course
							where InstructorID = @InstID 
							and ID = @CourseID;
							PRINT 'Instructor was deleted from course successfully';
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
				end
	end

exec RemoveInstructorCourse
		@InstID = 1,
		@CourseID = 2