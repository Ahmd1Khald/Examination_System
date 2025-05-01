CREATE SCHEMA Person;

ALTER SCHEMA Person TRANSFER [dbo].[Instructor];
ALTER SCHEMA Person TRANSFER [dbo].[Student];
ALTER SCHEMA Person TRANSFER [dbo].[TrainingManager];
ALTER SCHEMA Person TRANSFER [dbo].[UserTable];
