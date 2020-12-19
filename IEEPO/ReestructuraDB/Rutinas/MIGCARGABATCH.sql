DECLARE @Var_TotalAnios int
DECLARE @Par_Anios  int
DECLARE @Var_FechaIni DATETIME
DECLARE @Var_FechaFin DATETIME
DECLARE @Var_AnioIni int
DECLARE  @Var_NumRegistros INT
SET @Par_Anios=5 -- Parametro



SET @Var_AnioIni    =   year((dateadd(year,(@Par_Anios * -1 ),getdate())))
SET @Var_FechaIni  = DATEFROMPARTS(@Var_AnioIni,1,1)
SET @Var_FechaFin= dateadd(minute,-1,dateadd(year,1,@Var_FechaIni))
-- select @Var_FechaIni,@Var_FechaFin

-- truncamos las tablas que vamos a cargar
TRUNCATE TABLE IEEPOSYNC.dbo.Hplazas

--
-- print @Var_AnioIni
DECLARE @SQLCommand varchar(max) 
DECLARE @SQLWhere    varchar(500)
DECLARE @SQLSET     varchar(1000)
DECLARE @SQLSETOFF  varchar(1000)
DECLARE @ObjectName  varchar(200)
DECLARE @ColumNames VARCHAR(max)
DECLARE @SQLErrMen  varchar(1000)

    SET @Var_TotalAnios=82
    SET @Var_FechaIni='1938-01-01 00:00:00.000'
    SET @Var_FechaFin='1938-12-31 23:59:00.000'

    DECLARE @count INT;
    SELECT @count =0


-- HPLAZAS SE VA COMPLETA --
--  ---------------------------
    WHILE @count < @Var_TotalAnios
    BEGIN
        SET @Var_FechaIni=DATEADD(year,1,@Var_FechaIni)
        SET @Var_FechaFin=DATEADD(year,1,@Var_FechaFin)
        -- --------------
        ----- Hplazas ----
        -- --------------
        SET @Var_NumRegistros=(select count(*) from  IEEPO.dbo.Hplazas where Movimiento  between @Var_FechaIni and @Var_FechaFin)       
        SET @ObjectName='Hplazas'
        SET @SQLWhere=' where Movimiento  between '+ char(39) + convert(varchar,@Var_FechaIni,20) + char(39)  + ' and  '+ char(39)  + convert(varchar,@Var_FechaFin,20) + char(39) + ' '
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + '( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print @SQLCommand
        BEGIN TRY
            EXEC (@sqlCommand)
            EXEC MIGBITACORAALT 0,'Hplazas','N','N'
        SET @SQLErrMen=''
        END TRY
        BEGIN CATCH
                 SET @SQLErrMen=(select ERROR_MESSAGE())
                PRINT '##ERROR## ' + @SQLErrMen
        END CATCH


        -- > loop
        SET @count =@count +1
    END --  del while


-- TABLAS QUE SE FILTRAN POR PERIODO
-- Se hace un loop por cada periodo desde N Años Atras...        
/*

drop table if exists #tmpperiodos
CREATE TABLE #tmpperiodos
    (
    ID_Periodo int
    )

-- insertamos los periodos del año actual
INSERT INTO #tmpperiodos 
    SELECT ID_Periodo 
    FROM IEEPO.dbo.CalenNomina 
    WHERE FechaIni>=@Var_FechaIni order by ID_Periodo desc -- 178

DECLARE @Periodo INT = (select min(ID_Periodo) FROM #tmpperiodos)
DECLARE @MaxPeriodo INT=(select max(ID_Periodo) FROM #tmpperiodos)
-- DECLARE @SQLErrMen varchar(max)
DECLARE @SQL varchar(500)


TRUNCATE  TABLE IEEPOSYNC.dbo.Histpagos
TRUNCATE  TABLE IEEPOSYNC.dbo.histpagosdetalle
TRUNCATE  TABLE IEEPOSYNC.dbo.Recalculo_histpagos
TRUNCATE  TABLE IEEPOSYNC.dbo.Hvectores
TRUNCATE  TABLE IEEPOSYNC.dbo.Folio_Recibos
TRUNCATE  TABLE IEEPOSYNC.dbo.RastreoImpuesto

TRUNCATE  TABLE IEEPOSYNC.dbo.nom_histpagos
TRUNCATE  TABLE IEEPOSYNC.dbo.Nom_pagos_hist


WHILE  @MaxPeriodo >= @Periodo
    BEGIN
        
        -- =========================
        -- Histpagos
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='Histpagos'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- |SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- |SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand) -- 2 min
        EXEC MIGBITACORAALT 0,'Histpagos','N','N'
        


        -- =========================
        -- histpagosdetalle
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='histpagosdetalle'
        SET @SQLWhere=' where id_periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand) -- 18 minutos
        EXEC MIGBITACORAALT 0,'histpagosdetalle','N','N'
        

        --  =========================
        -- Recalculo_histpagos
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='Recalculo_histpagos'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand) -- 34 mins
        EXEC MIGBITACORAALT 0,'Recalculo_histpagos','N','N'
        
        

        -- =========================
        -- Hvectores
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='Hvectores'
        SET @SQLWhere=' where id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand)
        EXEC MIGBITACORAALT 0,'Hvectores','N','N'


        
        -- =========================
        -- Folio_Recibos
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='Folio_Recibos'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand)
        EXEC MIGBITACORAALT 0,'Folio_Recibos','N','S'


        -- =========================
        -- RastreoImpuesto
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='RastreoImpuesto'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand)
        EXEC MIGBITACORAALT 0,'RastreoImpuesto','N','N'


        
        

        -- =========================
        -- nom_histpagos
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='nom_histpagos'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand)
        EXEC MIGBITACORAALT 0,'nom_histpagos','N','N'

        -- =========================
        -- Nom_pagos_hist -- 
        -- =========================
        SET @SQLSET     =' ' 
        SET @SQLSETOFF  =' '
        SET @ObjectName='Nom_pagos_hist'
        SET @SQLWhere=' where Id_Periodo=' + cast(@Periodo as NVARCHAR)  
        SET @ColumNames=( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                    FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_NAME = @ObjectName  and TABLE_CATALOG='IEEPOSYNC')
        -- SET @SQLSET     = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' ON ' 
        -- SET @SQLSETOFF  = 'SET IDENTITY_INSERT IEEPOSYNC.dbo.' +@ObjectName + ' OFF ' 
        SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + ' ( ' + @ColumNames +' ) select '+ @ColumNames + ' from IEEPO.dbo.' + @ObjectName + '  '+ @SQLWhere + ' ' + @SQLSETOFF   
        print  @SQLCommand
        exec  (@SQLCommand)
        EXEC MIGBITACORAALT 0,'Nom_pagos_hist','N','N'



        -- Controlar el commit
*/
        SET @Periodo=@Periodo+1
    END

select count(*) from IEEPO.dbo.Recalculo_histpagos
select count(*) from IEEPOSYNC.dbo.Recalculo_histpagos


