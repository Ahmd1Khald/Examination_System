create view dbo.studentanswerdetails as
select 
    sa.stdid as studentid,
    p.fname + ' ' + p.lname as studentname,
    sa.examid,
    sa.questionid,
    qp.question,
    sa.answer as studentanswer,
    qp.correctanswer,
    qpick.degree,
    case 
        when sa.answer = qp.correctanswer then qpick.degree
        else 0
    end as earneddegree
from 
    dbo.studentanswer sa
join 
    dbo.questionpool qp on sa.questionid = qp.id
join 
    dbo.questionpick qpick on sa.questionid = qpick.questionid and sa.examid = qpick.examid
join 
    [person].student p on sa.stdid = p.id;


select * 
from dbo.studentanswerdetails 
where studentid = 50 and examid = 12;