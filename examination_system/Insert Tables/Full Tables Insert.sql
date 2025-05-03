INSERT INTO Person.[usertable] ([name], [password], [role], [email])
VALUES
(N'ahmed hassan',      N'ahmed123',   N'Student',      N'ahmed.hassan@example.com'),
(N'sara mahmoud',      N'sara456',    N'Student',      N'sara.mahmoud@example.com'),
(N'mohamed ali',       N'mohamed789', N'Instructor',   N'mohamed.ali@example.com'),
(N'menna fathy',       N'menna321',   N'Training Manager', N'menna.fathy@example.com'),
(N'ibrahim adel',      N'ibrahim654', N'Student',      N'ibrahim.adel@example.com'),
(N'dina elmasry',      N'dina987',    N'Instructor',   N'dina.elmasry@example.com'),
(N'tarek nabil',       N'tarek111',   N'Student',      N'tarek.nabil@example.com'),
(N'nourhan youssef',   N'nourhan222', N'Training Manager', N'nourhan.youssef@example.com'),
(N'youssef mostafa',   N'youssef333', N'Instructor',   N'youssef.mostafa@example.com'),
(N'reem kamal',        N'reem444',    N'Student',      N'reem.kamal@example.com'),

(N'hossam gabr',       N'hossam555',  N'Student',      N'hossam.gabr@example.com'),
(N'layla adel',        N'layla666',   N'Instructor',   N'layla.adel@example.com'),
(N'karim lotfy',       N'karim777',   N'Training Manager', N'karim.lotfy@example.com'),
(N'fatma naguib',      N'fatma888',   N'Student',      N'fatma.naguib@example.com'),
(N'walid tarek',       N'walid999',   N'Instructor',   N'walid.tarek@example.com'),
(N'rania helmy',       N'rania000',   N'Training Manager', N'rania.helmy@example.com'),
(N'alaa yassin',       N'alaa101',    N'Student',      N'alaa.yassin@example.com'),
(N'noha sami',         N'noha202',    N'Instructor',   N'noha.sami@example.com'),
(N'mostafa shawky',    N'mostafa303', N'Student',      N'mostafa.shawky@example.com'),
(N'esraa nader',       N'esraa404',   N'Training Manager', N'esraa.nader@example.com'),

(N'adel badr',         N'adel505',    N'Student',      N'adel.badr@example.com'),
(N'mai fouad',         N'mai606',     N'Instructor',   N'mai.fouad@example.com'),
(N'hany zaki',         N'hany707',    N'Training Manager', N'hany.zaki@example.com'),
(N'yara magdy',        N'yara808',    N'Student',      N'yara.magdy@example.com'),
(N'omar fekry',        N'omar909',    N'Instructor',   N'omar.fekry@example.com'),
(N'nahla said',        N'nahla010',   N'Training Manager', N'nahla.said@example.com'),
(N'khaled mansour',    N'khaled121',  N'Student',      N'khaled.mansour@example.com'),
(N'mirna saber',       N'mirna232',   N'Instructor',   N'mirna.saber@example.com'),
(N'shady roshdy',      N'shady343',   N'Student',      N'shady.roshdy@example.com'),
(N'heba rami',         N'heba454',    N'Training Manager', N'heba.rami@example.com'),

(N'tamer fathi',       N'tamer565',   N'Student',      N'tamer.fathi@example.com'),
(N'nadine ayman',      N'nadine676',  N'Instructor',   N'nadine.ayman@example.com'),
(N'ziad ashraf',       N'ziad787',    N'Training Manager', N'ziad.ashraf@example.com'),
(N'mariam anwar',      N'mariam898',  N'Student',      N'mariam.anwar@example.com'),
(N'fady kamel',        N'fady909',    N'Instructor',   N'fady.kamel@example.com'),
(N'yasmine adel',      N'yasmine010', N'Training Manager', N'yasmine.adel@example.com'),
(N'ayman galal',       N'ayman121',   N'Student',      N'ayman.galal@example.com'),
(N'nesma khalil',      N'nesma232',   N'Instructor',   N'nesma.khalil@example.com'),
(N'samir zohdy',       N'samir343',   N'Student',      N'samir.zohdy@example.com'),
(N'malak tamer',       N'malak454',   N'Training Manager', N'malak.tamer@example.com'),

