create table IntakeTrack(
IntakeId int ,
TrackId int,
primary key (IntakeId,TrackId),
foreign key (IntakeId)references Intake(ID),
foreign key (TrackId)references Track(ID)

)