################################################################
-- dias de historia de las estadisticas
SELECT  DATEDIFF(DAY, sd.crdate, GETDATE()) AS days_history
FROM    sys.sysdatabases sd
WHERE   sd.[name] = 'tempdb' ;
#################################################################

select * from  sys.dm_os_performance_counters


select top 100 dows.*
from sys.dm_os_wait_stats as dows
order by dows.wait_time_ms desc

select *
from sys.dm_os_wait_stats as dows
where wait_type like '%PAGEIO%'
order by dows.wait_time_ms desc


-- Tiempos de Espera en el servidor ( tiempos altos por cuestiones de lectura)
select *
from sys.dm_os_wait_stats as dows
where wait_type like '%WRITELOG%'
order by dows.wait_time_ms desc

select *
from sys.dm_os_wait_stats as dows
where wait_type like '%BUFFER%'
order by dows.wait_time_ms desc

select *
from sys.dm_os_wait_stats as dows
where wait_type like '%ASYNC_IO%'
order by dows.wait_time_ms desc

-- Lecturas / escrituras  x archivo de datos

SELECT 
cast(DB_Name(a.database_id) as varchar) as Database_name,
b.physical_name, num_of_reads,num_of_bytes_read,io_stall_queued_read_ms,num_of_writes,
num_of_bytes_written,io_stall_write_ms,io_stall_queued_write_ms,io_stall,size_on_disk_bytes,type_desc,
name,physical_name,size,max_size,is_percent_growth
FROM  
sys.dm_io_virtual_file_stats(5, null) a 
INNER JOIN sys.master_files b ON a.database_id = b.database_id and a.file_id = b.file_id
ORDER BY num_of_reads desc



-- consultas corriendo
select  * from sys.query_store_runtime_stats

-- querys
SELECT qs.execution_count, 
       qs.total_worker_time, 
       qs.total_worker_time / qs.execution_count AS 'Avg CPU Time', 
       qs. total_physical_reads, 
       qs.total_physical_reads / qs.execution_count AS 'Avg Physical Reads', 
       qs.total_logical_reads, 
       qs.total_logical_reads / qs.execution_count AS 'Avg Logical Reads', 
       qs.total_logical_writes, 
       qs.total_logical_writes / qs.execution_count AS 'Avg Logical Writes', 
       SUBSTRING(st.text, qs.statement_start_offset / 2 + 1, 
		(CASE qs.statement_end_offset
                     WHEN-1 THEN DATALENGTH(st.text)
                     ELSE qs.statement_end_offset
                     END
		   - qs.statement_start_offset) / 2 + 1)AS statement_text
  FROM sys.dm_exec_query_stats AS qs 
  CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle)AS st
  ORDER BY qs.execution_count DESC;

  
-- procedures

SELECT qs.execution_count, 
       qs.total_worker_time, 
       qs.total_worker_time / qs.execution_count AS 'Avg CPU Time', 
       qs. total_physical_reads, 
       qs.total_physical_reads / qs.execution_count AS 'Avg Physical Reads', 
       qs.total_logical_reads, 
       qs.total_logical_reads / qs.execution_count AS 'Avg Logical Reads', 
       qs.total_logical_writes, 
       qs.total_logical_writes / qs.execution_count AS 'Avg Logical Writes', 
	   text
 
  FROM sys.dm_exec_procedure_stats AS qs 
  CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle)AS st
  where type='P'
  and database_id=5 -- IEEPO

  ORDER BY qs.execution_count DESC;


-- indices
select * from sys.dm_db_missing_index_details
select * from sys.dm_db_index_usage_stats
select * from sys.dm_db_index_operational_stats(5,null,null,null)



--  consultas por multiple aplicación

SELECT s.TotalExecutionCount,
s.*,
t.text
from 
	(SELECT deqs.plan_handle,
	SUM(deqs.execution_count) as TotalExecutionCount,
	SUM(deqs.total_elapsed_time) as TotalElapsedTime,
	SUM(deqs.total_logical_reads) as TotalLogicalReads,
	SUM(deqs.total_physical_reads) as TotalPhysicalReads
	FROM sys.dm_exec_query_stats as deqs
	GROUP by deqs.plan_handle
	) as s

	CROSS APPLY sys.dm_exec_sql_text(s.plan_handle) as t
	ORDER BY s.TotalLogicalReads desc

	-- con el hash

	SELECT s.TotalExecutionCount,
