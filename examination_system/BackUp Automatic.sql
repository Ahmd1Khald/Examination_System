DECLARE @DatabaseName NVARCHAR(100) = 'ExaminationSystemDB';
DECLARE @BackupFolder NVARCHAR(200) = 'C:\'; -- Ensure this folder exists and is writable
DECLARE @FileName NVARCHAR(300);
DECLARE @DateSuffix NVARCHAR(50);
DECLARE @SQL NVARCHAR(MAX);

-- Create date suffix for filename (Format: yyyy-MM-dd_HHmm)
SET @DateSuffix = FORMAT(GETDATE(), 'yyyy-MM-dd_HHmm');

-- Combine to form full backup file path
SET @FileName = @BackupFolder + @DatabaseName + '_' + @DateSuffix + '.bak';

-- Compose the dynamic SQL for backup
SET @SQL = '
BACKUP DATABASE [' + @DatabaseName + ']
TO DISK = N''' + @FileName + '''
WITH FORMAT, INIT,
     NAME = N''Full Backup of ' + @DatabaseName + ''',
     STATS = 10;
';

-- Execute the backup SQL
EXEC sp_executesql @SQL;
