create view dbo.studenttotaldegrees as
select 
    s.id as studentid,
    p.fname + ' ' + p.lname as studentname,
    e.id as examid,
    c.name as coursename,
    dbo.calculate_student_degree(s.id, e.id) as totaldegree
from 
    [person].student s
join 
    [person].student p on s.id = p.id
join 
    dbo.studentexam se on s.id = se.stdid
join 
    dbo.exam e on se.examid = e.id
join 
    dbo.course c on e.courseid = c.id;


select * from dbo.studenttotaldegrees;


select * 
from dbo.studenttotaldegrees 
where coursename = 'introduction to programming';