s.*,
t.text
from 
	(SELECT deqs.query_plan_hash,
	SUM(deqs.execution_count) as TotalExecutionCount,
	SUM(deqs.total_elapsed_time) as TotalElapsedTime,
	SUM(deqs.total_logical_reads) as TotalLogicalReads,
	SUM(deqs.total_physical_reads) as TotalPhysicalReads
	FROM sys.dm_exec_query_stats as deqs
	GROUP by deqs.query_plan_hash
	) as s

	CROSS APPLY 
	( SELECT plan_handle FROM sys.dm_exec_query_stats as deqs
	WHERE s.query_plan_hash=deqs.query_plan_hash
	)as p

	CROSS APPLY
	
	sys.dm_exec_sql_text(p.plan_handle) as t
	ORDER BY s.TotalLogicalReads desc
--



-- consumo  alto de CPU (ya existe)
select top(50) st.text as Query, qs.total_worker_time,
qs.execution_count
FROM sys.dm_exec_query_stats as qs CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as st
order by qs.total_worker_time desc

-- Recompilacion (recompilations menos del 10% de compilatiosn)
select * from sys.dm_os_performance_counters where counter_name in ('Batch Requests/sec','SQL Compilations/sec','SQL Re-Compilations/sec')

-- Planes con muchas compilaciones
select top(50) sql_text.text as Query,sql_handle,plan_generation_num,execution_count,
dbid,objectid
from 
 sys.dm_exec_query_stats a
 cross apply sys.dm_exec_sql_text(sql_handle)as sql_text
 where plan_generation_num>1
 order by plan_generation_num desc


 select *
from 
 sys.dm_exec_query_stats a
 cross apply sys.dm_exec_sql_text(sql_handle)as sql_text
 where plan_generation_num>1
 order by plan_generation_num desc

SELECT actual_state, actual_state_desc, readonly_reason,
    current_storage_size_mb, max_storage_size_mb
FROM sys.database_query_store_options;


--
--
--



-- Consultas con alto consumo de CPU
select top 10
 case when sql_handle IS NULL
 then '' 
 else ( substring(st.text,(qs.statement_start_offset+2)/2,
 (
 case when qs.statement_end_offset = -1 
 then len(convert(nvarchar(MAX),st.text))*2 
 else qs.statement_end_offset 
 end - qs.statement_start_offset) /2 ) )
 end as query_text
, qp.query_plan
, (total_worker_time+0.0)/1000 as total_worker_time
, (total_worker_time+0.0)/(execution_count*1000) as [AvgCPUTime]
, total_logical_reads as [LogicalReads]
, total_logical_writes as [logicalWrites]
, execution_count
, creation_time
, last_execution_time
, total_logical_reads+total_logical_writes as [AggIO]
, (total_logical_reads+total_logical_writes)/(execution_count + 0.0) as [AvgIO]
, db_name(st.dbid) as database_name
, st.objectid as object_id
from sys.dm_exec_query_stats qs
cross apply sys.dm_exec_sql_text(sql_handle) st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp
where total_worker_time > 0 
order by total_worker_time desc;


--  Indices con altos eventos SCAN

SELECT  OBJECT_NAME(ddius.[object_id], ddius.database_id) AS [object_name] ,
        ddius.index_id ,
        ddius.user_seeks ,
        ddius.user_scans ,
        ddius.user_lookups ,
        ddius.user_seeks + ddius.user_scans + ddius.user_lookups 
                                                     AS user_reads ,
        ddius.user_updates AS user_writes ,
        ddius.last_user_scan ,
        ddius.last_user_update
FROM    sys.dm_db_index_usage_stats ddius
WHERE   ddius.database_id = 5 -- filter out system tables
        AND OBJECTPROPERTY(ddius.OBJECT_ID, 'IsUserTable') = 1
        AND ddius.index_id > 0  -- filter out heaps 
ORDER BY ddius.user_scans DESC 


-- Indices que no han sido usados ( Index / Stats) (Base actual)
SELECT  OBJECT_NAME(i.[object_id]) AS [Table Name] ,
        i.name
FROM    sys.indexes AS i
        INNER JOIN sys.objects AS o ON i.[object_id] = o.[object_id]
WHERE   i.index_id NOT IN ( SELECT  ddius.index_id
                            FROM    sys.dm_db_index_usage_stats AS ddius
                            WHERE   ddius.[object_id] = i.[object_id]
                                    AND i.index_id = ddius.index_id
                                    AND database_id = DB_ID() )
        AND o.[type] = 'U'
ORDER BY OBJECT_NAME(i.[object_id]) ASC ; 


