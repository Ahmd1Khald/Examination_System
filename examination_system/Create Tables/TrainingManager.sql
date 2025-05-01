CREATE TABLE TrainingManager (
    ID INT PRIMARY KEY,
    Email VARCHAR(100) not null,
    [Name] VARCHAR(50) not null,
    UserID INT,

	constraint FK_TrainingManager_UserTable_UserID
	foreign key (UserID) references UserTable(ID),
);
