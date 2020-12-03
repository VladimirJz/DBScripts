
--##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--##  Inserta manualmente los datos de los ultimos 12 meses en las tablas mas grandes de laBD
--##  Recorre de manera automatica las tablas usadas en el ultimo mes y extrae los datos de producción
--##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- test 2
-- BASE DE DATOS ORIGEN : PRODUCCION
-- BASE DE DATOS DESTINO :  IEEPOSYNC
-- Comentario
GO
-- Parametros que pueden 
DECLARE @Par_BDOrigen varchar(50) ='IEEPO'
DECLARE @Par_HorasHist int  =-800 -- Objetos modificados en las ultimas N horas (+ de 30 dias Aprox)

DECLARE @Var_DBID int -- ID de la Base de datos
SET @Var_DBID=(select DB_ID(@Par_BDOrigen)) --


USE IEEPO
drop table if exists TMPOBJECTSUPDATE;
create table TMPOBJECTSUPDATE
(
    ObjectID int,
    ObjectName varchar(50),
    LastUse DATETIME
)
-- Todo= Agregar Indices

-- Buscamos tabla actualizadas segun sus estadisticas, es decir que alguno de sus indices hayan sido usados
-- para consulta (cualquiera)
-- Obtenemos la ultima actualización de todos los indices
insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_user_scan,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_user_seek,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_user_lookup,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID



insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_user_update,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_system_seek,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_system_scan,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_system_lookup,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID


insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    select object_id ObjectID,  OBJECT_NAME(object_id)ObjectName,   (isnull(last_system_update,'9999-01-01'))LastIndexUse
    from sys.dm_db_index_usage_stats ius where database_id=@Var_DBID

-- Hacemos lo mismo directamente con las tablas que hayan tenido algun tipo de actualización, no importa si los datos
-- se repiten, al final nos quedaremos con los ultimos resultados.

-- #todo: cambiar, la bd sera siempre la seleccionada (USE)hacerlo dinamico segun el parametro
insert into TMPOBJECTSUPDATE (ObjectID, ObjectName, LastUse)
    SELECT so.object_id,(so.name)ObjectName, (STATS_DATE(ss.object_id, stats_id)) AS LastTableUse  
    FROM sys.stats ss inner join sys.objects  so on ss.object_id=so.object_id
    where so.[type]='U'


-- eliminamos las tablas 'Z's
delete from TMPOBJECTSUPDATE where (left(ObjectName,1) = 'Z' or left(ObjectName,4) = 'FC_z') 
-- Buscamos objetos actualizados en las ultimas N horas

drop table if exists TMPLASTUPDATE;
CREATE TABLE  TMPLASTUPDATE
(
    ObjectID int,
    ObjectName varchar(50),
    LastUse     datetime,
    RowsNumber   int not null DEFAULT 0

);

drop table if exists LASTUPDATE;
CREATE TABLE  LASTUPDATE
(   ID  int IDENTITY(1,1), 
    ObjectID int,
    ObjectName varchar(50),
    LastUse     datetime,
    RowsNumber   bigint not null DEFAULT 0

);
-- 	CREATE CLUSTERED INDEX idxRowsNumber on LASTUPDATE(RowsNumber)


truncate table TMPLASTUPDATE
insert into TMPLASTUPDATE (ObjectID,ObjectName,LastUse)
    select max(ObjectID)ObjectID,max( ObjectName)ObjectName,max(LastUse)LastUse
    from TMPOBJECTSUPDATE 
    where LastUse 
    BETWEEN DATEADD(HOUR,@Par_HorasHist,GETDATE()) AND CAST(GETDATE() AS datetime)
    and ObjectName is not null and ObjectName!='TMPOBJECTSUPDATE' and ObjectName!='TrashTemp'
    group by ObjectID

truncate table LASTUPDATE
-- Ordenamos por Numero de registros
insert into LASTUPDATE (ObjectID,ObjectName,LastUse,RowsNumber)
    select tmp.ObjectID,max(ObjectName)ObjectName,max(LastUse),sum((coalesce([sysp].[rows],0)))Rows
    from TMPLASTUPDATE tmp  left  join sys.partitions  sysp  on tmp.ObjectID=sysp.object_id
    where ObjectName not in ('TMPLASTUPDATE','LASTUPDATE')
    group by tmp.ObjectID
    order by sum(([sysp].[rows])) desc


DECLARE @Par_BDOrigen varchar(50) ='IEEPO'
-- clonamos la Base de datos  (WSCALCULO NO EXISTE)


-- Rutina para alimentar las tablas
USE IEEPO

