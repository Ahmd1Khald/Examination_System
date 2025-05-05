

-- proc to get Courses for specific Instructor
exec dbo.sp_GetCoursesByInstructor
		@InstID = 5

-- proc to get Courses for each Instructor
exec dbo.GetExamByCourse 
		@CourseID = 8

-- proc to get degree of student in exams
exec GetStudentExamResult 
		@StdID = 5

-- proc to create exam and its type
EXEC sp_CreateExamAndType  
	@ExamType = 'Exam',
	@date = '2025-05-2',
	@start_time = '10:16:00',
	@end_time = '12:15:00',
	@TotalDegree = 80,
	@CourseName = 'AI and Machine Learning',
	@UserType = 'Instructor'

-- proc to pick question to an Exam
exec sp_PickQuestions
			@QSID = 38,
			@ExamID = 8,
			@InstID = 1,
			@Degree = 5

-- proc to remove Instructor from teaching specific Course
exec RemoveInstructorCourse
		@InstID = 1,
		@CourseID = 2

-- proc to instructor select student to do specific exam
	exec sp_selectStudentToExam
			@StdID = 3,
			@ExamID  = 13,
			@CourseID = 2

-- proc to take student answer and store it
	EXEC sp_StoreStudentAnswer 
		@QID = 2,
		@ExamID = 1,
		@StdID = 13,
		@Answer = 'HTML'

	EXEC sp_StoreStudentAnswer 
		@QID = 3,
		@ExamID = 2,
		@StdID = 15,
		@Answer = 'True'

--proc to Update correct answer in Question pool
EXEC sp_UpdateCorrectAnswer
	@QuestionID = 53,
	@newCorrectAnswer = 'True'

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 37,
	@newCorrectAnswer = 'HTML'

-- proc to Update course degree range
exec UpdateCourseDegreeRange 
		@CourseID = 5,
		@MaxDegree = 90,
		@MinDegree = 50

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