(N'ramy ehab',         N'ramy565',    N'Student',      N'ramy.ehab@example.com'),
(N'hagar osama',       N'hagar676',   N'Instructor',   N'hagar.osama@example.com'),
(N'thabet yehia',      N'thabet787',  N'Training Manager', N'thabet.yehia@example.com'),
(N'dalia elhady',      N'dalia898',   N'Student',      N'dalia.elhady@example.com'),
(N'bassel nashaat',    N'bassel909',  N'Instructor',   N'bassel.nashaat@example.com'),
(N'rana abdallah',     N'rana010',    N'Training Manager', N'rana.abdallah@example.com'),
(N'salim gawish',      N'salim121',   N'Student',      N'salim.gawish@example.com'),
(N'huda refaat',       N'huda232',    N'Instructor',   N'huda.refaat@example.com'),
(N'mahmoud ghoneim',   N'mahmoud343', N'Student',      N'mahmoud.ghoneim@example.com'),
(N'lamia reda',        N'lamia454',   N'Training Manager', N'lamia.reda@example.com');


go

insert into dbo.department (name)
values 
    ('software dev'),
    ('network admin'),
    ('tech support'),
    ('db admin'),
    ('cybersecurity'),
    ('devops'),
    ('cloud compute'),
    ('ui ux design'),
    ('data analysis'),
    ('it helpdesk');

	INSERT INTO Course ([Name], [Description], MaxDegree, MinDegree)
VALUES
('Introduction to Programming', 'Beginner-level course using Python to learn the fundamentals of programming.', 100, 50),
('Web Development with ASP.NET', 'Learn how to build modern web applications using ASP.NET Core.', 100, 60),
('SQL Database Design', 'Comprehensive guide to designing and managing databases using SQL Server.', 100, 55),
('Mobile App Development', 'Create mobile apps using Flutter and Dart with real-world practice.', 100, 50),
('Data Structures and Algorithms', 'Essential course on data structures and problem-solving techniques.', 100, 65),
('Cybersecurity Fundamentals', 'Understand the basics of cybersecurity and how to protect systems.', 100, 70),
('AI and Machine Learning', 'Introductory course to AI and ML concepts using Python and real data.', 100, 60),
('Frontend Web Development', 'Learn HTML, CSS, and JavaScript to build interactive web interfaces.', 100, 50),
('DevOps and Cloud Computing', 'Learn the principles of DevOps and how to deploy applications using cloud services like Azure and AWS.', 100, 60),
('Software Engineering', 'Study the software development life cycle, requirements analysis, and design patterns.', 100, 65),
('Network Administration', 'Understand computer networks and how to manage servers, systems, and IT infrastructure.', 100, 55);

go


