

create or alter proc UpdateStudentExamDegree
		@ExamID int,
		@StdID int,
		@newDegree int
as
	begin
		declare @TotalDegree int = (select TotalDegree
											from Exam
											where ID = @ExamID) 
		if(@newDegree > @TotalDegree)
			THROW 50000, 'Degree must not exceed total exam degree.', 1;
		else
			begin
			begin try
				begin transaction
					update StudentExam
					set StdExamDegree = @newDegree
					where ExamID = @ExamID and StdID = @StdID
					commit;
					print 'Student degree updated succefully'
			end try
			begin catch
				rollback;
				print 'Error Occured:' + ERROR_MESSAGE();
			end catch
		end
	end

exec UpdateStudentExamDegree 
		@ExamID = 5,
		@StdID = 17,
		@newDegree = 12