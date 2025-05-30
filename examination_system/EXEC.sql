-- proc to create exam and its type
EXEC dbo.sp_CreateExamAndType  
	@ExamType = 'Exam', ---Corrective
	@date = '2025-05-6',
	@start_time = '10:15:00',
	@end_time = '12:15:00',
	@TotalDegree = 20,
	@CourseName = 'AI and Machine Learning'


EXEC dbo.sp_CreateExamAndType  
	@ExamType = 'Exam',
	@date = '2025-05-6',
	@start_time = '10:15:00',
	@end_time = '12:15:00',
	@TotalDegree = 20,
	@CourseName = 'AI and Mach'


	EXEC dbo.sp_CreateExamAndType  
	@ExamType = 'Exam',
	@date = '2025-05-6',
	@start_time = '10:15:00',
	@end_time = '14:15:00',
	@TotalDegree = 20,
	@CourseName = 'AI and Machine Learning'


EXEC sp_CreateExamAndType  
	@ExamType = 'Exam',
	@date = '2025-05-6',
	@start_time = '09:15:00',
	@end_time = '07:15:00',
	@TotalDegree = 20,
	@CourseName = 'AI and Machine Learning'
-----------------------------------------------------------------------------------

--for True/False Questions
EXEC sp_AddQuestionAndType
    @corectAnswer = 'False',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = NULL;
GRANT EXECUTE ON dbo.sp_AddQuestionAndType TO InstructorUser;


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

-----------------------------------------------------------------------------

-- proc to pick question to an Exam
exec dbo.sp_PickQuestions
			@QSID = 33,
			@ExamID = 6,
			@InstID = 6,
			@Degree = 5


--- Allow Student To Take Exam
EXEC AllowStdToExam @StdID = 2;----11


select* from Exam 
join StudentExam on ExamID = ID
where StdID = 2


EXEC AllowStdToExam @StdID = 13;



-- proc to take student answer and store it
	EXEC sp_StoreStudentAnswer 
		@QID = 2,
		@ExamID = 1,
		@StdID = 13,
		@Answer = 'True'

EXEC sp_StoreStudentAnswer 
		@QID = 1,
		@ExamID = 1,
		@StdID = 13,
		@Answer = 'B'

---fun Calculate_Student_Degree take  @StudentID int, @ExamID int
Select dbo.Calculate_Student_Degree (13,1) AS TotalDegree;


---proc Calculate and Store Student_Degree take  @StudentID int, @ExamID int
exec Student_Exam_Degree @StudentID = 13, @ExamID = 1


select * from Person.vw_StudentExamDegrees where ID = 13 


--- Add Course If You Manager 
EXEC usp_AddCourse 
    @CourseName = 'Data 223',
    @Description = 'Introduction to databases',
    @MaxDegree = 100,
    @MinDegree = 50,
    @TrackID = 2,
	@InstID = 2;


--- Create Intake By Manager 
EXEC usp_AddIntake
@Number = 48,
@TrackID = 100,
@TMID=2;
GRANT EXECUTE ON dbo.usp_AddIntake TO ManagerRole;

--- Create Track  By Manager 
EXEC sp_AddTrack 
    @track_name = 'Software Engineering', 
    @department_id = 10, 
    @TrainingManager_id = 5;
GRANT EXECUTE ON dbo.sp_AddTrack TO ManagerRole;


--delete track
EXEC usp_DeleteTrack @track_id = 20;

--- delete student 
EXEC DeleteStudent_Prc @StudentID = 74;

--- add student 
EXEC AddStudent_Prc
    @FName = 'Khaled',
    @LName = 'Maher',
    @UserID = 5,
    @IntakeID = 2,
    @TM_ID = 1,
    @BranchID = 1


--- Delete Course By Course Id 
EXEC usp_DeleteCourse @CourseID = 26;
GRANT EXECUTE ON dbo.usp_DeleteCourse TO ManagerRole;


-- proc to update specific exam start and end time
exec UpdateExamTime 
		@ExamID = 10,
		@Start_Time = '09:00:00',
		@End_Time = '10:00:00'


-- proc to update student degree in a specific exam
exec UpdateStudentExamDegree 
		@ExamID = 5,
		@StdID = 17,
		@newDegree = 12