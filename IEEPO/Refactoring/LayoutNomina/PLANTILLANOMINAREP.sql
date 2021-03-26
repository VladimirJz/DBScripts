-- ==== Layout Quincena  ====
exec PLANTILLANOMINAREP '02/2020',0,'N' -- Par: Quincena , (0=Todos,1=Solo mil), 'N' sin uso

-- =========================
GO
drop PROCEDURE  if exists [dbo].[PLANTILLANOMINAREP]
GO
create PROCEDURE [dbo].[PLANTILLANOMINAREP] (   @Par_Periodo varchar(7),  -- Formato mm/yyyy
                                                @Par_Limite int ,-- Toma solo los primeros 1000 Registros para procesar (Para pruebas de salida) 0 = sin limite (todos)
                                                @Par_Salida char -- S= Si(Completa) , M=Minimal , N=No 
                                             )
WITH EXEC AS CALLER
AS
BEGIN 
declare @Var_Anio int
declare @Var_QuincenaID int
declare @Entero_Cero int
declare @Var_PeriodoID int

declare @Var_PeriodoNumID varchar(6)
declare @Var_NumConceptos int
DECLARE @Var_SQLSelect varchar(500)
DECLARE @Var_SQLFrom    varchar(2000)
DECLARE @Var_Contador INT;

DECLARE @Var_SQLColumns varchar(max)
DECLARE @Var_SQLCreateTable nvarchar(max)
DECLARE @Var_SQLCreateTableNom nvarchar(max)
DECLARE @Var_SQLInsert NVARCHAR(max)

DECLARE @Var_SQLGroup NVARCHAR(max)

-- Para el Select Final
DECLARE @Var_SQLConceptosRep nvarchar(max)
DECLARE @Var_SQLSelectRep nvarchar(max)
DECLARE @Var_SQLFromRep nvarchar(max)
DECLARE @Var_SQLReporteLayout nvarchar(max)





-- inicializamos los objetos utilizados
truncate table TMP_PERIODOS
truncate table TMP_DATOSEC
truncate table TMP_DETALLENOM
truncate table TMP_PERIODOS
truncate table TMP_NOMINAPAGOS
truncate table TMP_LAYOUTNOMINA


-- Tablas dinamicas
drop table if exists TMP_FILACONCEPTOS  
drop table if exists TMP_NOMINACONCEPTOS

set @Var_QuincenaID =(select SUBSTRING(@Par_Periodo,1,2))
set @Var_Anio= (select SUBSTRING(@Par_Periodo,4,4))
set @Entero_Cero = 0


SET @Var_PeriodoID = (select coalesce(PeriodoID,@Entero_Cero) from TMP_PERIODOS where Quincena=@Var_QuincenaID and Anio=@Var_Anio)

SET @Var_PeriodoID = (select coalesce (@Var_PeriodoID,@Entero_Cero))
SET @Var_PeriodoNumID =  (select concat(convert(varchar,@Var_Anio),RIGHT('0'+convert(varchar,@Var_QuincenaID),2)))


