Create table DepartmentTable(
depID int identity(1,2),
depName nvarchar(20),

constraint pk_DepartmentTable_depID primary key(depID),
)