select ObjectName,LastUse,RowsNumber,format(RowsNumber , '###,###,###,###') from LASTUPDATE order by RowsNumber desc

-- Insertamos manualmente todas las tablas con mas de 1 millon de registros!!
/*GO
USE WSCALCULO
EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
go*/
USE IEEPO

-- Tabla de Bitacora
DROP TABLE IF EXISTS SYNCBITACORA
CREATE TABLE SYNCBITACORA
(
    BitacoraID      int identity(1,1),
    ObjectID        int,
    ObjectName      varchar(500),
    DisableCheck    char(1), --'S/n'
    InsertIDEntity  char(1),-- 'S/n'
    HoraTermina     datetime
    
)

-- Insertamos los registros manualmente.
-- verificamos los periodos existentes
drop table if exists #tmpperiodos
CREATE TABLE #tmpperiodos
    (
    ID_Periodo int
    )

-- insertamos los periodos del año actual
INSERT INTO #tmpperiodos 
    SELECT ID_Periodo 
    FROM IEEPO.dbo.CalenNomina 
    WHERE FechaIni>='2020-01-01' order by ID_Periodo desc -- 178

-- select * from #tmpperiodos 
DECLARE @Periodo INT = (select min(ID_Periodo) FROM #tmpperiodos)
DECLARE @MaxPeriodo INT=(select max(ID_Periodo) FROM #tmpperiodos)
select * from   #tmpperiodos 
/*
USE [IEEPOSYNC]
GO
-- Eliminamos los indices
DROP INDEX [IX_Nom_histpagos_idemp_idplaza_idperiodo_idconcepto] ON IEEPOSYNC.[dbo].[nom_histpagos]
DROP INDEX [IX_Nom_histpagos_idperiodo_idplaza_idreferencia] ON IEEPOSYNC.[dbo].[nom_histpagos] WITH ( ONLINE = OFF )
GO
*/
     
GO
WHILE  @MaxPeriodo >= @Periodo
    BEGIN
        print 'select * from nom_histpagos where ID_Periodo=' + cast(@Periodo as varchar)
        -- Controlar el commit
        BEGIN TRY 
            BEGIN TRANSACTION
                insert into IEEPOSYNC.dbo.nom_histpagos
                    select * from IEEPO.dbo.nom_histpagos where ID_Periodo=@Periodo
            COMMIT
        END TRY
            BEGIN CATCH  
                SET @SQLErrMen=(select ERROR_MESSAGE())
                PRINT @SQLErrMen
                ROLLBACK
            END CATCH 

        SET @Periodo=@Periodo+1
    END

-- Creamos nuevamente los indices:
CREATE NONCLUSTERED INDEX [IX_Nom_histpagos_idemp_idplaza_idperiodo_idconcepto] ON [dbo].[nom_histpagos]
(
	[Id_Emp] ASC,
	[id_plaza] ASC,
	[Id_Periodo] ASC,
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_Nom_histpagos_idperiodo_idplaza_idreferencia] ON [dbo].[nom_histpagos]
(
	[Id_Periodo] ASC,
	[id_plaza] ASC,
	[Id_Referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





    insert into IEEPOSYNC.dbo.HContinuidad  
        select * from   Hcontinuidad where añoqna like '2020%'
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 1,21 minutos
    
    exec SYNCBITACORAALT 0,'HContinuidad','N','N'

    insert into IEEPOSYNC.dbo.Tcia   
        select * from Tcia -- 782 rows 0 m
        exec SYNCBITACORAALT 0,'Tcia','N','N'


    insert into IEEPOSYNC.dbo.Usuarios
        select * from Usuarios --324  rows
        exec SYNCBITACORAALT 0,'Usuarios','N','N'

    insert into IEEPOSYNC.dbo.TNacionalidad
        select * from TNacionalidad --12 rows 0 s
        exec SYNCBITACORAALT 0,'TNacionalidad','N','N'

    insert into IEEPOSYNC.dbo.TBancos
        select * from TBancos -- 3rows (fijo)
        exec SYNCBITACORAALT 0,'TBancos','N','N'



        insert into IEEPOSYNC.dbo.Empleados
            select * from Empleados OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --53868 rows affected 1m 43 s
            exec SYNCBITACORAALT 0,'Empleados','S','N'


    insert into IEEPOSYNC.dbo.Hcia ([id_emp],   [Id_rel],   [Fecha],    [Id_User],  [Movimiento])
        select id_emp,   Id_rel,   Fecha,    Id_User,  Movimiento from HCia  where Movimiento BETWEEN '2020-01-01' and GETDATE()
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --  0 s
        exec SYNCBITACORAALT 0,'HCia','N' ,'N'




    insert into IEEPOSYNC.dbo.HistPagos
        select * from HistPagos  where Fecha BETWEEN '2020-01-01' and '2020-11-29' OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --  11 minutos

        exec SYNCBITACORAALT 0,'HistPagos','N','N' -- << AQUI (SE DIO ROLLBACK) se carga con ETL






    insert into IEEPOSYNC.dbo.HPlazas ([Id_plaza],  [Fecha],        [Id_TipoMovPlazas],[Valor_IdCampo],[Id_User],
                                    [Movimiento],[esHistoria],   [documentos])
        select  Id_plaza,   Fecha,      Id_TipoMovPlazas,   Valor_IdCampo,  Id_User,
                Movimiento, esHistoria, documentos
        from HPlazas where Movimiento BETWEEN '2020-01-01' and '2020-11-17'
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 7 seg

    insert into IEEPOSYNC.dbo.PlazaEmpleados  ([Id_Emp] ,[Id_plaza]     ,[Fecha]            ,[Id_User]      ,[Movimiento]
                                            ,[id_nodo] ,[Documentos]   ,[id_plazaanterior] ,[esHistoria]   ,[desliguePlaza]
                                            ,[tipoHistoria])
        select  Id_Emp ,    Id_plaza     ,Fecha            ,Id_User      ,Movimiento,
                id_nodo ,   Documentos   ,id_plazaanterior ,esHistoria   ,desliguePlaza,
                tipoHistoria
        from PlazaEmpleados where Movimiento BETWEEN '2020-01-01' and '2020-11-17'
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --  2s


    insert into IEEPOSYNC.dbo.Excepciones ([Id_Periodo],        [Id_Emp],       [Id_Clave],     [Seq],               [Cantidad],
                                            [Sueldo],           [Id_Categoria], [ClaveDif],     [SaldoActual],      [SaldoInicial],
                                            [Id_User],          [Fecha],        [id_plaza],     [Id_Referencia],    [id_periodoPago],
                                            [Id_ProcesoNomina], [Desde],        [Hasta],        [comentarios])

        select  [Id_Periodo],       [Id_Emp],       [Id_Clave],     [Seq],               [Cantidad],
                [Sueldo],           [Id_Categoria], [ClaveDif],     [SaldoActual],      [SaldoInicial],
                [Id_User],          [Fecha],        [id_plaza],     [Id_Referencia],    [id_periodoPago],
                [Id_ProcesoNomina], [Desde],        [Hasta],        [comentarios]
        from  Excepciones where Fecha BETWEEN '2020-01-01' and '2020-11-17'
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --  13s


    insert into IEEPOSYNC.dbo.PlazaIEEPO 
        select *  from PlazaIEEPO
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) --25s


    insert into IEEPOSYNC.dbo.deducsfijas
        select * from deducsfijas where FechaHasta >= '2020-01-01'
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 19s

    insert into IEEPOSYNC.dbo.HTabulador_SE_Cat_Puesto
        select  *  from HTabulador_SE_Cat_Puesto   -- 
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 11s

    insert into IEEPOSYNC.dbo.HTabulador_SE_CM
        select  *  from  HTabulador_SE_CM
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 10s

    insert into IEEPOSYNC.dbo.ValoresMatriz5
        select * from ValoresMatriz5
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 9s

    insert into IEEPOSYNC.dbo.HHoras
        Select  * from   HHoras
        OPTION(USE HINT('ENABLE_PARALLEL_PLAN_PREFERENCE')) -- 10s



    -- Guardamos tablas alimentadas manualmente (15)

select * from SYNCBITACORA
select * from LASTUPDATE

/* solo para prueba

select * from LASTUPDATE where RowsNumber<@NumMaxReg and RowsNumber>@Entero_cero -- 41 >
insert into SYNCBITACORA(ObjectID,ObjectName,DisableCheck,InsertIDEntity,HoraTermina)
    select ObjectID,ObjectName,'N','N',getdate() from LASTUPDATE where ID <41


insert into SYNCBITACORA(ObjectID,ObjectName,DisableCheck,InsertIDEntity,HoraTermina)
    select ObjectID,ObjectName,'N','N',getdate() from LASTUPDATE where ID between 50 and 59


*/
-- DESDE AQUI

select * from LASTUPDATE

DECLARE @NumMaxReg      int  -- numero maximo de registros para cargar la tabla completa
DECLARE @Entero_cero    int 
SET @Entero_cero=0
SET @NumMaxReg=28000000 -- probar  
  drop table if exists #SYNCTABLAS
    CREATE TABLE #SYNCTABLAS(
        ObjectID int, 
        ObjectName  varchar(50)
    );


-- Objetos pendientes de cargar (no se cargaron con un script directo)
INSERT INTO #SYNCTABLAS (ObjectID,ObjectName) 
    select lu.ObjectID,     lu.ObjectName
    from LASTUPDATE lu left join SYNCBITACORA syn on lu.ObjectID=syn.ObjectID
    where RowsNumber<@NumMaxReg 
        and RowsNumber>@Entero_cero 
        and isnull(syn.BitacoraID,0)=0

-- Objetos pendientes de cargar (no se cargaron con un script directo)







    DECLARE @count INT;
    SELECT @count = COUNT(*) FROM #SYNCTABLAS ;

    WHILE @count > 0
    BEGIN
        DECLARE @ObjectName VARCHAR(50) = (SELECT TOP(1) ObjectName FROM #SYNCTABLAS);
        DECLARE @ObjectID VARCHAR(50)   = (SELECT TOP(1) ObjectID FROM #SYNCTABLAS);
        DECLARE @ColumNames VARCHAR(max)= ( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                            FROM INFORMATION_SCHEMA.COLUMNS
                                            WHERE TABLE_NAME = @ObjectName and TABLE_CATALOG='IEEPO')
        DECLARE @SQLErrMen  varchar(1000)
        DECLARE @SQLCommand varchar(max) 
        DECLARE @SQLSET     varchar(1000)
        DECLARE @SQLSETOFF  varchar(1000)
        DECLARE @IDENTITY   char
        SET @IDENTITY='N'
        SET @SQLSET=''
        SET @SQLSETOFF=''
        -- SET @SQLCommand='insert into IEEPOSYNC.dbo.' + @ObjectName + ' select * from ' + @ObjectName 
        -- Vaciamos la tabla destino
        BEGIN TRY     
            SET @SQLCommand= 'TRUNCATE TABLE IEEPOSYNC.dbo.' + @ObjectName
            PRINT 'TRUNCAR : '+ @SQLCommand  
            EXEC (@sqlCommand)
        END TRY          
        BEGIN CATCH  
            SET @SQLErrMen=(select ERROR_MESSAGE())
            PRINT @SQLErrMen
        END CATCH  
        
        -- Si la tabla contiene IDEntity
        DECLARE @SQLIdentity int = (select (OBJECTPROPERTY(@ObjectID, 'TableHasIdentity')))
        -- PRINT @SQLIdentity
        IF(@SQLIdentity =1)
            BEGIN
                BEGIN TRY     
                    SET @IDENTITY= 'S'
                    SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
                    SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
                    PRINT 'IDENTITY : ' + @SQLSET
                    --EXEC (@sqlCommand)
                END TRY  
                BEGIN CATCH  
                    SET @SQLErrMen=(select ERROR_MESSAGE())
                    PRINT @SQLErrMen
                END CATCH
            END
        
        BEGIN TRY    
            
            SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + '( ' + @ColumNames +' ) select '+ @ColumNames + ' from ' + @ObjectName + ' ' + @SQLSETOFF
            PRINT 'INSERT.. '
            EXEC (@sqlCommand)
            exec SYNCBITACORAALT @ObjectID,@ObjectName,'N' ,@IDENTITY 
        END TRY
        BEGIN CATCH  
            SET @SQLErrMen=(select ERROR_MESSAGE())
            PRINT @SQLErrMen
        END CATCH

        DELETE TOP (1) FROM #SYNCTABLAS
        SELECT @count = COUNT(*) FROM #SYNCTABLAS;
    END --  del while


select * from SYNCBITACORA


    USE WSCALCULO
    EXEC (@SQLCreateFK)
    PRINT 'Llaves reconstruidas'
    USE IEEPO29JUL
    GO



 

declare @Var_UltimoPeriodo int= (select max(Id_Periodo) from CalenNomina)
select @Var_UltimoPeriodo -- ultimo periodo registrado.




		select min(Id_Periodo) from CalenNomina  where Fechaini>= (select DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) )
--
select Id_Periodo, FechaIni,FechaFin,Parcial,PeriodoMensual,FechaPago 
from CalenNomina where Id_Periodo BETWEEN 3044 and 3223 and Id_cia=2

3044

select CONVERT(DATE,GETDATE())
select date()

 select DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) 

  select  DATEDIFF(yy, 0, GETDATE())
  


select * from CATANIOQUINCENA