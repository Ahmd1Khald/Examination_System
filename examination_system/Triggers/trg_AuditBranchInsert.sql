create trigger trg_AuditBranchInsert
on [dbo].[Branch]
after insert
as
begin
    print 'A new branch has been inserted.'
end

insert into [dbo].[Branch] (Name, Location, TMID)
values ('Test Branch', '123 Street', 1)
