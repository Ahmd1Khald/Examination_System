create view vw_CourseOverview as
select 
    c.ID as CourseID,
    c.Name as CourseName,
    c.Description,
    c.MaxDegree,
    c.MinDegree,
    ic.InstructorID,
    p.name,
    count(distinct e.ID) as ExamCount
from 
    dbo.Course c
    inner join dbo.InstructorCourse ic on c.ID = ic.CourseID
    inner join Person.Instructor p on ic.InstructorID = p.ID
    left join dbo.Exam e on c.ID = e.CourseID
group by 
    c.ID, c.Name, c.Description, c.MaxDegree, c.MinDegree, ic.InstructorID, p.Name;

select *
from vw_CourseOverview;