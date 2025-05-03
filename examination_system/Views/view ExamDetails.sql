create view ExamDetails
as
select 
    e.ID as 'exam_id',
    c.ID as 'course_id',
    c.Name as 'course_name',
    COALESCE(min(s.IntakeID), 1) as 'intake',
    COALESCE(min(b.Name), '') as 'branch',
    COALESCE(min(t.Name), '') as 'track',
    e.Start_Time as 'start_time',
    e.End_Time as 'end_time',
    e.Date as 'date_of_exam',
    COALESCE(min(i.ID), 0) as 'inst_id'
from Exam e
left join QuestionPick p on p.ExamID = e.ID
left join Person.Instructor i on i.ID = p.InstID
left join Course c on c.ID = e.CourseID
left join StudentAnswer sa on sa.ExamID = e.ID
left join Person.Student s on s.ID = sa.StdID
left join Branch b on b.ID = s.BranchID
left join Track t on t.ID = s.BranchID
left join Intake it on it.ID = s.IntakeID
group by 
    e.ID, c.ID, c.Name, e.Start_Time, e.End_Time, e.Date


select * from ExamDetails
order by exam_id


