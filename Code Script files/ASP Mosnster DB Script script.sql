/****** Object:  Database [db18494]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE DATABASE [db18494]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db18494', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db18494.mdf' , SIZE = 73728KB , MAXSIZE = 1048576KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db18494_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db18494_log.ldf' , SIZE = 8192KB , MAXSIZE = 5242880KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db18494] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db18494].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db18494] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db18494] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db18494] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db18494] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db18494] SET ARITHABORT OFF 
GO
ALTER DATABASE [db18494] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db18494] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db18494] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db18494] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db18494] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db18494] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db18494] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db18494] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db18494] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db18494] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db18494] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db18494] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db18494] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db18494] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db18494] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db18494] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db18494] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db18494] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db18494] SET  MULTI_USER 
GO
ALTER DATABASE [db18494] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db18494] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db18494] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db18494] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db18494] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db18494] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db18494', N'ON'
GO
ALTER DATABASE [db18494] SET QUERY_STORE = ON
GO
ALTER DATABASE [db18494] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  User [db18494_TrainingManager]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE USER [db18494_TrainingManager] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [db18494_Student]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE USER [db18494_Student] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [db18494_Instructor]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE USER [db18494_Instructor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [db18494_TrainingManager]
GO
ALTER ROLE [db_datareader] ADD MEMBER [db18494_TrainingManager]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [db18494_TrainingManager]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [db18494_Student]
GO
ALTER ROLE [db_datareader] ADD MEMBER [db18494_Student]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [db18494_Student]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [db18494_Instructor]
GO
ALTER ROLE [db_datareader] ADD MEMBER [db18494_Instructor]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [db18494_Instructor]
GO
/****** Object:  Schema [Person]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  FullTextCatalog [db18494]    Script Date: 5/3/2025 9:54:37 PM ******/
CREATE FULLTEXT CATALOG [db18494] AS DEFAULT
GO
/****** Object:  UserDefinedFunction [dbo].[CalcMaxGradeCourse_Fun]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------calc Fun avarage degrees-------------

CREATE   FUNCTION [dbo].[CalcMaxGradeCourse_Fun]
    (
    @StudentID INT,
    @CourseID INT
    )
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @MaxGrade DECIMAL(5,2);

   
    SELECT @MaxGrade = MAX(se.StdExamDegree)
    FROM StudentExam se
    JOIN Exam e ON se.Examid = e.ID
    WHERE 
        se.StdID = @StudentID 
        AND e.CourseID = @CourseID;

    RETURN @MaxGrade;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[Calculate_Student_Degree]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[Calculate_Student_Degree]
(
   @StudentID int,
   @ExamID int
)
returns int
as
begin
     declare @ToTalDegree int = 0
     select  @ToTalDegree = SUM(
           case
		        when SA.Answer = QP.correctAnswer then QPICK.Degree
				else  0
           end
      )
	
     from 
     StudentAnswer SA
     inner join QuestionPool QP on SA.QuestionID =QP.ID
     inner join QuestionPick QPICK on SA.QuestionID =QPICK.QuestionID
	 
     where SA.StdID = @StudentID and QPICK.ExamID = @ExamID
     return isnull (@ToTalDegree,0)
end
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateAverageGrade_Fun]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[CalculateAverageGrade_Fun]  
    (@StudentID INT)  
RETURNS DECIMAL(5,2)  
AS  
BEGIN  
    DECLARE @AvgGrade DECIMAL(5,2);  
    SELECT @AvgGrade = AVG(StdExamDegree)  
    FROM StudentExam  
    WHERE ExamID = @StudentID;  
    RETURN @AvgGrade;  
END;  
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateMaxGrade_Fun]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[CalculateMaxGrade_Fun]  
    (@ExamID INT)  
RETURNS INT 
AS  
BEGIN  
    DECLARE @MaxGrade INT;  
    SELECT @MaxGrade = Max(StdExamDegree)  
    FROM StudentExam  
    --WHERE ExamID = @ExamID;  
    RETURN @MAXGrade;  
END;  
GO
/****** Object:  UserDefinedFunction [dbo].[getCourseID]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getCourseID](@CourseName nvarchar(30))
returns int
as
	begin
		declare @CourseID int
		select @CourseID = ID
		from Course
		where Name = @CourseName;

		return @CourseID;
	end
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalDegree]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[GetTotalDegree]
(
    @StdID INT,
    @ExamID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TotalDegree INT;

    SELECT @TotalDegree = ISNULL(SUM(QP.Degree), 0)
    FROM QuestionPick QP
    INNER JOIN QuestionPool QPool ON QP.QuestionID = QPool.ID
    INNER JOIN StudentAnswer SA 
        ON SA.QuestionID = QP.QuestionID AND SA.ExamID = QP.ExamID
    WHERE SA.StdID = @StdID
      AND QP.ExamID = @ExamID
      AND QPool.correctAnswer = SA.Answer;

    RETURN @TotalDegree;
END;
GO
/****** Object:  Table [Person].[UserTable]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[UserTable](
	[ID] [int] IDENTITY(100,10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [pk_UserTable_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[TMID] [int] NOT NULL,
 CONSTRAINT [pk_Branch_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[TMID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Person].[Student]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NULL,
	[LName] [nvarchar](20) NULL,
	[UserID] [int] NOT NULL,
	[IntakeID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[TMID] [int] NOT NULL,
 CONSTRAINT [pk_Student_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_studentinfo]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- view for student 

create view [dbo].[vw_studentinfo] as
select 
    u.name as studentfullname,
    b.name as branch,
    i.number as intake
from 
    person.student s
    inner join person.usertable u on s.userid = u.id
    inner join dbo.branch b on s.branchid = b.id
    inner join dbo.intake i on s.intakeid = i.id
where 
    u.role = N'student';
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[StdCrsDegree] [int] NULL,
 CONSTRAINT [PK_StudentCourseTable] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[MaxDegree] [int] NOT NULL,
	[MinDegree] [int] NOT NULL,
 CONSTRAINT [PK_Course_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Course_Details]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Student_Course_Details] 
as
select s.FName + ' ' +s.LName as 'Full Name',
C.Name as 'course Name',
SCrs.StdCrsDegree as 'Student_Course_Degree'
from 
Person.Student S
inner join StudentCourse SCrs on S.ID =SCrs.StudentID
inner join Course C on SCrs.CourseID = C.ID
GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[ExamID] [int] NOT NULL,
	[StdID] [int] NOT NULL,
	[StdExamDegree] [int] NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_StudentExam_ExamID] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Start_Time] [time](0) NOT NULL,
	[End_Time] [time](0) NOT NULL,
	[TotalDegree] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Exam_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Person].[vw_StudentExamDegrees]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [Person].[vw_StudentExamDegrees] 
AS
SELECT 
    S.FName + ' ' + S.LName AS [Student Full Name], 
    SE.StdExamDegree AS [Exam Degree],
    C.Name
FROM Person.Student S
JOIN StudentExam SE ON SE.StdID = S.ID
JOIN StudentCourse SC ON SC.StudentID = S.ID 
JOIN Exam on Exam.CourseID = SC.CourseID
JOIN Course C ON C.ID = SC.CourseID
GO
/****** Object:  Table [dbo].[QuestionPool]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPool](
	[ID] [int] NOT NULL,
	[correctAnswer] [nvarchar](max) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionPick]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPick](
	[QuestionID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[InstID] [int] NOT NULL,
	[Degree] [int] NOT NULL,
 CONSTRAINT [PK_QuestionPick] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[ExamID] ASC,
	[InstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetExamQSForStd_FN]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetExamQSForStd_FN](@StdID int)
returns table
as
return
(
		select Q.Question
		from QuestionPool Q inner join QuestionPick QP
		on Q.ID = QP.QuestionID
		inner join Exam E
		on E.ID = QP.ExamID
		inner join StudentExam SE
		on E.ID = SE.ExamID
		where SE.StdID = @StdID
)
GO
/****** Object:  View [dbo].[CourseDetails_vw]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseDetails_vw]
AS
SELECT 
    c.ID,
    c.Name,
    c.MaxDegree,
    COUNT(e.ID) AS NumberOfExams
FROM Course c
LEFT JOIN Exam e ON c.ID = e.ID
GROUP BY c.ID, c.Name, c.MaxDegree;
GO
/****** Object:  View [dbo].[CourseDetails_v]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseDetails_v]
AS
SELECT 
    c.ID,
    c.Name,
    c.MaxDegree,
    COUNT(e.ID) AS NumberOfExams
FROM Course c
LEFT JOIN Exam e ON c.ID = e.ID
GROUP BY c.ID, c.Name, c.MaxDegree;
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Student_Degrees_By_Course]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Get_Student_Degrees_By_Course]
(
    @CourseID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        S.ID AS StudentID,
        P.FName+' '+P.LName AS StudentName,
        E.ID AS ExamID,
        dbo.Calculate_Student_Degree(S.ID, E.ID) AS Degree
    FROM 
        [Person].[Student] S
    JOIN 
        dbo.StudentExam SE ON S.ID = SE.StdID
    JOIN 
        dbo.Exam E ON SE.ExamID = E.ID
    JOIN 
        dbo.Course C ON E.CourseID = C.ID
    JOIN 
        [Person].Student P ON S.ID = P.ID
    WHERE 
        C.ID = @CourseID
);
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[QuestionID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[StdID] [int] NOT NULL,
	[Answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentAnswer] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[ExamID] ASC,
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentAnswerDetails]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAnswerDetails] AS
SELECT 
    SA.StdID AS StudentID,
    P.FName + ' ' + P.LName AS StudentName,
    SA.ExamID,
    SA.QuestionID,
    QP.Question,
    SA.Answer AS StudentAnswer,
    QP.CorrectAnswer,
    QPICK.Degree,
    CASE 
        WHEN SA.Answer = QP.CorrectAnswer THEN QPICK.Degree
        ELSE 0
    END AS EarnedDegree
FROM 
    dbo.StudentAnswer SA
JOIN 
    dbo.QuestionPool QP ON SA.QuestionID = QP.ID
JOIN 
    dbo.QuestionPick QPICK ON SA.QuestionID = QPICK.QuestionID AND SA.ExamID = QPICK.ExamID
JOIN 
    [Person].Student P ON SA.StdID = P.ID;
GO
/****** Object:  View [dbo].[StudentTotalDegrees]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentTotalDegrees] AS
SELECT 
    S.ID AS StudentID,
    P.FName + ' ' + P.LName AS StudentName,
    E.ID AS ExamID,
    C.Name AS CourseName,
    dbo.Calculate_Student_Degree(S.ID, E.ID) AS TotalDegree
FROM 
    [Person].Student S
JOIN 
    [Person].Student P ON S.ID = P.ID
JOIN 
    dbo.StudentExam SE ON S.ID = SE.StdID
JOIN 
    dbo.Exam E ON SE.ExamID = E.ID
JOIN 
    dbo.Course C ON E.CourseID = C.ID;
GO
/****** Object:  View [dbo].[Top10StudentsPerCourse]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Top10StudentsPerCourse] AS
WITH StudentCourseTotals AS (
    SELECT 
        S.ID AS StudentID,
        P.FName + ' ' + P.LName AS StudentName,
        C.ID AS CourseID,
        C.Name AS CourseName,
        SUM(dbo.Calculate_Student_Degree(S.ID, E.ID)) AS TotalDegree
    FROM 
        [Person].Student S
    JOIN 
        [Person].Student P ON S.ID = P.ID
    JOIN 
        dbo.StudentExam SE ON S.ID = SE.StdID
    JOIN 
        dbo.Exam E ON SE.ExamID = E.ID
    JOIN 
        dbo.Course C ON E.CourseID = C.ID
    GROUP BY 
        S.ID, P.FName, P.LName, C.ID, C.Name
),
RankedStudents AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY CourseID ORDER BY TotalDegree DESC) AS RankInCourse
    FROM 
        StudentCourseTotals
)
SELECT 
    StudentID,
    StudentName,
    CourseID,
    CourseName,
    TotalDegree,
    RankInCourse
FROM 
    RankedStudents
WHERE 
    RankInCourse <= 10;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(10,10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_Department_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamType]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamType](
	[ExamID] [int] NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ExamType] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourse]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourse](
	[InstructorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [pk_InstructorCourse] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntakeTrack]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntakeTrack](
	[IntakeID] [int] NOT NULL,
	[TrackID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IntakeID] ASC,
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[QuestionID] [int] NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[ID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DeptID] [int] NOT NULL,
	[TMID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrackCourse]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackCourse](
	[TrackID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [pk_TrackCourse] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Person].[Instructor]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [pk_InstructorID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Person].[TrainingManager]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[TrainingManager](
	[ID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (1, N'main branch', N'nasr city, cairo', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (2, N'alex branch', N'smouha, alexandria', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (3, N'giza branch', N'dokki, giza', 3)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (4, N'maadi branch', N'maadi, cairo', 4)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (5, N'mansoura br', N'el gomhoria st', 5)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (6, N'tanta branch', N'el geish st', 6)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (7, N'zagazig br', N'el kornish st', 7)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (8, N'assiut br', N'nasser road', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (9, N'fayoum br', N'el masaken', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (10, N'sohag br', N'el shaheed st', 3)
GO
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (11, N'Introduction to Programming', N'Beginner-level course using Python to learn the fundamentals of programming.', 100, 50)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (12, N'Web Development with ASP.NET', N'Learn how to build modern web applications using ASP.NET Core.', 100, 60)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (13, N'SQL Database Design', N'Comprehensive guide to designing and managing databases using SQL Server.', 100, 55)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (14, N'Mobile App Development', N'Create mobile apps using Flutter and Dart with real-world practice.', 100, 50)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (15, N'Data Structures and Algorithms', N'Essential course on data structures and problem-solving techniques.', 100, 65)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (16, N'Cybersecurity Fundamentals', N'Understand the basics of cybersecurity and how to protect systems.', 100, 70)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (17, N'AI and Machine Learning', N'Introductory course to AI and ML concepts using Python and real data.', 100, 60)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (18, N'Frontend Web Development', N'Learn HTML, CSS, and JavaScript to build interactive web interfaces.', 100, 50)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (19, N'DevOps and Cloud Computing', N'Learn the principles of DevOps and how to deploy applications using cloud services like Azure and AWS.', 100, 60)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (20, N'Software Engineering', N'Study the software development life cycle, requirements analysis, and design patterns.', 100, 65)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree]) VALUES (21, N'Network Administration', N'Understand computer networks and how to manage servers, systems, and IT infrastructure.', 100, 55)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (10, N'software dev')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (20, N'network admin')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (30, N'tech support')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (40, N'db admin')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (50, N'cybersecurity')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (60, N'devops')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (70, N'cloud compute')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (80, N'ui ux design')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (90, N'data analysis')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (100, N'it helpdesk')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (1, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 11, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (2, 2024, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 20, 12, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (3, 2024, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 20, 13, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (4, 2024, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 20, 14, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (5, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 15, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (6, 2024, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 20, 16, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (7, 2024, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 20, 17, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (8, 2024, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 20, 18, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (9, 2024, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 20, 19, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (10, 2024, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 20, 20, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (11, 2024, CAST(N'18:56:00' AS Time), CAST(N'22:00:00' AS Time), 20, 21, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (12, 2023, CAST(N'14:37:00' AS Time), CAST(N'22:00:00' AS Time), 10, 11, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (13, 2023, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 10, 12, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (14, 2023, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 10, 13, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (15, 2023, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 10, 14, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (16, 2023, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 10, 15, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (17, 2023, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 10, 16, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (18, 2023, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 10, 17, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (19, 2023, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 10, 18, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (20, 2023, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 10, 19, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (21, 2023, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 10, 20, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (22, 2023, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 10, 21, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (23, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 11, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (24, 2022, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 30, 12, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (25, 2022, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 30, 13, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (26, 2022, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 30, 14, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (27, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 15, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (28, 2022, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 30, 16, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (29, 2022, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 30, 17, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (30, 2022, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 30, 18, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (31, 2022, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 30, 19, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (32, 2022, CAST(N'13:56:00' AS Time), CAST(N'22:00:00' AS Time), 30, 20, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (33, 2022, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 30, 21, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (35, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 12, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (36, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 12, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (37, 2026, CAST(N'11:16:00' AS Time), CAST(N'14:15:00' AS Time), 80, 12, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (38, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 12, CAST(N'2025-05-02' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (1, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (2, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (3, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (3, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (4, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (5, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (6, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (6, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (7, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (8, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (9, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (9, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (10, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (11, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (12, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (12, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (13, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (14, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (15, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (15, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (16, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (17, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (18, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (18, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (19, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (20, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (21, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (21, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (22, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (23, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (24, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (24, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (25, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (26, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (27, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (27, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (28, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (29, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (30, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (30, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (31, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (32, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (33, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (33, N'Exam')
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (1, 11)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (1, 12)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (1, 18)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (1, 20)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (2, 11)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (2, 13)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (2, 19)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (2, 20)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (3, 15)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (3, 17)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (3, 20)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (4, 13)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (4, 16)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (4, 21)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (5, 11)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (5, 15)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (5, 17)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (6, 12)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (6, 14)
GO
INSERT [dbo].[InstructorCourse] ([InstructorID], [CourseID]) VALUES (6, 18)
GO
SET IDENTITY_INSERT [dbo].[Intake] ON 
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (1, 43, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (2, 44, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (3, 45, 3)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (4, 46, 4)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (5, 47, 5)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (6, 48, 6)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (7, 49, 7)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (8, 50, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (9, 51, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (10, 52, 3)
GO
SET IDENTITY_INSERT [dbo].[Intake] OFF
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (1, 100)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (1, 101)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (2, 100)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (2, 102)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (3, 103)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (4, 104)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (5, 100)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (6, 102)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (7, 101)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (8, 104)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (9, 103)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (10, 100)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (10, 101)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (10, 102)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (1, 1, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (2, 1, 1, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (2, 1, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (3, 1, 1, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (3, 1, 2, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (3, 2, 3, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (4, 1, 1, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (4, 1, 3, 9)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (4, 2, 4, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (5, 1, 1, 9)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (5, 3, 5, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (6, 1, 1, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (6, 3, 6, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (7, 4, 1, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (8, 4, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (9, 5, 3, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (10, 5, 4, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (11, 6, 5, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (12, 6, 6, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (13, 7, 1, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (14, 7, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (15, 8, 3, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (16, 8, 4, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (17, 9, 5, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (18, 9, 6, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (19, 10, 1, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (20, 10, 2, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (21, 11, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (22, 11, 4, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (23, 12, 5, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (24, 12, 6, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (25, 13, 1, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (26, 13, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (27, 14, 3, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (28, 14, 4, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (29, 15, 5, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (30, 15, 6, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (31, 16, 1, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (32, 16, 2, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (33, 17, 3, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (34, 17, 4, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (35, 18, 5, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (36, 18, 6, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (37, 19, 1, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (38, 19, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (39, 20, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (40, 20, 4, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (41, 21, 5, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (42, 22, 6, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (43, 23, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (44, 24, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (45, 25, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (46, 26, 4, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (47, 27, 5, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (48, 28, 6, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (49, 29, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (50, 30, 2, 3)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (1, N'B', N'Which of the following is a valid Python data type?\nA. folder\nB. list\nC. script\nD. node')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (2, N'True', N'Python is a dynamically typed language. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (3, N'False', N'Python uses curly braces to define code blocks. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (4, N'Indentation', N'What is used to define blocks of code in Python?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (5, N'C', N'Which operator is used for exponentiation in Python?\nA. ^\nB. exp\nC. **\nD. power')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (6, N'True', N'ASP.NET supports both MVC and Web API. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (7, N'A', N'Which of these is a valid HTTP method?\nA. POST\nB. PUSH\nC. FETCH\nD. LOAD')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (8, N'C#', N'What language is commonly used with ASP.NET Core?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (9, N'Model-View-Controller', N'What does MVC stand for?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (10, N'False', N'ASP.NET cannot be used for RESTful services. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (11, N'True', N'What does SQL stand for?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (12, N'A', N'Which SQL statement is used to remove a table?\nA. DROP\nB. REMOVE\nC. DELETE\nD. CLEAR')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (13, N'B', N'Which keyword is used to return only unique values?\nA. UNIQUE\nB. DISTINCT\nC. SELECT\nD. FILTER')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (14, N'JOIN', N'What keyword is used to combine rows from two or more tables?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (15, N'False', N'You must use WHERE in every SQL SELECT query. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (16, N'A', N'Which language is commonly used with Flutter?\nA. Dart\nB. Kotlin\nC. Swift\nD. C#')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (17, N'True', N'React Native allows development for both iOS and Android. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (18, N'Android Studio', N'Which IDE is typically used for Android development?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (19, N'B', N'Which OS is Swift used for?\nA. Android\nB. iOS\nC. Windows\nD. Linux')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (20, N'False', N'Mobile apps cannot access device hardware. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (21, N'C', N'Which data structure uses LIFO?\nA. Queue\nB. Tree\nC. Stack\nD. Graph')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (22, N'True', N'A queue is FIFO (First In, First Out). (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (23, N'Binary Search', N'Which algorithm is best for searching in a sorted array?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (24, N'False', N'A linked list allows random access. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (25, N'D', N'Which is NOT a type of tree?\nA. AVL\nB. Binary\nC. B-Tree\nD. Circle')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (26, N'True', N'Firewalls prevent unauthorized access to networks. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (27, N'B', N'What does HTTPS stand for?\nA. Hypertext Transfer Push Security\nB. Hypertext Transfer Protocol Secure\nC. HTTP Secureline\nD. Host Transfer Secure')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (28, N'Encryption', N'What is the process of converting data into a secret code called?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (29, N'False', N'Passwords should be stored in plain text. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (30, N'A', N'Which of the following is a common cyber attack?\nA. Phishing\nB. Fishing\nC. Surfing\nD. Tracking')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (31, N'C', N'Which of these is a Python library for ML?\nA. React\nB. Flask\nC. Scikit-learn\nD. Redux')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (32, N'True', N'Supervised learning requires labeled data. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (33, N'Classification', N'What is the process of categorizing data into classes called?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (34, N'False', N'AI and ML are exactly the same thing. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (35, N'Overfitting', N'What do we call a model that performs well on training data but poorly on unseen data?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (36, N'B', N'Which language is used to style HTML?\nA. HTML\nB. CSS\nC. PHP\nD. JS')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (37, N'True', N'HTML is used for structuring web pages. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (38, N'DOM', N'What does the browser create from HTML that JavaScript can interact with?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (39, N'A', N'Which tag is used to link a CSS file?\nA. <link>\nB. <style>\nC. <script>\nD. <css>')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (40, N'False', N'You cannot use JavaScript in HTML. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (41, N'True', N'CI/CD pipelines are part of DevOps. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (42, N'Docker', N'Which tool is used to containerize applications?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (43, N'C', N'Which is a cloud provider?\nA. Oracle\nB. Cisco\nC. AWS\nD. MySQL')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (44, N'Infrastructure as Code', N'What does IaC stand for?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (45, N'False', N'DevOps is only about writing code. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (46, N'D', N'Which software model handles risk best?\nA. Agile\nB. Waterfall\nC. Incremental\nD. Spiral')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (47, N'Requirement Gathering', N'What is the first phase in the software life cycle?')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (48, N'True', N'TCP ensures reliable data transmission. (True/False)')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (49, N'C', N'What does IP stand for?\nA. Internal Process\nB. Internet Packet\nC. Internet Protocol\nD. Inter-Process')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question]) VALUES (50, N'OSI Model', N'What model divides network communication into 7 layers?')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (1, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (2, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (3, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (4, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (5, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (6, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (7, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (8, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (9, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (10, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (11, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (12, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (13, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (14, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (15, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (16, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (17, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (18, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (19, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (20, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (21, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (22, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (23, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (24, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (25, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (26, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (27, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (28, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (29, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (30, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (31, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (32, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (33, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (34, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (35, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (36, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (37, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (38, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (39, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (40, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (41, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (42, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (43, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (44, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (45, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (46, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (47, N'Text')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (48, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (49, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (50, N'Text')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (1, 1, 48, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (2, 1, 48, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (2, 1, 49, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (3, 1, 48, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (3, 2, 50, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (4, 1, 48, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (4, 2, 51, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (5, 1, 48, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (5, 3, 52, N'OOP is based on objects')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (6, 3, 53, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (7, 4, 54, N'Encapsulation')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (8, 4, 55, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (9, 5, 56, N'Inheritance allows reusability')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (10, 5, 57, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (11, 6, 58, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (12, 6, 59, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (13, 7, 60, N'LINQ queries data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (14, 7, 61, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (15, 8, 62, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (16, 8, 63, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (17, 9, 64, N'Encapsulation hides data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (18, 9, 65, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (19, 10, 66, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (20, 10, 67, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (21, 11, 68, N'Multi-threading improves performance')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (22, 11, 48, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (23, 12, 49, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (24, 12, 50, N'Databases store structured data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (25, 13, 51, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (26, 13, 52, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (27, 14, 53, N'Functions are reusable blocks')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (28, 14, 54, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (29, 15, 55, N'Pointers are used for memory access')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (30, 15, 56, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (31, 16, 57, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (32, 16, 58, N'Exception handling improves reliability')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (33, 17, 59, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (34, 17, 60, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (35, 18, 61, N'Interfaces provide abstraction')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (36, 18, 62, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (37, 19, 63, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (38, 19, 64, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (39, 20, 65, N'SQL is used for querying data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (40, 20, 66, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (41, 21, 67, N'Encapsulation keeps data safe')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (42, 21, 68, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (43, 22, 48, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (44, 22, 49, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (45, 23, 50, N'Exception handling uses try-catch')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (46, 23, 51, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (47, 24, 52, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (48, 24, 53, N'Database normalization removes redundancy')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (49, 25, 54, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (50, 25, 55, N'Pointers are risky but powerful')
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 48, 85)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 49, 82)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 50, 69)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 59, 83)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 60, 88)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (12, 49, 78)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (12, 50, 89)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (12, 51, 93)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (12, 60, 68)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (12, 61, 62)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (13, 50, 92)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (13, 51, 77)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (13, 52, 58)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (13, 61, 90)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (13, 62, 95)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (14, 51, 70)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (14, 52, 84)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (14, 53, 86)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (14, 62, 72)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (14, 63, 74)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (15, 52, 88)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (15, 53, 60)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (15, 54, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (15, 63, 96)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (15, 64, 81)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (16, 53, 60)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (16, 54, 91)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (16, 55, 78)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (16, 64, 59)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (16, 65, 85)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (17, 54, 73)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (17, 55, 71)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (17, 65, 81)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (17, 66, 70)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (18, 55, 91)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (18, 56, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (18, 66, 87)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (18, 67, 90)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (19, 56, 65)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (19, 57, 67)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (19, 67, 66)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (19, 68, 63)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (20, 48, 87)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (20, 57, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (20, 58, 94)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (20, 68, 93)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (21, 48, 75)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (21, 49, 76)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (21, 58, 77)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (21, 59, 79)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (1, 48, 85, 11)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (1, 60, 81, 11)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (2, 49, 40, 12)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (2, 61, 72, 12)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (3, 50, 30, 13)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (3, 62, 68, 13)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (4, 51, 75, 14)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (4, 63, 79, 14)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (5, 52, 60, 15)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (5, 64, 91, 15)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (6, 53, 45, 16)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (6, 65, 86, 16)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (7, 54, 55, 17)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (7, 66, 59, 17)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (8, 55, 68, 18)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (8, 67, 70, 18)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (9, 56, 70, 19)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (9, 68, 66, 19)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (10, 48, 88, 20)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (10, 57, 50, 20)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (11, 49, 73, 21)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (11, 58, 80, 21)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (12, 50, 54, 11)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (12, 59, 73, 11)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (13, 51, 68, 12)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (13, 60, 90, 12)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (14, 52, 76, 13)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (14, 61, 65, 13)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (15, 53, 90, 14)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (15, 62, 77, 14)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (16, 54, 64, 15)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (16, 63, 56, 15)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (17, 55, 70, 16)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (17, 64, 61, 16)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (18, 56, 85, 17)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (18, 65, 83, 17)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (19, 66, 70, 18)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (20, 67, 88, 19)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (21, 68, 79, 20)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (22, 48, 42, 21)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (23, 49, 69, 11)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (24, 50, 60, 12)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (25, 51, 58, 13)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (26, 52, 87, 14)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (27, 53, 40, 15)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (28, 54, 55, 16)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (29, 55, 61, 17)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (30, 56, 76, 18)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (31, 57, 64, 19)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (32, 58, 90, 20)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [CourseID]) VALUES (33, 59, 50, 21)
GO
SET IDENTITY_INSERT [dbo].[Track] ON 
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (100, N'full stack .net', 10, 1)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (101, N'full stack java', 20, 2)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (102, N'data analysis', 30, 3)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (103, N'cyber security', 40, 4)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (104, N'ai & machine learning', 50, 5)
GO
SET IDENTITY_INSERT [dbo].[Track] OFF
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (100, 11)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (100, 18)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (100, 20)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (101, 11)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (101, 13)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (101, 18)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (101, 19)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (101, 20)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (102, 11)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (102, 13)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (102, 15)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (102, 20)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (103, 11)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (103, 13)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (103, 16)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (103, 21)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (104, 11)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (104, 15)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (104, 17)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (104, 20)
GO
SET IDENTITY_INSERT [Person].[Instructor] ON 
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (1, N'Mohamed Ali', 120)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (2, N'Dina Elmasry', 150)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (3, N'Youssef Mostafa', 180)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (4, N'Layla Adel', 200)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (5, N'Walid Tarek', 240)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (6, N'Noha Sami', 270)
GO
SET IDENTITY_INSERT [Person].[Instructor] OFF
GO
SET IDENTITY_INSERT [Person].[Student] ON 
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (48, N'Ahmed', N'Hassan', 100, 1, 1, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (49, N'Hossam', N'Gabr', 110, 2, 2, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (50, N'Adel', N'Badr', 120, 3, 3, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (51, N'Tamer', N'Fathi', 130, 4, 4, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (52, N'Ramy', N'Ehab', 140, 5, 5, 5)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (53, N'Ahmed', N'Hassan', 100, 6, 6, 6)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (54, N'Hossam', N'Gabr', 110, 7, 1, 7)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (55, N'Adel', N'Badr', 120, 8, 2, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (56, N'Tamer', N'Fathi', 130, 1, 3, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (57, N'Ramy', N'Ehab', 140, 2, 4, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (58, N'Ahmed', N'Hassan', 100, 3, 5, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (59, N'Hossam', N'Gabr', 110, 4, 6, 5)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (60, N'Adel', N'Badr', 120, 5, 1, 6)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (61, N'Tamer', N'Fathi', 130, 6, 2, 7)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (62, N'Ramy', N'Ehab', 140, 7, 3, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (63, N'Ahmed', N'Hassan', 100, 8, 4, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (64, N'Hossam', N'Gabr', 110, 1, 5, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (65, N'Adel', N'Badr', 120, 2, 6, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (66, N'Tamer', N'Fathi', 130, 3, 1, 5)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (67, N'Ramy', N'Ehab', 140, 4, 2, 6)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (68, N'Ahmed', N'Hassan', 100, 5, 3, 7)
GO
SET IDENTITY_INSERT [Person].[Student] OFF
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (1, N'ahmed.hassan@example.com', N'Ahmed Khaled', 100)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (2, N'sara.mahmoud@example.com', N'Alaa Ayesh', 110)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (3, N'menna.fathy@example.com', N'Menna Fathy', 130)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (4, N'nourhan.youssef@example.com', N'Nourhan Youssef', 170)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (5, N'karim.lotfy@example.com', N'Karim Lotfy', 220)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (6, N'rania.helmy@example.com', N'Rania Helmy', 250)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (7, N'esraa.nader@example.com', N'Esraa Nader', 290)
GO
SET IDENTITY_INSERT [Person].[UserTable] ON 
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (100, N'Ahmed Khaled', N'pass1234', N'Training Manager', N'ahmed.hassan@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (110, N'Alaa Ayesh', N'pass5678', N'Training Manager', N'sara.mahmoud@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (120, N'Mohamed Ali', N'pass9012', N'Instructor', N'mohamed.ali@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (130, N'Menna Fathy', N'egypt2025', N'Training Manager', N'menna.fathy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (140, N'Ibrahim Adel', N'secure@12', N'Student', N'ibrahim.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (150, N'Dina Elmasry', N'dina!pass', N'Instructor', N'dina.elmasry@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (160, N'Tarek Nabil', N'tarekpass', N'Student', N'tarek.nabil@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (170, N'Nourhan Youssef', N'nour2025', N'Training Manager', N'nourhan.youssef@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (180, N'Youssef Mostafa', N'youss!23', N'Instructor', N'youssef.mostafa@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (190, N'Reem Kamal', N'reempass1', N'Student', N'reem.kamal@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (200, N'Hossam Gabr', N'hossam555', N'Student', N'hossam.gabr@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (210, N'Layla Adel', N'layla666', N'Instructor', N'layla.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (220, N'Karim Lotfy', N'karim777', N'Training Manager', N'karim.lotfy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (230, N'Fatma Naguib', N'fatma888', N'Student', N'fatma.naguib@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (240, N'Walid Tarek', N'walid999', N'Instructor', N'walid.tarek@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (250, N'Rania Helmy', N'rania000', N'Training Manager', N'rania.helmy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (260, N'Alaa Yassin', N'alaa101', N'Student', N'alaa.yassin@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (270, N'Noha Sami', N'noha202', N'Instructor', N'noha.sami@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (280, N'Mostafa Shawky', N'mostafa303', N'Student', N'mostafa.shawky@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (290, N'Esraa Nader', N'esraa404', N'Training Manager', N'esraa.nader@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (300, N'Adel Badr', N'adel505', N'Student', N'adel.badr@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (310, N'Mai Fouad', N'mai606', N'Instructor', N'mai.fouad@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (320, N'Hany Zaki', N'hany707', N'Training Manager', N'hany.zaki@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (330, N'Yara Magdy', N'yara808', N'Student', N'yara.magdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (340, N'Omar Fekry', N'omar909', N'Instructor', N'omar.fekry@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (350, N'Nahla Said', N'nahla010', N'Training Manager', N'nahla.said@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (360, N'Khaled Mansour', N'khaled121', N'Student', N'khaled.mansour@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (370, N'Mirna Saber', N'mirna232', N'Instructor', N'mirna.saber@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (380, N'Shady Roshdy', N'shady343', N'Student', N'shady.roshdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (390, N'Heba Rami', N'heba454', N'Training Manager', N'heba.rami@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (400, N'Tamer Fathi', N'tamer565', N'Student', N'tamer.fathi@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (410, N'Nadine Ayman', N'nadine676', N'Instructor', N'nadine.ayman@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (420, N'Ziad Ashraf', N'ziad787', N'Training Manager', N'ziad.ashraf@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (430, N'Mariam Anwar', N'mariam898', N'Student', N'mariam.anwar@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (440, N'Fady Kamel', N'fady909', N'Instructor', N'fady.kamel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (450, N'Yasmine Adel', N'yasmine010', N'Training Manager', N'yasmine.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (460, N'Ayman Galal', N'ayman121', N'Student', N'ayman.galal@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (470, N'Nesma Khalil', N'nesma232', N'Instructor', N'nesma.khalil@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (480, N'Samir Zohdy', N'samir343', N'Student', N'samir.zohdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (490, N'Malak Tamer', N'malak454', N'Training Manager', N'malak.tamer@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (500, N'Ramy Ehab', N'ramy565', N'Student', N'ramy.ehab@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (510, N'Hagar Osama', N'hagar676', N'Instructor', N'hagar.osama@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (520, N'Thabet Yehia', N'thabet787', N'Training Manager', N'thabet.yehia@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (530, N'Dalia Elhady', N'dalia898', N'Student', N'dalia.elhady@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (540, N'Bassel Nashaat', N'bassel909', N'Instructor', N'bassel.nashaat@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (550, N'Rana Abdallah', N'rana010', N'Training Manager', N'rana.abdallah@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (560, N'Salim Gawish', N'salim121', N'Student', N'salim.gawish@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (570, N'Huda Refaat', N'huda232', N'Instructor', N'huda.refaat@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (580, N'Mahmoud Ghoneim', N'mahmoud343', N'Student', N'mahmoud.ghoneim@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (590, N'Ahmed Taher', N'taher454', N'Training Manager', N'taher.ahmed@example.com')
GO
SET IDENTITY_INSERT [Person].[UserTable] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unq_UserTable_Email]    Script Date: 5/3/2025 9:54:37 PM ******/
ALTER TABLE [Person].[UserTable] ADD  CONSTRAINT [unq_UserTable_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unq_usertable_name]    Script Date: 5/3/2025 9:54:37 PM ******/
ALTER TABLE [Person].[UserTable] ADD  CONSTRAINT [unq_usertable_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD  DEFAULT ('2025-01-01') FOR [Date]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_BranchTable_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_BranchTable_TrainingManager_TMID]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course_CourseID]
GO
ALTER TABLE [dbo].[ExamType]  WITH CHECK ADD  CONSTRAINT [FK_ExamType_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamType] CHECK CONSTRAINT [FK_ExamType_Exam_ExamID]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Course_CourseID]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [Person].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Intake]  WITH CHECK ADD  CONSTRAINT [FK_Intake_TrainingManager_ID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Intake] CHECK CONSTRAINT [FK_Intake_TrainingManager_ID]
GO
ALTER TABLE [dbo].[IntakeTrack]  WITH CHECK ADD  CONSTRAINT [FK_IntakeTrack_Intake_IntakeID] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [dbo].[IntakeTrack] CHECK CONSTRAINT [FK_IntakeTrack_Intake_IntakeID]
GO
ALTER TABLE [dbo].[IntakeTrack]  WITH CHECK ADD  CONSTRAINT [FK_IntakeTrack_Track_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[IntakeTrack] CHECK CONSTRAINT [FK_IntakeTrack_Track_TrackID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPick_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_Exam_ExamID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPick_Instructor_InstID] FOREIGN KEY([InstID])
REFERENCES [Person].[Instructor] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_Instructor_InstID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPick_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[QuestionType]  WITH CHECK ADD  CONSTRAINT [FK_QuestionType_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionType] CHECK CONSTRAINT [FK_QuestionType_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Exam_ExamID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_Student_StdID] FOREIGN KEY([StdID])
REFERENCES [Person].[Student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Student_StdID]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course_courseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course_courseID]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Student_studentID] FOREIGN KEY([StudentID])
REFERENCES [Person].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student_studentID]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Course_CourseID]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exam_ExamID]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Student_StdID] FOREIGN KEY([StdID])
REFERENCES [Person].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Student_StdID]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_Track_Department_DeptID] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_Track_Department_DeptID]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_Track_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_Track_TrainingManager_TMID]
GO
ALTER TABLE [dbo].[TrackCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrackCourse_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[TrackCourse] CHECK CONSTRAINT [FK_TrackCourse_Course_CourseID]
GO
ALTER TABLE [dbo].[TrackCourse]  WITH CHECK ADD  CONSTRAINT [FK_TrackCourse_Track_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[TrackCourse] CHECK CONSTRAINT [FK_TrackCourse_Track_TrackID]
GO
ALTER TABLE [Person].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_UserTable_userID] FOREIGN KEY([userID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[Instructor] CHECK CONSTRAINT [FK_Instructor_UserTable_userID]
GO
ALTER TABLE [Person].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch_branchID] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_Branch_branchID]
GO
ALTER TABLE [Person].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake_IntakeID] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_Intake_IntakeID]
GO
ALTER TABLE [Person].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_TrainingManager_TMID]
GO
ALTER TABLE [Person].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_UserTable_userID] FOREIGN KEY([UserID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_UserTable_userID]
GO
ALTER TABLE [Person].[TrainingManager]  WITH CHECK ADD  CONSTRAINT [FK_TrainingManager_UserTable_UserID] FOREIGN KEY([UserID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[TrainingManager] CHECK CONSTRAINT [FK_TrainingManager_UserTable_UserID]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [Check_Degree_Max_Min] CHECK  (([MinDegree]<=[MaxDegree]))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Check_Degree_Max_Min]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH CHECK ADD  CONSTRAINT [Check_Degree] CHECK  (([Degree]>=(0)))
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [Check_Degree]
GO
ALTER TABLE [Person].[UserTable]  WITH CHECK ADD  CONSTRAINT [chk_UserRole] CHECK  (([Role]='Instructor' OR [Role]='Student' OR [Role]='Training Manager'))
GO
ALTER TABLE [Person].[UserTable] CHECK CONSTRAINT [chk_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[AddStudent_Prc]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddStudent_Prc]
   
    @FName NVARCHAR(50),
    @LName NVARCHAR(50),
    @TM_ID INT,
    @BranchID INT,
    @IntakeID INT,
    @UserID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF USER!='db18494_TrainingManager'
        BEGIN
            RAISERROR('Access Denied! Only Training Managers can add students.', 16, 1);
            RETURN;
        END;

    
        IF NOT EXISTS (SELECT 1 FROM [Person].UserTable WHERE ID = @UserID)
        BEGIN
            RAISERROR('Invalid UserID! User does not exist.', 16, 1);
            RETURN;
        END;

       
        INSERT INTO person.Student (FName, LName, UserID,IntakeID, BranchID, TMID)
        VALUES (@FName, @LName,@UserID, @IntakeID, @BranchID, @TM_ID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AllowStdToExam]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[AllowStdToExam] @StdID int
as
	begin
			if exists(
			select 1 
			from Exam E
			inner join StudentExam SE on E.ID = SE.ExamID
			where SE.StdID = @StdID
			  and E.[Date] = CAST(GETDATE() as date)
			  and CAST(GETDATE() as Time(0)) between E.Start_Time and E.End_Time
		)

			begin
				select * from GetExamQSForStd_FN(@StdID)
			end
		else
			begin 
				print 'Outside of exam time window.'
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent_Prc]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteStudent_Prc]
    @StudentID INT -- أو @UserID بناءً على مفتاح الجدول الأساسي
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

       
        IF NOT IS_ROLEMEMBER('TrainingManager') = 1
        BEGIN
            RAISERROR('Access Denied! Only Training Managers can delete students.', 16, 1);
            RETURN;
        END;
   
        IF NOT EXISTS (SELECT 1 FROM person.Student WHERE ID = @StudentID)
        BEGIN
            RAISERROR('Student not found!', 16, 1);
            RETURN;
        END;

        DELETE FROM StudentExam 
        WHERE StdID = @StudentID;

        
        DELETE FROM person.Student 
        WHERE ID = @StudentID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[gettop10studentsbycoursename]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    procedure [dbo].[gettop10studentsbycoursename]
    @coursename nvarchar(100)
