
create or alter proc sp_UpdateCorrectAnswer 
		@QuestionID int,
		@newCorrectAnswer nvarchar(max)
as
	begin
		declare @Type nvarchar(20)=(
									select [Type]
									from QuestionType
									where QuestionID = @QuestionID
									);
		begin try
			begin transaction
				if (@newCorrectAnswer is null or LEN(@newCorrectAnswer)= 0)
					THROW 50000, 'Every question must have Correct Answer.', 1;
				if(@Type = 'True/False' and @newCorrectAnswer not in ('True','False'))
					THROW 50000, 'Invalid answer for True/False questions.', 1;	
				if(@Type = 'Text'or @Type = 'Multiple Choice' and @newCorrectAnswer in ('True','False'))
					THROW 50000, 'This answer is for True/False questions only.', 1;	
				
				update QuestionPool
				set correctAnswer = @newCorrectAnswer
				where ID = @QuestionID
				print 'New answer updated succefully'
				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch
	end

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 53,
	@newCorrectAnswer = 'True'

EXEC sp_UpdateCorrectAnswer
	@QuestionID = 37,
	@newCorrectAnswer = 'HTML'
