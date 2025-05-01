

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


INSERT INTO Exam ([Year], Start_Time, End_Time, TotalDegree, CourseID)
VALUES
(2024, '09:00', '11:00', 100, 11),	
(2024, '12:00', '14:00', 100, 12),	
(2024, '10:00', '12:00', 100, 13),	
(2024, '13:00', '15:00', 100, 14),	
(2024, '09:00', '11:00', 100, 15),	
(2024, '10:30', '12:30', 100, 16),	
(2024, '14:00', '16:00', 100, 17),	
(2024, '08:00', '10:00', 100, 18),	
(2024, '11:00', '13:00', 100, 19),	
(2024, '13:30', '15:30', 100, 20),	
(2024, '09:30', '11:30', 100, 21),
(2023, '09:00', '11:00', 100, 11),
(2023, '12:00', '14:00', 100, 12),
(2023, '10:00', '12:00', 100, 13),
(2023, '13:00', '15:00', 100, 14),
(2023, '09:00', '11:00', 100, 15),
(2023, '10:30', '12:30', 100, 16),
(2023, '14:00', '16:00', 100, 17),
(2023, '08:00', '10:00', 100, 18),
(2023, '11:00', '13:00', 100, 19),
(2023, '13:30', '15:30', 100, 20),
(2023, '09:30', '11:30', 100, 21),
(2022, '09:00', '11:00', 100, 11),
(2022, '12:00', '14:00', 100, 12),
(2022, '10:00', '12:00', 100, 13),
(2022, '13:00', '15:00', 100, 14),
(2022, '09:00', '11:00', 100, 15),
(2022, '10:30', '12:30', 100, 16),
(2022, '14:00', '16:00', 100, 17),
(2022, '08:00', '10:00', 100, 18),
(2022, '11:00', '13:00', 100, 19),
(2022, '13:30', '15:30', 100, 20),
(2022, '09:30', '11:30', 100, 21);

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

INSERT INTO QuestionPick (QuestionID, ExamID, InstID, Degree)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 3),
(3, 2, 3, 4),
(4, 2, 4, 2),
(5, 3, 5, 5),
(6, 3, 6, 2),
(7, 4, 1, 4),
(8, 4, 2, 3),
(9, 5, 3, 3),
(10, 5, 4, 2),

(11, 6, 5, 4),
(12, 6, 6, 3),
(13, 7, 1, 5),
(14, 7, 2, 2),
(15, 8, 3, 1),
(16, 8, 4, 3),
(17, 9, 5, 4),
(18, 9, 6, 2),
(19, 10, 1, 3),
(20, 10, 2, 1),

(21, 11, 3, 2),
(22, 11, 4, 4),
(23, 12, 5, 3),
(24, 12, 6, 2),
(25, 13, 1, 5),
(26, 13, 2, 2),
(27, 14, 3, 3),
(28, 14, 4, 4),
(29, 15, 5, 3),
(30, 15, 6, 2),

(31, 16, 1, 4),
(32, 16, 2, 1),
(33, 17, 3, 3),
(34, 17, 4, 2),
(35, 18, 5, 2),
(36, 18, 6, 1),
(37, 19, 1, 3),
(38, 19, 2, 2),
(39, 20, 3, 2),
(40, 20, 4, 1),

(41, 21, 5, 4),
(42, 22, 6, 3),
(43, 23, 1, 2),
(44, 24, 2, 3),
(45, 25, 3, 2),
(46, 26, 4, 3),
(47, 27, 5, 1),
(48, 28, 6, 4),
(49, 29, 1, 2),
(50, 30, 2, 3);
go

