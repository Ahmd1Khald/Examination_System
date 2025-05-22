Create table Person.UserTable(
ID int identity(10,10),
[Name] nvarchar(20) not null,
[Password] nvarchar(20) not null,
[Role] nvarchar(20) not null,
[Email] varchar(50)

constraint pk_UserTable_ID primary key(ID),
constraint unq_UserTable_Email unique ([Email]),
)
