
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

---






