create or alter function [dbo].[GetStudentCountByIntake]
(@IntakeID int)
returns int
as
begin
    declare @StudentCount int;
    
    select @StudentCount = count(*)
    from [Person].[Student] s
    where s.IntakeID = @IntakeID;
    
    return isnull(@StudentCount, 0);
end;

select [dbo].[GetStudentCountByIntake](1) as StudentCount;