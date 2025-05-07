-- Check if a specific column has only unique values
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT [DR_NO]) AS distinct_values,
    CASE 
        WHEN COUNT(*) = COUNT(DISTINCT [DR_NO]) 
        THEN 'All values are unique' 
        ELSE 'Contains duplicates' 
    END AS uniqueness_check
  FROM [dbo].[xcrime2020t2025];