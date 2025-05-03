alter PROCEDURE AssignInstructorToCourse
  @InstructorID INT,
  @CourseID INT
AS
BEGIN
 
  IF EXISTS (SELECT 1 FROM Person.Instructor WHERE ID = @InstructorID)
     AND EXISTS (SELECT 1 FROM Course WHERE ID = @CourseID)
  BEGIN

    IF NOT EXISTS (
      SELECT 1 FROM InstructorCourse 
      WHERE InstructorID = @InstructorID AND CourseID = @CourseID
    )
    BEGIN
      INSERT INTO InstructorCourse (InstructorID, CourseID)
      VALUES (@InstructorID, @CourseID);
    END
    ELSE
    BEGIN
      RAISERROR('This instructor is already assigned to this course.', 16, 1);
    END
  END
  ELSE
  BEGIN
    RAISERROR('Instructor or Course not found.', 16, 1);
  END
END;


EXEC AssignInstructorToCourse @InstructorID = 1, @CourseID = 17;


----select * from InstructorCourse
