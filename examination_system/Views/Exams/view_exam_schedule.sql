create view vw_ExamSchedule as
select 
    e.ID as ExamID,
    e.Date,
    e.Start_Time,
    e.End_Time,
    i.ID as IntakeID,
    i.Number as IntakeNumber,
    b.ID as BranchID,
    b.Name as BranchName,
    t.ID as TrackID,
    t.Name as TrackName
from 
    dbo.Exam e
    inner join dbo.Course c on e.CourseID = c.ID
    inner join dbo.InstructorCourse ic on c.ID = ic.CourseID
    inner join Person.Instructor instr on ic.InstructorID = instr.ID
    inner join dbo.Branch b on b.TMID = instr.id
    inner join dbo.Intake i on i.TMID = b.TMID
    inner join dbo.IntakeTrack it on i.ID = it.IntakeID
    inner join dbo.Track t on it.TrackID = t.ID;

select * from vw_ExamSchedule;