-- indices activos sin uso (base actual)

SELECT  '[' + DB_NAME() + '].[' + su.[name] + '].[' + o.[name] + ']'
            AS [statement] ,
        i.[name] AS [index_name] ,
        ddius.[user_seeks] + ddius.[user_scans] + ddius.[user_lookups]
            AS [user_reads] ,
        ddius.[user_updates] AS [user_writes] ,
        SUM(SP.rows) AS [total_rows]
FROM    sys.dm_db_index_usage_stats ddius
        INNER JOIN sys.indexes i ON ddius.[object_id] = i.[object_id]
                                     AND i.[index_id] = ddius.[index_id]
        INNER JOIN sys.partitions SP ON ddius.[object_id] = SP.[object_id]
                                        AND SP.[index_id] = ddius.[index_id]
        INNER JOIN sys.objects o ON ddius.[object_id] = o.[object_id]
        INNER JOIN sys.sysusers su ON o.[schema_id] = su.[UID]
WHERE   ddius.[database_id] = DB_ID() -- current database only
        AND OBJECTPROPERTY(ddius.[object_id], 'IsUserTable') = 1
        AND ddius.[index_id] > 0
GROUP BY su.[name] ,
        o.[name] ,
        i.[name] ,
        ddius.[user_seeks] + ddius.[user_scans] + ddius.[user_lookups] ,
        ddius.[user_updates]
HAVING  ddius.[user_seeks] + ddius.[user_scans] + ddius.[user_lookups] = 0
ORDER BY ddius.[user_updates] DESC ,
        su.[name] ,
        o.[name] ,
        i.[name] 


--

-- Potentially inefficent non-clustered indexes (writes > reads)
SELECT  OBJECT_NAME(ddius.[object_id]) AS [Table Name] ,
        i.name AS [Index Name] ,
        i.index_id ,
        user_updates AS [Total Writes] ,
        user_seeks + user_scans + user_lookups AS [Total Reads] ,
        user_updates - ( user_seeks + user_scans + user_lookups )
            AS [Difference]
FROM    sys.dm_db_index_usage_stats AS ddius WITH ( NOLOCK )
        INNER JOIN sys.indexes AS i WITH ( NOLOCK )
            ON ddius.[object_id] = i.[object_id]
            AND i.index_id = ddius.index_id
WHERE   OBJECTPROPERTY(ddius.[object_id], 'IsUserTable') = 1
        AND ddius.database_id = DB_ID()
        AND user_updates > ( user_seeks + user_scans + user_lookups )
        AND i.index_id > 1
ORDER BY [Difference] DESC ,
        [Total Writes] DESC ,
        [Total Reads] ASC ;




-- indices Writes / Reads (no usados para lectura)
SELECT  '[' + DB_NAME() + '].[' + su.[name] + '].[' + o.[name] + ']'
                                                       AS [statement] ,
        i.[name] AS [index_name] ,
        ddius.[user_seeks] + ddius.[user_scans] + ddius.[user_lookups]
            AS [user_reads] ,
        ddius.[user_updates] AS [user_writes] ,
        ddios.[leaf_insert_count] ,
        ddios.[leaf_delete_count] ,
        ddios.[leaf_update_count] ,
        ddios.[nonleaf_insert_count] ,
        ddios.[nonleaf_delete_count] ,
        ddios.[nonleaf_update_count]
FROM    sys.dm_db_index_usage_stats ddius
        INNER JOIN sys.indexes i ON ddius.[object_id] = i.[object_id]
                                     AND i.[index_id] = ddius.[index_id]
        INNER JOIN sys.partitions SP ON ddius.[object_id] = SP.[object_id]
                                        AND SP.[index_id] = ddius.[index_id]
        INNER JOIN sys.objects o ON ddius.[object_id] = o.[object_id]
        INNER JOIN sys.sysusers su ON o.[schema_id] = su.[UID]
        INNER JOIN sys.[dm_db_index_operational_stats](DB_ID(), NULL, NULL,
                                                       NULL)
                  AS ddios
                      ON ddius.[index_id] = ddios.[index_id]
                         AND ddius.[object_id] = ddios.[object_id]
                         AND SP.[partition_number] = ddios.[partition_number]
                         AND ddius.[database_id] = ddios.[database_id]
WHERE OBJECTPROPERTY(ddius.[object_id], 'IsUserTable') = 1
      AND ddius.[index_id] > 0
      AND ddius.[user_seeks] + ddius.[user_scans] + ddius.[user_lookups] = 0
