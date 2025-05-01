CREATE TABLE StudentExam (
    ExamID INT,
    StdID INT,
    StdDegree INT,
    PRIMARY KEY (ExamID, StdID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ID),
    FOREIGN KEY (StdID) REFERENCES Student(ID)
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