DROP TABLE [dbo].[StudentAnswer];
DROP TABLE [dbo].[QuestionPick];
DROP TABLE [dbo].[StudentExam];
DROP TABLE [dbo].[StudentCourse];
DROP TABLE [dbo].[InstructorCourse];
DROP TABLE [dbo].[TrackCourse];
DROP TABLE [dbo].[IntakeTrack];
DROP TABLE [dbo].[ExamType];
DROP TABLE [dbo].[QuestionType];

DROP TABLE [dbo].[Exam];

DROP TABLE [dbo].[Intake];

DROP TABLE [dbo].[Branch];
DROP TABLE [dbo].[Department];
DROP TABLE [Person].[TrainingManager];
DROP TABLE [Person].[UserTable];


DROP TABLE [Person].[Student];
DROP TABLE [Person].[Instructor];
DROP TABLE [dbo].[Course];
DROP TABLE [dbo].[Track];
DROP TABLE [dbo].[QuestionPool];





-- Disable all constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

-- Drop all tables
EXEC sp_MSforeachtable 'DROP TABLE ?';

-- Re-enable constraints would go here, but not needed since we're dropping everything