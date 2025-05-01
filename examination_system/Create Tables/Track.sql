create table Track(
    ID int primary key,
    [Name] varchar(50) not null,
    DeptID INT,
    TMID INT,

    FOREIGN KEY (DeptID) REFERENCES Department(ID),
    FOREIGN KEY (TMID) REFERENCES TrainingManager(ID)
);

INSERT INTO Track (ID, [name] ,DeptID, TMID) VALUES
(1, '.Net', 1, 1),
(2, 'Java', 1, 2),
(3, 'Python', 2, 1),
(4, 'Front-End', 2, 2),
(5, 'Mobile', 3, 3);
