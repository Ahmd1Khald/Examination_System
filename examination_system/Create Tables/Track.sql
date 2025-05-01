create table Track(
    ID int primary key identity(100,1),
    [Name] varchar(50) not null,
    DeptID INT not null,
    TMID INT not null,

	constraint FK_Track_Department_DeptID
	foreign key (DeptID)
	references Department(ID),

	constraint FK_Track_TrainingManager_TMID
	foreign key (TMID)
	references TrainingManager(ID),
);