create or alter function [dbo].[IsInstructorEligibleForCourse]
(@InstructorName nvarchar(100), @CourseName nvarchar(100))
returns nvarchar(20)
as
begin
    declare @EligibilityStatus nvarchar(20) = 'Not Eligible';
    declare @InstructorID int;
    declare @CourseID int;

    select @InstructorID = i.ID
    from [Person].[Instructor] i
    where i.Name = @InstructorName;

    if @InstructorID is null
    begin
        return 'Instructor Not Found';
    end

    select @CourseID = c.ID
    from [dbo].[Course] c
    where c.Name = @CourseName;

    if @CourseID is null
    begin
        return 'Course Not Found';
    end

    if exists (
        select 1
        from [dbo].[InstructorCourse] ic
        where ic.InstructorID = @InstructorID
          and ic.CourseID = @CourseID
    )
        set @EligibilityStatus = 'Eligible';
    
    return @EligibilityStatus;
end;

select *
from dbo.InstructorCourse

select [dbo].[IsInstructorEligibleForCourse]('Mohamed Ali', 'Web Development with ASP.NET') as EligibilityStatus;