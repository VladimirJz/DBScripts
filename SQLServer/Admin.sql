
-- RESPALDO DE BASE DE DATOS (FILE)
DECLARE @bd VARCHAR(255)
DECLARE @archivo VARCHAR(255)
DECLARE @fecha VARCHAR(255)
                            
SET @bd='IEEPOSYNC' 
SET @fecha = convert(varchar, getdate(), 112)
SET @archivo = '\\172.16.3.34\E$\'+@bd+'_backup_'+ @fecha +'.bak'
 
BACKUP DATABASE [IEEPOREPLICA] TO DISK = @archivo
WITH NOFORMAT, NOINIT, NAME = 'IEEPOReplica Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
 
 -- Transaction Log Full Due to ‘CHECKPOINT’

 ALTER DATABASE IEEPOSYNC  set  EMERGENCY 
ALTER DATABASE IEEPOSYNC  REBUILD LOG ON (NAME='IEEPO_LOG',FILENAME='G:\IEEPOREPLICA_log.ldf')
ALTER DATABASE IEEPOSYNC  set ONLINE
ALTER DATABASE IEEPOSYNC  SET MULTI_USER 


-- Backup LOG -------------------------
-- Respaldar el LOG de base de datos
-- Hacer el backup hacia el Device

ALTER DATABASE [IEEPOSYNC] SET RECOVERY FULL;

BACKUP LOG [IEEPOSYNC] TO  [TMPBACKUP] 
WITH NOFORMAT, NOINIT,  NAME = N'IEEPO_LOG_BACKUP', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO

USE [IEEPOSYNC]
GO -- IEEPO_LOG = data file 
DBCC SHRINKFILE (N'IEEPO_LOG' , TRUNCATEONLY)
GO

ALTER DATABASE [IEEPOSYNC] SET RECOVERY SIMPLE;
-- ALTER DATABASE [IEEPOSYNC] SET RECOVERY BULK_LOGGED;

-- Verificar referencias FK a mi Tabla

 SELECT
    f.name constraint_name
   ,OBJECT_NAME(f.parent_object_id) referencing_table_name
   ,COL_NAME(fc.parent_object_id, fc.parent_column_id) referencing_column_name
   ,OBJECT_NAME (f.referenced_object_id) referenced_table_name
   ,COL_NAME(fc.referenced_object_id, fc.referenced_column_id) referenced_column_name
   ,delete_referential_action_desc
   ,update_referential_action_desc

FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc
   ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME (f.referenced_object_id) = 'Trubros'
