


create proc sp_GetAllCourses
	as
		begin
			select *
			from Course
			order by Name
		end

exec sp_GetAllCourses