INSERT INTO QuestionPool (ID, correctAnswer, Question)
VALUES
(1, 'B', 'Which of the following is a valid Python data type?\nA. folder\nB. list\nC. script\nD. node'),
(2, 'True', 'Python is a dynamically typed language. (True/False)'),
(3, 'False', 'Python uses curly braces to define code blocks. (True/False)'),
(4, 'Indentation', 'What is used to define blocks of code in Python?'),
(5, 'C', 'Which operator is used for exponentiation in Python?\nA. ^\nB. exp\nC. **\nD. power'),
(6, 'True', 'ASP.NET supports both MVC and Web API. (True/False)'),
(7, 'A', 'Which of these is a valid HTTP method?\nA. POST\nB. PUSH\nC. FETCH\nD. LOAD'),
(8, 'C#', 'What language is commonly used with ASP.NET Core?'),
(9, 'Model-View-Controller', 'What does MVC stand for?'),
(10, 'False', 'ASP.NET cannot be used for RESTful services. (True/False)'),
(11, 'Structured Query Language', 'What does SQL stand for?'),
(12, 'A', 'Which SQL statement is used to remove a table?\nA. DROP\nB. REMOVE\nC. DELETE\nD. CLEAR'),
(13, 'B', 'Which keyword is used to return only unique values?\nA. UNIQUE\nB. DISTINCT\nC. SELECT\nD. FILTER'),
(14, 'JOIN', 'What keyword is used to combine rows from two or more tables?'),
(15, 'False', 'You must use WHERE in every SQL SELECT query. (True/False)'),
(16, 'A', 'Which language is commonly used with Flutter?\nA. Dart\nB. Kotlin\nC. Swift\nD. C#'),
(17, 'True', 'React Native allows development for both iOS and Android. (True/False)'),
(18, 'Android Studio', 'Which IDE is typically used for Android development?'),
(19, 'B', 'Which OS is Swift used for?\nA. Android\nB. iOS\nC. Windows\nD. Linux'),
(20, 'False', 'Mobile apps cannot access device hardware. (True/False)'),
(21, 'C', 'Which data structure uses LIFO?\nA. Queue\nB. Tree\nC. Stack\nD. Graph'),
(22, 'True', 'A queue is FIFO (First In, First Out). (True/False)'),
(23, 'Binary Search', 'Which algorithm is best for searching in a sorted array?'),
(24, 'False', 'A linked list allows random access. (True/False)'),
(25, 'D', 'Which is NOT a type of tree?\nA. AVL\nB. Binary\nC. B-Tree\nD. Circle'),
(26, 'True', 'Firewalls prevent unauthorized access to networks. (True/False)'),
(27, 'B', 'What does HTTPS stand for?\nA. Hypertext Transfer Push Security\nB. Hypertext Transfer Protocol Secure\nC. HTTP Secureline\nD. Host Transfer Secure'),
(28, 'Encryption', 'What is the process of converting data into a secret code called?'),
(29, 'False', 'Passwords should be stored in plain text. (True/False)'),
(30, 'A', 'Which of the following is a common cyber attack?\nA. Phishing\nB. Fishing\nC. Surfing\nD. Tracking'),
(31, 'C', 'Which of these is a Python library for ML?\nA. React\nB. Flask\nC. Scikit-learn\nD. Redux'),
(32, 'True', 'Supervised learning requires labeled data. (True/False)'),
(33, 'Classification', 'What is the process of categorizing data into classes called?'),
(34, 'False', 'AI and ML are exactly the same thing. (True/False)'),
(35, 'Overfitting', 'What do we call a model that performs well on training data but poorly on unseen data?'),
(36, 'B', 'Which language is used to style HTML?\nA. HTML\nB. CSS\nC. PHP\nD. JS'),
(37, 'True', 'HTML is used for structuring web pages. (True/False)'),
(38, 'DOM', 'What does the browser create from HTML that JavaScript can interact with?'),
(39, 'A', 'Which tag is used to link a CSS file?\nA. <link>\nB. <style>\nC. <script>\nD. <css>'),
(40, 'False', 'You cannot use JavaScript in HTML. (True/False)'),
(41, 'True', 'CI/CD pipelines are part of DevOps. (True/False)'),
(42, 'Docker', 'Which tool is used to containerize applications?'),
(43, 'C', 'Which is a cloud provider?\nA. Oracle\nB. Cisco\nC. AWS\nD. MySQL'),
(44, 'Infrastructure as Code', 'What does IaC stand for?'),
(45, 'False', 'DevOps is only about writing code. (True/False)'),
(46, 'D', 'Which software model handles risk best?\nA. Agile\nB. Waterfall\nC. Incremental\nD. Spiral'),
(47, 'Requirement Gathering', 'What is the first phase in the software life cycle?'),
(48, 'True', 'TCP ensures reliable data transmission. (True/False)'),
(49, 'C', 'What does IP stand for?\nA. Internal Process\nB. Internet Packet\nC. Internet Protocol\nD. Inter-Process'),
(50, 'OSI Model', 'What model divides network communication into 7 layers?');

go

BULK INSERT Person.TrainingManager
FROM 'D:\ITI\SQL Project\Files\TM data.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2, -- Skip header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


go


INSERT INTO Person.Instructor ([Name], userID) VALUES
('Mohamed Ali', 120),
('Dina Elmasry', 150),
('Youssef Mostafa', 180),
('Layla Adel', 200),
('Walid Tarek', 240),
('Noha Sami', 270);

go



