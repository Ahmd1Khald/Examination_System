

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
			FROM Course
			WHERE InstructorID = @InstID AND ID = @ExamCourseID
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

	exec sp_PickQuestions
			@QSID = 38,
			@ExamID = 8,
			@InstID = 1,
			@Degree = 5