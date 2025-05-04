create or alter procedure Student_Exam_Degree
@StudentID INT,
@ExamID INT
as
begin
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
     set student_exam_Degree = @Student_Exam_Degree
     where StdID=@StudentID and ExamID = @ExamID
     end 
     else 
     begin 
     insert into StudentExam(StdID,ExamID,student_exam_Degree)
     values (@StudentID ,@ExamID,@Student_Exam_Degree)
     end
end

exec Student_Exam_Degree @StudentID = 60, @ExamID = 13
SELECT * FROM StudentExam WHERE StdID = 60 AND ExamID = 13
