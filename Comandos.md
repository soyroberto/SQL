SELECT COUNT(*) AS total_rows

FROM [dbo].[MetroMEXdata-2025-04-30];

-- SQL Server/Azure SQL DB
**907,335 total** 
SELECT SUM(p.rows) AS total_rows
--------
FROM sys.partitions p

WHERE p.object_id = OBJECT_ID('dbo.MetroMEXdata-2025-04-30')

AND p.index_id IN (0, 1); -- Heap or clustered index