INSERT INTO [dbo].[Exam] ([Year], Start_Time, End_Time, TotalDegree, CourseID, [Date])
VALUES
(2024, '09:00', '11:00', 20, 0, '2024-06-15'),
(2024, '12:00', '14:00', 20, 1, '2024-06-15'),
(2024, '10:00', '12:00', 20, 2, '2024-06-15'),
(2024, '13:00', '15:00', 20, 3, '2024-06-15'),
(2024, '09:00', '11:00', 20, 4, '2024-06-15'),
(2024, '10:30', '12:30', 20, 5, '2024-06-15'),
(2024, '14:00', '16:00', 20, 6, '2024-06-15'),
(2024, '08:00', '10:00', 20, 7, '2024-06-15'),
(2024, '11:00', '13:00', 20, 8, '2024-06-15'),
(2024, '13:30', '15:30', 20, 9, '2024-06-15'),
(2024, '09:30', '11:30', 20, 10, '2024-06-15'),
(2023, '09:00', '11:00', 10, 0, '2023-06-15'),
(2023, '12:00', '14:00', 10, 1, '2023-06-15'),
(2023, '10:00', '12:00', 10, 2, '2023-06-15'),
(2023, '13:00', '15:00', 10, 3, '2023-06-15'),
(2023, '09:00', '11:00', 10, 4, '2023-06-15'),
(2023, '10:30', '12:30', 10, 5, '2023-06-15'),
(2023, '14:00', '16:00', 10, 6, '2023-06-15'),
(2023, '08:00', '10:00', 10, 7, '2023-06-15'),
(2023, '11:00', '13:00', 10, 8, '2023-06-15'),
(2023, '13:30', '15:30', 10, 9, '2023-06-15'),
(2023, '09:30', '11:30', 10, 10, '2023-06-15'),
(2022, '09:00', '11:00', 30, 0, '2022-06-15'),
(2022, '12:00', '14:00', 30, 1, '2022-06-15'),
(2022, '10:00', '12:00', 30, 2, '2022-06-15'),
(2022, '13:00', '15:00', 30, 3, '2022-06-15'),
(2022, '09:00', '11:00', 30, 4, '2022-06-15'),
(2022, '10:30', '12:30', 30, 5, '2022-06-15'),
(2022, '14:00', '16:00', 30, 6, '2022-06-15'),
(2022, '08:00', '10:00', 30, 7, '2022-06-15'),
(2022, '11:00', '13:00', 30, 8, '2022-06-15'),
(2022, '13:30', '15:30', 30, 9, '2022-06-15'),
(2022, '09:30', '11:30', 30, 10, '2022-06-15');

go



INSERT INTO QuestionType (QuestionID, [Type])
VALUES
(1, 'Multiple Choice'),
(2, 'True/False'),
(3, 'True/False'),
(4, 'Text'),
(5, 'Multiple Choice'),

(6, 'True/False'),
(7, 'Multiple Choice'),
(8, 'Text'),
(9, 'Text'),
(10, 'True/False'),

(11, 'Text'),
(12, 'Multiple Choice'),
(13, 'Multiple Choice'),
(14, 'Text'),
(15, 'True/False'),

(16, 'Multiple Choice'),
(17, 'True/False'),
(18, 'Text'),
(19, 'Multiple Choice'),
(20, 'True/False'),

(21, 'Multiple Choice'),
(22, 'True/False'),
(23, 'Text'),
(24, 'True/False'),
(25, 'Multiple Choice'),

(26, 'True/False'),
(27, 'Multiple Choice'),
(28, 'Text'),
(29, 'True/False'),
(30, 'Multiple Choice'),

(31, 'Multiple Choice'),
(32, 'True/False'),
(33, 'Text'),
(34, 'True/False'),
(35, 'Text'),

(36, 'Multiple Choice'),
(37, 'True/False'),
(38, 'Text'),
(39, 'Multiple Choice'),
(40, 'True/False'),

(41, 'True/False'),
(42, 'Text'),
(43, 'Multiple Choice'),
(44, 'Text'),
(45, 'True/False'),

(46, 'Multiple Choice'),
(47, 'Text'),
(48, 'True/False'),
(49, 'Multiple Choice'),
(50, 'Text');
go

