Create table UserTable(
userID int identity(1,10),
userName nvarchar(20),
userPassword nvarchar(20),
userRole nvarchar(12),
userEmail varchar(50)

constraint pk_UserTable_userID primary key(userID),
constraint unq_UserTable_userEmail unique (userEmail)
)