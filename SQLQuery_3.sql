IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'matilda')
BEGIN
    CREATE USER [matilda] FROM LOGIN [matilda];
    PRINT 'User matilda created successfully';
END
ELSE
BEGIN
    PRINT 'User matilda already exists';
END