INSERT INTO dbo.Branch ([Name] ,[Location], TMID)
VALUES 
    ('main branch', 'nasr city, cairo', 1),
    ('alex branch', 'smouha, alexandria', 2),
    ('giza branch', 'dokki, giza', 3),
    ('maadi branch', 'maadi, cairo', 4),
    ('mansoura br', 'el gomhoria st', 5),
    ('tanta branch', 'el geish st', 6),
    ('zagazig br', 'el kornish st', 7),
    ('assiut br', 'nasser road', 1),
    ('fayoum br', 'el masaken', 2),
    ('sohag br', 'el shaheed st', 3);

	go

	
insert into dbo.intake (number, tmid)
values
    (43, 1),
    (44, 2),
    (45, 3),
    (46, 4),
    (47, 5),
    (48, 6),
    (49, 7),
    (50, 1),
    (51, 2),
    (52, 3);


	go

	
insert into dbo.track (name, deptid, tmid)
values
    ('full stack .net',     10, 1),
    ('full stack java',     20, 2),
    ('data analysis',       30, 3),
    ('cyber security',      40, 4),
    ('ai & machine learning', 50, 5);

	go

	INSERT INTO ExamType (ExamID, [Type])
SELECT ID, 'Exam'
FROM Exam;
go 

INSERT INTO ExamType (ExamID, [Type])
SELECT ID, 'Corrective'
FROM Exam
WHERE ID % 3 = 0;

go

INSERT INTO [dbo].[InstructorCourse] (InstructorID, CourseID)
VALUES
(0, 0), (0, 1), (0, 7), (0, 9),
(1, 0), (1, 2), (1, 8), (1, 9),
(2, 4), (2, 6), (2, 9),
(3, 2), (3, 5), (3, 10),
(4, 0), (4, 4), (4, 6),
(5, 1), (5, 3), (5, 7);

go

INSERT INTO [dbo].[IntakeTrack] (IntakeID, TrackID)
VALUES
(0, 0),
(0, 1),
(1, 0),
(1, 2),
(2, 3),
(3, 4),
(4, 0),
(5, 2),
(6, 1),
(7, 4),
(8, 3),
(9, 0),
(9, 1),
(9, 2);

go

-- Full Stack .NET
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (0, 0);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (0, 7);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (0, 9);

-- Full Stack Java
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (1, 0);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (1, 2);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (1, 7);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (1, 8);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (1, 9);

-- Data Analysis
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (2, 0);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (2, 2);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (2, 4);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (2, 9);

-- Cyber Security
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (3, 0);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (3, 2);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (3, 5);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (3, 10);

-- AI & Machine Learning
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (4, 0);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (4, 4);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (4, 6);
INSERT INTO [dbo].[TrackCourse] (TrackID, CourseID) VALUES (4, 9);


go

INSERT INTO [Person].[Student] (ID, FName, LName, UserID, IntakeID, BranchID, TMID)
VALUES
(1, 'Ahmed', 'Hassan', 10, 0, 0, 1),
(2, 'Sara', 'Mahmoud', 20, 0, 0, 1),
(3, 'Ibrahim', 'Adel', 50, 0, 0, 1),
(4, 'Tarek', 'Nabil', 70, 0, 0, 1),
(5, 'Reem', 'Kamal', 100, 0, 0, 1),
(6, 'Fatma', 'Naguib', 110, 1, 1, 2),
(7, 'Alaa', 'Yassin', 140, 1, 1, 2),
(8, 'Mostafa', 'Shawky', 170, 1, 1, 2),
(9, 'Yara', 'Magdy', 190, 1, 1, 2),
(10, 'Khaled', 'Mansour', 210, 1, 1, 2),
(11, 'Shady', 'Roshdy', 240, 2, 2, 3),
(12, 'Mariam', 'Anwar', 270, 2, 2, 3),
(13, 'Ayman', 'Galal', 290, 2, 2, 3),
(14, 'Samir', 'Zohdy', 310, 2, 2, 3),
(15, 'Dalia', 'Elhady', 340, 2, 2, 3),
(16, 'Salim', 'Gawish', 370, 3, 3, 4),
(17, 'Mahmoud', 'Ghoneim', 390, 3, 3, 4),
(18, 'Hossam', 'Gabr', 410, 3, 3, 4),
(19, 'Adel', 'Badr', 440, 3, 3, 4),
(20, 'Tamer', 'Fathi', 470, 3, 3, 4),
(21, 'Ramy', 'Ehab', 490, 4, 4, 5);

