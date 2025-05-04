



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
-----------------------------------------------------------------

create proc sp_AssignCourseToInstructor @InstID int,@CourseID int
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
-----------------------------------------------------------

create or alter proc RemoveInstructorCourse @InstID int, @CourseID int
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
				from InstructorCourse
				where InstructorID = @InstID and CourseID = @CourseID
				)
			THROW 50000, 'There is no Instructor teaches that course.', 1;

		else
			begin
					begin try
						begin transaction
							delete from InstructorCourse
							where InstructorID = @InstID 
							and CourseID = @CourseID;
							PRINT 'Instructor was deleted from course successfully';
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
				end
	end

exec RemoveInstructorCourse 4,9
-----------------------------------------------------------

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
-----------------------------------------------------------
ALTER TABLE QuestionPool ADD Options VARCHAR(255);


UPDATE QuestionPool
SET Options = CASE ID
    WHEN 1 THEN 'folder,list,script,node'
    WHEN 5 THEN '^,exp,**,power'
    WHEN 7 THEN 'POST,PUSH,FETCH,LOAD'
    WHEN 12 THEN 'DROP,REMOVE,DELETE,CLEAR'
    WHEN 13 THEN 'UNIQUE,DISTINCT,SELECT,FILTER'
    WHEN 16 THEN 'Dart,Kotlin,Swift,C#'
    WHEN 19 THEN 'Android,iOS,Windows,Linux'
    WHEN 21 THEN 'Queue,Tree,Stack,Graph'
    WHEN 25 THEN 'AVL,Binary,B-Tree,Circle'
    WHEN 30 THEN 'Phishing,Fishing,Surfing,Tracking'
    WHEN 31 THEN 'React,Flask,Scikit-learn,Redux'
    WHEN 36 THEN 'HTML,CSS,PHP,JS'
    WHEN 39 THEN '<link>,<style>,<script>,<css>'
    WHEN 43 THEN 'Oracle,Cisco,AWS,MySQL'
    WHEN 46 THEN 'Agile,Waterfall,Incremental,Spiral'
    WHEN 49 THEN 'Internal Process,Internet Packet,Internet Protocol,Inter-Process'
    ELSE Options
END
WHERE ID IN (1, 5, 7, 12, 13, 16, 19, 21, 25, 30, 31, 36, 39, 43, 46, 49);

UPDATE QuestionPool
SET Question = CASE ID
    WHEN 1 THEN 'Which of the following is a valid Python data type?'
    WHEN 5 THEN 'Which operator is used for exponentiation in Python?'
    WHEN 7 THEN 'Which of these is a valid HTTP method?'
    WHEN 12 THEN 'Which SQL statement is used to remove a table?'
    WHEN 13 THEN 'Which keyword is used to return only unique values?'
    WHEN 16 THEN 'Which language is commonly used with Flutter?'
    WHEN 19 THEN 'Which OS is Swift used for?'
    WHEN 21 THEN 'Which data structure uses LIFO?'
    WHEN 25 THEN 'Which is NOT a type of tree?'
    WHEN 30 THEN 'Which of the following is a common cyber attack?'
    WHEN 31 THEN 'Which of these is a Python library for ML?'
    WHEN 36 THEN 'Which language is used to style HTML?'
    WHEN 39 THEN 'Which tag is used to link a CSS file?'
    WHEN 43 THEN 'Which is a cloud provider?'
    WHEN 46 THEN 'Which software model handles risk best?'
    WHEN 49 THEN 'What does IP stand for?'
    ELSE Question
END
WHERE ID IN (1, 5, 7, 12, 13, 16, 19, 21, 25, 30, 31, 36, 39, 43, 46, 49); 

create or alter proc sp_AddQuestionAndType
		@corectAnswer nvarchar(max),
		@Question nvarchar(max),
		@Type nvarchar(20),
		@Option nvarchar(200) = null
as
	begin
		begin try
			begin transaction
			declare @QID int = (select MAX(ID) from QuestionPool)+1
			if(@Type not in ('Multiple Choice','True/False','Text'))
				THROW 50000, 'Type of the question should be Multiple Choice or True/False or Text .', 1;
			if (@corectAnswer is null or LEN(@corectAnswer)= 0)
				THROW 50000, 'Every question must have Correct Answer.', 1;
			if((@Type = 'True/False' or @Type = 'Text') and @Option is not null)
				THROW 50000, 'Only Multiple Choice Questions can have Option.', 1;
			if(@Type = 'True/False' and @corectAnswer not in ('True','False'))
				THROW 50000, 'Invalid answer for True/False questions.', 1;			
			if(@Type = 'Multiple Choice')
				begin
					if(@Option is null)
						THROW 50000, 'Multiple Choice Questions must have Option.', 1;
					else 
						begin 
							declare @OptionCount int = 
								(len(@option) - len(replace(@option,',','')))+1;
							if(@OptionCount < 2)
								THROW 50000, 'Options of Multiple Choice Questions must be at least 2.', 1;	
						end
				end
				insert into QuestionPool
				values (@QID,@corectAnswer,@Question,@Option)

				insert into QuestionType
				values(@QID, @Type)

				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch	
	end

----------------------- Execution tests ----------------------

--for True/False Questions
EXEC sp_AddQuestionAndType
    @corectAnswer = 'False',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = NULL;

EXEC sp_AddQuestionAndType
    @corectAnswer = 'False',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = 'A: True, B: False';

EXEC sp_AddQuestionAndType
    @corectAnswer = 'Yes',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = NULL;

-- for Multiple Choice Questions
EXEC sp_AddQuestionAndType
    @corectAnswer = 'C',
    @Question = 'Which operator is used for exponentiation in Python?',
    @Type = 'Multiple Choice',
    @Option = 'A: ^, B: exp, C: **, D: power';

EXEC sp_AddQuestionAndType
    @corectAnswer = 'A',
    @Question = 'Which operator is used for exponentiation in Python?',
    @Type = 'Multiple Choice',
    @Option = 'A: **';

-- Text Question
EXEC sp_AddQuestionAndType
    @corectAnswer = 'Indentation',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = NULL;

EXEC sp_AddQuestionAndType
    @corectAnswer = 'Indentation',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = 'A: Spaces';

EXEC sp_AddQuestionAndType
    @corectAnswer = '',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = NULL;

-- general test
EXEC sp_AddQuestionAndType
    @corectAnswer = 'Test',
    @Question = 'Test question',
    @Type = 'InvalidType',
    @Option = NULL;

---------------------------------------------------------------
create or alter proc sp_UpdateCorrectAnswer 
		@QuestionID int,
		@newCorrectAnswer nvarchar(max)
as
	begin
		declare @Type nvarchar(20)=(
									select [Type]
									from QuestionType
									where QuestionID = @QuestionID
									);
		begin try
			begin transaction
				if (@newCorrectAnswer is null or LEN(@newCorrectAnswer)= 0)
					THROW 50000, 'Every question must have Correct Answer.', 1;
				if(@Type = 'True/False' and @newCorrectAnswer not in ('True','False'))
					THROW 50000, 'Invalid answer for True/False questions.', 1;	
				if(@Type = 'Text'or @Type = 'Multiple Choice' and @newCorrectAnswer in ('True','False'))
					THROW 50000, 'This answer is for True/False questions only.', 1;	
				
				update QuestionPool
				set correctAnswer = @newCorrectAnswer
				where ID = @QuestionID
				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch
	end

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 53,
	@newCorrectAnswer = 'True'

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 37,
	@newCorrectAnswer = 'HTML'

