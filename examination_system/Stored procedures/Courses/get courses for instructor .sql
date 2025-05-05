create or alter proc sp_GetCoursesByInstructor @InstID int
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
				from Course
				where ID = @InstID 
				)
			THROW 50000, 'This Instructor does not teach a course.', 1;
		else
			begin
				select C.InstructorID,I.Name,C.ID, C.Name
                from Course C inner join Person.Instructor I
                on I.ID = C.InstructorID
                where C.InstructorID = @InstID
                order by c.Name
			end
	end

exec sp_GetCoursesByInstructor 5

drop proc sp_GetCoursesByInstructor
