# SQL Performance Dashboard

A curated collection of SQL Server scripts designed to monitor and troubleshoot performance issues in real-time.

---

## Script Files

- **blocking_sessions.sql**  
  Displays active blocking and blocked sessions in SQL Server. Helps identify real-time locking problems.

- **database_size_summary.sql**  
  Summarizes the size (in MB) of each database across the server. Useful for storage management and capacity planning.

- **index_usage_stats.sql**  
  Reports how indexes are being used. Helps you detect underutilized or unnecessary indexes.- *index_usage_stats.sql*  
  Reports how indexes are being used by queries. Helps detect underutilized or unnecessary indexes by analyzing user_seeks, user_scans, user_lookups, and user_updates.
## Screenshot of Index Usage Query
The output below shows a real-time execution of our index usage script in SQL Server Management Studio (SSMS).
![Index Stats Screenshot](images/index_stats_success.jpeg)
  * Query Used*:
  ```sql
  SELECT  
      OBJECT_NAME(i.object_id) AS table_name,  
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
  FROM sys.dm_db_index_usage_stats AS S  
  INNER JOIN sys.indexes AS i  
      ON s.object_id = i.object_id AND s.index_id = i.index_id  
  WHERE OBJECTPROPERTY(s.object_id, 'IsUserTable') = 1  
  ORDER BY user_seeks + user_scans + user_lookups DESC;

- **top_slowest_queries.sql**  
  Lists the top 20 slowest-running queries based on average CPU time. Helps in identifying query performance bottlenecks.

---

## How to Use

- Run each script in SQL Server Management Studio (SSMS)
- Analyze the results to take corrective DBA actions
- Useful for audits, tuning, and system health checks

---

## Author

**Auwalu Favour**  
[GitHub: @Favour-DBA](https://github.com/Favour-DBA)
