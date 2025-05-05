
--- Add Course If You Manager 
EXEC usp_AddCourse 
    @CourseName = 'Data',
    @Description = 'Introduction to databases',
    @MaxDegree = 100,
    @MinDegree = 50,
    @TrackID = 2,
	@InstID = 2;


	--- Add Intake If You Manager 
EXEC usp_AddIntake
@Number = 48,
@TrackID = 100,
@TMID=2;

--- Allow Student To Take Exam
EXEC AllowStdToExam @StdID = 48;

-- Assign Course To Instructor
exec sp_AssignCourseToInstructor 4,11

---Add Permisions to Instructor to studentExam

GRANT SELECT ON StudentExam TO db18494_Instructor;
---Create Exam
EXECUTE AS USER = 'db18494_Instructor';
EXEC CreateExam_Prc
    @Year=2025,
    @CourseID=12,
    @TotalDegree=80,
    @StartTime='10:16:00',
    @EndTime='12:15:00',
	@Date='2025-05-2'
  
   REVERT;


--- Create Intake By Manager 

EXECUTE AS USER = 'db18494_TrainingManager';
EXEC usp_AddIntake
@Number = 48,
@TrackID = 100,
@TMID=2;

--- Create Track  By Manager 
EXEC sp_AddTrack 
    @track_name = 'Software Engineering', 
    @department_id = 10, 
    @TrainingManager_id = 5;

--- Delete Course By Course Id 
EXEC usp_DeleteCourse @CourseID = 26;


--- check if the course exist and get top 10 students in this course 
exec dbo.gettop10studentsbycoursename @coursename = 'database sysems';
exec dbo.gettop10studentsbycoursename @coursename = 'introduction to programming';


--- shows the courses an instructor teaches and the number of students in each
exec dbo.sp_GetInstructorLoad @InstructorID = 3;


--- check if the course exist and get summary for it if exist 
exec dbo.sp_GetCourseExamSummary @CourseID = 90;
exec dbo.sp_GetCourseExamSummary @CourseID = 2;

--- It lists all students and whether they took a specific exam
exec dbo.sp_ExamParticipationReport @ExamID = 1;

--- returns a random set of questions according to question type 
exec [dbo].[SelectRandomQuestionsForExam] 'Multiple Choice', 9;
exec [dbo].[SelectRandomQuestionsForExam] 'True/False', 9;
exec [dbo].[SelectRandomQuestionsForExam] 'Text', 9;


--- get all courses
exec sp_GetAllCourses

--- get AVG degrees by course name
exec sp_GetAVGDegreesByCrsName @CourseName = 'Network Administration';

--- form TM name get the branches 
PC_GetBranchFromTMName 'hany'

--- from branch name get student in
PC_GetStudentsInBranch 'main'

--- from intake number get student in	
PC_GetStudentsInIntake 43

--- from student id get its degrees
exec GetStudentExamResult 5

-- proc to get Courses for specific Instructor
exec dbo.sp_GetCoursesByInstructor
		@InstID = 5

GRANT EXECUTE ON dbo.sp_GetCoursesByInstructor TO InstructorRole;

-- proc to get Courses for each Instructor
exec dbo.GetExamByCourse 
		@CourseID = 8
GRANT EXECUTE ON dbo.GetExamByCourse TO InstructorRole;


-- proc to get degree of student in exams
exec dbo.GetStudentExamResult 
		@StdID = 5
GRANT EXECUTE ON dbo.GetStudentExamResult TO StudentRole;

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

--- Assign Course To Instructor by take @InstID int, @CourseID int
exec sp_AssignCourseToInstructor 4,9


-- proc to create exam and its type
EXEC dbo.sp_CreateExamAndType  
	@ExamType = 'Exam',
	@date = '2025-05-2',
	@start_time = '10:16:00',
	@end_time = '12:15:00',
	@TotalDegree = 80,
	@CourseName = 'AI and Machine Learning',
	@UserType = 'Instructor'
GRANT EXECUTE ON dbo.sp_CreateExamAndType TO InstructorRole;


-- proc to pick question to an Exam
exec dbo.sp_PickQuestions
			@QSID = 38,
			@ExamID = 8,
			@InstID = 2,
			@Degree = 5
GRANT EXECUTE ON dbo.sp_PickQuestions TO InstructorRole;


-- proc to remove Instructor from teaching specific Course
exec dbo.RemoveInstructorCourse
		@InstID = 1,---2
		@CourseID = 2---2
GRANT EXECUTE ON dbo.RemoveInstructorCourse TO ManagerRole;


-- proc to instructor select student to do specific exam
	exec dbo.sp_selectStudentToExam
			@StdID = 3,
			@ExamID  = 13,
			@CourseID = 2
GRANT EXECUTE ON dbo.sp_selectStudentToExam TO InstructorRole;


-- proc to take student answer and store it
	EXEC sp_StoreStudentAnswer 
		@QID = 2,
		@ExamID = 1,
		@StdID = 13,
		@Answer = 'True'
GRANT EXECUTE ON dbo.sp_StoreStudentAnswer TO StudentRole;

	EXEC sp_StoreStudentAnswer 
		@QID = 3,
		@ExamID = 2,
		@StdID = 15,
		@Answer = 'True'


--proc to Update correct answer in Question pool
EXEC sp_UpdateCorrectAnswer
	@QuestionID = 53,
	@newCorrectAnswer = 'True'
GRANT EXECUTE ON dbo.sp_UpdateCorrectAnswer TO InstructorRole;

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 37,
	@newCorrectAnswer = 'HTML'


-- proc to Update course degree range
exec UpdateCourseDegreeRange 
		@CourseID = 5,
		@MaxDegree = 90,
		@MinDegree = 50
GRANT EXECUTE ON dbo.UpdateCourseDegreeRange TO ManagerRole;


-- proc to update specific exam start and end time
exec UpdateExamTime 
		@ExamID = 10,
		@Start_Time = '09:00:00',
		@End_Time = '10:00:00'
GRANT EXECUTE ON dbo.UpdateExamTime TO InstructorRole;


-- proc to update student degree in a specific exam
exec UpdateStudentExamDegree 
		@ExamID = 5,
		@StdID = 17,
		@newDegree = 12
GRANT EXECUTE ON dbo.UpdateStudentExamDegree TO InstructorRole;












