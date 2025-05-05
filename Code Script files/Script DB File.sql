/****** Object:  Database [ExaminationSystemDB]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE DATABASE [ExaminationSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystemDB_Primary', FILENAME = N'D:\ITI\SQL Project\DB\ExaminationSystemDB.mdf' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [ExaminationSystemDB_FG1] 
( NAME = N'ExamSystem_Data1', FILENAME = N'D:\ITI\SQL Project\DB\ExamSystem_Data1.ndf' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [ExaminationSystemDB_FG2] 
( NAME = N'ExamSystem_Data2', FILENAME = N'D:\ITI\SQL Project\DB\ExamSystem_Data2.ndf' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [ExaminationSystemDB_FG3] 
( NAME = N'ExamSystem_Data3', FILENAME = N'D:\ITI\SQL Project\DB\ExamSystem_Data3.ndf' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [ExaminationSystemDB_FG4] 
( NAME = N'ExamSystem_Data4', FILENAME = N'D:\ITI\SQL Project\DB\ExamSystem_Data4.ndf' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'ExaminationSystemDB_Log', FILENAME = N'D:\ITI\SQL Project\DB\ExaminationSystemDB_Log.ldf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystemDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationSystemDB', N'ON'
GO
ALTER DATABASE [ExaminationSystemDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystemDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  User [StudentUser]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE USER [StudentUser] FOR LOGIN [StudentLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ManagerUser]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE USER [ManagerUser] FOR LOGIN [ManagerLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [InstructorUser]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE USER [InstructorUser] FOR LOGIN [InstructorLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminUser]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE USER [AdminUser] FOR LOGIN [AdminLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [StudentRole]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE ROLE [StudentRole]
GO
/****** Object:  DatabaseRole [ManagerRole]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE ROLE [ManagerRole]
GO
/****** Object:  DatabaseRole [InstructorRole]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE ROLE [InstructorRole]
GO
/****** Object:  DatabaseRole [AdminRole]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE ROLE [AdminRole]
GO
ALTER ROLE [StudentRole] ADD MEMBER [StudentUser]
GO
ALTER ROLE [ManagerRole] ADD MEMBER [ManagerUser]
GO
ALTER ROLE [InstructorRole] ADD MEMBER [InstructorUser]
GO
ALTER ROLE [AdminRole] ADD MEMBER [AdminUser]
GO
/****** Object:  Schema [Person]    Script Date: 5/5/2025 3:25:13 PM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  UserDefinedFunction [dbo].[Calculate_Student_Degree]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[CalculateAverageGrade_Fun]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    FUNCTION [dbo].[CalculateAverageGrade_Fun]  
    (@StudentID INT)  
RETURNS DECIMAL(5,2)  
AS  
BEGIN  
    DECLARE @AvgGrade DECIMAL(5,2);  
    SELECT @AvgGrade = AVG(StdExamDegree)  
    FROM StudentExam  
    WHERE StdID = @StudentID;  
    RETURN @AvgGrade;  
END;  
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateMaxGrade_Fun]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------calc Fun Max degrees-------------

CREATE   FUNCTION [dbo].[CalculateMaxGrade_Fun]
(
    @ExamID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @MaxGrade INT;

    SELECT @MaxGrade = MAX(StdExamDegree)
    FROM StudentExam
    WHERE ExamID = @ExamID;

    RETURN ISNULL(@MaxGrade, 0); 
END;
GO
/****** Object:  UserDefinedFunction [dbo].[Count_Student_CorrectAnswers]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Count_Student_CorrectAnswers](@ExamID INT, @StdID INT)
RETURNS INT
AS
BEGIN
    DECLARE @CorrectAnswers INT

    SELECT @CorrectAnswers = COUNT(*)
    FROM StudentAnswer SA
    JOIN QuestionPool Q ON Q.ID = SA.QuestionID
    WHERE SA.ExamID = @ExamID AND SA.StdID = @StdID AND SA.Answer = Q.correctAnswer

    RETURN ISNULL(@CorrectAnswers, 0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Exam_Duration]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[Get_Exam_Duration](@ExamID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Duration INT

    SELECT @Duration = DATEDIFF(MINUTE, Start_Time, End_Time)
    FROM Exam
    WHERE ID = @ExamID

    RETURN @Duration
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetBestStudentsPerExam]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[GetBestStudentsPerExam]
(@ExamID int)
returns @TopStudents table 
(
    StudentID int,
    TotalDegree int
)
as
begin
    -- Validate ExamID exists
    if not exists (select 1 from [dbo].[Exam] where ID = @ExamID)
    begin
        return;
    end

    -- Calculate total degree for each student who took the exam
    insert into @TopStudents (StudentID, TotalDegree)
    select 
        se.StdID as StudentID,
        coalesce(se.StdExamDegree, 0) as TotalDegree
    from [dbo].[StudentExam] se
    inner join [dbo].[Exam] e on se.ExamID = e.ID
    inner join [dbo].[StudentCourse] sc on se.StdID = sc.StudentID 
        and e.CourseID = sc.CourseID
    where se.ExamID = @ExamID
        and se.StdExamDegree > 0
    order by se.StdExamDegree desc;

    return;
end;
GO
/****** Object:  UserDefinedFunction [dbo].[getCourseID]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetExamCountByCourseAndYear]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[GetExamCountByCourseAndYear]
(@CourseID int, @Year int)
returns int
as
begin
    declare @ExamCount int;
    
    select @ExamCount = count(*)
    from [dbo].[Exam] e
    where e.CourseID = @CourseID
      and e.Year = @Year;
    
    return isnull(@ExamCount, 0);
end;
GO
/****** Object:  UserDefinedFunction [dbo].[GetStudentCountByIntake]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[GetStudentCountByIntake]
(@IntakeID int)
returns int
as
begin
    declare @StudentCount int;
    
    select @StudentCount = count(*)
    from [Person].[Student] s
    where s.IntakeID = @IntakeID;
    
    return isnull(@StudentCount, 0);
end;
GO
/****** Object:  UserDefinedFunction [dbo].[IsInstructorEligibleForCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[IsInstructorEligibleForCourse]
(@InstructorName nvarchar(100), @CourseName nvarchar(100))
returns nvarchar(20)
as
begin
    declare @EligibilityStatus nvarchar(20) = 'Not Eligible';
    declare @InstructorID int;
    declare @CourseID int;

    select @InstructorID = i.ID
    from [Person].[Instructor] i
    where i.Name = @InstructorName;

    if @InstructorID is null
    begin
        return 'Instructor Not Found';
    end

    select @CourseID = c.ID
    from [dbo].[Course] c
    where c.Name = @CourseName;

    if @CourseID is null
    begin
        return 'Course Not Found';
    end

    if exists (
        select 1
        from [dbo].[InstructorCourse] ic
        where ic.InstructorID = @InstructorID
          and ic.CourseID = @CourseID
    )
        set @EligibilityStatus = 'Eligible';
    
    return @EligibilityStatus;
end;
GO
/****** Object:  Table [Person].[Student]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Student](
	[ID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[StudentExam]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[ExamID] [int] NOT NULL,
	[StdID] [int] NOT NULL,
	[StdExamDegree] [int] NULL,
	[courseid] [int] NOT NULL,
 CONSTRAINT [PK_StudentExam_ExamID] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/5/2025 3:25:13 PM ******/
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
	[InstructorID] [int] NULL,
 CONSTRAINT [PK_Course_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[get_student_degrees_by_course]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Add function Get_Student_Degrees_By_Course to retrieve student exam degrees by course

create function [dbo].[get_student_degrees_by_course]
(
    @courseid int
)
returns table
as
return
(
    select 
        s.id as studentid,
        p.fname+' '+p.lname as studentname,
        e.id as examid,
        dbo.calculate_student_degree(s.id, e.id) as degree
    from 
        [person].[student] s
    join 
        dbo.studentexam se on s.id = se.stdid
    join 
        dbo.exam e on se.examid = e.id
    join 
        dbo.course c on e.courseid = c.id
    join 
        [person].student p on s.id = p.id
    where 
        c.id = @courseid
);
GO
/****** Object:  View [dbo].[CourseDetails_v]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------Number of Exams in each Course-----------

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
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[Student_Course_Details]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Student_Course_Details] 
as
select S.FName + ' ' +S.LName as 'Full Name',
C.Name as 'course Name',
SCrs.StdCrsDegree as 'Student_Course_Degree'
from 
Person.Student S
inner join StudentCourse SCrs on S.ID =SCrs.StudentID
inner join Course C on SCrs.CourseID = C.ID
GO
/****** Object:  Table [Person].[UserTable]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[UserTable](
	[ID] [int] IDENTITY(10,10) NOT NULL,
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
/****** Object:  Table [dbo].[Branch]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [dbo].[Intake]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[vw_studentinfo]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[Exam_Students]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Exam_Students] 
AS
select 
      SE.ExamID,
	  SE.StdID,
	  S.FName + ' ' +S.LName as 'StudentFullName'
from StudentExam SE
inner join Exam E ON SE.ExamID = E.ID
inner join person.Student S ON SE.StdID = S.ID
GO
/****** Object:  Table [dbo].[Track]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [dbo].[QuestionPick]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [Person].[Instructor]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[ExamDetails]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ExamDetails]
as
select 
    e.ID as 'exam_id',
    c.ID as 'course_id',
    c.Name as 'course_name',
    COALESCE(min(s.IntakeID), 1) as 'intake',
    COALESCE(min(b.Name), '') as 'branch',
    COALESCE(min(t.Name), '') as 'track',
    e.Start_Time as 'start_time',
    e.End_Time as 'end_time',
    e.Date as 'date_of_exam',
    COALESCE(min(i.ID), 0) as 'inst_id'
from Exam e
left join QuestionPick p on p.ExamID = e.ID
left join Person.Instructor i on i.ID = p.InstID
left join Course c on c.ID = e.CourseID
left join StudentAnswer sa on sa.ExamID = e.ID
left join Person.Student s on s.ID = sa.StdID
left join Branch b on b.ID = s.BranchID
left join Track t on t.ID = s.BranchID
left join Intake it on it.ID = s.IntakeID
group by 
    e.ID, c.ID, c.Name, e.Start_Time, e.End_Time, e.Date
GO
/****** Object:  Table [Person].[TrainingManager]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[TrainingManager_Details]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TrainingManager_Details]
as
SELECT 
    TM.ID AS TMID,
    TM.Name as 'TrainingManager Name',
    B.ID as 'Branch id',
    B.Name as'branch name',
    T.ID as 'training manager id',
    T.Name as 'training manager name',
    I.Number as 'Intake number'
from person.TrainingManager TM
inner JOIN Branch B ON TM.ID = B.TMID
inner JOIN Track T ON TM.ID = T.TMID
inner JOIN Intake I ON TM.ID = I.TMID
GO
/****** Object:  Table [dbo].[QuestionPool]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPool](
	[ID] [int] NOT NULL,
	[correctAnswer] [nvarchar](max) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Options] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Exam_Summary]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Exam_Summary] 
AS
SELECT 
    E.ID AS ExamID,
    C.Name,
    COUNT(DISTINCT SA.StdID) AS TotalStudents,
    SUM(CASE WHEN SA.Answer = Q.correctAnswer THEN 1 ELSE 0 END) AS CorrectAnswers,
    SUM(CASE WHEN SA.Answer != Q.correctAnswer THEN 1 ELSE 0 END) AS WrongAnswers
FROM Exam E
JOIN StudentAnswer SA ON SA.ExamID = E.ID
JOIN QuestionPool Q ON Q.ID = SA.QuestionID
JOIN Course C ON C.ID = E.CourseID
GROUP BY E.ID, C.Name
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  View [dbo].[vw_QuestionPool]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_QuestionPool] as
select 
    qp.ID as QuestionID,
    qt.Type as QuestionType,
    qp.Question,
    qp.correctAnswer
from 
    dbo.QuestionPool qp
    left join dbo.QuestionType qt on qp.ID = qt.QuestionID;
GO
/****** Object:  View [dbo].[studentanswerdetails]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[studentanswerdetails] as
select 
    sa.stdid as studentid,
    p.fname + ' ' + p.lname as studentname,
    sa.examid,
    sa.questionid,
    qp.question,
    sa.answer as studentanswer,
    qp.correctanswer,
    qpick.degree,
    case 
        when sa.answer = qp.correctanswer then qpick.degree
        else 0
    end as earneddegree
from 
    dbo.studentanswer sa
join 
    dbo.questionpool qp on sa.questionid = qp.id
join 
    dbo.questionpick qpick on sa.questionid = qpick.questionid and sa.examid = qpick.examid
join 
    [person].student p on sa.stdid = p.id;
GO
/****** Object:  View [dbo].[vw_StudentExams]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_StudentExams] as
select distinct
    sa.StdID,
    e.ID as ExamID,
    e.Date,
    e.Start_Time,
    e.End_Time,
    c.Name as CourseName
from 
    dbo.StudentAnswer sa
    inner join dbo.Exam e on sa.ExamID = e.ID
    inner join dbo.Course c on e.CourseID = c.ID;
GO
/****** Object:  View [dbo].[studenttotaldegrees]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[studenttotaldegrees] as
select 
    s.id as studentid,
    p.fname + ' ' + p.lname as studentname,
    e.id as examid,
    c.name as coursename,
    dbo.calculate_student_degree(s.id, e.id) as totaldegree
from 
    [person].student s
join 
    [person].student p on s.id = p.id
join 
    dbo.studentexam se on s.id = se.stdid
join 
    dbo.exam e on se.examid = e.id
join 
    dbo.course c on e.courseid = c.id;
GO
/****** Object:  View [dbo].[View_Student_UpcomingExams]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[View_Student_UpcomingExams] AS
SELECT 
    E.ID AS ExamID,
    E.CourseID,
    E.Start_Time,
    E.End_Time,
    E.Date,
    CAST(
        CONVERT(VARCHAR(10), E.Date, 120) + ' ' + 
        CONVERT(VARCHAR(8), E.Start_Time, 108)
    AS DATETIME) AS ExamStartDateTime
FROM Exam E
WHERE GETDATE() < CAST(
    CONVERT(VARCHAR(10), E.Date, 120) + ' ' + 
    CONVERT(VARCHAR(8), E.Start_Time, 108)
AS DATETIME)
GO
/****** Object:  View [Person].[vw_StudentExamDegrees]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [Person].[vw_StudentExamDegrees] 
AS
SELECT 
   S.FName + ' ' + S.LName AS [Student Full Name], 
   SE.StdExamDegree AS [Exam Degree],
   Course.Name
FROM Person.Student S
JOIN StudentExam SE ON SE.StdID = S.ID
JOIN Course ON SE.CourseID = Course.ID
GO
/****** Object:  Table [dbo].[TrackCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[FN_GetCourseByTrack]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[FN_GetCourseByTrack](@TrackID int)
returns table
as
return
(
	select C.ID 'Course ID', C.Name 'Course Name'
	from Course C inner join TrackCourse TC
	on C.ID = TC.CourseID
	inner join Track T
	on T.ID = TC.TrackID
	where T.ID = @TrackID
)
GO
/****** Object:  UserDefinedFunction [dbo].[getQSforCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   function [dbo].[getQSforCourse](@CourseID int)
returns table
as
return
	(
		select Q.ID
		from Course C inner join Exam E
		on C.ID = E.CourseID
		inner join QuestionPick QP
		on E.ID = QP.ExamID
		inner join QuestionPool Q
		on Q.ID = QP.QuestionID
		where C.ID = @CourseID
	)
GO
/****** Object:  UserDefinedFunction [dbo].[GetExamQSForStd_FN]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetExamQSForStd_FN](@StdID int)
returns table
as
return
(
		select Q.Question,Q.Options
		from QuestionPool Q inner join QuestionPick QP
		on Q.ID = QP.QuestionID
		inner join Exam E
		on E.ID = QP.ExamID
		inner join StudentExam SE
		on E.ID = SE.ExamID
		where SE.StdID = @StdID
)
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [dbo].[ExamType]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  Table [dbo].[IntakeTrack]    Script Date: 5/5/2025 3:25:13 PM ******/
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
SET IDENTITY_INSERT [dbo].[Branch] ON 
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (0, N'main branch', N'nasr city, cairo', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (1, N'alex branch', N'smouha, alexandria', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (2, N'giza branch', N'dokki, giza', 3)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (3, N'maadi branch', N'maadi, cairo', 4)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (4, N'mansoura br', N'el gomhoria st', 5)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (5, N'tanta branch', N'el geish st', 6)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (6, N'zagazig br', N'el kornish st', 7)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (7, N'assiut br', N'nasser road', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (8, N'fayoum br', N'el masaken', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (9, N'sohag br', N'el shaheed st', 3)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (10, N'main branch', N'nasr city, cairo', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (11, N'alex branch', N'smouha, alexandria', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (12, N'giza branch', N'dokki, giza', 3)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (13, N'maadi branch', N'maadi, cairo', 4)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (14, N'mansoura br', N'el gomhoria st', 5)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (15, N'tanta branch', N'el geish st', 6)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (16, N'zagazig br', N'el kornish st', 7)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (17, N'assiut br', N'nasser road', 1)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (18, N'fayoum br', N'el masaken', 2)
GO
INSERT [dbo].[Branch] ([ID], [Name], [Location], [TMID]) VALUES (19, N'sohag br', N'el shaheed st', 3)
GO
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (0, N'Introduction to Programming', N'Beginner-level course using Python to learn the fundamentals of programming.', 100, 50, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (1, N'Web Development with ASP.NET', N'Learn how to build modern web applications using ASP.NET Core.', 100, 60, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (2, N'SQL Database Design', N'Comprehensive guide to designing and managing databases using SQL Server.', 100, 55, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (3, N'Mobile App Development', N'Create mobile apps using Flutter and Dart with real-world practice.', 100, 50, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (4, N'Data Structures and Algorithms', N'Essential course on data structures and problem-solving techniques.', 100, 65, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (5, N'Cybersecurity Fundamentals', N'Understand the basics of cybersecurity and how to protect systems.', 90, 50, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (6, N'AI and Machine Learning', N'Introductory course to AI and ML concepts using Python and real data.', 100, 60, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (7, N'Frontend Web Development', N'Learn HTML, CSS, and JavaScript to build interactive web interfaces.', 100, 50, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (8, N'DevOps and Cloud Computing', N'Learn the principles of DevOps and how to deploy applications using cloud services like Azure and AWS.', 100, 60, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (9, N'Software Engineering', N'Study the software development life cycle, requirements analysis, and design patterns.', 100, 65, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (10, N'Network Administration', N'Understand computer networks and how to manage servers, systems, and IT infrastructure.', 100, 55, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (11, N'Introduction to Programming', N'Beginner-level course using Python to learn the fundamentals of programming.', 100, 50, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (12, N'Web Development with ASP.NET', N'Learn how to build modern web applications using ASP.NET Core.', 100, 60, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (13, N'SQL Database Design', N'Comprehensive guide to designing and managing databases using SQL Server.', 100, 55, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (14, N'Mobile App Development', N'Create mobile apps using Flutter and Dart with real-world practice.', 100, 50, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (15, N'Data Structures and Algorithms', N'Essential course on data structures and problem-solving techniques.', 100, 65, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (16, N'Cybersecurity Fundamentals', N'Understand the basics of cybersecurity and how to protect systems.', 100, 70, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (17, N'AI and Machine Learning', N'Introductory course to AI and ML concepts using Python and real data.', 100, 60, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (18, N'Frontend Web Development', N'Learn HTML, CSS, and JavaScript to build interactive web interfaces.', 100, 50, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (19, N'DevOps and Cloud Computing', N'Learn the principles of DevOps and how to deploy applications using cloud services like Azure and AWS.', 100, 60, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (20, N'Software Engineering', N'Study the software development life cycle, requirements analysis, and design patterns.', 100, 65, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (21, N'Network Administration', N'Understand computer networks and how to manage servers, systems, and IT infrastructure.', 100, 55, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (22, N'English', N'A language course that improve student skills', 100, 40, 10)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (23, N'Data', N'Introduction to databases', 100, 50, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Description], [MaxDegree], [MinDegree], [InstructorID]) VALUES (24, N'Data 223', N'Introduction to databases', 100, 50, 2)
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
INSERT [dbo].[Department] ([ID], [Name]) VALUES (110, N'software dev')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (120, N'network admin')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (130, N'tech support')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (140, N'db admin')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (150, N'cybersecurity')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (160, N'devops')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (170, N'cloud compute')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (180, N'ui ux design')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (190, N'data analysis')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (200, N'it helpdesk')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (0, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 0, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (1, 2024, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 20, 1, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (2, 2024, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 20, 2, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (3, 2024, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 20, 3, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (4, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 4, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (5, 2024, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 20, 5, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (6, 2024, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 20, 6, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (7, 2024, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 20, 7, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (8, 2024, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 20, 8, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (9, 2024, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 20, 9, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (10, 2024, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 20, 10, CAST(N'2024-05-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (11, 2025, CAST(N'12:00:00' AS Time), CAST(N'20:00:00' AS Time), 10, 0, CAST(N'2025-05-05' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (12, 2025, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 10, 1, CAST(N'2025-05-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (13, 2025, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 10, 2, CAST(N'2025-05-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (14, 2023, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 10, 3, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (15, 2023, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 10, 4, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (16, 2023, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 10, 5, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (17, 2023, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 10, 6, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (18, 2023, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 10, 7, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (19, 2023, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 10, 8, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (20, 2023, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 10, 9, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (21, 2023, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 10, 10, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (22, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 0, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (23, 2022, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 30, 1, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (24, 2022, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 30, 2, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (25, 2022, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 30, 3, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (26, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 4, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (27, 2022, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 30, 5, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (28, 2022, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 30, 6, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (29, 2022, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 30, 7, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (30, 2022, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 30, 8, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (31, 2022, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 30, 9, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (32, 2022, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 30, 10, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (33, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 0, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (34, 2024, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 20, 1, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (35, 2024, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 20, 2, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (36, 2024, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 20, 3, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (37, 2024, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 20, 4, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (38, 2024, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 20, 5, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (39, 2024, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 20, 6, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (40, 2024, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 20, 7, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (41, 2024, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 20, 8, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (42, 2024, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 20, 9, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (43, 2024, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 20, 10, CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (44, 2023, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 10, 0, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (45, 2023, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 10, 1, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (46, 2023, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 10, 2, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (47, 2023, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 10, 3, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (48, 2023, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 10, 4, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (49, 2023, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 10, 5, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (50, 2023, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 10, 6, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (51, 2023, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 10, 7, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (52, 2023, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 10, 8, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (53, 2023, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 10, 9, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (54, 2023, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 10, 10, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (55, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 0, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (56, 2022, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 30, 1, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (57, 2022, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 30, 2, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (58, 2022, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 30, 3, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (59, 2022, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 30, 4, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (60, 2022, CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 30, 5, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (61, 2022, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 30, 6, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (62, 2022, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 30, 7, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (63, 2022, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 30, 8, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (64, 2022, CAST(N'13:30:00' AS Time), CAST(N'15:30:00' AS Time), 30, 9, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (65, 2022, CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time), 30, 10, CAST(N'2022-06-15' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (66, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 6, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (67, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 6, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (68, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 6, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (69, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 6, CAST(N'2025-05-02' AS Date))
GO
INSERT [dbo].[Exam] ([ID], [Year], [Start_Time], [End_Time], [TotalDegree], [CourseID], [Date]) VALUES (70, 2025, CAST(N'10:16:00' AS Time), CAST(N'12:15:00' AS Time), 80, 6, CAST(N'2025-05-02' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (0, N'Corrective')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (0, N'Exam')
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
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (66, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (67, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (68, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (69, N'Exam')
GO
INSERT [dbo].[ExamType] ([ExamID], [Type]) VALUES (70, N'Exam')
GO
SET IDENTITY_INSERT [dbo].[Intake] ON 
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (0, 43, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (1, 44, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (2, 45, 3)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (3, 46, 4)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (4, 47, 5)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (5, 48, 6)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (6, 49, 7)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (7, 50, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (8, 51, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (9, 52, 3)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (10, 43, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (11, 44, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (12, 45, 3)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (13, 46, 4)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (14, 47, 5)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (15, 48, 6)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (16, 49, 7)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (17, 50, 1)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (18, 51, 2)
GO
INSERT [dbo].[Intake] ([ID], [Number], [TMID]) VALUES (19, 52, 3)
GO
SET IDENTITY_INSERT [dbo].[Intake] OFF
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (0, 0)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (0, 1)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (1, 0)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (1, 2)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (2, 3)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (3, 4)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (4, 0)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (5, 2)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (6, 1)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (7, 4)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (8, 3)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (9, 0)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (9, 1)
GO
INSERT [dbo].[IntakeTrack] ([IntakeID], [TrackID]) VALUES (9, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (1, 1, 0, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (2, 1, 1, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (3, 2, 2, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (4, 2, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (5, 3, 4, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (6, 3, 5, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (7, 4, 0, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (8, 4, 1, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (9, 5, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (10, 5, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (11, 6, 4, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (12, 6, 5, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (13, 7, 0, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (14, 7, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (15, 8, 2, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (16, 8, 3, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (17, 9, 4, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (18, 9, 5, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (19, 10, 0, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (20, 10, 1, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (21, 11, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (22, 11, 3, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (23, 12, 4, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (24, 12, 5, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (25, 13, 0, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (26, 13, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (27, 14, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (28, 14, 3, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (29, 15, 4, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (30, 15, 5, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (31, 16, 0, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (32, 16, 1, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (33, 17, 2, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (34, 17, 3, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (35, 18, 4, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (36, 18, 5, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (37, 19, 0, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (38, 8, 2, 5)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (38, 19, 1, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (39, 20, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (40, 20, 3, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (41, 21, 4, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (42, 22, 5, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (43, 23, 0, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (44, 24, 1, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (45, 25, 2, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (46, 26, 3, 3)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (47, 27, 4, 1)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (48, 28, 5, 4)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (49, 29, 0, 2)
GO
INSERT [dbo].[QuestionPick] ([QuestionID], [ExamID], [InstID], [Degree]) VALUES (50, 30, 1, 3)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (1, N'B', N'Which of the following is a valid Python data type?', N'folder,list,script,node')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (2, N'True', N'Python is a dynamically typed language. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (3, N'False', N'Python uses curly braces to define code blocks. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (4, N'Indentation', N'What is used to define blocks of code in Python?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (5, N'C', N'Which operator is used for exponentiation in Python?', N'^,exp,**,power')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (6, N'True', N'ASP.NET supports both MVC and Web API. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (7, N'A', N'Which of these is a valid HTTP method?', N'POST,PUSH,FETCH,LOAD')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (8, N'C#', N'What language is commonly used with ASP.NET Core?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (9, N'Model-View-Controller', N'What does MVC stand for?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (10, N'False', N'ASP.NET cannot be used for RESTful services. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (11, N'Structured Query Language', N'What does SQL stand for?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (12, N'A', N'Which SQL statement is used to remove a table?', N'DROP,REMOVE,DELETE,CLEAR')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (13, N'B', N'Which keyword is used to return only unique values?', N'UNIQUE,DISTINCT,SELECT,FILTER')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (14, N'JOIN', N'What keyword is used to combine rows from two or more tables?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (15, N'False', N'You must use WHERE in every SQL SELECT query. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (16, N'A', N'Which language is commonly used with Flutter?', N'Dart,Kotlin,Swift,C#')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (17, N'True', N'React Native allows development for both iOS and Android. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (18, N'Android Studio', N'Which IDE is typically used for Android development?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (19, N'B', N'Which OS is Swift used for?', N'Android,iOS,Windows,Linux')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (20, N'False', N'Mobile apps cannot access device hardware. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (21, N'C', N'Which data structure uses LIFO?', N'Queue,Tree,Stack,Graph')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (22, N'True', N'A queue is FIFO (First In, First Out). (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (23, N'Binary Search', N'Which algorithm is best for searching in a sorted array?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (24, N'False', N'A linked list allows random access. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (25, N'D', N'Which is NOT a type of tree?', N'AVL,Binary,B-Tree,Circle')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (26, N'True', N'Firewalls prevent unauthorized access to networks. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (27, N'B', N'What does HTTPS stand for?\nA. Hypertext Transfer Push Security\nB. Hypertext Transfer Protocol Secure\nC. HTTP Secureline\nD. Host Transfer Secure', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (28, N'Encryption', N'What is the process of converting data into a secret code called?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (29, N'False', N'Passwords should be stored in plain text. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (30, N'A', N'Which of the following is a common cyber attack?', N'Phishing,Fishing,Surfing,Tracking')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (31, N'C', N'Which of these is a Python library for ML?', N'React,Flask,Scikit-learn,Redux')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (32, N'True', N'Supervised learning requires labeled data. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (33, N'Classification', N'What is the process of categorizing data into classes called?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (34, N'False', N'AI and ML are exactly the same thing. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (35, N'Overfitting', N'What do we call a model that performs well on training data but poorly on unseen data?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (36, N'B', N'Which language is used to style HTML?', N'HTML,CSS,PHP,JS')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (37, N'True', N'HTML is used for structuring web pages. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (38, N'DOM', N'What does the browser create from HTML that JavaScript can interact with?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (39, N'A', N'Which tag is used to link a CSS file?', N'<link>,<style>,<script>,<css>')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (40, N'False', N'You cannot use JavaScript in HTML. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (41, N'True', N'CI/CD pipelines are part of DevOps. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (42, N'Docker', N'Which tool is used to containerize applications?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (43, N'C', N'Which is a cloud provider?', N'Oracle,Cisco,AWS,MySQL')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (44, N'Infrastructure as Code', N'What does IaC stand for?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (45, N'False', N'DevOps is only about writing code. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (46, N'D', N'Which software model handles risk best?', N'Agile,Waterfall,Incremental,Spiral')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (47, N'Requirement Gathering', N'What is the first phase in the software life cycle?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (48, N'True', N'TCP ensures reliable data transmission. (True/False)', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (49, N'C', N'What does IP stand for?', N'Internal Process,Internet Packet,Internet Protocol,Inter-Process')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (50, N'OSI Model', N'What model divides network communication into 7 layers?', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (51, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (52, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (53, N'C', N'Which operator is used for exponentiation in Python?', N'A: ^, B: exp, C: **, D: power')
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (54, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (55, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (56, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (57, N'False', N'Python uses curly braces to define code blocks.', NULL)
GO
INSERT [dbo].[QuestionPool] ([ID], [correctAnswer], [Question], [Options]) VALUES (58, N'False', N'Python uses curly braces to define code blocks.', NULL)
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
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (51, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (52, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (53, N'Multiple Choice')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (54, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (55, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (56, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (57, N'True/False')
GO
INSERT [dbo].[QuestionType] ([QuestionID], [Type]) VALUES (58, N'True/False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (1, 1, 1, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (2, 1, 2, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (2, 1, 13, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (3, 2, 3, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (4, 2, 4, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (5, 3, 5, N'OOP is based on objects')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (6, 3, 6, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (7, 4, 7, N'Encapsulation')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (8, 4, 8, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (9, 5, 9, N'Inheritance allows reusability')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (10, 5, 10, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (11, 6, 11, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (12, 6, 12, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (13, 7, 13, N'LINQ queries data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (14, 7, 14, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (15, 8, 15, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (16, 8, 16, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (17, 9, 17, N'Encapsulation hides data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (18, 9, 18, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (19, 10, 19, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (20, 10, 20, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (21, 11, 21, N'Multi-threading improves performance')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (22, 11, 1, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (23, 12, 2, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (24, 12, 3, N'Databases store structured data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (25, 13, 4, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (26, 13, 5, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (27, 14, 6, N'Functions are reusable blocks')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (28, 14, 7, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (29, 15, 8, N'Pointers are used for memory access')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (30, 15, 9, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (31, 16, 10, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (32, 16, 11, N'Exception handling improves reliability')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (33, 17, 12, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (34, 17, 13, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (35, 18, 14, N'Interfaces provide abstraction')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (36, 18, 15, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (37, 19, 16, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (38, 19, 17, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (39, 20, 18, N'SQL is used for querying data')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (40, 20, 19, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (41, 21, 20, N'Encapsulation keeps data safe')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (42, 21, 21, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (43, 22, 1, N'True')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (44, 22, 2, N'C')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (45, 23, 3, N'Exception handling uses try-catch')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (46, 23, 4, N'A')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (47, 24, 5, N'False')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (48, 24, 6, N'Database normalization removes redundancy')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (49, 25, 7, N'B')
GO
INSERT [dbo].[StudentAnswer] ([QuestionID], [ExamID], [StdID], [Answer]) VALUES (50, 25, 8, N'Pointers are risky but powerful')
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (1, 1, 85)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (1, 2, 82)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (1, 3, 69)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (1, 12, 83)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (1, 13, 88)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (2, 2, 78)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (2, 3, 89)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (2, 4, 93)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (2, 13, 68)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (2, 14, 62)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (3, 3, 92)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (3, 4, 77)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (3, 5, 58)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (3, 14, 90)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (3, 15, 95)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (4, 4, 70)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (4, 5, 84)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (4, 6, 86)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (4, 15, 72)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (4, 16, 74)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (5, 5, 88)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (5, 6, 60)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (5, 7, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (5, 16, 96)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (5, 17, 81)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (6, 6, 60)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (6, 7, 91)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (6, 8, 78)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (6, 17, 59)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (6, 18, 85)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (7, 7, 73)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (7, 8, 71)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (7, 18, 81)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (7, 19, 70)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (8, 8, 91)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (8, 9, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (8, 19, 87)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (8, 20, 90)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (9, 9, 65)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (9, 10, 67)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (9, 20, 66)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (9, 21, 63)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (10, 1, 87)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (10, 10, 80)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (10, 11, 94)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (10, 21, 93)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 1, 75)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 2, 76)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 11, 77)
GO
INSERT [dbo].[StudentCourse] ([CourseID], [StudentID], [StdCrsDegree]) VALUES (11, 12, 79)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (1, 1, 17, 1)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (1, 13, 16, 1)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (2, 2, 8, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (2, 14, 14, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (3, 3, 6, 3)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (3, 15, 13, 3)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (4, 4, 15, 4)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (4, 16, 15, 4)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (5, 5, 12, 5)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (5, 17, 12, 5)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (6, 6, 9, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (6, 18, 17, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (7, 7, 11, 7)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (7, 19, 11, 7)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (8, 8, 13, 8)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (8, 20, 14, 8)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (9, 9, 14, 9)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (9, 21, 13, 9)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (10, 1, 17, 10)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (10, 10, 10, 10)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (11, 2, 7, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (11, 11, 8, 10)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (12, 3, 5, 1)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (12, 12, 7, 1)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (13, 3, NULL, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (13, 4, 6, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (13, 13, 9, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (14, 5, 7, 3)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (14, 14, 6, 3)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (15, 6, 9, 4)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (15, 15, 7, 4)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (16, 7, 6, 5)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (16, 16, 5, 5)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (17, 8, 7, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (17, 17, 6, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (18, 9, 8, 7)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (18, 18, 8, 7)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (19, 19, 7, 8)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (20, 20, 8, 9)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (21, 21, 7, 10)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (22, 1, 12, 19)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (23, 2, 20, 1)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (24, 3, 18, 2)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (25, 4, 17, 3)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (26, 5, 26, 4)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (27, 6, 12, 5)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (28, 7, 16, 6)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (29, 8, 18, 7)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (30, 9, 22, 8)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (31, 10, 19, 9)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (32, 11, 27, 10)
GO
INSERT [dbo].[StudentExam] ([ExamID], [StdID], [StdExamDegree], [courseid]) VALUES (33, 12, 10, 8)
GO
SET IDENTITY_INSERT [dbo].[Track] ON 
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (0, N'full stack .net', 10, 1)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (1, N'full stack java', 20, 2)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (2, N'data analysis', 30, 3)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (3, N'cyber security', 40, 4)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (4, N'ai & machine learning', 50, 5)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (5, N'full stack .net', 10, 1)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (6, N'full stack java', 20, 2)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (7, N'data analysis', 30, 3)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (8, N'cyber security', 40, 4)
GO
INSERT [dbo].[Track] ([ID], [Name], [DeptID], [TMID]) VALUES (9, N'ai & machine learning', 50, 5)
GO
SET IDENTITY_INSERT [dbo].[Track] OFF
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (0, 0)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (0, 7)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (0, 9)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (1, 0)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (1, 2)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (1, 7)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (1, 8)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (1, 9)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 0)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 2)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 4)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 9)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 23)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (2, 24)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (3, 0)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (3, 2)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (3, 5)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (3, 10)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (4, 0)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (4, 4)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (4, 6)
GO
INSERT [dbo].[TrackCourse] ([TrackID], [CourseID]) VALUES (4, 9)
GO
SET IDENTITY_INSERT [Person].[Instructor] ON 
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (0, N'Mohamed Ali', 120)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (1, N'Dina Elmasry', 150)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (2, N'Youssef Mostafa', 180)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (3, N'Layla Adel', 200)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (4, N'Walid Tarek', 240)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (5, N'Noha Sami', 270)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (6, N'Mohamed Ali', 120)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (7, N'Dina Elmasry', 150)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (8, N'Youssef Mostafa', 180)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (9, N'Layla Adel', 200)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (10, N'Walid Tarek', 240)
GO
INSERT [Person].[Instructor] ([ID], [Name], [userID]) VALUES (11, N'Noha Sami', 270)
GO
SET IDENTITY_INSERT [Person].[Instructor] OFF
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (1, N'Ahmed', N'Hassan', 10, 0, 0, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (2, N'Sara', N'Mahmoud', 20, 0, 0, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (3, N'Ibrahim', N'Adel', 50, 0, 0, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (4, N'Tarek', N'Nabil', 70, 0, 0, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (5, N'Reem', N'Kamal', 100, 0, 0, 1)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (6, N'Fatma', N'Naguib', 110, 1, 1, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (7, N'Alaa', N'Yassin', 140, 1, 1, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (8, N'Mostafa', N'Shawky', 170, 1, 1, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (9, N'Yara', N'Magdy', 190, 1, 1, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (10, N'Khaled', N'Mansour', 210, 1, 1, 2)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (11, N'Shady', N'Roshdy', 240, 2, 2, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (12, N'Mariam', N'Anwar', 270, 2, 2, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (13, N'Ayman', N'Galal', 290, 2, 2, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (14, N'Samir', N'Zohdy', 310, 2, 2, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (15, N'Dalia', N'Elhady', 340, 2, 2, 3)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (16, N'Salim', N'Gawish', 370, 3, 3, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (17, N'Mahmoud', N'Ghoneim', 390, 3, 3, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (18, N'Hossam', N'Gabr', 410, 3, 3, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (19, N'Adel', N'Badr', 440, 3, 3, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (20, N'Tamer', N'Fathi', 470, 3, 3, 4)
GO
INSERT [Person].[Student] ([ID], [FName], [LName], [UserID], [IntakeID], [BranchID], [TMID]) VALUES (21, N'Ramy', N'Ehab', 490, 4, 4, 5)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (1, N'menna.fathy@example.com', N'menna fathy', 4)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (2, N'nourhan.youssef@example.com', N'nourhan youssef', 8)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (3, N'rania.helmy@example.com', N'rania helmy', 16)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (4, N'esraa.nader@example.com', N'esraa nader', 20)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (5, N'karim.lotfy@example.com', N'karim lotfy', 13)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (6, N'hany.zaki@example.com', N'hany zaki', 23)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (7, N'nahla.said@example.com', N'nahla said', 26)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (8, N'heba.rami@example.com', N'heba rami', 30)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (9, N'ziad.ashraf@example.com', N'ziad ashraf', 33)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (10, N'yasmine.adel@example.com', N'yasmine adel', 36)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (11, N'malak.tamer@example.com', N'malak tamer', 40)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (12, N'thabet.yehia@example.com', N'thabet yehia', 43)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (13, N'rana.abdallah@example.com', N'rana abdallah', 46)
GO
INSERT [Person].[TrainingManager] ([ID], [Email], [Name], [UserID]) VALUES (14, N'lamia.reda@example.com', N'lamia reda', 50)
GO
SET IDENTITY_INSERT [Person].[UserTable] ON 
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (10, N'ahmed hassan', N'ahmed123', N'Student', N'ahmed.hassan@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (20, N'sara mahmoud', N'sara456', N'Student', N'sara.mahmoud@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (30, N'mohamed ali', N'mohamed789', N'Instructor', N'mohamed.ali@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (40, N'menna fathy', N'menna321', N'Training Manager', N'menna.fathy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (50, N'ibrahim adel', N'ibrahim654', N'Student', N'ibrahim.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (60, N'dina elmasry', N'dina987', N'Instructor', N'dina.elmasry@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (70, N'tarek nabil', N'tarek111', N'Student', N'tarek.nabil@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (80, N'nourhan youssef', N'nourhan222', N'Training Manager', N'nourhan.youssef@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (90, N'youssef mostafa', N'youssef333', N'Instructor', N'youssef.mostafa@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (100, N'reem kamal', N'reem444', N'Student', N'reem.kamal@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (110, N'hossam gabr', N'hossam555', N'Student', N'hossam.gabr@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (120, N'layla adel', N'layla666', N'Instructor', N'layla.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (130, N'karim lotfy', N'karim777', N'Training Manager', N'karim.lotfy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (140, N'fatma naguib', N'fatma888', N'Student', N'fatma.naguib@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (150, N'walid tarek', N'walid999', N'Instructor', N'walid.tarek@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (160, N'rania helmy', N'rania000', N'Training Manager', N'rania.helmy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (170, N'alaa yassin', N'alaa101', N'Student', N'alaa.yassin@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (180, N'noha sami', N'noha202', N'Instructor', N'noha.sami@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (190, N'mostafa shawky', N'mostafa303', N'Student', N'mostafa.shawky@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (200, N'esraa nader', N'esraa404', N'Training Manager', N'esraa.nader@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (210, N'adel badr', N'adel505', N'Student', N'adel.badr@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (220, N'mai fouad', N'mai606', N'Instructor', N'mai.fouad@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (230, N'hany zaki', N'hany707', N'Training Manager', N'hany.zaki@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (240, N'yara magdy', N'yara808', N'Student', N'yara.magdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (250, N'omar fekry', N'omar909', N'Instructor', N'omar.fekry@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (260, N'nahla said', N'nahla010', N'Training Manager', N'nahla.said@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (270, N'khaled mansour', N'khaled121', N'Student', N'khaled.mansour@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (280, N'mirna saber', N'mirna232', N'Instructor', N'mirna.saber@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (290, N'shady roshdy', N'shady343', N'Student', N'shady.roshdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (300, N'heba rami', N'heba454', N'Training Manager', N'heba.rami@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (310, N'tamer fathi', N'tamer565', N'Student', N'tamer.fathi@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (320, N'nadine ayman', N'nadine676', N'Instructor', N'nadine.ayman@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (330, N'ziad ashraf', N'ziad787', N'Training Manager', N'ziad.ashraf@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (340, N'mariam anwar', N'mariam898', N'Student', N'mariam.anwar@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (350, N'fady kamel', N'fady909', N'Instructor', N'fady.kamel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (360, N'yasmine adel', N'yasmine010', N'Training Manager', N'yasmine.adel@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (370, N'ayman galal', N'ayman121', N'Student', N'ayman.galal@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (380, N'nesma khalil', N'nesma232', N'Instructor', N'nesma.khalil@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (390, N'samir zohdy', N'samir343', N'Student', N'samir.zohdy@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (400, N'malak tamer', N'malak454', N'Training Manager', N'malak.tamer@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (410, N'ramy ehab', N'ramy565', N'Student', N'ramy.ehab@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (420, N'hagar osama', N'hagar676', N'Instructor', N'hagar.osama@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (430, N'thabet yehia', N'thabet787', N'Training Manager', N'thabet.yehia@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (440, N'dalia elhady', N'dalia898', N'Student', N'dalia.elhady@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (450, N'bassel nashaat', N'bassel909', N'Instructor', N'bassel.nashaat@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (460, N'rana abdallah', N'rana010', N'Training Manager', N'rana.abdallah@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (470, N'salim gawish', N'salim121', N'Student', N'salim.gawish@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (480, N'huda refaat', N'huda232', N'Instructor', N'huda.refaat@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (490, N'mahmoud ghoneim', N'mahmoud343', N'Student', N'mahmoud.ghoneim@example.com')
GO
INSERT [Person].[UserTable] ([ID], [Name], [Password], [Role], [Email]) VALUES (500, N'lamia reda', N'lamia454', N'Training Manager', N'lamia.reda@example.com')
GO
SET IDENTITY_INSERT [Person].[UserTable] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unq_UserTable_Email]    Script Date: 5/5/2025 3:25:13 PM ******/
ALTER TABLE [Person].[UserTable] ADD  CONSTRAINT [unq_UserTable_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unq_usertable_name]    Script Date: 5/5/2025 3:25:13 PM ******/
ALTER TABLE [Person].[UserTable] ADD  CONSTRAINT [unq_usertable_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD  DEFAULT ('2025-01-01') FOR [Date]
GO
ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD  CONSTRAINT [FK_BranchTable_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_BranchTable_TrainingManager_TMID]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [Person].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[Exam]  WITH NOCHECK ADD  CONSTRAINT [FK_Exam_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course_CourseID]
GO
ALTER TABLE [dbo].[ExamType]  WITH NOCHECK ADD  CONSTRAINT [FK_ExamType_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamType] CHECK CONSTRAINT [FK_ExamType_Exam_ExamID]
GO
ALTER TABLE [dbo].[Intake]  WITH NOCHECK ADD  CONSTRAINT [FK_Intake_TrainingManager_ID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Intake] CHECK CONSTRAINT [FK_Intake_TrainingManager_ID]
GO
ALTER TABLE [dbo].[IntakeTrack]  WITH NOCHECK ADD  CONSTRAINT [FK_IntakeTrack_Intake_IntakeID] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [dbo].[IntakeTrack] CHECK CONSTRAINT [FK_IntakeTrack_Intake_IntakeID]
GO
ALTER TABLE [dbo].[IntakeTrack]  WITH NOCHECK ADD  CONSTRAINT [FK_IntakeTrack_Track_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[IntakeTrack] CHECK CONSTRAINT [FK_IntakeTrack_Track_TrackID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionPick_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_Exam_ExamID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionPick_Instructor_InstID] FOREIGN KEY([InstID])
REFERENCES [Person].[Instructor] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_Instructor_InstID]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionPick_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [FK_QuestionPick_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[QuestionType]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionType_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionType] CHECK CONSTRAINT [FK_QuestionType_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAnswer_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Exam_ExamID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAnswer_QuestionPool_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_QuestionPool_QuestionID]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAnswer_Student_StdID] FOREIGN KEY([StdID])
REFERENCES [Person].[Student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Student_StdID]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentCourse_Course_courseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course_courseID]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentCourse_Student_studentID] FOREIGN KEY([StudentID])
REFERENCES [Person].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student_studentID]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [fk_studentexam_course_courseid] FOREIGN KEY([courseid])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [fk_studentexam_course_courseid]
GO
ALTER TABLE [dbo].[StudentExam]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentExam_Exam_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exam_ExamID]
GO
ALTER TABLE [dbo].[StudentExam]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentExam_Student_StdID] FOREIGN KEY([StdID])
REFERENCES [Person].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Student_StdID]
GO
ALTER TABLE [dbo].[Track]  WITH NOCHECK ADD  CONSTRAINT [FK_Track_Department_DeptID] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_Track_Department_DeptID]
GO
ALTER TABLE [dbo].[Track]  WITH NOCHECK ADD  CONSTRAINT [FK_Track_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_Track_TrainingManager_TMID]
GO
ALTER TABLE [dbo].[TrackCourse]  WITH NOCHECK ADD  CONSTRAINT [FK_TrackCourse_Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[TrackCourse] CHECK CONSTRAINT [FK_TrackCourse_Course_CourseID]
GO
ALTER TABLE [dbo].[TrackCourse]  WITH NOCHECK ADD  CONSTRAINT [FK_TrackCourse_Track_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([ID])
GO
ALTER TABLE [dbo].[TrackCourse] CHECK CONSTRAINT [FK_TrackCourse_Track_TrackID]
GO
ALTER TABLE [Person].[Instructor]  WITH NOCHECK ADD  CONSTRAINT [FK_Instructor_UserTable_userID] FOREIGN KEY([userID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[Instructor] CHECK CONSTRAINT [FK_Instructor_UserTable_userID]
GO
ALTER TABLE [Person].[Student]  WITH NOCHECK ADD  CONSTRAINT [FK_Student_Branch_branchID] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_Branch_branchID]
GO
ALTER TABLE [Person].[Student]  WITH NOCHECK ADD  CONSTRAINT [FK_Student_Intake_IntakeID] FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_Intake_IntakeID]
GO
ALTER TABLE [Person].[Student]  WITH NOCHECK ADD  CONSTRAINT [FK_Student_TrainingManager_TMID] FOREIGN KEY([TMID])
REFERENCES [Person].[TrainingManager] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_TrainingManager_TMID]
GO
ALTER TABLE [Person].[Student]  WITH NOCHECK ADD  CONSTRAINT [FK_Student_UserTable_userID] FOREIGN KEY([UserID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[Student] CHECK CONSTRAINT [FK_Student_UserTable_userID]
GO
ALTER TABLE [Person].[TrainingManager]  WITH NOCHECK ADD  CONSTRAINT [FK_TrainingManager_UserTable_UserID] FOREIGN KEY([UserID])
REFERENCES [Person].[UserTable] ([ID])
GO
ALTER TABLE [Person].[TrainingManager] CHECK CONSTRAINT [FK_TrainingManager_UserTable_UserID]
GO
ALTER TABLE [dbo].[Course]  WITH NOCHECK ADD  CONSTRAINT [Check_Degree_Max_Min] CHECK  (([MinDegree]<=[MaxDegree]))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Check_Degree_Max_Min]
GO
ALTER TABLE [dbo].[QuestionPick]  WITH NOCHECK ADD  CONSTRAINT [Check_Degree] CHECK  (([Degree]>=(0)))
GO
ALTER TABLE [dbo].[QuestionPick] CHECK CONSTRAINT [Check_Degree]
GO
ALTER TABLE [dbo].[StudentExam]  WITH NOCHECK ADD  CONSTRAINT [CK_StudentExam_Degree_Valid] CHECK  (([StdExamDegree]>=(0)))
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [CK_StudentExam_Degree_Valid]
GO
ALTER TABLE [Person].[UserTable]  WITH CHECK ADD  CONSTRAINT [chk_UserRole] CHECK  (([Role]='Instructor' OR [Role]='Student' OR [Role]='Training Manager'))
GO
ALTER TABLE [Person].[UserTable] CHECK CONSTRAINT [chk_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[AddStudent_Prc]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AllowStdToExam]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteStudent_Prc]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteStudent_Prc]
    @StudentID INT 
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

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
/****** Object:  StoredProcedure [dbo].[GetExamByCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[GetExamByCourse] @CourseID int
as
	begin
		Select ID 'Exam ID', [Year], Start_Time, End_Time,TotalDegree,[Date]
		from Exam
		where CourseID = @CourseID
	end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentExamResult]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[GetStudentExamResult] @StdID int
as
	begin
		select StdExamDegree
		from StudentExam
		where StdID = @StdID
	end
GO
/****** Object:  StoredProcedure [dbo].[gettop10studentsbycoursename]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gettop10studentsbycoursename]
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
/****** Object:  StoredProcedure [dbo].[PC_GetBranchFromTMName]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsInBranch]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PC_GetStudentsInIntake]    Script Date: 5/5/2025 3:25:13 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RemoveInstructorCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create   proc [dbo].[RemoveInstructorCourse]
			@InstID int,
			@CourseID int
as
	begin
				if not exists (
				select 1
				from Course
				where ID = @CourseID
				)
			THROW 50000, 'This course is not assigned to an Istructor.', 1;
		else if not exists (
				select 1
				from Person.Instructor
				where ID = @InstID
				)
			THROW 50000, 'Invalid Instructor ID.', 1;
		else if not exists (
				select 1
				from Course
				where InstructorID = @InstID and ID = @CourseID
				)
			THROW 50000, 'There is no Instructor teaches that course.', 1;

		else
			begin
					begin try
						begin transaction
							update Course
							set InstructorID = null
							where InstructorID = @InstID 
							and ID = @CourseID;
							PRINT 'Instructor was deleted from course successfully';
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
				end
	end
GO
/****** Object:  StoredProcedure [dbo].[SelectRandomQuestionsForExam]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[SelectRandomQuestionsForExam]
    @Type nvarchar(20),
    @Count int
as
begin
    set nocount on;

    select top (@Count) qp.ID as QuestionID, qp.Question
    from [dbo].[QuestionPool] qp
    inner join [dbo].[QuestionType] qt on qp.ID = qt.QuestionID
    where qt.Type = @Type
    order by newid();
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddQuestionAndType]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_AddQuestionAndType]
		@corectAnswer nvarchar(max),
		@Question nvarchar(max),
		@Type nvarchar(20),
		@Option nvarchar(200) = null
as
	begin
		begin try
			begin transaction
			declare @QID int = (select MAX(ID) from QuestionPool)+1
			if(@Type not in ('Multiple Choice','True/False','Text'))
				THROW 50000, 'Type of the question should be Multiple Choice or True/False or Text .', 1;
			if (@corectAnswer is null or LEN(@corectAnswer)= 0)
				THROW 50000, 'Every question must have Correct Answer.', 1;
			if((@Type = 'True/False' or @Type = 'Text') and @Option is not null)
				THROW 50000, 'Only Multiple Choice Questions can have Option.', 1;
			if(@Type = 'True/False' and @corectAnswer not in ('True','False'))
				THROW 50000, 'Invalid answer for True/False questions.', 1;			
			if(@Type = 'Multiple Choice')
				begin
					if(@Option is null)
						THROW 50000, 'Multiple Choice Questions must have Option.', 1;
					else 
						begin 
							declare @OptionCount int = 
								(len(@option) - len(replace(@option,',','')))+1;
							if(@OptionCount < 2)
								THROW 50000, 'Options of Multiple Choice Questions must be at least 2.', 1;	
						end
				end
				insert into QuestionPool(ID,correctAnswer,Question,Options)
				values (@QID,@corectAnswer,@Question,@Option)

				insert into QuestionType(QuestionID,Type)
				values(@QID, @Type)

				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch	
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTrack]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AddTrack] 	
    @track_name NVARCHAR(100),
    @department_id INT,
    @TrainingManager_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

    

     IF EXISTS (SELECT 1 FROM Track WHERE Name = @track_name)
        BEGIN
            PRINT('Track name already exists!');
            RETURN;
        END;

     
        IF NOT EXISTS (SELECT 1 FROM Person.TrainingManager WHERE ID = @TrainingManager_id)
        BEGIN
            PRINT('Invalid Training Manager ID!');
            RETURN;
        END;


        INSERT INTO Track (Name, DeptID, TMID)
        VALUES (@track_name, @department_id, @TrainingManager_id);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignCourseToInstructor]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_AssignCourseToInstructor] 
        @InstID int,
        @CourseID int
as
    begin
        if not exists (
                select 1
                from Course
                where ID = @CourseID
                )
            THROW 50000, 'You must enter a valid course.', 1;
        else if not exists (
                select 1
                from Person.Instructor
                where ID = @InstID
                )
            THROW 50000, 'No Instructor with this ID.', 1;
        else if exists (
                select 1
                from Course
                where InstructorID = @InstID and ID = @CourseID
                )
            THROW 50000, 'This instructor is already assigned to the course.', 1;

        else
            begin
                    begin try
                        begin transaction
                            update Course
                            set InstructorID = @InstID
                            where ID = @CourseID
                            PRINT 'Instructor Assigned to course successfully';
                            commit;
                    end try
                    begin catch
                        rollback;
                        print 'Error Occured:' + ERROR_MESSAGE();
                    end catch
                end
    end


GO
/****** Object:  StoredProcedure [dbo].[sp_CreateExamAndType]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[sp_CreateExamAndType]
	@ExamType nvarchar(20),
	@date date,
	@start_time Time(0),
	@end_time Time(0),
	@TotalDegree int,
	@CourseName nvarchar(30)
as
begin
	DECLARE @DurationMinutes INT = DATEDIFF(MINUTE, @start_time, @end_time);


	if(@DurationMinutes > 120)
		print 'The Exam duration must be two hours or less'
	else if(@TotalDegree > 100)
		begin
			RAISERROR('Exam degree exceeds course limit!', 16, 1);
			RETURN;
		end
	else if	(@CourseName not in (select [Name] from Course))
		print 'Please select a valid Course Name'
	else if(@ExamType not in ('Exam','Corrective'))
		print 'The exam Type must be either Exam or Corrective'
	else
	begin
		begin try
			begin transaction
			Insert into Exam
			Values (Year(GETDATE()),@start_time ,@end_time,@TotalDegree,
						dbo.getCourseID(@CourseName),@date)

			declare @ExamID int = SCOPE_IDENTITY();
			insert into ExamType values(@ExamID,@ExamType)
			commit
			print('Exam and ExamType inserted succefully')
		end try
		begin catch
			rollback
			print 'An error occurred: '+ Error_MESSAGE();
		end catch
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExamParticipationReport]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_ExamParticipationReport]
    @ExamID int
as
begin
    select 
        s.ID as StudentID,
        s.fname+' '+s.lname as StudentName,
        case 
            when exists (
                select 1 from StudentAnswer sa 
                where sa.StdID = s.ID and sa.ExamID = @ExamID
            ) then 'Taken'
            else 'Not Taken'
        end as ExamStatus
    from person.student s;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCourses]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_GetAllCourses]
	as
		begin
			select *
			from Course
			order by Name
		end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAVGDegrees]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetAVGDegrees]
    @CourseName nvarchar(30)
AS
BEGIN
    DECLARE @CourseID int;

    -- Retrieve CourseID based on CourseName
    SELECT top 1 @CourseID = ID 
    FROM dbo.Course 
    WHERE [Name] = @CourseName;

    -- Check if the course exists
    IF @CourseID IS NULL
    BEGIN
        RAISERROR('Course with name ''%s'' does not exist.', 16, 1, @CourseName);
        RETURN;
    END;

    -- Query to get exam summary
    SELECT 
        e.ID AS ExamID,
        COUNT(DISTINCT sa.StdID) AS StudentsTaken,
        AVG(CAST(CASE 
                    WHEN sa.Answer = qp.correctAnswer THEN qpPick.Degree
                    ELSE 0
                 END AS float)) AS AvgScore
    FROM dbo.Exam e
    LEFT JOIN dbo.StudentAnswer sa ON e.ID = sa.ExamID
    LEFT JOIN dbo.QuestionPool qp ON sa.QuestionID = qp.ID
    LEFT JOIN dbo.QuestionPick qpPick ON sa.QuestionID = qpPick.QuestionID 
                                     AND sa.ExamID = qpPick.ExamID
    WHERE e.CourseID = @CourseID
    GROUP BY e.ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAVGDegreesByCrsName]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetAVGDegreesByCrsName]
    @CourseName nvarchar(30)
AS
BEGIN
    DECLARE @CourseID int;

    -- Retrieve CourseID based on CourseName
    SELECT top 1 @CourseID = ID 
    FROM dbo.Course 
    WHERE [Name] = @CourseName;

    -- Check if the course exists
    IF @CourseID IS NULL
    BEGIN
        RAISERROR('Course with name ''%s'' does not exist.', 16, 1, @CourseName);
        RETURN;
    END;

    -- Query to get exam summary
    SELECT 
        e.ID AS ExamID,
        COUNT(DISTINCT sa.StdID) AS StudentsTaken,
        AVG(CAST(CASE 
                    WHEN sa.Answer = qp.correctAnswer THEN qpPick.Degree
                    ELSE 0
                 END AS float)) AS AvgScore
    FROM dbo.Exam e
    LEFT JOIN dbo.StudentAnswer sa ON e.ID = sa.ExamID
    LEFT JOIN dbo.QuestionPool qp ON sa.QuestionID = qp.ID
    LEFT JOIN dbo.QuestionPick qpPick ON sa.QuestionID = qpPick.QuestionID 
                                     AND sa.ExamID = qpPick.ExamID
    WHERE e.CourseID = @CourseID
    GROUP BY e.ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCourseExamSummary]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[sp_GetCourseExamSummary]
    @CourseID INT
as
begin
    if not exists (select 1 from dbo.Course where ID = @CourseID)
    begin
        raiserror('Course ID %d does not exist.', 16, 1, @CourseID);
        return;
    end

    select 
        e.ID as ExamID,
        count(distinct sa.StdID) as StudentsTaken,
        avg(cast(dbo.Calculate_Student_Degree(sa.StdID, e.ID) as float)) as AvgScore
    from dbo.Exam e
    left join dbo.StudentAnswer sa on e.ID = sa.ExamID
    where e.CourseID = @CourseID
    group by e.ID;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCoursesByInstructor]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_GetCoursesByInstructor] @InstID int
as
	begin
		if not exists (
				select 1
				from Person.Instructor
				where ID = @InstID
				)
			THROW 50000, 'Invalid Instructor ID.', 1;
		 else if not exists (
				select 1
				from Course
				where ID = @InstID 
				)
			THROW 50000, 'This Instructor does not teach a course.', 1;
		else
			begin
				select C.InstructorID,I.Name,C.ID, C.Name
                from Course C inner join Person.Instructor I
                on I.ID = C.InstructorID
                where C.InstructorID = @InstID
                order by c.Name
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInstructorLoad]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetInstructorLoad]
    @InstructorID INT
AS
BEGIN
    SELECT 
        i.Name AS InstructorName,
        c.ID AS CourseID,
        c.Name AS CourseName,
        COUNT(DISTINCT sc.StudentID) AS TotalStudents
    FROM dbo.Course c
    JOIN Person.Instructor i ON c.InstructorID = i.ID
    LEFT JOIN dbo.StudentCourse sc ON c.ID = sc.CourseID
    WHERE c.InstructorID = @InstructorID
    GROUP BY i.Name, c.ID, c.Name;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_PickQuestions]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_PickQuestions]
		@QSID int,
		@ExamID int,
		@InstID int,
		@Degree int
as
	begin
		declare @ExamDegree int =(
			select TotalDegree
			from Exam
			where ID = @ExamID
			) 
		declare @ExamCourseID int =(
			select CourseID 
			from Exam 
			where ID = @ExamID
			)
		declare @QuestionIDs table(ID int); 
		insert into @QuestionIDs 
		select ID 
		from getQSforCourse(@ExamCourseID);

		if not exists (
			SELECT 1
			FROM Course
			WHERE InstructorID = @InstID AND ID = @ExamCourseID
			)
			 THROW 50000, 'Instructor and Exam should be of the same Course.', 1;
		else if not exists (select 1 from @QuestionIDs where ID = @QSID)
			 THROW 50000, 'Choose Question related to the course.', 1;
		else if(@Degree > @ExamDegree)
			 THROW 50000, 'Question Degree must not exceed Exam degree.', 1;
		else
			begin
				begin try
					begin transaction
						insert into QuestionPick
						values(@QSID, @ExamID, @InstID, @Degree)

						commit;
						print 'You picked a question for exam successfully'
				end try
				begin catch
					rollback;
					print 'An error occurred: '+ Error_MESSAGE();
				end catch
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectStudentToExam]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   proc [dbo].[sp_selectStudentToExam] 
		@StdID int,
		@ExamID int,
		@CourseID int
as
	begin 
		if not exists (
				select 1 
				from StudentCourse
				where StudentID = @StdID and CourseID = @CourseID 
			)
			THROW 50000, 'Enter valid Student that takes this course.', 1;
		else
		begin
			begin try
				begin transaction
					insert into StudentExam (ExamID,StdID,courseid)
					Values(@ExamID, @StdID,@CourseID)
					
					commit;
					print 'Student selected to exam successfully'
			end try
			begin catch
				rollback;
				print 'Error Occured:' + ERROR_MESSAGE();
			end catch
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_StoreStudentAnswer]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc [dbo].[sp_StoreStudentAnswer]
		@QID int,
		@ExamID int,
		@StdID int,
		@Answer nvarchar(max)
as
	begin
		declare @Type nvarchar(20) = (select Type
									from QuestionType
									where QuestionID = @QID)
		if(@Type = 'True/False'and @Answer not in('True','False'))
			THROW 50000, 'Must answer with True or false', 1;
		if not exists(
				select 1
				from StudentExam
				where ExamID = @ExamID 
				)
			THROW 50000,'Invalid Exam ID.', 1;	
		if not exists(
				select 1
				from StudentExam
				where StdID = @StdID
				)
			THROW 50000,'Invalid Student ID.', 1;	
		else if not exists(
				select 1
				from QuestionPool
				where ID = @QID
				)
			THROW 50000,'Invalid Question ID.', 1;	
		else
			begin
					begin try
						begin transaction
							insert into StudentAnswer
							values(@QID,@ExamID,@StdID,@Answer)
							print 'your answer was added succefully'
							commit;
					end try
					begin catch
						rollback;
						print 'Error Occured:' + ERROR_MESSAGE();
					end catch
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCorrectAnswer]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[sp_UpdateCorrectAnswer] 
		@QuestionID int,
		@newCorrectAnswer nvarchar(max)
as
	begin
		declare @Type nvarchar(20)=(
									select [Type]
									from QuestionType
									where QuestionID = @QuestionID
									);
		begin try
			begin transaction
				if (@newCorrectAnswer is null or LEN(@newCorrectAnswer)= 0)
					THROW 50000, 'Every question must have Correct Answer.', 1;
				if(@Type = 'True/False' and @newCorrectAnswer not in ('True','False'))
					THROW 50000, 'Invalid answer for True/False questions.', 1;	
				if(@Type = 'Text'or @Type = 'Multiple Choice' and @newCorrectAnswer in ('True','False'))
					THROW 50000, 'This answer is for True/False questions only.', 1;	
				
				update QuestionPool
				set correctAnswer = @newCorrectAnswer
				where ID = @QuestionID
				print 'New answer updated succefully'
				commit;
		end try
		begin catch
			rollback;
			print 'Error Occured: ' + ERROR_MESSAGE();
		end catch
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseDegreeRange]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[UpdateCourseDegreeRange] 
	@CourseID int,
	@MaxDegree int,
	@MinDegree int
as
	begin
		if(@MinDegree > @MaxDegree)
			THROW 50000, 'Invalid Range of degrees.', 1;
		else if not exists (
				select 1
				from Course
				where ID = @CourseID
				)
			THROW 50000, 'There is no course with this ID.', 1;
			else
			begin
				begin try
					begin transaction
						update Course
						set MaxDegree = @MaxDegree, MinDegree = @MinDegree
						where ID = @CourseID;
						PRINT 'Course degree range updated successfully';
						commit;
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateExamTime]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   proc [dbo].[UpdateExamTime] 
			@ExamID int,
			@Start_Time Time(0),
			@End_Time Time(0)
as
	begin
	DECLARE @DurationMinutes INT = DATEDIFF(MINUTE, @start_time, @end_time);
		if(@DurationMinutes > 120)
		print 'The Exam duration must be two hours or less'
		else
			begin
				begin try 
					begin transaction
						update Exam
						set Start_Time = @Start_Time ,
						End_Time = @End_Time,
						[Year] = Year(GETDATE())
						where ID = @ExamID
						commit;
						print 'Exam time updated successfully'
				end try
				begin catch
					rollback;
					print 'Error Occured:' + ERROR_MESSAGE();
				end catch
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentExamDegree]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc [dbo].[UpdateStudentExamDegree]
		@ExamID int,
		@StdID int,
		@newDegree int
as
	begin
		declare @TotalDegree int = (select TotalDegree
											from Exam
											where ID = @ExamID) 
		if(@newDegree > @TotalDegree)
			THROW 50000, 'Degree must not exceed total exam degree.', 1;
		else
			begin
			begin try
				begin transaction
					update StudentExam
					set StdExamDegree = @newDegree
					where ExamID = @ExamID and StdID = @StdID
					commit;
					print 'Student degree updated succefully'
			end try
			begin catch
				rollback;
				print 'Error Occured:' + ERROR_MESSAGE();
			end catch
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_AddCourse]
    @CourseName NVARCHAR(100),
    @Description NVARCHAR(500),
    @MaxDegree INT,
    @MinDegree INT,
	@TrackID INT,
	@InstID int
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

      
        ---IF IS_ROLEMEMBER('ManagerRole') = 0
--
      ---  BEGIN
       ---     RAISERROR('Access Denied! Only Training Managers can add courses.', 16, 1);
       ---     RETURN;
       --- END;

        
        IF EXISTS (SELECT 1 FROM Course WHERE Name = @CourseName)
        BEGIN
            RAISERROR('Course name already exists!', 16, 1);
            RETURN;
        END;

         IF NOT EXISTS (SELECT 1 FROM Track WHERE ID = @TrackID)
        BEGIN
            RAISERROR('Invalid Track ID!', 16, 1);
            RETURN;
        END;

		IF NOT EXISTS (SELECT 1 FROM Person.Instructor WHERE ID = @InstID)
        BEGIN
            RAISERROR('Invalid Instructor ID!', 16, 1);
            RETURN;
        END;

        INSERT INTO Course (Name, Description, MaxDegree, MinDegree,InstructorID)
        VALUES (@CourseName, @Description, @MaxDegree, @MinDegree,@InstID);

		DECLARE @NewCourseID INT = SCOPE_IDENTITY();

        INSERT INTO TrackCourse (TrackID, CourseID)
        VALUES ( @TrackID, @NewCourseID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_AddIntake]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_AddIntake]
    @Number INT,
    @TMID INT,
    @TrackID INT 
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

      
     
      

    
        IF @TrackID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Track WHERE ID = @TrackID)
        BEGIN
            RAISERROR('Invalid Track ID!', 16, 1);
            RETURN;
        END;


        
     
        IF EXISTS (
            SELECT 1 
            FROM Intake 
            WHERE Number = @Number
         
        )
        BEGIN
            RAISERROR('Intake already exists for this Number and track!', 16, 1);
            RETURN;
        END;

       
        INSERT INTO Intake (Number,TMID)
        VALUES (@Number,@TMID);

       
        DECLARE @NewIntakeID INT = SCOPE_IDENTITY();

    
        IF @TrackID IS NOT NULL
        BEGIN
            INSERT INTO IntakeTrack (IntakeID, TrackID)
            VALUES (@NewIntakeID, @TrackID);
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCourse]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_DeleteCourse]
    @CourseID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        
        IF IS_ROLEMEMBER('TrainingManager') = 0
        BEGIN
            RAISERROR('Access Denied! Only Training Managers can delete courses.', 16, 1);
            RETURN;
        END;

      
        IF NOT EXISTS (SELECT 1 FROM Course WHERE ID = @CourseID)
        BEGIN
            RAISERROR('Course not found!', 16, 1);
            RETURN;
        END;

        DELETE FROM TrackCourse 
        WHERE TrackID = @CourseID;

 
        DELETE FROM Course 
        WHERE ID = @CourseID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTrack]    Script Date: 5/5/2025 3:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------Delete Track-------------------------------
CREATE   PROCEDURE [dbo].[usp_DeleteTrack]
    @track_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM TRACKCOURSE 
        WHERE TrackID = @track_id;


        DELETE FROM Track 
        WHERE ID = @track_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
ALTER DATABASE [ExaminationSystemDB] SET  READ_WRITE 
GO
