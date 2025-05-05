

create or alter proc sp_StoreStudentAnswer
		@QID int,
		@ExamID int,
		@StdID int,
		@Answer nvarchar(max)
as
	begin
		declare @Type nvarchar(20) = (select Type
									from QuestionType
									where QuestionID = @QID)
		if(@Type = 'True/False'and @Answer not in('True','False'))
			THROW 50000, 'Must answer with True or false', 1;
		if not exists(
				select 1
				from StudentExam
				where ExamID = @ExamID 
				)
			THROW 50000,'Invalid Exam ID.', 1;	
		if not exists(
				select 1
				from StudentExam
				where StdID = @StdID
				)
			THROW 50000,'Invalid Student ID.', 1;	
		else if not exists(
				select 1
				from QuestionPool
				where ID = @QID
				)
			THROW 50000,'Invalid Question ID.', 1;	
		else
			begin
					begin try
						begin transaction
							insert into StudentAnswer
							values(@QID,@ExamID,@StdID,@Answer)
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
			end
	end

	EXEC sp_StoreStudentAnswer 
		@QID = 2,
		@ExamID = 1,
		@StdID = 13,
		@Answer = 'HTML'

	EXEC sp_StoreStudentAnswer 
		@QID = 3,
		@ExamID = 2,
		@StdID = 15,
		@Answer = 'True'