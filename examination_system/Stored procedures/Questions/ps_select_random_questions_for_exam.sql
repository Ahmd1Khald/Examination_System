
create or alter procedure [dbo].[SelectRandomQuestionsForExam]
    @Type nvarchar(20),
    @Count int
as
begin
    set nocount on;

    select top (@Count) qp.ID as QuestionID, qp.Question
    from [dbo].[QuestionPool] qp
    inner join [dbo].[QuestionType] qt on qp.ID = qt.QuestionID
    where qt.Type = @Type
    order by newid();
end;



exec [dbo].[SelectRandomQuestionsForExam] 'Multiple Choice', 9;

exec [dbo].[SelectRandomQuestionsForExam] 'True/False', 9;

exec [dbo].[SelectRandomQuestionsForExam] 'Text', 9;