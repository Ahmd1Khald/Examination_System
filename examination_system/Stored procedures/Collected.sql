



create or alter proc sp_nearestExam
as
	begin
		select Top(1) *
		from vw_ExamSchedule
		where [Date] >= cast(GETDATE() as date)
		order by [Date], Start_Time
	end
exec sp_nearestExam
go



	-- sp 
-- sp to pick questions for specific exam

create or alter function getQSforCourse(@CourseID int)
returns table
as
return
	(
		select Q.ID
		from Course C inner join Exam E
		on C.ID = E.CourseID
		inner join QuestionPick QP
		on E.ID = QP.ExamID
		inner join QuestionPool Q
		on Q.ID = QP.QuestionID
		where C.ID = @CourseID
	)
go
create or alter proc sp_PickQuestions
		@QSID int,
		@ExamID int,
		@InstID int,
		@Degree int
as
	begin
		declare @ExamDegree int =(
			select TotalDegree
			from Exam
			where ID = @ExamID
			) 
		declare @ExamCourseID int =(
			select CourseID 
			from Exam 
			where ID = @ExamID
			)
		declare @QuestionIDs table(ID int); 
		insert into @QuestionIDs 
		select ID 
		from getQSforCourse(@ExamCourseID);

		if not exists (
			SELECT 1
			FROM InstructorCourse
			WHERE InstructorID = @InstID AND CourseID = @ExamCourseID
			)
			 THROW 50000, 'Instructor and Exam should be of the same Course.', 1;
		else if not exists (select 1 from @QuestionIDs where ID = @QSID)
			 THROW 50000, 'Choose Question related to the course.', 1;
		else if(@Degree > @ExamDegree)
			 THROW 50000, 'Question Degree must not exceed Exam degree.', 1;
		else
			begin
				begin try
					begin transaction
						insert into QuestionPick
						values(@QSID, @ExamID, @InstID, @Degree)

						commit;
						print 'You picked a question for exam successfully'
				end try
				begin catch
					rollback;
					print 'An error occurred: '+ Error_MESSAGE();
				end catch
			end
	end
	select * from getQSforCourse(18)
	exec sp_PickQuestions 38,8, 1,5

-- sp to select students to do specific exam

create or alter proc sp_selectStudentToExam 
		@InstID int,
		@StdID int,
		@ExamID int,
		@CourseID int
as
	begin 
		if not exists (
				select 1 
				from InstructorCourse
				where InstructorID = @InstID and CourseID = @CourseID 
			)
			THROW 50000, 'Enter valid Instructor for this course.', 1;
		else if not exists (
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

	exec sp_selectStudentToExam  3,3,13,2
----------------------------------------------------------

create or alter proc UpdateExamTime @ExamID int,@Start_Time Time(0),@End_Time Time(0)
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
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end

exec UpdateExamTime 10,'09:00:00','10:00:00'

-----------------------------------------------------------

create or alter proc GetExamByCourse @CourseID int
as
	begin
		Select ID 'Exam ID', [Year], Start_Time, End_Time,TotalDegree,[Date]
		from Exam
		where CourseID = @CourseID
	end

exec GetExamByCourse 8

----------------------------------------------------------
create proc UpdateStudentExamDegree @ExamID int, @StdID int, @newDegree int
as
	begin
		declare @TotalDegree int = (select TotalDegree
											from Exam
											where ID = @ExamID) 
		if(@newDegree > @TotalDegree)
			THROW 50000, 'Degree must not exceed total exam degree.', 1;
		else
			begin
			begin try
				begin transaction
					update StudentExam
					set StdExamDegree = @newDegree
					where ExamID = @ExamID and StdID = @StdID
					commit;
					print 'Student selected to exam successfully'
			end try
			begin catch
				rollback;
				print 'Error Occured:' + ERROR_MESSAGE();
			end catch
		end
	end

exec UpdateStudentExamDegree 5, 17,12
--------------------------------------------------------------

create or alter proc GetStudentExamResult @StdID int
as
	begin
		select StdExamDegree
		from StudentExam
		where StdID = @StdID
	end
exec GetStudentExamResult 5
--------------------------------------------------------------

create or alter proc AddCourse
	@name nvarchar(30),
	@Description nvarchar(max),
	@MaxDegree int,
	@MinDegree int
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
						values (@name,@Description,@MaxDegree,@MinDegree)
						commit;
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end

exec AddCourse 'English', 'A language course that improve student skills',100,40 
------------------------------------------------------

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

exec UpdateCourseDegreeRange 5,90,50
-----------------------------------------------------------

	create proc sp_GetAllCourses
	as
		begin
			select *
			from Course
			order by Name
		end

exec sp_GetAllCourses
---------------------------------------------------------------

create function FN_GetCourseByTrack(@TrackID int)
returns table
as
return
(
	select C.ID 'Course ID', C.Name 'Course Name'
	from Course C inner join TrackCourse TC
	on C.ID = TC.CourseID
	inner join Track T
	on T.ID = TC.TrackID
	where T.ID = @TrackID
)

select * from FN_GetCourseByTrack(4)