ORDER BY ddius.[user_updates] DESC ,
        su.[name] ,
        o.[name] ,
        i.[name] 


		-- bloqueos por Indices

		SELECT  '[' + DB_NAME(ddios.[database_id]) + '].[' + su.[name] + '].['
        + o.[name] + ']' AS [statement] ,
        i.[name] AS 'index_name' ,
        ddios.[partition_number] ,
        ddios.[row_lock_count] ,
        ddios.[row_lock_wait_count] ,
        CAST (100.0 * ddios.[row_lock_wait_count]
        / ( ddios.[row_lock_count] ) AS DECIMAL(5, 2)) AS [%_times_blocked] ,
        ddios.[row_lock_wait_in_ms] ,
        CAST (1.0 * ddios.[row_lock_wait_in_ms]
        / ddios.[row_lock_wait_count] AS DECIMAL(15, 2))
             AS [avg_row_lock_wait_in_ms]
FROM    sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) ddios
        INNER JOIN sys.indexes i ON ddios.[object_id] = i.[object_id]
                                     AND i.[index_id] = ddios.[index_id]
        INNER JOIN sys.objects o ON ddios.[object_id] = o.[object_id]
        INNER JOIN sys.sysusers su ON o.[schema_id] = su.[UID]
WHERE   ddios.row_lock_wait_count > 0
        AND OBJECTPROPERTY(ddios.[object_id], 'IsUserTable') = 1
        AND i.[index_id] > 0
ORDER BY ddios.[row_lock_wait_count] DESC ,
        su.[name] ,
        o.[name] ,
        i.[name]

		-- Waits / latch

		SELECT  '[' + DB_NAME() + '].[' + OBJECT_SCHEMA_NAME(ddios.[object_id])
        + '].[' + OBJECT_NAME(ddios.[object_id]) + ']' AS [object_name] ,
        i.[name] AS index_name ,
        ddios.page_io_latch_wait_count ,
        ddios.page_io_latch_wait_in_ms ,
        ( ddios.page_io_latch_wait_in_ms / ddios.page_io_latch_wait_count )
                                             AS avg_page_io_latch_wait_in_ms
FROM    sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) ddios
        INNER JOIN sys.indexes i ON ddios.[object_id] = i.[object_id]
                                    AND i.index_id = ddios.index_id
WHERE   ddios.page_io_latch_wait_count > 0
        AND OBJECTPROPERTY(i.OBJECT_ID, 'IsUserTable') = 1
ORDER BY ddios.page_io_latch_wait_count DESC ,
        avg_page_io_latch_wait_in_ms DESC 



		-- intentos de escalamiento de bloqueos

		SELECT  OBJECT_NAME(ddios.[object_id], ddios.database_id) AS [object_name] ,
        i.name AS index_name ,
        ddios.index_id ,
        ddios.partition_number ,
        ddios.index_lock_promotion_attempt_count ,
        ddios.index_lock_promotion_count ,
        ( ddios.index_lock_promotion_attempt_count
          / ddios.index_lock_promotion_count ) AS percent_success
FROM    sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) ddios
        INNER JOIN sys.indexes i ON ddios.OBJECT_ID = i.OBJECT_ID
                                    AND ddios.index_id = i.index_id
WHERE   ddios.index_lock_promotion_count > 0 


-- lost index / lock contention

SELECT  OBJECT_NAME(ddios.OBJECT_ID, ddios.database_id) AS OBJECT_NAME ,
        i.name AS index_name ,
        ddios.index_id ,
        ddios.partition_number ,
        ddios.page_lock_wait_count ,
        ddios.page_lock_wait_in_ms ,
        CASE WHEN DDMID.database_id IS NULL THEN 'N'
             ELSE 'Y'
        END AS missing_index_identified
FROM    sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) ddios
        INNER JOIN sys.indexes i ON ddios.OBJECT_ID = i.OBJECT_ID
                                    AND ddios.index_id = i.index_id
        LEFT OUTER JOIN ( SELECT DISTINCT
                                    database_id ,
                                    OBJECT_ID
                          FROM      sys.dm_db_missing_index_details
                        ) AS DDMID ON DDMID.database_id = ddios.database_id
                                      AND DDMID.OBJECT_ID = ddios.OBJECT_ID
WHERE   ddios.page_lock_wait_in_ms > 0
ORDER BY ddios.page_lock_wait_count DESC ;


-- buscar tablas pequeñas con indices
-- buscar tipos de datos varchar como indice