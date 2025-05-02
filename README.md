# SQL Server Performance Dashboard

This project provides a collection of SQL Server scripts designed to help DBAs monitor, troubleshoot, and optimize SQL Server performance. Each script is paired with a real-world example and visual output where available.

---

## Script Files 

### 1. index_usage_stats.sql  
Reports how indexes are being used. Helps you detect underutilized or unnecessary indexes.

### 2. blocking_sessions.sql  
Displays active blocking and blocked sessions. Helps identify real-time locking problems.

### 3. database_size_summary.sql  
Summarizes the size (in MB) of each database across the server. Useful for storage management and capacity planning.

### 4. top_slowest_queries.sql  
Lists the top 20 slowest-running queries based on average CPU time. Helps in identifying query performance bottlenecks.

---

### *index_usage_stats.sql*  
Reports how indexes are being used. Helps detect underutilized or unnecessary indexes.

This script analyzes index activity by checking metrics like user seeks, scans, lookups, and updates. It helps DBAs identify which indexes are actively used and which ones are not, allowing for smarter tuning decisions or possible cleanup to improve query performance and storage efficiency.

*Screenshot of Execution*  
![Index Stats Screenshot](images/index_stats_success.jpeg)


### *blocking_sessions.sql*  
Displays active blocking and blocked sessions in SQL Server. Helps identify real-time locking problems.

This script monitors session-level blocking by capturing details of blocked and blocking sessions, including session IDs, wait types, resources being waited on, and running queries. It helps DBAs detect and troubleshoot blocking issues that can degrade performance or halt transactions.

*Screenshot of Execution*  
![EmployeePayroll Blocking Demo](images/employee_payroll_blocking_demo.jpg)
---

## Demo: Database Size Summary  
Screenshot coming soon.

---

## Demo: Top Slowest Queries  
Screenshot coming soon.

---

## Tools Used
- SQL Server Management Studio (SSMS)  
- SQL Server 2019  
- AdventureWorks2019 sample database  

---

## Author  
*Favour Auwalu*  
[GitHub Portfolio](https://github.com/Favour-DBA)
