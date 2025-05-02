
-- view users of database
SELECT name AS UserName, type_desc AS UserType
FROM sys.database_principals
WHERE type IN ('S', 'U', 'G') -- S = SQL user, U = Windows user, G = Windows group
  AND name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys');

go
create proc sp_StudentExam @fname nvarchar(20),@lname nvarchar(20),@examID int,@date date,@srart_time Time(0),@end_time Time(0)
as
begin
	select @fname = FName, @lname = LName, @examID = E.ID, @date = E.[Date],@srart_time = E.Start_Time,@end_time = E.End_Time
	from Person.Student S inner join StudentExam SE
	on S.ID = SE.StdID
	inner join Exam E
	on E.ID = SE.ExamID
end