use [db18494]
go

create view vw_ExamResults as
select 
    sa.StdID,
    sa.ExamID,
    sa.QuestionID,
    qp.Question,
    sa.Answer as StudentAnswer,
    qp.correctAnswer,
    case 
        when sa.Answer = qp.correctAnswer then 1
        else 0
    end as Score,
    e.CourseID,
    c.Name as CourseName,
    ic.InstructorID,
    p.Name as InstructorName
from 
    dbo.StudentAnswer sa
    inner join dbo.QuestionPool qp on sa.QuestionID = qp.ID
    inner join dbo.QuestionPick qpick on sa.QuestionID = qpick.QuestionID and sa.ExamID = qpick.ExamID
    inner join dbo.Exam e on sa.ExamID = e.ID
    inner join dbo.Course c on e.CourseID = c.ID
    inner join dbo.InstructorCourse ic on c.ID = ic.CourseID
    inner join Person.Instructor p on ic.InstructorID = p.ID;



select *
from vw_ExamResults
where StdId=48;


