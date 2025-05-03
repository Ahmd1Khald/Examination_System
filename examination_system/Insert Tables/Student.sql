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


-- First verify your existing data
SELECT ID as 'UserTable Student ID' FROM [Person].[UserTable] WHERE Person.UserTable.[Role] = 'Student';
SELECT ID as 'Intake ID'  FROM [dbo].[Intake];
SELECT ID as 'Branch ID' FROM [dbo].[Branch]; 
SELECT ID as 'TrainingManager ID' FROM [Person].[TrainingManager];