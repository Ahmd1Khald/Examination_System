create or alter procedure dbo.sp_ExamParticipationReport
    @ExamID int
as
begin
    select 
        s.ID as StudentID,
        s.fname+' '+s.lname as StudentName,
        case 
            when exists (
                select 1 from StudentAnswer sa 
                where sa.StdID = s.ID and sa.ExamID = @ExamID
            ) then 'Taken'
            else 'Not Taken'
        end as ExamStatus
    from person.student s;
end;

exec dbo.sp_ExamParticipationReport @ExamID = 1;