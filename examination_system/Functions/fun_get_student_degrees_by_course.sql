--Add function Get_Student_Degrees_By_Course to retrieve student exam degrees by course

create function [dbo].[get_student_degrees_by_course]
(
    @courseid int
)
returns table
as
return
(
    select 
        s.id as studentid,
        p.fname+' '+p.lname as studentname,
        e.id as examid,
        dbo.calculate_student_degree(s.id, e.id) as degree
    from 
        [person].[student] s
    join 
        dbo.studentexam se on s.id = se.stdid
    join 
        dbo.exam e on se.examid = e.id
    join 
        dbo.course c on e.courseid = c.id
    join 
        [person].student p on s.id = p.id
    where 
        c.id = @courseid
);


select * 
from dbo.get_student_degrees_by_course(11);