if (@Var_PeriodoID=0) -- si no se ha cargado información previa. -- (#Sin funcionalidad actual)
BEGIN
    insert into TMP_PERIODOS(Quincena,Anio) values(@Var_QuincenaID,@Var_Anio)
    SET @Var_PeriodoID= (select coalesce(PeriodoID,@Entero_Cero) from TMP_PERIODOS where Quincena=@Var_QuincenaID and Anio=@Var_Anio)
    SET @Var_PeriodoID = (select coalesce (@Var_PeriodoID,@Entero_Cero))
    print 'Datos Enviados'
    -- Aislamos el conjunto de datos con los que trabajaremos.
    if(@Par_Limite=0)
    BEGIN
        insert into TMP_DATOSEC(NumComprobante,     TipoNominaID,   Periodo,        Plaza,      CURP,
                                TipoConcepto,       Concepto,       Descripcion,    Importe,    BaseCalculoISR,
                                Detalle,            PeriodoID )

                        select 	[NUM_COMPROBANTE],  [TIPO_NOMINA],  [PERIODO],      [PLAZA],    [CURP], 
                                [TIPO_CONCEPTO],    [CONCEPTO],	    [DESCRIPCION], 	[IMPORTE],  [BASE_CALCULO_ISR],
                                [DETALLE],          @Var_PeriodoID 
                        from  Datos_Enviados_Ctos whit(nolock) where PERIODO=@Par_Periodo OPTION(maxdop 4) -- 1 m 37 segundos
    END
    ELSE
    BEGIN
    print ' == Modo pruebas =='
        insert into TMP_DATOSEC(NumComprobante,     TipoNominaID,   Periodo,        Plaza,      CURP,
                                TipoConcepto,       Concepto,       Descripcion,    Importe,    BaseCalculoISR,
                                Detalle,            PeriodoID )

                        select top 1000             [NUM_COMPROBANTE],  [TIPO_NOMINA],  [PERIODO],      [PLAZA],    [CURP], 
                                                    [TIPO_CONCEPTO],    [CONCEPTO],	    [DESCRIPCION], 	[IMPORTE],  [BASE_CALCULO_ISR],
                                                    [DETALLE],          @Var_PeriodoID 
                        from  Datos_Enviados_Ctos whit(nolock) where PERIODO=@Par_Periodo OPTION(maxdop 4) -- 1 m 37 segundos
    END
    print 'Detalle Nomina'
	
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
                                [IMPORTE_NETO] ,[ESTATUS],          [SUBESTATUS],   [FORMA_PAGO],           cast([BANCO] as char),
                                [CLABE_BANCO],  [VALIDADA],          [QUINCENA],     [id_emp],               [id_plaza],
                                [nomina],       @Var_PeriodoID 
                            from Detalle_Nomina  whit(nolock) 
                            where  QUINCENA= @Var_PeriodoNumID 
                            and nomina='ORDINARIA' OPTION(maxdop 4) -- @Var_PeriodoNumID -- 8 segndos (12s)
                    
 -- 03 Minutos 52 Segundos
 -- TMP_DATOSEC = 1,983,437
 -- TMP_DETALLENOM = 112,019

END

-- Actualizamos el Banco
print 'Actualizar Banco'

update dn
SET dn.Banco=bnc.Banco
FROM TMP_DETALLENOM dn inner join [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.bancos bnc ON dn.banco = bnc.cvebanco

-- 
print 'Carga base a Formato Plantilla'

insert into TMP_NOMINAPAGOS (  NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         ESTATUS,            EmpleadoID,     NumComprobante,
                                BANCO)
                        
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
                                'ACTIVO' , -- IIF(dbo.bajaempleado(dn.EmpleadoID, dn.PlazaID, dn.FechaPago) IS NULL , 'ACTIVO', 'BAJA')
                                dn.EmpleadoID,
                                dn.NumComprobante,
                                dn.Banco
from TMP_DATOSEC dec inner join TMP_DETALLENOM  dn on dec.PeriodoID=dn.PeriodoID
and  dn.NumComprobante=dec.NumComprobante 
and dn.CURP = dec.CURP and dn.Plaza = dec.Plaza   --  1,983,421 rows  -- 06 minutos  x 20 min +
OPTION(MAXDOP 4)


print 'Agrupando registros'

insert into TMP_LAYOUTNOMINA (  NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         ESTATUS,            EmpleadoID,     NumComprobante)

                select distinct NUM_UR,         NOMBRE_UR,          TIPO_NOMINA,        MODALIDAD,      RFC,
                                CURP,           NOMBRE_EMPLEADO,    PLAZA,              CLAVE_PUESTO,   HORAS,
                                QNA_INI,        QNA_FIN,            QNA_PROC,           TIPO_PAGO,      NUM_CHEQUE,
                                NUM_CTA,        TOTAL_PERCEPCIONES, TOTAL_DEDUCCIONES,  TOTAL_NETO,     QUINCENA_ALTA,
                                QUINCENA_BAJA, MOTIVO_BAJA,         'ACTIVO' as ESTATUS,   EmpleadoID,     NumComprobante
                from TMP_NOMINAPAGOS --- 112,018 (1:23s)


print 'Identificando Conceptos'


insert into TMP_CONCEPTOS(  NumComprobante,     Plaza,  CURP,   TipoConcepto,   Concepto,
                            Importe,            Consecutivo)
                    select  NumComprobante,     Plaza,  CURP,   TipoConcepto,   Concepto,
                            Importe,            row_number() over(partition by NumComprobante,Plaza,CURP order by NumComprobante)  
                    from TMP_DATOSEC OPTION(maxdop 4) -- 01 minuto



SET @Var_NumConceptos= (select max(NumConceptos) from ( select count(*)NumConceptos 
                                                        from TMP_DATOSEC 
                                                        GROUP by NumComprobante,Plaza,Curp )Conceptos )


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
    
    SET @Var_SQLConceptosRep = concat(@Var_SQLConceptosRep,concat('TipoConcepto',cast(@Var_Contador as char)),', ')
    SET @Var_SQLConceptosRep = concat(@Var_SQLConceptosRep,concat('Concepto',cast(@Var_Contador as char)),', ')
    SET @Var_SQLConceptosRep = concat(@Var_SQLConceptosRep,concat('Importe',cast(@Var_Contador as char)),', ')


    SET @Var_Contador =@Var_Contador + 1
END

SET @Var_SQLGroup=concat('INSERT INTO TMP_NOMINACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(CURP), ', STUFF(@Var_SQLGroup,LEN(@Var_SQLGroup),1,' ') )
SET @Var_SQLGroup= concat(@Var_SQLGroup,' from TMP_FILACONCEPTOS group by NumComprobante,Plaza,CURP ')

SET @Var_SQLSelect = 'INSERT INTO TMP_FILACONCEPTOS SELECT max(NumComprobante),max(Plaza),max(Curp),'
SET @Var_SQLFrom =  ' 0.0  from TMP_CONCEPTOS GROUP by NumComprobante,Plaza,Curp,Consecutivo'

SET @Var_SQLCreateTableNom  = STUFF(@Var_SQLCreateTableNom,LEN(@Var_SQLCreateTableNom),1,')')
SET @Var_SQLCreateTable     = concat (@Var_SQLCreateTable,' Total decimal(18,2))')
-- 
-- Consulta para el insert
/*select @Var_SQLSelect+@Var_SQLColumns+@Var_SQLFrom
select @Var_SQLCreateTable
select @Var_SQLCreateTableNom*/
SET @Var_SQLInsert= concat( @Var_SQLSelect,@Var_SQLColumns,@Var_SQLFrom) 

print 'Creando tablas de conceptos (dinamico)'

exec sp_executesql @Var_SQLCreateTable

exec sp_executesql @Var_SQLCreateTableNom
/*select @Var_SQLInsert
select @Var_SQLGroup -- 17 minutos (112,019)*/
exec sp_executesql @Var_SQLInsert -- 4: 41 minutos (full)
exec sp_executesql @Var_SQLGroup

/*
select * from TMP_NOMINACONCEPTOS
select * from TMP_FILACONCEPTOS

update TMP_FILACONCEPTOS set 

*/
--  == Datos  Adicionales ===
-- ==> Numero de Cheque.
print 'Actualizando información Adicional en Plantilla'
print '... Cheques'
truncate table TMP_CHEQUES
insert into TMP_CHEQUES
          select NumComprobante,dn.Plaza,dn.CURP,cheque 
          from TMP_DETALLENOM dn inner join rel_cheque_recibo rcr ON rcr.id_detnom = dn.DetalleID
          LEFT JOIN hist_nomina hn ON rcr.id_hist = hn.id_hist

update lay    
set lay.NUM_CHEQUE=ch.Cheque
from 
TMP_CHEQUES ch inner join TMP_LAYOUTNOMINA lay
on ch.NumComprobante=lay.NumComprobante and ch.Plaza=lay.PLAZA and ch.CURP=lay.CURP

print '... UDP'

-- ==> UDP
truncate table TMP_UDP
insert into TMP_UDP
select  NumComprobante,dn.Plaza,dn.CURP,tlp28.udp  from 
TMP_DETALLENOM dn LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.vistatablalongitud vtl ON vtl.Clave = dn.CLAVE_CCT 
          LEFT JOIN [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.TablaLongitudProp_28 tlp28 ON vtl.Id_Nodo = tlp28.id_nodo -- 111811



update lay    
set lay.UNIDAD=udp.udp
from 
TMP_UDP udp inner join TMP_LAYOUTNOMINA lay
on udp.NumComprobante=lay.NumComprobante and udp.Plaza=lay.PLAZA and udp.CURP=lay.CURP


-- == Bajas Empleado ==
print '... Baja de Empleados'

truncate TABLE TMP_BAJAS

insert into TMP_BAJAS
  select distinct EmpleadoID,NumComprobante,Plaza,CURP,dbo.fechaToAnioQuincena(fdd.FechaIni)FechaBaja,fmm.Descripcion
  from TMP_DETALLENOM dn inner join ( 
  [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.FUP_Documentos fd
  inner join [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.fup_documento_detalle fdd on fd.Id_Documento = fdd.Id_Documento
  inner join [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.plazas p on fdd.Id_Plaza = p.Id_plaza
  inner join [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.FUP_MotivoMovimiento fmm on fdd.Id_MotivoMovimiento = fmm.Id_MotivoMovimiento
  inner join [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.FUP_TipoMovimiento ftm on fmm.Id_TipoMovimiento = ftm.Id_TipoMovimiento)
  on dn.EmpleadoID=fd.id_emp and fdd.Id_Plaza=PlazaID
  where fd.Id_Estatus=2 and ftm.id_tipomovimiento in (4,6,7,8) and fdd.id_motivomovimiento not in (11,12,119,120)
  and convert(date,fdd.FechaIni) < dn.FechaPago -- 04 s
  
 
update lay    
set lay.QUINCENA_BAJA=baj.FechaBaja,
    lay.MOTIVO_BAJA=baj.MotivoBaja,
    lay.ESTATUS='BAJA'
from 
TMP_BAJAS baj inner join TMP_LAYOUTNOMINA lay
on baj.EmpleadoID=lay.EmpleadoID -- 01 s
-- Comprobante/Plaza / CURP


-- == Fechas de Alta

print '... Alta de Empleados'

truncate table TMP_ALTAEMPLEADO
insert into TMP_ALTAEMPLEADO
    select max(id_emp)EmpleadoID,dbo.fechaToAnioQuincena(max(Fecha))FechaAlta from  [db.ieepo.gob.mx\MSSQLSERVER2,1414].ieepo.dbo.hfecha_alta_sep
    group by id_emp -- 06 s

update lay    
set lay.QUINCENA_ALTA=alt.FechaAlta
from 
TMP_ALTAEMPLEADO alt inner join TMP_LAYOUTNOMINA lay
on alt.EmpleadoID=lay.EmpleadoID -- 01 s
-- Comprobante/Plaza / CURP -- 05 segundos (add index)

--  ==  Reporte Final == 



SET @Var_SQLSelectRep='SELECT  row_number()over(order by NOMBRE_EMPLEADO)NUMERO ,NUM_UR,NOMBRE_UR,TIPO_NOMINA,MODALIDAD,RFC,lay.CURP,NOMBRE_EMPLEADO,lay.PLAZA,UNIDAD,CENTRO_TRABAJO,CLAVE_PUESTO,HORAS,QNA_INI,QNA_FIN,QNA_PROC,TIPO_PAGO,NUM_CHEQUE,NUM_CTA,BANCO,TOTAL_PERCEPCIONES,TOTAL_DEDUCCIONES,TOTAL_NETO,'
        

SET @Var_SQLFromRep ='FOLIO_FISCAL,ORIGEN_RECURSO,CTA_PAGADORA,BANCO_PAGADORA,TIPO_NUMERO,FECHA,IMPORTE,QUINCENA_ALTA,QUINCENA_BAJA,MOTIVO_BAJA,ESTATUS FROM TMP_LAYOUTNOMINA lay inner join TMP_NOMINACONCEPTOS con on lay.NumComprobante=con.NumComprobante and lay.PLAZA=con.Plaza and  lay.CURP=con.CURP ' -- 112,018

SET @Var_SQLReporteLayout =concat(@Var_SQLSelectRep,@Var_SQLConceptosRep,@Var_SQLFromRep)

-- == SALIDA
exec sp_executesql @Var_SQLReporteLayout



 /*
select top 200   * from  TMP_LAYOUTNOMINA lay inner join TMP_NOMINACONCEPTOS con
on lay.NumComprobante=con.NumComprobante and lay.PLAZA=con.Plaza and  lay.CURP=con.CURP  -- 112,018
*/
END
