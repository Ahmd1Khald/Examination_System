CREATE DATABASE ExaminationSystemDB 
ON 
PRIMARY (
    NAME = ExaminationSystemDB_Primary,
    FILENAME = 'D:\ITI\SQL Project\Examination System For ITI\examination_system\DB\ExaminationSystemDB.mdf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = ExaminationSystemDB_Log,
    FILENAME = 'D:\ITI\SQL Project\Examination System For ITI\examination_system\DB\ExaminationSystemDB_Log.ldf',
    SIZE = 20MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
);

