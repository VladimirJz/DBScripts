-- ==== Layout Quincena  ====
 
declare @Par_Periodo varchar(7) = '16/2020'
declare @Var_Anio int
declare @Var_QuincenaID int
declare @Entero_Cero int
declare @Var_PeriodoID int

declare @Var_PeriodoNumID varchar(6)
declare @Var_NumConceptos int

set @Var_QuincenaID =(select SUBSTRING(@Par_Periodo,1,2))
set @Var_Anio= (select SUBSTRING(@Par_Periodo,4,4))
set @Entero_Cero = 0
SET @Var_PeriodoID= (select coalesce(PeriodoID,@Entero_Cero) from TMP_PERIODOS where Quincena=@Var_QuincenaID and Anio=@Var_Anio)
SET @Var_PeriodoID = (select coalesce (@Var_PeriodoID,@Entero_Cero))


SET @Var_PeriodoNumID =  (select concat(convert(varchar,@Var_Anio),RIGHT('0'+convert(varchar,@Var_QuincenaID),2)))

-- select @Var_Anio,@Var_QuincenaID,@Var_PeriodoID,@Par_Periodo,@Var_PeriodoNumID

truncate table TMP_DATOSEC
truncate table TMP_DETALLENOM
truncate table TMP_PERIODOS

if (@Var_PeriodoID=0)
BEGIN
    print 'entra'
    insert into TMP_PERIODOS(Quincena,Anio) values(@Var_QuincenaID,@Var_Anio)
    SET @Var_PeriodoID= (select coalesce(PeriodoID,@Entero_Cero) from TMP_PERIODOS where Quincena=@Var_QuincenaID and Anio=@Var_Anio)
    SET @Var_PeriodoID = (select coalesce (@Var_PeriodoID,@Entero_Cero))
    
    -- Aislamos el conjunto de datos con los que trabajaremos.
    insert into TMP_DATOSEC(NumComprobante,     TipoNominaID,   Periodo,        Plaza,      CURP,
	                        TipoConcepto,       Concepto,       Descripcion,    Importe,    BaseCalculoISR,
	                        Detalle,            PeriodoID )

                    select 	[NUM_COMPROBANTE],  [TIPO_NOMINA],  [PERIODO],      [PLAZA],    [CURP], 
                            [TIPO_CONCEPTO],    [CONCEPTO],	    [DESCRIPCION], 	[IMPORTE],  [BASE_CALCULO_ISR],
                            [DETALLE],          @Var_PeriodoID 
                    from  Datos_Enviados_Ctos whit(nolock) where PERIODO=@Par_Periodo OPTION(maxdop 4) -- 1 m 37 segundos
    	
    -- Copiamos los registros de DETALLE NOMINA


    insert into TMP_DETALLENOM( DetalleID,  NumComprobante, Nombre,         PrimerApellido,         SegundoApellido,
                                CURP,       RFC,            NSS,            Plaza,                  Clave_CCT,
                                FechaPago,  FechaInicio,    FechaTermino,   ImportePercepciones,    ImporteDeducciones,
                                ImporteNeto,Estatus,        Subestatus,     FormaPago,              Banco,
                                ClaveBanco, Validada,       Quincena,       EmpleadoID,             PlazaID, 
                                Nomina,     PeriodoID
    )
    select  id_detalle,     [NUM_COMPROBANTE],  [NOMBRE],       [PRIMER_APELLIDO],      [SEGUNDO_APELLIDO],
            [CURP],         [RFC],              [NSS],          [CLAVE_PLAZA],          [CLAVE_CCT], 
            [FECHA_PAGO],   [FECHA_INICIO],     [FECHA_TERMINO],[IMPORTE_PERCEPCIONES], [IMPORTE_DEDUCCIONES],
            [IMPORTE_NETO] ,[ESTATUS],          [SUBESTATUS],   [FORMA_PAGO],           [BANCO],
            [CLABE_BANCO], [VALIDADA],          [QUINCENA],     [id_emp],               [id_plaza],
    [nomina], @Var_PeriodoID 
        from Detalle_Nomina  whit(nolock) where QUINCENA= @Var_PeriodoNumID OPTION(maxdop 4) -- @Var_PeriodoNumID -- 8 segndos (12s)
 
 -- 03 Minutos 52 Segundos
 -- TMP_DATOSEC = 1,983,437
 -- TMP_DETALLENOM = 112,019

