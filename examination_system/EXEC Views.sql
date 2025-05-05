-----VIEW CourseDetails_v Number of Exams in each Course
SELECT * FROM CourseDetails_v


-----student course details full name ,course name ,student course degree
SELECT * FROM Student_Course_Details 
ORDER BY [Full Name]

-- view for student studentinfo Provides student information, including full name, branch, and intake
SELECT * FROM vw_studentinfo

-----view Exam_Students Lists students assigned to exams with their full names.
select * from  Exam_Students 

-------------view ExamDetails Provides exam details, including exam ID, course, intake, and branch.

select * from ExamDetails
order by exam_id

-------------------Displays details of training managers, including branch and track information.
select * from TrainingManager_Details


----------Summarizes exam details, including course name, total students, and correct , wrong answers.

select * from View_Exam_Summary 


---Lists questions in the question pool with their types and correct answers.
select * from vw_QuestionPool;

-----Lists student answers for exams, including student name, question, and answer

select * 
from dbo.studentanswerdetails 

----Lists exams taken by students, including exam date and course.

select *
from vw_StudentExams;

----------studenttotaldegrees exam id ,total degree ,course name ,student full name 

select * from dbo.studenttotaldegrees;


-------view student full name ,exam degree , course name 

select * from Person.vw_StudentExamDegrees





------Displays upcoming exams for students, including exam ID, course, and timing.