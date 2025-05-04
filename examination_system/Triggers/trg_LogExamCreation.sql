create trigger trg_LogExamCreation
on [dbo].[Exam]
after insert
as
begin
    print 'Exam record has been created.'
end
