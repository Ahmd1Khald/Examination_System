
CREATE OR ALTER PROCEDURE usp_AddCourse
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


-----------------check------------


EXEC usp_AddCourse 
    @CourseName = 'Data',
    @Description = 'Introduction to databases',
    @MaxDegree = 100,
    @MinDegree = 50,
    @TrackID = 2,
	@InstID = 2;