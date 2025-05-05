create or alter procedure Student_Exam_Degree
@StudentID INT,
@ExamID INT
as
begin
	 declare @CourseID int = (Select courseid from Exam where id = @ExamID)
     declare @Student_Exam_Degree int 
     set @Student_Exam_Degree = dbo.Calculate_Student_Degree(@StudentID,@ExamID)
     if exists (
     select 1
     from 
     StudentExam
     where StdID=@StudentID and ExamID = @ExamID
     )
     begin 
     update StudentExam
     set StdExamDegree = @Student_Exam_Degree
     where StdID=@StudentID and ExamID = @ExamID
     end 
     else 
     begin 
     insert into StudentExam(StdID,ExamID,StdExamDegree,courseid)
     values (@StudentID ,@ExamID,@Student_Exam_Degree,@CourseID)
     end
end

exec Student_Exam_Degree @StudentID = 60, @ExamID = 13
SELECT * FROM StudentExam WHERE StdID = 60 AND ExamID = 13
