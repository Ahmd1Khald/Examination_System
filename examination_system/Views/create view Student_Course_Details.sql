create view Student_Course_Details 
as
select S.FName + ' ' +S.LName as 'Full Name',
C.Name as 'course Name',
SCrs.StdCrsDegree as 'Student_Course_Degree'
from 
Person.Student S
inner join StudentCourse SCrs on S.ID =SCrs.StudentID
inner join Course C on SCrs.CourseID = C.ID


SELECT * FROM Student_Course_Details 
ORDER BY [Full Name]