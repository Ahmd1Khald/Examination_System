create nonclustered index IX_Course_Name 
ON Course (Name)

select * 
from Course
where Name ='Introduction to Programming'