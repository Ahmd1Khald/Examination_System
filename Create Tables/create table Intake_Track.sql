create table Intake_Track(
intake_id int ,
track_id int,
primary key (intake_id,track_id),
foreign key (intake_id)references intake(id),
foreign key (track_id)references track(id)

)