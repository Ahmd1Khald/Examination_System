--- get all courses
exec sp_GetAllCourses

--- get AVG degrees by course name
exec sp_GetAVGDegreesByCrsName @CourseName = 'Network Administration';

--- form TM name get the branches 
PC_GetBranchFromTMName 'hany'

--- from branch name get student in
PC_GetStudentsInBranch 'main'

--- from intake number get student in	
PC_GetStudentsInIntake 43

--- from student id get its degrees
exec GetStudentExamResult 5



