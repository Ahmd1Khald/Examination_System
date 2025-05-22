CREATE LOGIN AdminLogin WITH PASSWORD = 'Admin@123';
CREATE LOGIN ManagerLogin WITH PASSWORD = 'Manager@123';
CREATE LOGIN InstructorLogin WITH PASSWORD = 'Instructor@123';
CREATE LOGIN StudentLogin WITH PASSWORD = 'Student@123';


---------------------------------------
use ExaminationSystemDB

--------------------------------------
CREATE USER AdminUser FOR LOGIN AdminLogin;
CREATE USER ManagerUser FOR LOGIN ManagerLogin;
CREATE USER InstructorUser FOR LOGIN InstructorLogin;
CREATE USER StudentUser FOR LOGIN StudentLogin;


-------------------------------------------------

CREATE ROLE AdminRole;
CREATE ROLE ManagerRole;
CREATE ROLE InstructorRole;
CREATE ROLE StudentRole;


----------------------------------------------

EXEC sp_addrolemember 'AdminRole', 'AdminUser';
EXEC sp_addrolemember 'ManagerRole', 'ManagerUser';
EXEC sp_addrolemember 'InstructorRole', 'InstructorUser';
EXEC sp_addrolemember 'StudentRole', 'StudentUser';


-------------------------------------------

-- Admin: Full control
GRANT CONTROL ON DATABASE::ExaminationSystemDB TO AdminRole;

-- Manager: Limited to managing instructors, students, and courses
GRANT SELECT, INSERT, UPDATE, DELETE ON Person.Instructor TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Person.Student TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Course TO ManagerRole;

-- Instructor: Can access courses they teach and student performance
GRANT SELECT ON dbo.Course TO InstructorRole;
GRANT SELECT, INSERT, UPDATE ON dbo.Exam TO InstructorRole;

-- Student: Can only view their own information (you’ll need row-level security for this in full)
GRANT SELECT ON Person.Student TO StudentRole;
GRANT SELECT ON dbo.Exam TO StudentRole;

-- Optionally: revoke access from public to tighten security
REVOKE CONNECT FROM PUBLIC;