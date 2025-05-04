-----works with store prosedure procedure Student_Exam_Degree
create trigger trg_AfterStudentAnswerInsert
on StudentAnswer
after insert 
as 
begin
     declare @StudentID INT, @ExamID INT,@CourseID INT
	 select top 1
	     StdID=@StudentID ,
	     ExamID = @ExamID
     from inserted

     select @CourseID = CourseID from Exam where ID = @ExamID
	 exec dbo.Student_Exam_Degree @StudentID , @ExamID,@CourseID

end


select * 
from StudentExam
where StdID = 60
