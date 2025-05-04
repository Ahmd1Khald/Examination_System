
create proc sp_AssignCourseToInstructor 
		@InstID int,
		@CourseID int
as
	begin
		if not exists (
				select 1
				from Course
				where ID = @CourseID
				)
			THROW 50000, 'You must enter a valid course.', 1;
		else if not exists (
				select 1
				from Person.Instructor
				where ID = @InstID
				)
			THROW 50000, 'No Instructor with this ID.', 1;
		else if exists (
				select 1
				from InstructorCourse
				where InstructorID = @InstID and CourseID = @CourseID
				)
			THROW 50000, 'This instructor is already assigned to the course.', 1;

		else
			begin
					begin try
						begin transaction
							insert into InstructorCourse
							values (@InstID,@CourseID)
							PRINT 'Instructor Assigned to course successfully';
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
				end
	end

exec sp_AssignCourseToInstructor 4,9
