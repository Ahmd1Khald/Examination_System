Create table UserTable(
ID int identity(1,10),
[Name] nvarchar(20),
[Password] nvarchar(20),
[Role] nvarchar(12),
[Email] varchar(50)

constraint pk_UserTable_ID primary key(ID),
constraint unq_UserTable_Email unique ([Email])
)