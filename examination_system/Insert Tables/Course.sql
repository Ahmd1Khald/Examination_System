

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



UPDATE Course
SET InstructorID = CASE ID
    WHEN 1 THEN 1 -- Mohamed Ali for 'Introduction to Programming'
    WHEN 2 THEN 2 -- Dina Elmasry for 'Web Development with ASP.NET'
    WHEN 3 THEN 3 -- Youssef Mostafa for 'SQL Database Design'
    WHEN 4 THEN 4 -- Layla Adel for 'Mobile App Development'
    WHEN 5 THEN 5 -- Walid Tarek for 'Data Structures and Algorithms'
    WHEN 6 THEN 6 -- Noha Sami for 'Cybersecurity Fundamentals'
    WHEN 7 THEN 1 -- Mohamed Ali for 'AI and Machine Learning' (reused)
    WHEN 8 THEN 2 -- Dina Elmasry for 'Frontend Web Development' (reused)
    WHEN 9 THEN 3 -- Youssef Mostafa for 'DevOps and Cloud Computing' (reused)
    WHEN 10 THEN 4 -- Layla Adel for 'Software Engineering' (reused)
    WHEN 11 THEN 5 -- Walid Tarek for 'Network Administration' (reused)
END;