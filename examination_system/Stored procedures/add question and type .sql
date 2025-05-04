

ALTER TABLE QuestionPool ADD Options VARCHAR(255);


UPDATE QuestionPool
SET Options = CASE ID
    WHEN 1 THEN 'folder,list,script,node'
    WHEN 5 THEN '^,exp,**,power'
    WHEN 7 THEN 'POST,PUSH,FETCH,LOAD'
    WHEN 12 THEN 'DROP,REMOVE,DELETE,CLEAR'
    WHEN 13 THEN 'UNIQUE,DISTINCT,SELECT,FILTER'
    WHEN 16 THEN 'Dart,Kotlin,Swift,C#'
    WHEN 19 THEN 'Android,iOS,Windows,Linux'
    WHEN 21 THEN 'Queue,Tree,Stack,Graph'
    WHEN 25 THEN 'AVL,Binary,B-Tree,Circle'
    WHEN 30 THEN 'Phishing,Fishing,Surfing,Tracking'
    WHEN 31 THEN 'React,Flask,Scikit-learn,Redux'
    WHEN 36 THEN 'HTML,CSS,PHP,JS'
    WHEN 39 THEN '<link>,<style>,<script>,<css>'
    WHEN 43 THEN 'Oracle,Cisco,AWS,MySQL'
    WHEN 46 THEN 'Agile,Waterfall,Incremental,Spiral'
    WHEN 49 THEN 'Internal Process,Internet Packet,Internet Protocol,Inter-Process'
    ELSE Options
END
WHERE ID IN (1, 5, 7, 12, 13, 16, 19, 21, 25, 30, 31, 36, 39, 43, 46, 49);

UPDATE QuestionPool
SET Question = CASE ID
    WHEN 1 THEN 'Which of the following is a valid Python data type?'
    WHEN 5 THEN 'Which operator is used for exponentiation in Python?'
    WHEN 7 THEN 'Which of these is a valid HTTP method?'
    WHEN 12 THEN 'Which SQL statement is used to remove a table?'
    WHEN 13 THEN 'Which keyword is used to return only unique values?'
    WHEN 16 THEN 'Which language is commonly used with Flutter?'
    WHEN 19 THEN 'Which OS is Swift used for?'
    WHEN 21 THEN 'Which data structure uses LIFO?'
    WHEN 25 THEN 'Which is NOT a type of tree?'
    WHEN 30 THEN 'Which of the following is a common cyber attack?'
    WHEN 31 THEN 'Which of these is a Python library for ML?'
    WHEN 36 THEN 'Which language is used to style HTML?'
    WHEN 39 THEN 'Which tag is used to link a CSS file?'
    WHEN 43 THEN 'Which is a cloud provider?'
    WHEN 46 THEN 'Which software model handles risk best?'
    WHEN 49 THEN 'What does IP stand for?'
    ELSE Question
END
WHERE ID IN (1, 5, 7, 12, 13, 16, 19, 21, 25, 30, 31, 36, 39, 43, 46, 49); 

create or alter proc sp_AddQuestionAndType
		@corectAnswer nvarchar(max),
		@Question nvarchar(max),
		@Type nvarchar(20),
		@Option nvarchar(200) = null
as
	begin
		begin try
			begin transaction
			declare @QID int = (select MAX(ID) from QuestionPool)+1
			if(@Type not in ('Multiple Choice','True/False','Text'))
				THROW 50000, 'Type of the question should be Multiple Choice or True/False or Text .', 1;
			if (@corectAnswer is null or LEN(@corectAnswer)= 0)
				THROW 50000, 'Every question must have Correct Answer.', 1;
			if((@Type = 'True/False' or @Type = 'Text') and @Option is not null)
				THROW 50000, 'Only Multiple Choice Questions can have Option.', 1;
			if(@Type = 'True/False' and @corectAnswer not in ('True','False'))
				THROW 50000, 'Invalid answer for True/False questions.', 1;			
			if(@Type = 'Multiple Choice')
				begin
					if(@Option is null)
						THROW 50000, 'Multiple Choice Questions must have Option.', 1;
					else 
						begin 
							declare @OptionCount int = 
								(len(@option) - len(replace(@option,',','')))+1;
							if(@OptionCount < 2)
								THROW 50000, 'Options of Multiple Choice Questions must be at least 2.', 1;	
						end
				end
				insert into QuestionPool
				values (@QID,@corectAnswer,@Question,@Option)

				insert into QuestionType
				values(@QID, @Type)

				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch	
	end

	
----------------------- Execution tests ----------------------

--for True/False Questions
EXEC sp_AddQuestionAndType
    @corectAnswer = 'False',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = NULL;

EXEC sp_AddQuestionAndType
    @corectAnswer = 'False',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = 'A: True, B: False';

EXEC sp_AddQuestionAndType
    @corectAnswer = 'Yes',
    @Question = 'Python uses curly braces to define code blocks.',
    @Type = 'True/False',
    @Option = NULL;

-- for Multiple Choice Questions
EXEC sp_AddQuestionAndType
    @corectAnswer = 'C',
    @Question = 'Which operator is used for exponentiation in Python?',
    @Type = 'Multiple Choice',
    @Option = 'A: ^, B: exp, C: **, D: power';

EXEC sp_AddQuestionAndType
    @corectAnswer = 'A',
    @Question = 'Which operator is used for exponentiation in Python?',
    @Type = 'Multiple Choice',
    @Option = 'A: **';

-- Text Question
EXEC sp_AddQuestionAndType
    @corectAnswer = 'Indentation',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = NULL;

EXEC sp_AddQuestionAndType
    @corectAnswer = 'Indentation',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = 'A: Spaces';

EXEC sp_AddQuestionAndType
    @corectAnswer = '',
    @Question = 'What is used to define blocks of code in Python?',
    @Type = 'Text',
    @Option = NULL;

-- general test
EXEC sp_AddQuestionAndType
    @corectAnswer = 'Test',
    @Question = 'Test question',
    @Type = 'InvalidType',
    @Option = NULL;
