create nonclustered index IX_Student_Name 
ON Person.Student (FName,LName)


SELECT * 
FROM Person.Student
WHERE FName = 'Ahmed' AND LName = 'Hassan';







