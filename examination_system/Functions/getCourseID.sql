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