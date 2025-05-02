# SQL Performance Dashboard

A curated collection of SQL Server scripts designed to monitor and troubleshoot performance issues in real-time.

---

## Script Files

- **blocking_sessions.sql**  
  Displays active blocking and blocked sessions in SQL Server. Helps identify real-time locking problems.
  ## Real-Time Blocking Demo Using EmployeePayroll Table

To demonstrate how the blocking_sessions.sql script works in a real-world scenario, i created a realistic EmployeePayroll table and simulated a blocking situation using SQL Server Management Studio (SSMS).

### Table Setup

```sql
CREATE TABLE dbo.EmployeePayroll (
    PayrollID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    PayPeriod NVARCHAR(20),
    NetPay DECIMAL(10,2)
);

INSERT INTO dbo.EmployeePayroll (EmployeeName, PayPeriod, NetPay)
VALUES 
('Alice Thomas', '2024-12', 3500.00),
('Brian Walker', '2024-12', 4100.00),
('Cindy Miller', '2024-12', 3850.00);
simulating a blocking scenario
Query window 1 ;
BEGIN TRAN;
UPDATE dbo.EmployeePayroll
SET NetPay = 3600.00
WHERE PayrollID = 1;
-- Do NOT commit yet
Query window 2 ;
UPDATE dbo.EmployeePayroll
SET NetPay = 3700.00
WHERE PayrollID = 1;
Then i opend a third ssms window and run blocking_sessions.sql;
SELECT 
    r.session_id AS BlockedSessionID,
    r.blocking_session_id AS BlockingSessionID,
    r.wait_type,
    r.wait_time,
    r.wait_resource,
    r.start_time,
    r.status,
    DB_NAME(r.database_id) AS database_name,
    s.host_name,
    s.program_name,
    s.login_name,
    t.text AS running_query
FROM sys.dm_exec_requests r
JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
WHERE r.blocking_session_id <> 0
ORDER BY r.wait_time DESC;
sample screenshot;
![EmployeePayroll Blocking Demo](images/employee_payroll_blocking_demo.jpg)
This demonstrates how the script captures active blocking sessions with details like session IDs, wait type (LCK_M_X), and the SQL query involved.



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