END


insert into TMP_NOMINAPAGOS (  NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         ESTATUS,            EmpleadoID,     NumComprobante)
                        
                        select -- top 10   
                                'R20',           
                                'OAXACA',           
                                CASE WHEN TRIM(dn.nomina) = 'ORDINARIA' THEN 'O' ELSE 'E' END,
                                CASE WHEN PlazaID like '%F%' THEN 'CONFIANZA' WHEN PlazaID like '%AA%' THEN 'MANDOS MEDIOS' ELSE 'BASE'END,   
                                dn.RFC,

                                dn.CURP,        
                                ISNULL(dn.Nombre, '')+ ' '+ISNULL(dn.PrimerApellido, '')+' '+ISNULL(dn.SegundoApellido,'') ,
                                dn.Plaza,           
                                CASE WHEN substring(dn.Plaza,7, 1) = 'E' THEN ' '+substring(dn.Plaza,7, 5) ELSE substring(dn.Plaza,7, 6) END,
                                CAST(CASE WHEN substring(dn.Plaza,7, 1) = 'E' THEN substring(dn.Plaza,12, 3) ELSE substring(dn.Plaza,13, 3)END AS INT) ,
                                
                                dbo.fechaToAnioQuincena(dn.FechaInicio),
                                dbo.fechaToAnioQuincena(dn.FechaTermino),
                                dbo.fechaToAnioQuincena(dn.FechaPago),
                                CASE WHEN UPPER(substring(FormaPago,1, 2)) = 'DE' THEN 'EL'ELSE 'CH' END,
                                0, --CASE WHEN UPPER(substring(forma_pago,1, 2)) = 'CH' THEN hn.cheque ELSE 0 END

                                dn.ClaveBanco,
                                ImportePercepciones,
                                ImporteDeducciones,
                                ImporteNeto,
                                '' ,-- dbo.altaempleado(dn.EmpleadoID),
                                
                                '' ,-- dbo.bajaempleado(dn.EmpleadoID, dn.PlazaID, dn.FechaPago),
                                '' , -- dbo.bajamotivo(dn.EmpleadoID, dn.PlazaID, dn.FechaPago),
                                '' , -- IIF(dbo.bajaempleado(dn.EmpleadoID, dn.PlazaID, dn.FechaPago) IS NULL , 'ACTIVO', 'BAJA')
                                dn.EmpleadoID,
                                dn.NumComprobante
from TMP_DATOSEC dec inner join TMP_DETALLENOM  dn on dec.PeriodoID=dn.PeriodoID
    and  dn.NumComprobante=dec.NumComprobante 
    and dn.CURP = dec.CURP and dn.Plaza = dec.Plaza   --  1,983,421 rows  -- 06 minutos  x 20 min +
    
   OPTION(MAXDOP 6)



insert into TMP_LAYOUTNOMINA (  NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         ESTATUS,            EmpleadoID,     NumComprobante)

                select distinct NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         ESTATUS,            EmpleadoID,     NumComprobante
                from TMP_NOMINAPAGOS --- 112,018 (1:23s)



