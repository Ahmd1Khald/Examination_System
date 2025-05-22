create or alter function [dbo].[GetBestStudentsPerExam]
(@ExamID int)
returns @TopStudents table 
(
    StudentID int,
    TotalDegree int
)
as
begin
    -- Validate ExamID exists
    if not exists (select 1 from [dbo].[Exam] where ID = @ExamID)
    begin
        return;
    end

    -- Calculate total degree for each student who took the exam
    insert into @TopStudents (StudentID, TotalDegree)
    select 
        se.StdID as StudentID,
        coalesce(se.StdExamDegree, 0) as TotalDegree
    from [dbo].[StudentExam] se
    inner join [dbo].[Exam] e on se.ExamID = e.ID
    inner join [dbo].[StudentCourse] sc on se.StdID = sc.StudentID 
        and e.CourseID = sc.CourseID
    where se.ExamID = @ExamID
        and se.StdExamDegree > 0
    order by se.StdExamDegree desc;

    return;
end;


select * from [dbo].[GetBestStudentsPerExam](2);
