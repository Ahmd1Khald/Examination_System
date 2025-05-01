create table IntakeTrack(
IntakeID int ,
TrackID int,
primary key (IntakeId,TrackId),

constraint FK_IntakeTrack_Intake_IntakeID
foreign key (IntakeID)
references Intake(ID),

constraint FK_IntakeTrack_Track_TrackID
foreign key (TrackID)
references Track(ID),
)