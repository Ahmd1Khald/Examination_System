


create proc sp_GetCoursesByInstructor @InstID int
as
	begin
		if not exists (
				select 1
				from Person.Instructor
				where ID = @InstID
				)
			THROW 50000, 'Invalid Instructor ID.', 1;
		 else if not exists (
				select 1
				from InstructorCourse
				where InstructorID = @InstID 
				)
			THROW 50000, 'This Instructor does not teach a course.', 1;
		else
			begin
				select IC.InstructorID,I.Name,C.ID, C.Name
				from InstructorCourse IC inner join Course C
				on C.ID = IC.CourseID
				inner join Person.Instructor I
				on I.ID = IC.InstructorID
				where IC.InstructorID = @InstID
				order by c.Name
			end
	end

exec sp_GetCoursesByInstructor 5
