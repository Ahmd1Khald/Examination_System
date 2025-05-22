--DDL alter student exam 

alter table [dbo].[studentexam]
add courseid int;


--DML update student exam 
update se
set se.courseid = e.courseid
from [dbo].[studentexam] se
join [dbo].[exam] e on se.examid = e.id;

--DQL select null couse id  in student exam 
select * from [dbo].[studentexam]
where courseid is null;

--DDL alter student exam 

alter table [dbo].[studentexam]
alter column courseid int not null;

alter table [dbo].[studentexam]
add constraint fk_studentexam_course_courseid
foreign key (courseid) references [dbo].[course](id);