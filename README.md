# SQL Performance Dashboard

A collection of SQL Server scripts for monitoring and analyzing performance.

---

## Included Scripts

### 1. `blocking_sessions.sql`
Shows active blocking and blocked sessions. Helps DBAs troubleshoot locking issues in real time.

### 2. `index_usage_stats.sql`
Analyzes index usage statistics to highlight underused, overused, or unused indexes.

### 3. `top_slowest_queries.sql`
Identifies the top 20 slowest queries based on average elapsed CPU time. Useful for tuning performance bottlenecks.

---

## How to Use

- Run each script using SQL Server Management Studio (SSMS)
- Review the output to take action: kill blockers, drop unused indexes, or rewrite queries
- Use these tools during tuning, health checks, and incident response

---

## Author

**Auwalu Favour**  
[GitHub: @Favour-DBA](https://github.com/Favour-DBA)