go

INSERT INTO [dbo].[QuestionPick] (QuestionID, ExamID, InstID, Degree)
VALUES
(1, 1, 0, 2),
(2, 1, 1, 3),
(3, 2, 2, 4),
(4, 2, 3, 2),
(5, 3, 4, 5),
(6, 3, 5, 2),
(7, 4, 0, 4),
(8, 4, 1, 3),
(9, 5, 2, 3),
(10, 5, 3, 2),
(11, 6, 4, 4),
(12, 6, 5, 3),
(13, 7, 0, 5),
(14, 7, 1, 2),
(15, 8, 2, 1),
(16, 8, 3, 3),
(17, 9, 4, 4),
(18, 9, 5, 2),
(19, 10, 0, 3),
(20, 10, 1, 1),
(21, 11, 2, 2),
(22, 11, 3, 4),
(23, 12, 4, 3),
(24, 12, 5, 2),
(25, 13, 0, 5),
(26, 13, 1, 2),
(27, 14, 2, 3),
(28, 14, 3, 4),
(29, 15, 4, 3),
(30, 15, 5, 2),
(31, 16, 0, 4),
(32, 16, 1, 1),
(33, 17, 2, 3),
(34, 17, 3, 2),
(35, 18, 4, 2),
(36, 18, 5, 1),
(37, 19, 0, 3),
(38, 19, 1, 2),
(39, 20, 2, 2),
(40, 20, 3, 1),
(41, 21, 4, 4),
(42, 22, 5, 3),
(43, 23, 0, 2),
(44, 24, 1, 3),
(45, 25, 2, 2),
(46, 26, 3, 3),
(47, 27, 4, 1),
(48, 28, 5, 4),
(49, 29, 0, 2),
(50, 30, 1, 3);

go

INSERT INTO [dbo].[StudentAnswer] (QuestionID, ExamID, StdID, Answer)
VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 3, 'False'),
(4, 2, 4, 'True'),
(5, 3, 5, 'OOP is based on objects'),
(6, 3, 6, 'C'),
(7, 4, 7, 'Encapsulation'),
(8, 4, 8, 'False'),
(9, 5, 9, 'Inheritance allows reusability'),
(10, 5, 10, 'B'),
(11, 6, 11, 'True'),
(12, 6, 12, 'A'),
(13, 7, 13, 'LINQ queries data'),
(14, 7, 14, 'C'),
(15, 8, 15, 'False'),
(16, 8, 16, 'B'),
(17, 9, 17, 'Encapsulation hides data'),
(18, 9, 18, 'A'),
(19, 10, 19, 'True'),
(20, 10, 20, 'C'),
(21, 11, 21, 'Multi-threading improves performance'),
(22, 11, 1, 'False'),
(23, 12, 2, 'A'),
(24, 12, 3, 'Databases store structured data'),
(25, 13, 4, 'True'),
(26, 13, 5, 'C'),
(27, 14, 6, 'Functions are reusable blocks'),
(28, 14, 7, 'False'),
(29, 15, 8, 'Pointers are used for memory access'),
(30, 15, 9, 'True'),
(31, 16, 10, 'B'),
(32, 16, 11, 'Exception handling improves reliability'),
(33, 17, 12, 'False'),
(34, 17, 13, 'A'),
(35, 18, 14, 'Interfaces provide abstraction'),
(36, 18, 15, 'True'),
(37, 19, 16, 'C'),
(38, 19, 17, 'False'),
(39, 20, 18, 'SQL is used for querying data'),
(40, 20, 19, 'A'),
(41, 21, 20, 'Encapsulation keeps data safe'),
(42, 21, 21, 'B'),
(43, 22, 1, 'True'),
(44, 22, 2, 'C'),
(45, 23, 3, 'Exception handling uses try-catch'),
(46, 23, 4, 'A'),
(47, 24, 5, 'False'),
(48, 24, 6, 'Database normalization removes redundancy'),
(49, 25, 7, 'B'),
(50, 25, 8, 'Pointers are risky but powerful');

