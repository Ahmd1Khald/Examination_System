

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
			@InstID = 1,
			@Degree = 5
GRANT EXECUTE ON dbo.sp_PickQuestions TO InstructorRole;

-- proc to remove Instructor from teaching specific Course
exec dbo.RemoveInstructorCourse
		@InstID = 1,
		@CourseID = 2
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
		@Answer = 'HTML'
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
