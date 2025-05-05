--- check if the course exist and get top 10 students in this course 
exec dbo.gettop10studentsbycoursename @coursename = 'database sysems';
exec dbo.gettop10studentsbycoursename @coursename = 'introduction to programming';

--- shows the courses an instructor teaches and the number of students in each
exec dbo.sp_GetInstructorLoad @InstructorID = 3;


--- check if the course exist and get summary for it if exist 
exec dbo.sp_GetCourseExamSummary @CourseID = 90;
exec dbo.sp_GetCourseExamSummary @CourseID = 11;

--- It lists all students and whether they took a specific exam
exec dbo.sp_ExamParticipationReport @ExamID = 1;

--- returns a random set of questions according to question type 
exec [dbo].[SelectRandomQuestionsForExam] 'Multiple Choice', 9;
exec [dbo].[SelectRandomQuestionsForExam] 'True/False', 9;
exec [dbo].[SelectRandomQuestionsForExam] 'Text', 9;