go


INSERT INTO StudentCourse (CourseID, StudentID, StdCrsDegree)
VALUES
    -- Using actual CourseIDs (1-11) and valid StudentIDs
    (1, 1, 85),
    (2, 2, 78),
    (3, 3, 92),
    (4, 4, 70),
    (5, 5, 88),
    (6, 6, 60),
    (7, 7, 73),
    (8, 8, 91),
    (9, 9, 65),
    (10, 10, 80),
    (11, 11, 77),
    
    (1, 12, 83),
    (2, 13, 68),
    (3, 14, 90),
    (4, 15, 72),
    (5, 16, 96),
    (6, 17, 59),
    (7, 18, 81),
    (8, 19, 87),
    (9, 20, 66),
    (10, 21, 93),
    
    (11, 1, 75),
    (1, 2, 82),
    (2, 3, 89),
    (3, 4, 77),
    (4, 5, 84),
    (5, 6, 60),
    (6, 7, 91),
    (7, 8, 71),
    (8, 9, 80),
    (9, 10, 67),
    
    (10, 11, 94),
    (11, 12, 79),
    (1, 13, 88),
    (2, 14, 62),
    (3, 15, 95),
    (4, 16, 74),
    (5, 17, 81),
    (6, 18, 85),
    (7, 19, 70),
    (8, 20, 90),
    
    (9, 21, 63),
    (10, 1, 87),
    (11, 2, 76),
    (1, 3, 69),
    (2, 4, 93),
    (3, 5, 58),
    (4, 6, 86),
    (5, 7, 80),
    (6, 8, 78);


	go

	INSERT INTO StudentExam (ExamID, StdID, StdExamDegree, CourseID)
VALUES
    -- First set of records (ExamID 1-11, StudentID 1-11, CourseID 1-11)
    (1, 1, 85, 1),
    (2, 2, 40, 2),
    (3, 3, 30, 3),
    (4, 4, 75, 4),
    (5, 5, 60, 5),
    (6, 6, 45, 6),
    (7, 7, 55, 7),
    (8, 8, 68, 8),
    (9, 9, 70, 9),
    (10, 10, 50, 10),
    
    -- Second set (continuing the pattern)
    (11, 11, 80, 10),
    (12, 12, 73, 1),
    (13, 13, 90, 2),
    (14, 14, 65, 3),
    (15, 15, 77, 4),
    (16, 16, 56, 5),
    (17, 17, 61, 6),
    (18, 18, 83, 7),
    (19, 19, 70, 8),
    (20, 20, 88, 9),
    
    -- Third set (reusing some StudentIDs)
    (21, 21, 79, 10),
    (22, 1, 42, 19),
    (23, 2, 69, 1),
    (24, 3, 60, 2),
    (25, 4, 58, 3),
    (26, 5, 87, 4),
    (27, 6, 40, 5),
    (28, 7, 55, 6),
    (29, 8, 61, 7),
    (30, 9, 76, 8),
    
    -- Fourth set
    (31, 10, 64, 9),
    (32, 11, 90, 10),
    (33, 12, 50, 8),
    (1, 13, 81, 1),
    (2, 14, 72, 2),
    (3, 15, 68, 3),
    (4, 16, 79, 4),
    (5, 17, 91, 5),
    (6, 18, 86, 6),
    (7, 19, 59, 7),
    
    -- Final set
    (8, 20, 70, 8),
    (9, 21, 66, 9),
    (10, 1, 88, 10),
    (11, 2, 73, 6),
    (12, 3, 54, 1),
    (13, 4, 68, 2),
    (14, 5, 76, 3),
    (15, 6, 90, 4),
    (16, 7, 64, 5),
    (17, 8, 70, 6),
    (18, 9, 85, 7);

	go

	UPDATE SE
SET SE.StdExamDegree = 
    CASE 
        WHEN SE.StdExamDegree > E.TotalDegree 
            THEN FLOOR((CAST(SE.StdExamDegree AS FLOAT) / 100) * E.TotalDegree)
        ELSE SE.StdExamDegree
    END
FROM StudentExam SE
JOIN Exam E ON SE.ExamID = E.ID;





