use Exam

--------------------------------Creat Track and Inset in it-------------------------

create table Track(
    ID int primary key,
    [name] varchar(50) not null,
    DeptID INT,
    TMID INT,
    -- FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (TMID) REFERENCES TrainingManager(ID)
);

INSERT INTO Track (ID, [name] ,DeptID, TMID) VALUES
(1, '.Net', 1, 1),
(2, 'Java', 1, 2),
(3, 'Python', 2, 1),
(4, 'Front-End', 2, 2),
(5, 'Mobile', 3, 3);

-----------------------Create Training Manager ind insert in it------------------------ 

CREATE TABLE TrainingManager (
    ID INT PRIMARY KEY,
    email VARCHAR(100),
    [name] VARCHAR(50),
    UserID INT,
    -- FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO TrainingManager (ID, email, [name], UserID) VALUES
(1, 'EngSara@gmail.com', 'Sara', 2),
(2, 'EngSarwit@gmail.com', 'Sarwit', 3),
(3, 'EngTony@gmail.com', 'Tony', 4),
(4, 'EngMirihan@gmail.com', 'Mirihan', 5),
(5, 'EngAlaa@gmail.com.com', 'Alaa', 6);

----------------------------Creat Student Exam and Insert in it -----------------------------

CREATE TABLE StudentExam (
    ExamID INT,
    StdID INT,
    StdDegree INT,
    PRIMARY KEY (ExamID, StdID),
    --FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    --FOREIGN KEY (StdID) REFERENCES Student(StdID)
);
INSERT INTO StudentExam (ExamID, StdID, StdDegree) VALUES
(1, 1, 40),
(1, 2, 38),
(1, 3, 35),
(2, 1, 45),
(2, 2, 42),
(2, 3, 39),
(3, 1, 30),
(3, 2, 28),
(3, 3, 26),
(4, 1, 44);