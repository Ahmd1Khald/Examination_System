BULK INSERT Person.TrainingManager
FROM 'D:\ITI\SQL Project\Files\TM data.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2, -- Skip header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);