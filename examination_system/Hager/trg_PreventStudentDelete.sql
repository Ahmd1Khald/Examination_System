create trigger trg_PreventStudentDelete
on person.Student
instead of delete
as
begin
    IF EXISTS (
	select 1 from StudentAnswer where StdID in (select StdID from deleted)
	)
	begin
	   raiserror ('Cannot delete student with existing exam answers.', 16, 1)
	return
	end

	delete from Person.Student where ID in (select id from deleted)

end
delete from person.Student where ID = 5;

