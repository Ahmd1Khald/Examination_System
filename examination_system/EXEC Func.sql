
---fun Calculate_Student_Degree take  @StudentID int, @ExamID int
Select dbo.Calculate_Student_Degree (3,2) AS TotalDegree;

select * from
StudentAnswer SA
     inner join QuestionPool QP on SA.QuestionID =QP.ID
     inner join QuestionPick QPICK on SA.QuestionID =QPICK.QuestionID
	 where StdID = 3


--- Calculate AVG degree for all student degree in specific exam
select dbo.CalculateAverageGrade_Fun(2) AS [Avarage degrees]


--- Get Exam Count By Course And Year
select [dbo].[GetExamCountByCourseAndYear](2, 2023) as ExamCount;


---get top 10 stdunets in each exam by exam id
select * from [dbo].[GetBestStudentsPerExam](2);


--- get studetn count by intake id
select [dbo].[GetStudentCountByIntake](1) as StudentCount;


---Get Student Degrees By Course id
select * from dbo.get_student_degrees_by_course(2);


---Count CorrectAnswers for each Student take exam id and std id
SELECT dbo.Count_Student_CorrectAnswers(2, 3) AS CorrectAnswersCount;

---Get Exam Duration
SELECT dbo.Get_Exam_Duration(1) as 'Exam_Duration'

---Get Course By Track
select * from FN_GetCourseByTrack(2)

---Get QS For Course By Course ID

SELECT * FROM getQSforCourse(2);

---Get Course ID

SELECT dbo.getCourseID('Introduction to Programming') AS CourseID;

---Get Exam QS For Student using ID
SELECT * FROM GetExamQSForStd_FN(2);


--- Calculate Average Grade 
SELECT dbo.CalculateAverageGrade_Fun(2) AS AverageGrade;
--- Calculate Max Grade 
SELECT dbo.CalculateMaxGrade_Fun(2) AS [Max Degree];






