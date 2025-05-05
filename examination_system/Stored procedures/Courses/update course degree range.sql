


create proc UpdateCourseDegreeRange 
	@CourseID int,
	@MaxDegree int,
	@MinDegree int
as
	begin
		if(@MinDegree > @MaxDegree)
			THROW 50000, 'Invalid Range of degrees.', 1;
		else if not exists (
				select 1
				from Course
				where ID = @CourseID
				)
			THROW 50000, 'There is no course with this ID.', 1;
			else
			begin
				begin try
					begin transaction
						update Course
						set MaxDegree = @MaxDegree, MinDegree = @MinDegree
						where ID = @CourseID;
						PRINT 'Course degree range updated successfully';
						commit;
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end

exec UpdateCourseDegreeRange 
		@CourseID = 5,
		@MaxDegree = 90,
		@MinDegree = 50