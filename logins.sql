-- Connect to master database first
USE master;
GO

-- View server-level logins
SELECT * FROM sys.sql_logins;

-- View all server principals
SELECT * FROM sys.server_principals;