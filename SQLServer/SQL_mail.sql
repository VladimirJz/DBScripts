

DECLARE @Var_TableRows   varchar(max)
DECLARE @Var_TableHeader varchar(max) 
DECLARE @Var_TableFoot   varchar(max)
DECLARE @Var_Head        varchar(max)
DECLARE @Var_HTML varchar(max)
DECLARE @Var_DBName varchar(20)

DECLARE @Var_DDSize varchar(20)
DECLARE @Var_DBData varchar(20)
DECLARE @Var_QnaProceso varchar(20)
DECLARE @Var_QnaCerrada varchar(20)
DECLARE @DataBaseSize TABLE
        (
            database_name varchar(20),
            database_size varchar(20),
            unallocated_space varchar(20),
            reserved varchar(20),
            data varchar(20),
            index_size varchar(20),
            unused varchar(20)
        )

INSERT INTO @DataBaseSize EXEC sp_spaceused @oneresultset = 1  

SET @Var_DBName = (select database_name from @DataBaseSize)
SET @Var_DDSize = (select database_size from @DataBaseSize)
SET @Var_DBData = (select data from @DataBaseSize)
SET @Var_QnaCerrada = (select top 1 dbo.fechaToAnioQuincena(fechaini) 
                        from calennomina where Procesado = 1 and actualizado = 0 and parcial = 0
                        )
SET @Var_QnaProceso = (select dbo.fechaToAnioQuincena(max(fechaini)) 
                        from calennomina where procesado = 1 and Actualizado = 1 and Parcial = 0
                        )
SET @Var_TableRows =(select @Var_DBName [TD] ,@Var_DDSize [TD] ,@Var_DBData [TD], @Var_QnaCerrada [TD] ,@Var_QnaProceso [TD]
      For XML raw('tr'), Elements)
 

SET @Var_Head = '<html><head>' + 
                  '<style>' + 
                  'td {padding-left:5px;padding-right:5px;padding-top:5px;padding-bottom:5px;font-family: Arial, Helvetica, sans-serif; font-size: 10pt;} ' + 
                  '</style>' + 
                  '</head>' + 
                  '<body>'+
                  'El respaldo de la BD' + @Var_DBName +  'se realizo correctamente' + 
                  '<br>Archivo:' + @Var_Archivo +
                  '<br>Ubicación: Directorio E: Backups '+
                    

SET @Var_TableHeader = '<table cellpadding="5" cellspacing="0" border="1" bordercolor="#C0C0C0" style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt; border-collapse:collapse;border-bottom-style:solid;">' + 
                        '<tr bgcolor=#FFEFD8>' +
                        '<td align=center style="background-color: ; color:#E546A5 white"><b>Nombre</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>Tamanio</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>Data</b></td>' +
                        '<td align=center style="background-color: #E546A5; color: white"><b>QnaProceso</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>QnaCerrada</b></td>'; 


SET @Var_TableFoot = '</table></body></html>'; 


SET @Var_HTML = concat(@Var_Head,@Var_TableHeader , @Var_TableRows , @Var_TableFoot)

select @Var_HTML
--



El respaldo de la BD IEEPO se realizó correctamente.

El trabajo de respaldo de la base de datos IEEPO concluyo correctamente 
con nombre IEEPO_backup_20210302 en el servidor de respaldos(172.16.3.34), 
en disco E:\, carpeta backups; ruta \\172.16.3.34\E$\Backups\IEEPO_backup_20210302.bak


### asi quedo 



                            

BACKUP DATABASE [IEEPO] TO DISK = @archivo
WITH NOFORMAT, NOINIT, NAME = 'IEEPO-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
 


DECLARE @Var_Archivo VARCHAR(255)
DECLARE @Var_Fecha VARCHAR(255)
DECLARE @Var_TableRows   varchar(max)
DECLARE @Var_TableHeader varchar(max) 
DECLARE @Var_TableFoot   varchar(max)
DECLARE @Var_Head        varchar(max)
DECLARE @Var_HTML varchar(max)
DECLARE @Var_DBName varchar(20)

DECLARE @Var_DDSize varchar(20)
DECLARE @Var_DBData varchar(20)
DECLARE @Var_QnaProceso varchar(20)
DECLARE @Var_QnaCerrada varchar(20)
DECLARE @DataBaseSize TABLE
        (
            database_name varchar(20),
            database_size varchar(20),
            unallocated_space varchar(20),
            reserved varchar(20),
            data varchar(20),
            index_size varchar(20),
            unused varchar(20)
        )


SET @Var_DBName='IEEPO' 
SET @Var_Fecha = convert(varchar, getdate(), 112)
SET @Var_Archivo = '\\172.16.3.34\E$\Backups\'+@Var_DBName+'_backup_'+ @Var_Fecha +'.bak'
 
-- aqui se dbe generar el backup

INSERT INTO @DataBaseSize EXEC sp_spaceused @oneresultset = 1  

SET @Var_DBName = (select database_name from @DataBaseSize)
SET @Var_DDSize = (select database_size from @DataBaseSize)
SET @Var_DBData = (select data from @DataBaseSize)
SET @Var_QnaCerrada = (select top 1 dbo.fechaToAnioQuincena(fechaini) 
                        from calennomina where Procesado = 1 and actualizado = 0 and parcial = 0
                        )
SET @Var_QnaProceso = (select dbo.fechaToAnioQuincena(max(fechaini)) 
                        from calennomina where procesado = 1 and Actualizado = 1 and Parcial = 0
                        )
SET @Var_TableRows =(select @Var_DBName [TD] ,@Var_DDSize [TD] ,@Var_DBData [TD], @Var_QnaCerrada [TD] ,@Var_QnaProceso [TD]
      For XML raw('tr'), Elements)
 
SET @Var_Archivo = replace(@Var_Archivo,'\','&#92;') -- backslash
SET @Var_Archivo = replace(@Var_Archivo,'$','&#36;') -- dollar

SET @Var_Head = '<html><head>' + 
                  '<style>' + 
                  'td {padding-left:5px;padding-right:5px;padding-top:5px;padding-bottom:5px;font-family: Arial, Helvetica, sans-serif; font-size: 10pt;} ' + 
                  '</style>' + 
                  '</head>' + 
                  '<body>'+
                  'El respaldo de la BD ' + @Var_DBName +  ' se realizo correctamente' + 
                  '<br>Archivo: ' + @Var_Archivo +
                  '<br>Dir. Local: Directorio E:&#92;Backups ' + 
		  '<br>Detalle:'
                    

SET @Var_TableHeader = '<table cellpadding="5" cellspacing="0" border="1" bordercolor="#C0C0C0" style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt; border-collapse:collapse;border-bottom-style:solid;">' + 
                        '<tr bgcolor=#FFEFD8>' +
                        '<td align=center style="background-color: #E546A5; color:white"><b>Database</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>Tama&#241;o</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>DataFiles</b></td>' +
                        '<td align=center style="background-color: #E546A5; color: white"><b>QnaProceso</b></td>' + 
                        '<td align=center style="background-color: #E546A5; color: white"><b>QnaCerrada</b></td>'; 


SET @Var_TableFoot = '</table><hr></body></html>'; 


SET @Var_HTML = concat(@Var_Head,@Var_TableHeader , @Var_TableRows , @Var_TableFoot)

EXEC msdb.dbo.sp_send_dbmail @profile_name='BackupsBaseDatosIeepo',
    @recipients= 'vjimenezv@ieepo.gob.mx',
    @subject= 'Respaldo de base de datos IEEPO',
    @body_format = 'HTML',
    @body= @Var_HTML 

