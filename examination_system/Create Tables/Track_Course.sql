Create table TrackCourse(
TrackID int,
CourseID int,

constraint pk_TrackCourse primary key (TrackID, CourseID),

constraint FK_TrackCourse_Track_TrackID foreign key (TrackID)
references Track(ID),

constraint FK_TrackCourse_Course_CourseID foreign key (CourseID)
references Course(ID),

)