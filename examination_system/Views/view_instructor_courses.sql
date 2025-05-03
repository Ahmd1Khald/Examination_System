create view view_instructorcourses as
select 
    ic.instructorid,
    c.id as courseid,
    c.name as coursename,
    c.description,
    c.maxdegree,
    c.mindegree
from 
    dbo.instructorcourse ic
join 
    dbo.course c on ic.courseid = c.id;

select * from view_instructorcourses;

select * 
from view_instructorcourses
where instructorid = 1;
