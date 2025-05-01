# SQL Performance Dashboard

This project contains a collection of SQL Server scripts for monitoring and analyzing database performance. These scripts are useful for database administrators looking to optimize their systems, troubleshoot issues, and ensure high availability.

## Included Scripts

### 1. `top_slowest_queries.sql`
Identifies the top 20 slowest queries based on average elapsed CPU time. Helps pinpoint problematic queries for tuning.

### 2. `index_usage_stats.sql`
Analyzes how indexes are being used across your databases. Great for identifying unused or overused indexes.

### 3. `blocking_sessions.sql`
Shows currently blocked and blocking sessions. Useful for identifying live locking issues.

## How to Use
- Run each script in SQL Server Management Studio (SSMS)
- Review results and take action (e.g. rewrite queries, remove unused indexes, resolve blockers)

## Author
**Auwalu Favour**  
[GitHub: @Favour-DBA](https://github.com/Favour-DBA)