CREATE DATABASE ExaminationSystemDB 
ON 
PRIMARY (
    NAME = ExaminationSystemDB_Primary,
    FILENAME = 'D:\ITI\SQL Project\DB\ExaminationSystemDB.mdf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
),
FILEGROUP ExaminationSystemDB_FG1 (
    NAME = ExamSystem_Data1,
    FILENAME = 'D:\ITI\SQL Project\DB\ExamSystem_Data1.ndf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
),
FILEGROUP ExaminationSystemDB_FG2 (
    NAME = ExamSystem_Data2,
    FILENAME = 'D:\ITI\SQL Project\DB\ExamSystem_Data2.ndf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
),
FILEGROUP ExaminationSystemDB_FG3 (
    NAME = ExamSystem_Data3,
    FILENAME = 'D:\ITI\SQL Project\DB\ExamSystem_Data3.ndf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
),
FILEGROUP ExaminationSystemDB_FG4 (
    NAME = ExamSystem_Data4,
    FILENAME = 'D:\ITI\SQL Project\DB\ExamSystem_Data4.ndf',
    SIZE = 50MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
LOG ON (
    NAME = ExaminationSystemDB_Log,
    FILENAME = 'D:\ITI\SQL Project\DB\ExaminationSystemDB_Log.ldf',
    SIZE = 20MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
);

