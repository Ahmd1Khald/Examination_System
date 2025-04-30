use Exam
create table Track(
    ID int primary key,
    [name] varchar(50) not null,
    DeptID INT,
    TMID INT,
    -- FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (TMID) REFERENCES TrainingManager(ID)
);
CREATE TABLE TrainingManager (
    ID INT PRIMARY KEY,
    email VARCHAR(100),
    [name] VARCHAR(50),
    UserID INT,
    -- FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE StudentExam (
    ExamID INT,
    StdID INT,
    StdDegree INT,
    PRIMARY KEY (ExamID, StdID),
    --FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    --FOREIGN KEY (StdID) REFERENCES Student(StdID)
);