select distinct TipoConcepto,Concepto from TMP_DATOSEC -- (232 rows  27 s

select TipoConcepto,Concepto from TMP_DATOSEC group by TipoConcepto,Concepto order by TipoConcepto desc -- (232 rows  27 s

drop table if exists TMP_CONCEPTOS
create table TMP_CONCEPTOS
(   ID int IDENTITY(1,1),
    NumComprobante int,
    Plaza varchar(50),
    CURP varchar(18),
    TipoConcepto varchar(2),
    Concepto varchar(3),
    Importe decimal(18,2),
    Consecutivo int

)

insert into TMP_CONCEPTOS(NumComprobante,Plaza,CURP,TipoConcepto,Concepto,Importe,Consecutivo)
select NumComprobante,Plaza,CURP,TipoConcepto,Concepto,Importe,row_number() over(partition by NumComprobante,Plaza,CURP order by NumComprobante)  
from TMP_DATOSEC OPTION(maxdop 4) -- 01 minuto




drop table if exists TMP_FILACONCEPTOS  
drop table if exists TMP_NOMINACONCEPTOS

-- desde aqui
declare @Var_NumConceptos int
SET @Var_NumConceptos= (select max(NumConceptos) from (select count(*)NumConceptos 
                            from TMP_DATOSEC 
                            GROUP by NumComprobante,Plaza,Curp )Conceptos )

        DECLARE @Var_SQLSelect varchar(500)
        DECLARE @Var_SQLFrom    varchar(2000)
        DECLARE @Var_Contador INT;
        DECLARE @Var_SQLColumns varchar(max)
        DECLARE @Var_SQLCreateTable nvarchar(max)
        DECLARE @Var_SQLCreateTableNom nvarchar(max)

        DECLARE @Var_SQLInsert NVARCHAR(max)
        DECLARE @Var_SQLGroup NVARCHAR(max)
        SET @Var_Contador = 1 ;
        SET @Var_SQLCreateTable='CREATE TABLE TMP_FILACONCEPTOS (NumComprobante int, Plaza varchar (50), CURP varchar(25), '
        SET @Var_SQLCreateTableNom='CREATE TABLE TMP_NOMINACONCEPTOS (NumComprobante int, Plaza varchar (50), CURP varchar(25), '

        WHILE @Var_Contador <= @Var_NumConceptos
        BEGIN
            SET @Var_SQLColumns=concat(@Var_SQLColumns,'CASE WHEN (Consecutivo)=', cast(@Var_Contador as char) ,' THEN max(TipoConcepto) else '''' END ,'  )
            SET @Var_SQLColumns=concat(@Var_SQLColumns,'CASE WHEN (Consecutivo)=', cast(@Var_Contador as char) ,' THEN max(Concepto) else '''' END ,'  )
            SET @Var_SQLColumns=concat(@Var_SQLColumns,'CASE WHEN (Consecutivo)=', cast(@Var_Contador as char) ,' THEN max(Importe) else 0.00 END ,'  )
            
            SET @Var_SQLCreateTable=concat(@Var_SQLCreateTable,concat('TipoConcepto',cast(@Var_Contador as char),' varchar(20),'))        
            SET @Var_SQLCreateTable=concat(@Var_SQLCreateTable,concat('Concepto',cast(@Var_Contador as char),' varchar(20),'))
            SET @Var_SQLCreateTable=concat(@Var_SQLCreateTable,concat('Importe',cast(@Var_Contador as char),' decimal(18,2),'))

            SET @Var_SQLCreateTableNom=concat(@Var_SQLCreateTableNom,concat('TipoConcepto',cast(@Var_Contador as char),' varchar(20),'))        
            SET @Var_SQLCreateTableNom=concat(@Var_SQLCreateTableNom,concat('Concepto',cast(@Var_Contador as char),' varchar(20),'))
            SET @Var_SQLCreateTableNom=concat(@Var_SQLCreateTableNom,concat('Importe',cast(@Var_Contador as char),' decimal(18,2),'))

            SET @Var_SQLGroup= concat(@Var_SQLGroup,'max(TipoConcepto',cast(@Var_Contador as char),'),max(Concepto',cast(@Var_Contador as char),'),max(Importe',cast(@Var_Contador as char),'),')

            SET @Var_Contador =@Var_Contador + 1
        END
       --  select @Var_SQLColumns

SET @Var_SQLGroup=concat('INSERT INTO TMP_NOMINACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(CURP), ', STUFF(@Var_SQLGroup,LEN(@Var_SQLGroup),1,' ') )
SET @Var_SQLGroup= concat(@Var_SQLGroup,' from TMP_FILACONCEPTOS group by NumComprobante,Plaza,CURP ')

SET @Var_SQLSelect = 'INSERT INTO TMP_FILACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(Curp),'
SET @Var_SQLFrom =  ' 0.0  from TMP_CONCEPTOS GROUP by NumComprobante,Plaza,Curp,Consecutivo'
SET @Var_SQLCreateTableNom  = STUFF(@Var_SQLCreateTableNom,LEN(@Var_SQLCreateTableNom),1,')') -- @Var_SQLCreateTable STUFF(@MyWORD, LEN(@MyWORD), 1, '2')
SET @Var_SQLCreateTable     = concat (@Var_SQLCreateTable,' Total decimal(18,2))')
-- 
-- Consulta para el insert
select @Var_SQLSelect+@Var_SQLColumns+@Var_SQLFrom
select @Var_SQLCreateTable
select @Var_SQLCreateTableNom
SET @Var_SQLInsert= concat( @Var_SQLSelect,@Var_SQLColumns,@Var_SQLFrom) 

exec sp_executesql @Var_SQLCreateTable
exec sp_executesql @Var_SQLCreateTableNom
select @Var_SQLInsert
select @Var_SQLGroup -- 17 minutos (112,019)
exec sp_executesql @Var_SQLInsert -- 4: 41 minutos (full)
exec sp_executesql @Var_SQLGroup


select * from TMP_NOMINACONCEPTOS
select * from TMP_FILACONCEPTOS

update TMP_FILACONCEPTOS set 


 
select *  from  TMP_LAYOUTNOMINA lay inner join TMP_NOMINACONCEPTOS con
on lay.NumComprobante=con.NumComprobante and lay.PLAZA=con.Plaza and  lay.CURP=con.CURP  -- 112,018



CREATE TABLE TMP_NOMINACONCEPTOS (NumComprobante int, Plaza varchar (50), CURP varchar(25)) 






##################
SELECT max(NumComprobante),max(Plaza),max(CURP), max(TipoConcepto1                             ),max(Concepto1                             ),max(Importe1                             ),max(TipoConcepto2                             ),max(Concepto2                             ),max(Importe2                             ),max(TipoConcepto3                             ),max(Concepto3                             ),max(Importe3                             ),max(TipoConcepto4                             ),max(Concepto4                             ),max(Importe4                             ),max(TipoConcepto5                             ),max(Concepto5                             ),max(Importe5                             ),max(TipoConcepto6                             ),max(Concepto6                             ),max(Importe6                             ),max(TipoConcepto7                             ),max(Concepto7                             ),max(Importe7                             ),max(TipoConcepto8                             ),max(Concepto8                             ),max(Importe8                             ),max(TipoConcepto9                             ),max(Concepto9                             ),max(Importe9                             ),max(TipoConcepto10                            ),max(Concepto10                            ),max(Importe10                            ),max(TipoConcepto11                            ),max(Concepto11                            ),max(Importe11                            ),max(TipoConcepto12                            ),max(Concepto12                            ),max(Importe12                            ),max(TipoConcepto13                            ),max(Concepto13                            ),max(Importe13                            ),max(TipoConcepto14                            ),max(Concepto14                            ),max(Importe14                            ),max(TipoConcepto15                            ),max(Concepto15                            ),max(Importe15                            ),max(TipoConcepto16                            ),max(Concepto16                            ),max(Importe16                            ),max(TipoConcepto17                            ),max(Concepto17                            ),max(Importe17                            ),max(TipoConcepto18                            ),max(Concepto18                            ),max(Importe18                            ),max(TipoConcepto19                            ),max(Concepto19                            ),max(Importe19                            ),max(TipoConcepto20                            ),max(Concepto20                            ),max(Importe20                            ),max(TipoConcepto21                            ),max(Concepto21                            ),max(Importe21                            ),max(TipoConcepto22                            ),max(Concepto22                            ),max(Importe22                            ),max(TipoConcepto23                            ),max(Concepto23                            ),max(Importe23                            ),max(TipoConcepto24                            ),max(Concepto24                            ),max(Importe24                            ),max(TipoConcepto25                            ),max(Concepto25                            ),max(Importe25                            ),max(TipoConcepto26                            ),max(Concepto26                            ),max(Importe26                            ),max(TipoConcepto27                            ),max(Concepto27                            ),max(Importe27                            ) from TMP_FILACONCEPTOS group by NumComprobante,Plaza,CURP 

INSERT INTO TMP_NOMINACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(CURP), max(TipoConcepto1                             ),max(Concepto1                             ),max(Importe1                             ),max(TipoConcepto2                             ),max(Concepto2                             ),max(Importe2                             ),max(TipoConcepto3                             ),max(Concepto3                             ),max(Importe3                             ),max(TipoConcepto4                             ),max(Concepto4                             ),max(Importe4                             ),max(TipoConcepto5                             ),max(Concepto5                             ),max(Importe5                             ),max(TipoConcepto6                             ),max(Concepto6                             ),max(Importe6                             ),max(TipoConcepto7                             ),max(Concepto7                             ),max(Importe7                             ),max(TipoConcepto8                             ),max(Concepto8                             ),max(Importe8                             ),max(TipoConcepto9                             ),max(Concepto9                             ),max(Importe9                             ),max(TipoConcepto10                            ),max(Concepto10                            ),max(Importe10                            ),max(TipoConcepto11                            ),max(Concepto11                            ),max(Importe11                            ),max(TipoConcepto12                            ),max(Concepto12                            ),max(Importe12                            ),max(TipoConcepto13                            ),max(Concepto13                            ),max(Importe13                            ),max(TipoConcepto14                            ),max(Concepto14                            ),max(Importe14                            ),max(TipoConcepto15                            ),max(Concepto15                            ),max(Importe15                            ),max(TipoConcepto16                            ),max(Concepto16                            ),max(Importe16                            ),max(TipoConcepto17                            ),max(Concepto17                            ),max(Importe17                            ),max(TipoConcepto18                            ),max(Concepto18                            ),max(Importe18                            ),max(TipoConcepto19                            ),max(Concepto19                            ),max(Importe19                            ),max(TipoConcepto20                            ),max(Concepto20                            ),max(Importe20                            ),max(TipoConcepto21                            ),max(Concepto21                            ),max(Importe21                            ),max(TipoConcepto22                            ),max(Concepto22                            ),max(Importe22                            ),max(TipoConcepto23                            ),max(Concepto23                            ),max(Importe23                            ),max(TipoConcepto24                            ),max(Concepto24                            ),max(Importe24                            ),max(TipoConcepto25                            ),max(Concepto25                            ),max(Importe25                            ),max(TipoConcepto26                            ),max(Concepto26                            ),max(Importe26                            ),max(TipoConcepto27                            ),max(Concepto27                            ),max(Importe27                            ), from TMP_FILACONCEPTOS group by NumComprobante,Plaza,CURP 

INSERT INTO TMP_FILACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(Curp),CASE WHEN (Consecutivo)=1                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=1                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=1                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=2                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=2                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=2                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=3                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=3                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=3                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=4                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=4                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=4                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=5                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=5                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=5                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=6                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=6                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=6                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=7                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=7                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=7                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=8                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=8                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=8                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=9                              THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=9                              THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=9                              THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=10                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=10                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=10                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=11                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=11                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=11                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=12                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=12                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=12                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=13                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=13                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=13                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=14                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=14                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=14                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=15                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=15                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=15                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=16                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=16                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=16                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=17                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=17                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=17                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=18                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=18                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=18                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=19                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=19                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=19                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=20                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=20                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=20                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=21                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=21                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=21                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=22                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=22                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=22                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=23                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=23                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=23                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=24                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=24                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=24                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=25                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=25                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=25                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=26                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=26                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=26                             THEN max(Importe) else 0.00 END ,CASE WHEN (Consecutivo)=27                             THEN max(TipoConcepto) else '' END ,CASE WHEN (Consecutivo)=27                             THEN max(Concepto) else '' END ,CASE WHEN (Consecutivo)=27                             THEN max(Importe) else 0.00 END , 0.0  from TMP_CONCEPTOS GROUP by NumComprobante,Plaza,Curp,Consecutivo
SET @Var_SQLFrom =  ' '''' from TMP_CONCEPTOS GROUP by NumComprobante,Plaza,Curp,Consecutivo'

select @Var_SQLSelect+@Var_SQLColumns+@Var_SQLFrom





select top 200 * from TMP_DATOSEC


















select top 200 * from TMP_LAYOUTNOMINA



/*

select 
                                max(NUM_UR),         max(NOMBRE_UR),          max(TIPO_NOMINA),        max(MODALIDAD),      max(RFC),
                                max(CURP),           max(NOMBRE_EMPLEADO),    max(PLAZA),              max(CLAVE_PUESTO),   max(HORAS),
                                max(QNA_INI),        max(QNA_FIN),            max(QNA_PROC),           max(TIPO_PAGO),      max(NUM_CHEQUE),
                                max(NUM_CTA),        max(TOTAL_PERCEPCIONES), max(TOTAL_DEDUCCIONES),  max(TOTAL_NETO),     max(QUINCENA_ALTA),
                                max(QUINCENA_BAJA),  max(MOTIVO_BAJA),        max(ESTATUS),            max(EmpleadoID),     max(NumComprobante)
                                from TMP_LAYOUTNOMINA
group by PLAZA,CURP ,NumComprobante -- 112,018 (45 s) -- con todos los campos tarda 3x

*/

/*
select max(NumComprobante),max(CURP),max(Plaza) from TMP_LAYOUTNOMINA
group by PLAZA,CURP ,NumComprobante -- 112,018 (45 s)
*/


                                 



select top 200 * from  TMP_LAYOUTNOMINA 

select top 20 * from TMP_DATOSEC
select top 20 * from TMP_DETALLENOM

SELECT TOP 20 FROM detalle_





CREATE TABLE TMP_LAYOUTNOMINA
(NUM int IDENTITY(1,1),	
NUM_UR char(3),	
NOMBRE_UR char(6),
TIPO_NOMINA char (1),
MODALIDAD varchar(10),
RFC char(13),	
CURP char(18),
NOMBRE_EMPLEADO varchar(200),
PLAZA varchar(25),	
UNIDAD int,	
CENTRO_TRABAJO varchar(20),	
CLAVE_PUESTO varchar(10),
HORAS int,
QNA_INI char(6),
QNA_FIN char(6),
QNA_PROC char(6),
TIPO_PAGO char(2),
NUM_CHEQUE	int,
NUM_CTA varchar (25), 
BANCO varchar(25),
TOTAL_PERCEPCIONES decimal(18,2),
TOTAL_DEDUCCIONES decimal(18,2),
TOTAL_NETO decimal(18,2),
FOLIO_FISCAL varchar(50),
ORIGEN_RECURSO varchar(50),	
CTA_PAGADORA varchar(25),
BANCO_PAGADORA varchar(25),	
TIPO_NÚMERO ,	
FECHA date,	
IMPORTE decimal(18,2),
QUINCENA_ALTA varchar(8)
QUINCENA_BAJA varchar(8)
MOTIVO_BAJA varchar(100),
ESTATUS varchar (10)
)


SELECT 
0 ID,'R20','OAXACA'
CASE  WHEN TRIM(dn.nomina) = 'ORDINARIA' THEN 'O' ELSE 'E' END AS tipo_nomina,
CASE WHEN clave_plaza like '%F%' THEN 'CONFIANZA'WHEN clave_plaza like '%AA%' THEN 'MANDOS MEDIOS' ELSE 'BASE' END AS modalidad_trabajador,
dn.RFC,
dn.CURP,
ISNULL(dn.NOMBRE, '')+' '+ISNULL(dn.PRIMER_APELLIDO, '')+' '+ISNULL(dn.SEGUNDO_APELLIDO,'') AS empleado,
dn.Plaza,







   select top 200 * from Datos_Enviados_Ctos
-- select top 10 * from Detalle_Nomina
   
   

	SECUENCIA,              NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,            MODALIDAD_TRABAJADOR,
	CLAVE_PUESTO,           HORAS,          TIPO_PAGO,          UNIDAD_DISTRIBUCION,    NUM_CHEQUE,
	CLABE_INTERBANCARIA,    BANCO ,         EMPLEADO ,          RFC,                    PLAZA,
	CLAVE_CCT,              NUMCOMPROBANTE, IMPORTEPERCEPCIONES,IMPORTEDEDUCCIONES,     IMPORTENETO,
	TIPOCONCEPTO,           CONCEPTO,       IMPORTE,            CLAVE_PLAZA,            FECHAALTA,
	FECHABAJA,              BAJAMOTIVO,     ESTATUS,            QNA_INI,                QNA_FIN,
	QNA_PROC,               ID_EMP 





   
    select count(*) from TMP_DATOSEC -- 2,180,817

select count(dec.PeriodoID) from TMP_DATOSEC dec inner join TMP_DETALLENOM dn on 
dec.PeriodoID=dn.PeriodoID and 
dn.NumComprobante=dec.NumComprobante  and dn.CURP = dec.CURP and dn.Plaza = dec.Plaza
where dec.PeriodoID=1 option MAXDOP(4) -- 2,180,817 ( 01 min 35 s)

select  top 1000 * from TMP_DATOSEC dec inner join TMP_DETALLENOM dn on 
dec.PeriodoID=dn.PeriodoID and 
dn.NumComprobante=dec.NumComprobante  and dn.CURP = dec.CURP and dn.Plaza = dec.Plaza
where dec.PeriodoID=1 option(MAXDOP 4) -- 2,180,817 ( 01 min 35 s)




select count(dec.PeriodoID) from TMP_DATOSEC dec inner join TMP_DETALLENOM dn on 
dec.PeriodoID=dn.PeriodoID and 
dn.NumComprobante=dec.NumComprobante  and dn.CURP = dec.CURP and dn.Plaza = dec.Plaza
LEFT JOIN rel_cheque_recibo rcr ON rcr.id_detnom = dn.DetalleID
LEFT JOIN hist_nomina hn ON rcr.id_hist = hn.id_hist
LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.vistatablalongitud vtl ON vtl.Clave = dn.CLAVE_CCT 
LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.TablaLongitudProp_28 tlp28 ON vtl.Id_Nodo = tlp28.id_nodo 
LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.bancos bnc ON dn.banco = bnc.cvebanco
WHERE dn.nomina='ORDINARIA' -- AND dn.QUINCENA='202001'
AND  dn.PeriodoID=1 and  dec.PeriodoID=1

where  -- 2,180,817 ( 01 min 35 s)



 FROM Detalle_Nomina dn  WITH (NOLOCK) 
        	INNER JOIN Datos_Enviados_Ctos dec  WITH (NOLOCK) ON dn.NUM_COMPROBANTE=dec.NUM_COMPROBANTE  and dn.CURP = dec.CURP and dn.CLAVE_PLAZA = dec.PLAZA
       
select * from  [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.vistatablalongitud vtl
LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.TablaLongitudProp_28 tlp28 ON vtl.Id_Nodo = tlp28.id_nodo 



select top 100 * from Detalle_Nomina -- qqna =  202001

    --

    --


select * from TMP_PERIODOS 
select top 1 * from TMP_DATOSEC
truncate table TMP_PERIODOS
select top 200 * from 
Datos_Enviados_Ctos where PERIODO='01/2020' -- 00/2015



                 select count(*)  from  Datos_Enviados_Ctos whit(nolock) where PERIODO='01/2020' option(maxdop 4)  -- 1 m 37 segundos
