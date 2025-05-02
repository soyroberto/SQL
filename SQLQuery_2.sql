-- View all users in the current database
SELECT * FROM sys.database_principals
WHERE type IN ('S', 'U', 'G', 'E') -- SQL users, Windows users, groups, external users
ORDER BY name;

-- More detailed view
SELECT 
    dp.name AS username,
    dp.type_desc AS user_type,
    dp.authentication_type_desc AS auth_type,
    dp.create_date,
    dp.modify_date
FROM sys.database_principals dp
WHERE dp.type IN ('S', 'U', 'G', 'E');