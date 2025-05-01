-- View currently blocked and blocking sessions
SELECT 
    blocking_session_id AS BlockingSession,
    session_id AS BlockedSession,
    wait_type,
    wait_time,
    wait_resource,
    DB_NAME(database_id) AS DatabaseName,
    OBJECT_NAME(p.object_id) AS BlockingObject,
    r.status,
    r.command,
    r.start_time,
    t.text AS SqlText
FROM sys.dm_exec_requests r
INNER JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
LEFT JOIN sys.dm_exec_requests br ON r.blocking_session_id = br.session_id
LEFT JOIN sys.partitions p ON r.resource_associated_entity_id = p.hobt_id
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
WHERE r.blocking_session_id <> 0;