create or alter function [dbo].[GetBestStudentsPerCourse]
(@CourseID int)
returns @TopStudents table 
(
    StudentID int,
    TotalDegree int
)
as
begin
    with StudentExams as (
        select distinct sa.StdID, e.ID as ExamID
        from [dbo].[StudentAnswer] sa
        inner join [dbo].[Exam] e on sa.ExamID = e.ID
        where e.CourseID = @CourseID
    )
    insert into @TopStudents (StudentID, TotalDegree)
    select top 10 
        se.StdID,
        sum([dbo].[Calculate_Student_Degree](se.StdID, se.ExamID)) as TotalDegree
    from StudentExams se
    group by se.StdID
    having sum([dbo].[Calculate_Student_Degree](se.StdID, se.ExamID)) > 0
    order by sum([dbo].[Calculate_Student_Degree](se.StdID, se.ExamID)) desc;
    
    return;
end;

select * 
from [dbo].[GetBestStudentsPerCourse](11);

select * 
from [dbo].[GetBestStudentsPerCourse](12);