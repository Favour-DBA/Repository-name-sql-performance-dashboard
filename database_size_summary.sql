EXEC sp_MSforeachdb 
'USE [?];
SELECT 
    ''?'' AS DatabaseName,
    SUM(size * 8 / 1024) AS SizeMB
FROM sys.master_files
GROUP BY DB_NAME(database_id);'
