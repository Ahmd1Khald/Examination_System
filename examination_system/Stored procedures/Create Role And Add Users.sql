
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'TrainingManager')
BEGIN
    CREATE ROLE TrainingManager;
END;


GRANT EXECUTE ON usp_AddCourse TO TrainingManager;
GRANT EXECUTE ON usp_DeleteCourse TO TrainingManager;


GRANT EXECUTE ON AddTrack_Prc TO TrainingManager;
GRANT EXECUTE ON usp_DeleteTrack TO TrainingManager;

