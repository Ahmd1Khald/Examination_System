create or alter procedure dbo.sp_GetCourseExamSummary
    @CourseID int
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
        avg(cast(case 
                    when sa.Answer = qp.correctAnswer then qpPick.Degree
                    else 0
                end as float)) as AvgScore
    from dbo.Exam e
    left join dbo.StudentAnswer sa on e.ID = sa.ExamID
    left join dbo.QuestionPool qp on sa.QuestionID = qp.ID
    left join dbo.QuestionPick qpPick on sa.QuestionID = qpPick.QuestionID 
                                      and sa.ExamID = qpPick.ExamID
    where e.CourseID = @CourseID
    group by e.ID;
end;

exec dbo.sp_GetCourseExamSummary @CourseID = 90;

exec dbo.sp_GetCourseExamSummary @CourseID = 11;