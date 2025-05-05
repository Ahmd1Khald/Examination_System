create view vw_QuestionPool as
select 
    qp.ID as QuestionID,
    qt.Type as QuestionType,
    qp.Question,
    qp.correctAnswer
from 
    dbo.QuestionPool qp
    left join dbo.QuestionType qt on qp.ID = qt.QuestionID;

select * from vw_QuestionPool;