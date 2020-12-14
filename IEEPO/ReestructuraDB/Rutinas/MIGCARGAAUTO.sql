GO
drop PROCEDURE  if exists [dbo].[MIGCARGAAUTO]
go
create PROCEDURE [dbo].[MIGCARGAAUTO] ( @Par_MaxNumRegistros bigint,  -- Se copian solo tablas con un NumFilas < Par_NumReg
                                        @Par_Salida char ,-- S= Si(Completa) , M=Minimal , N=No 
                                        @Par_Ejecuta char -- S= SI , NO=NO ,                                     
                                        )
WITH EXEC AS CALLER
AS
BEGIN 
 SET NOCOUNT ON 


    DECLARE @NumMaxReg      bigint  -- numero maximo de registros para cargar la tabla completa
    DECLARE @Entero_cero    int 

    SET @Entero_cero=0
    SET @NumMaxReg=@Par_MaxNumRegistros -- probar  
    


    drop table if exists #TMPMIGTABLAS
    CREATE TABLE #TMPMIGTABLAS(
            ObjectID int, 
            NombreTabla  varchar(200),
            NumFilas     bigint
        )

    create CLUSTERED index idxNumFilas on  #TMPMIGTABLAS(NumFilas desc)
    -- Objetos pendientes de cargar (no se cargaron con un script directo)
    INSERT INTO #TMPMIGTABLAS (ObjectID,NombreTabla,NumFilas) 
        select MIG.ObjectIDDestino,MIG.NombreTabla,MIG.NumFilasOrigen
        from RELACIONOBJETOSMIG MIG left join MIGBITACORA TMP on MIG.ObjectIDDestino=TMP.ObjectIDDestino
        where MIG.NumFilasOrigen <@NumMaxReg 
            and MIG.NumFilasOrigen>@Entero_cero 
            and isnull(TMP.BitacoraID,0)=0 
            order by MIG.NumFilasOrigen desc




        DECLARE @count INT;
        SELECT @count = COUNT(*) FROM #TMPMIGTABLAS ;

        WHILE @count > 0
        BEGIN
            DECLARE @ObjectName     VARCHAR(50) = (SELECT TOP(1) NombreTabla FROM #TMPMIGTABLAS)
            DECLARE @NumRegistros   BIGINT      = (SELECT TOP(1) NumFilas FROM #TMPMIGTABLAS) 
            DECLARE @ObjectID       VARCHAR(50) = (SELECT TOP(1) ObjectID FROM #TMPMIGTABLAS)
            DECLARE @ColumNames     VARCHAR(max)= ( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
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
            IF(@Par_Salida='M')
                    BEGIN
                    PRINT 'Procesando Tabla : ['+ @ObjectName + '] '
                    END
            BEGIN TRY 
                    SET @SQLCommand= 'TRUNCATE TABLE IEEPOSYNC.dbo.' + @ObjectName
                    -- PRINT 'TRUNCAR : '+ @SQLCommand  
                    IF(@Par_Salida='S')
                        PRINT 'Borrando Información existente: '+ @SQLCommand  
                -- EXEC (@sqlCommand)
            END TRY          
            BEGIN CATCH  
                SET @SQLErrMen=(select ERROR_MESSAGE())
                PRINT '##ERROR## ' + @SQLErrMen
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
                        IF(@Par_Salida='S')
                        PRINT 'Ajustando Parametros : ' + @SQLSET
                        --EXEC (@sqlComfdfdfmand)
                    END TRY  
                    BEGIN CATCH  
                        SET @SQLErrMen=(select ERROR_MESSAGE())
                         PRINT '##ERROR## ' + @SQLErrMen
                    END CATCH
                END
            
            BEGIN TRY    
                
                SET @SQLCommand=@SQLSET + 'insert into IEEPOSYNC.dbo.' + @ObjectName + '( ' + @ColumNames +' ) select '+ @ColumNames + ' from ' + @ObjectName + ' ' + @SQLSETOFF
                IF(@Par_Salida='S')
                PRINT 'Insertando datos: INSERT INTO ' + @ObjectName + '...'
                EXEC (@sqlCommand)
                exec MIGBITACORAALT @ObjectID,@ObjectName,'N' ,@IDENTITY 
            END TRY
            BEGIN CATCH  
                SET @SQLErrMen=(select ERROR_MESSAGE())
                PRINT '##ERROR## ' + @SQLErrMen
            END CATCH

             IF(@Par_Salida='M')
                    BEGIN
                    PRINT '      \_Procesados : '+ cast(@NumRegistros as VARCHAR) + ' registros. '
                    END

            DELETE TOP (1) FROM #TMPMIGTABLAS
            SELECT @count = COUNT(*) FROM #TMPMIGTABLAS;
        END --  del while
END