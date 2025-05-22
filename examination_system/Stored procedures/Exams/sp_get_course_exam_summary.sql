
create or alter procedure dbo.sp_GetCourseExamSummary
    @CourseID INT
as
begin
    if not exists (select 1 from dbo.Course where ID = @CourseID)
    begin
        raiserror('Course ID %d does not exist.', 16, 1, @CourseID);
        return;
    end

    select 
        e.ID as ExamID,
        count(distinct sa.StdID) as StudentsTaken,
        avg(cast(dbo.Calculate_Student_Degree(sa.StdID, e.ID) as float)) as AvgScore
    from dbo.Exam e
    left join dbo.StudentAnswer sa on e.ID = sa.ExamID
    where e.CourseID = @CourseID
    group by e.ID;
end;


exec dbo.sp_GetCourseExamSummary @CourseID = 90;

exec dbo.sp_GetCourseExamSummary @CourseID = 10;