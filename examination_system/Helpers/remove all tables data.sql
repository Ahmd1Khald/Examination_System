-- Disable all constraints temporarily
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

-- Use DELETE instead of TRUNCATE
DELETE FROM [dbo].[StudentAnswer]
DELETE FROM [dbo].[QuestionPick]
DELETE FROM [dbo].[StudentExam]
DELETE FROM [dbo].[StudentCourse]
DELETE FROM [dbo].[InstructorCourse]
DELETE FROM [dbo].[TrackCourse]
DELETE FROM [dbo].[IntakeTrack]
DELETE FROM [dbo].[ExamType]
DELETE FROM [dbo].[QuestionType]

DELETE FROM [dbo].[Exam]
DELETE FROM [dbo].[QuestionPool]
DELETE FROM [dbo].[Intake]
DELETE FROM [dbo].[Track]
DELETE FROM [dbo].[Course]
DELETE FROM [dbo].[Branch]
DELETE FROM [dbo].[Department]

DELETE FROM [Person].[Student]
DELETE FROM [Person].[Instructor]
DELETE FROM [Person].[TrainingManager]
DELETE FROM [Person].[UserTable]

-- Reset identity counters
DBCC CHECKIDENT ('[dbo].[Branch]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[Course]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[Department]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[Exam]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[Intake]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[QuestionPool]', RESEED, 0)
DBCC CHECKIDENT ('[dbo].[Track]', RESEED, 0)
DBCC CHECKIDENT ('[Person].[Instructor]', RESEED, 0)
DBCC CHECKIDENT ('[Person].[Student]', RESEED, 0)
DBCC CHECKIDENT ('[Person].[UserTable]', RESEED, 0)

-- Re-enable all constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL'