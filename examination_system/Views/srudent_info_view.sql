-- view for student 
create view vw_studentinfo as
select 
    u.name as studentfullname,
    b.name as branch,
    i.number as intake
from 
    person.student s
    inner join person.usertable u on s.userid = u.id
    inner join dbo.branch b on s.branchid = b.id
    inner join dbo.intake i on s.intakeid = i.id
where 
    u.role = N'student';