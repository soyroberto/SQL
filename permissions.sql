-- Check your current permissions in this database
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');
GO

-- Check specific table permissions
SELECT * FROM fn_my_permissions('dbo.MetroMEXdata-2025-04-30', 'OBJECT');
GO

GRANT SELECT ON [dbo].[MetroMEXdata-2025-04-30] TO [matilda];