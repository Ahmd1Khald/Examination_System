CREATE TABLE TrainingManager (
    ID INT PRIMARY KEY,
    Email VARCHAR(100),
    [Name] VARCHAR(50),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES UserTable(ID)
);
INSERT INTO TrainingManager (ID, email, [name], UserID) VALUES
(1, 'EngSara@gmail.com', 'Sara', 2),
(2, 'EngSarwit@gmail.com', 'Sarwit', 3),
(3, 'EngTony@gmail.com', 'Tony', 4),
(4, 'EngMirihan@gmail.com', 'Mirihan', 5),
(5, 'EngAlaa@gmail.com.com', 'Alaa', 6);