


create or alter proc AddCourse
	@name nvarchar(30),
	@Description nvarchar(max),
	@MaxDegree int,
	@MinDegree int,
	@InstID int
as
	begin
		if exists(
			select 1 
			from Course
			where Name = @name
			)
			THROW 50000, 'Course you attempted to add is already exists.', 1;
		else
			begin
				begin try
					begin transaction
						insert into Course
						values (@name,@Description,@MaxDegree,@MinDegree,@InstID)
						commit;
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end

exec AddCourse 'English', 'A language course that improve student skills',100,40,10 