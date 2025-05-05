----------------------------Number of Exams in each Course-----------

CREATE VIEW CourseDetails_v
AS
SELECT 
    c.ID,
    c.Name,
    c.MaxDegree,
    COUNT(e.ID) AS NumberOfExams
FROM Course c
LEFT JOIN Exam e ON c.ID = e.ID
GROUP BY c.ID, c.Name, c.MaxDegree;

----------------------------check
SELECT * FROM CourseDetails_v