as
begin
    if not exists (select 1 from dbo.course where name = @coursename)
    begin
        raiserror('course name "%s" does not exist.', 16, 1, @coursename);
        return;
    end

    ;with studentcoursetotals as (
        select 
            s.id as studentid,
            s.fname + ' ' + s.lname as studentname,
            c.id as courseid,
            c.name as coursename,
            sum(dbo.calculate_student_degree(s.id, e.id)) as totaldegree
        from 
            [person].student s
        
        join 
            dbo.studentexam se on s.id = se.stdid
        join 
            dbo.exam e on se.examid = e.id
        join 
            dbo.course c on e.courseid = c.id
        group by 
            s.id, s.fname, s.lname, c.id, c.name
    ),
    rankedstudents as (
        select *,
            row_number() over (partition by courseid order by totaldegree desc) as rankincourse
        from 
            studentcoursetotals
    )
    select 
        studentid,
        studentname,
        courseid,
        coursename,
        totaldegree,
        rankincourse
    from 
        rankedstudents
    where 
        rankincourse <= 10
        and coursename = @coursename;
end
GO
/****** Object:  StoredProcedure [dbo].[PC_GetBranchFromTMName]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PC_GetBranchFromTMName](@TM varchar(50))
AS
BEGIN
    SELECT 
		T.[Name] AS 'Training Manager Name',
        B.[Name] AS 'Branch Name',
        B.[Location] AS 'Branch Location'
        
    FROM 
        Branch AS B
        JOIN Person.TrainingManager as T  ON B.TMID = T.ID
    WHERE 
        T.Name LIKE '%'+ @TM +'%';
END;
GO
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsInBranch]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PC_GetStudentsInBranch](@BranchName nvarchar(20))
AS
BEGIN
    SELECT 
        S.ID, 
        S.FName + ' ' + S.LName AS 'Student Name',
		I.Number AS 'Intake Number',
        B.[Name] AS 'Branch Name',
        B.[Location] AS 'Branch Location',
        T.[Name] AS 'Training Manager Name'
    FROM 
        Person.Student AS S
        JOIN Branch AS B ON S.BranchID = B.ID
        JOIN Intake AS I ON S.IntakeID = I.ID
        JOIN Person.TrainingManager AS T ON T.ID = B.TMID
    WHERE 
        B.[Name] Like '%' + @BranchName + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsInIntake]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PC_GetStudentsInIntake](@IntakeNum int)
AS
BEGIN
    SELECT 
        S.ID, 
        S.FName + ' ' + S.LName AS 'Student Name',
		I.Number AS 'Intake Number',
        B.[Name] AS 'Branch Name',
        B.[Location] AS 'Branch Location',
        T.[Name] AS 'Training Manager Name'
    FROM 
        Person.Student AS S
        JOIN Branch AS B ON S.BranchID = B.ID
        JOIN Intake AS I ON S.IntakeID = I.ID
        JOIN Person.TrainingManager AS T ON T.ID = B.TMID
    WHERE 
        I.Number = @IntakeNum;
END;
GO
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsNumInBranch]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PC_GetStudentsNumInBranch]
AS
BEGIN
    SELECT 
	COUNT(S.ID) as 'Students Number',B.[Name] 'Branch Name'
    FROM 
        Person.Student AS S
        JOIN Branch AS B ON S.BranchID = B.ID
	group by B.[Name]
END;
GO
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsNumInIntack]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[PC_GetStudentsNumInIntack]
AS
BEGIN
    SELECT 
	COUNT(S.ID) as 'Students Number',I.Number 'Intake Number'
    FROM 
        Person.Student AS S
        JOIN Intake AS I ON S.IntakeID = I.ID

	group by I.Number
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateExam]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_CreateExam]
    @Year INT,
    @CourseID INT,
    @TotalDegree INT,
    @StartTime DATETIME,
    @EndTime DATETIME,
	@Date DATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @MaxDegree INT = (SELECT MaxDegree FROM Course WHERE ID = @CourseID);

        IF @TotalDegree > @MaxDegree
        BEGIN
            RAISERROR('Exam degree exceeds course limit!', 16, 1);
            RETURN;
        END;

     
        INSERT INTO Exam ([Year],CourseID, TotalDegree, Start_Time, End_Time,[Date])
        VALUES (@Year, @CourseID, @TotalDegree, @StartTime, @EndTime, @Date);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Person].[inserttrainingmanager]    Script Date: 5/3/2025 9:54:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Person].[inserttrainingmanager]
    @id int,
    @email varchar(100),
    @name varchar(50),
    @userid int = null
as
begin
    if @userid is not null and not exists (
        select 1 from [person].[usertable] where id = @userid
    )
    begin
        raiserror('userid not found in usertable.', 16, 1)
        return
    end

    insert into [person].[trainingmanager] (id, email, name, userid)
    values (@id, @email, @name, @userid)
end
GO
ALTER DATABASE [db18494] SET  READ_WRITE 
GO
