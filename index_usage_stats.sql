-- Index Usage Statistics
SELECT 
    OBJECT_NAME(s.object_id) AS table_name,
    i.name AS index_name,
    i.type_desc AS index_type,
    user_seeks,
    user_scans,
    user_lookups,
    user_updates,
    last_user_seek,
    last_user_scan,
    last_user_lookup,
    last_user_update
FROM sys.dm_db_index_usage_stats AS s
INNER JOIN sys.indexes AS i
    ON s.object_id = i.object_id AND s.index_id = i.index_id
WHERE OBJECTPROPERTY(s.object_id,'IsUserTable') = 1
ORDER BY user_seeks + user_scans + user_lookups DESC;