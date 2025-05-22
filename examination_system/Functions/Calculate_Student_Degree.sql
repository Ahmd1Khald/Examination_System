create or alter function Calculate_Student_Degree 
(
   @StudentID int,
   @ExamID int
)
returns int
as
begin
     declare @ToTalDegree int = 0
     select  @ToTalDegree = SUM(
           case
		        when SA.Answer = QP.correctAnswer then QPICK.Degree
				else  0
           end
      )
     from 
     StudentAnswer SA
     inner join QuestionPool QP on SA.QuestionID =QP.ID
     inner join QuestionPick QPICK on SA.QuestionID =QPICK.QuestionID
     where SA.StdID = @StudentID and QPICK.ExamID = @ExamID
     return isnull (@ToTalDegree,0)
end

