

create function FN_GetCourseByTrack(@TrackID int)
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

select * from FN_GetCourseByTrack(4)