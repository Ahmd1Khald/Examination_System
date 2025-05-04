create or alter function [dbo].[GetExamCountByCourseAndYear]
(@CourseID int, @Year int)
returns int
as
begin
    declare @ExamCount int;
    
    select @ExamCount = count(*)
    from [dbo].[Exam] e
    where e.CourseID = @CourseID
      and e.Year = @Year;
    
    return isnull(@ExamCount, 0);
end;

select [dbo].[GetExamCountByCourseAndYear](2, 2023) as ExamCount;

select * from Course where id = 2
select * from Exam where id = 2