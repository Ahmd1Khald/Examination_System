ALTER TABLE Person.UserTable
ADD CONSTRAINT chk_UserRole 
CHECK ([Role] IN ('Training Manager', 'Student', 'Instructor'));
