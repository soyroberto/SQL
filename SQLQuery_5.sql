USE [dbsrvauesqlp]; -- Your database name
CREATE USER [matilda] FROM LOGIN [matilda];

-- Grant permissions
GRANT SELECT ON [dbo].[MetroMEXdata-2025-04-30] TO [matilda];