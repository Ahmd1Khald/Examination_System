--DML branch

use [db18494];
go

insert into dbo.branch (name, location, tmid)
values 
    ('main branch', 'nasr city, cairo', 1),
    ('alex branch', 'smouha, alexandria', 2),
    ('giza branch', 'dokki, giza', 3),
    ('maadi branch', 'maadi, cairo', 4),
    ('mansoura br', 'el gomhoria st', 5),
    ('tanta branch', 'el geish st', 6),
    ('zagazig br', 'el kornish st', 7),
    ('assiut br', 'nasser road', 1),
    ('fayoum br', 'el masaken', 2),
    ('sohag br', 'el shaheed st', 3);
