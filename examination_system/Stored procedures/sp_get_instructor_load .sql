create or alter procedure dbo.sp_GetInstructorLoad
    @InstructorID int
as
begin
    select 
        p.Name as InstructorName,
        c.ID as CourseID,
        c.Name as CourseName,
        count(distinct s.studentId) as TotalStudents
    from dbo.InstructorCourse ic
    join dbo.Course c on ic.CourseID = c.ID
    join dbo.studentcourse s on s.CourseID = c.ID
    join Person.Instructor p on ic.InstructorID = p.ID
    where ic.InstructorID = @InstructorID
    group by p.Name, c.ID, c.Name;
end;

exec dbo.sp_GetInstructorLoad @InstructorID = 3;