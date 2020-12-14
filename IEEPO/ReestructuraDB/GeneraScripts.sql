-- ** ALTERNATIVO **
-- se generan los Scripts SQL en batchs individuales
-- para evitar llenar el log de transacciones
DECLARE  @Var_Tabla varchar(200)
SET  @Var_Tabla='histpagosdetalle'

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

    
	drop table if exists SQLINSERT
	CREATE TABLE SQLINSERT
	(
	SQLInsert Varchar(500)
	)

-- select * from #tmpperiodos

DECLARE @Periodo INT = (select min(ID_Periodo) FROM #tmpperiodos)
DECLARE @MaxPeriodo INT=(select max(ID_Periodo) FROM #tmpperiodos)
DECLARE @SQLErrMen varchar(max)
DECLARE @SQL varchar(500)

USE [IEEPOSYNC]
    
WHILE  @MaxPeriodo >= @Periodo
    BEGIN
        -- print 'select * from nom_histpagos where ID_Periodo=' + cast(@Periodo as varchar)
		SET @SQL= 'insert into IEEPOSYNC.dbo.'+ @Var_Tabla  + ' select * from IEEPO.dbo.' + @Var_Tabla +  ' where id_Periodo=' + cast(@Periodo as varchar)
		insert into SQLINSERT values('GO')
		insert into SQLINSERT values(@SQL)
        -- Controlar el commit
		/*
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
*/
        SET @Periodo=@Periodo+1
    END

-- mostramos las sentencias en bloques individuales
select * from SQLINSERT


select count(*) from IEEPOSYNC.dbo.nom_histpagos
select count(*) from IEEPOSYNC.dbo.histpagosdetalle