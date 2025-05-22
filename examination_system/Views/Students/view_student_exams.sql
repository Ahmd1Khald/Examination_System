create view vw_StudentExams as
select distinct
    sa.StdID,
    e.ID as ExamID,
    e.Date,
    e.Start_Time,
    e.End_Time,
    c.Name as CourseName
from 
    dbo.StudentAnswer sa
    inner join dbo.Exam e on sa.ExamID = e.ID
    inner join dbo.Course c on e.CourseID = c.ID;

select *
from vw_StudentExams;