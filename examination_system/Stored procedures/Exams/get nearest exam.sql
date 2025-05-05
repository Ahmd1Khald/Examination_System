


create or alter proc sp_nearestExam
as
	begin
		select Top(1) *
		from vw_ExamSchedule
		where [Date] >= cast(GETDATE() as date)
		order by [Date], Start_Time
	end
exec sp_nearestExam