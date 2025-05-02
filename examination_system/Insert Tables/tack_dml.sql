--DML track 

use [db18494];
go

insert into dbo.track (name, deptid, tmid)
values
    ('full stack .net',     10, 1),
    ('full stack java',     20, 2),
    ('data analysis',       30, 3),
    ('cyber security',      40, 4),
    ('ai & machine learning', 50, 5);
