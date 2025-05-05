
--- Add Course If You Manager 
EXEC usp_AddCourse 
    @CourseName = 'Data',
    @Description = 'Introduction to databases',
    @MaxDegree = 100,
    @MinDegree = 50,
	@TrackID=100;

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








