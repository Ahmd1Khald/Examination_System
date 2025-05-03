create view TrainingManager_Details
as
SELECT 
    TM.ID AS TMID,
    TM.Name as 'TrainingManager Name',
    B.ID as 'Branch id',
    B.Name as'branch name',
    T.ID as 'training manager id',
    T.Name as 'training manager name',
    I.Number as 'Intake number'
from person.TrainingManager TM
inner JOIN Branch B ON TM.ID = B.TMID
inner JOIN Track T ON TM.ID = T.TMID
inner JOIN Intake I ON TM.ID = I.TMID

select * from TrainingManager_Details