TMP_PERIODOS
TMP_DATOSEC
TMP_DETALLENOM
TMP_PERIODOS
TMP_NOMINAPAGOS
TMP_FILACONCEPTOS
TMP_NOMINACONCEPTOS
TMP_LAYOUTNOMINA
TMP_CONCEPTOS
TMP_CHEQUES
TMP_UDP
TMP_BAJAS
TMP_ALTAEMPLEADO

drop table if exists TMP_ALTAEMPLEADO
create table TMP_ALTAEMPLEADO
(
    EmpleadoID int,
    FechaAlta varchar(6)
)

drop table if exists TMP_BAJAS
create table TMP_BAJAS
(
    EmpleadoID int,
    NumComprobante int,
    Plaza varchar(50),
    CURP varchar(25),
    FechaBaja varchar(6),
    MotivoBaja varchar(500)
)


drop table if exists TMP_UDP
create table  TMP_UDP
(
    NumComprobante int,
    Plaza varchar (50),
    CURP varchar(25),
    udp int
)


drop table if exists TMP_CHEQUES
Create table TMP_CHEQUES
(
    NumComprobante int,
    Plaza varchar(50),
    CURP varchar(25),
    Cheque int
) 

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

drop table if exists TMP_PERIODOS
CREATE TABLE dbo.TMP_PERIODOS
(
PeriodoID int IDENTITY(1,1),
Quincena int,
Anio int
)

drop table TMP_DATOSEC
CREATE TABLE dbo.TMP_DATOSEC
(
	ID int IDENTITY(1,1) NOT NULL,
	NumComprobante int,
	TipoNominaID char(2) NULL,
	Periodo varchar(7) NULL,
	Plaza varchar(21) NULL,
	CURP varchar(18) NULL,
	TipoConcepto varchar(2) NULL,
	Concepto varchar(3) NULL,
	Descripcion varchar(100) NULL,
	Importe decimal(18,2) NULL,
	BaseCalculoISR decimal(18,2)NULL,
	Detalle varchar (80) NULL,
	PeriodoID int
)
-- drop index TMP_DATOSEC.idx_NumComprobante_curp_plaza
-- create index idx_NumComprobante_curp_plaza  on TMP_DATOSEC (NumComprobante) include (CURP,Plaza) 
-- create index idx_NumComprobante_curp_plaza  on TMP_DATOSEC (PeriodoID) include (NumComprobante,Plaza,CURP)   --40 s ( 35 4)
-- nuevo 
-- drop index TMP_DATOSEC.idx_NumComprobante_curp_plaza
create index idx_Layout1 on TMP_DATOSEC  (NumComprobante,Plaza,CURP,PeriodoID)   --40 s ( 35 4)





Detalle_Nomina

CREATE  INDEX idx_NominaPeriodo_Detalle_Comprobante_CURP_Plaza_ClaveCCT_Banco
ON [dbo].[TMP_DETALLENOM] ([Nomina],[PeriodoID])
INCLUDE ([DetalleID],[NumComprobante],[CURP],[Plaza],[Clave_CCT],[Banco])

go


drop table if exists TMP_NOMINAPAGOS
CREATE TABLE TMP_NOMINAPAGOS
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
TIPO_NÚMERO varchar(10),	
FECHA date,	
IMPORTE decimal(18,2),
QUINCENA_ALTA varchar(8),
QUINCENA_BAJA varchar(8),
MOTIVO_BAJA varchar(100),
ESTATUS varchar (10),
EmpleadoID int,
NumComprobante int
)


drop table if exists TMP_LAYOUTNOMINA
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
TIPO_NUMERO varchar(10),	
FECHA date,	
IMPORTE decimal(18,2),
QUINCENA_ALTA varchar(8),
QUINCENA_BAJA varchar(8),
MOTIVO_BAJA varchar(100),
ESTATUS varchar (10),
EmpleadoID int,
NumComprobante int
)







drop table if exists TMP_DETALLENOM
create TABLE TMP_DETALLENOM
    (ID int IDENTITY(1,1),
	DetalleID int,
    NumComprobante int,
    Nombre varchar(50),
    PrimerApellido varchar(50),
    SegundoApellido varchar(50),
    CURP varchar(20),
    RFC varchar(15),
    NSS varchar(15),
    Plaza varchar(25),
    Clave_CCT VARCHAR (10),
    FechaPago date,
    FechaInicio date,
    FechaTermino date,
    ImportePercepciones decimal(18,2),
    ImporteDeducciones decimal(18,2),
    ImporteNeto decimal(18,2),
    Estatus varchar(25),
    Subestatus varchar(150),
    FormaPago varchar(25),
    Banco varchar(30),
    ClaveBanco varchar(25),
    Validada varchar(10),
    Quincena varchar(6),
    EmpleadoID int,
    PlazaID int,
    Nomina varchar(150),
    PeriodoID int)


create index idx_Layout1 on TMP_DETALLENOM  (NumComprobante,Plaza,CURP,PeriodoID)   --40 s ( 35 4)


--drop index TMP_DETALLENOM.idx_NumComprobante_curp_plaza

-- create index idx_NumComprobante_curp_plaza  on TMP_DETALLENOM (PeriodoID) include (NumComprobante,CURP,Plaza)   --40 s ( 35 4)


drop table if exists TMP_REPORTENOM
create table TMP_REPORTENOM
(
	SECUENCIA int,
	NUM_UR char(3),
	NOMBRE_UR char(6),
	TIPO_NOMINA char(1),
	MODALIDAD_TRABAJADOR varchar(20),
	CLAVE_PUESTO CHAR(3),
	HORAS INT,
	TIPO_PAGO char(2),
	UNIDAD_DISTRIBUCION varchar(50),
	NUM_CHEQUE int,
	CLABE_INTERBANCARIA varchar(20),
	BANCO varchar(20),
	EMPLEADO varchar(200),
	RFC varchar(20),
	PLAZA  varchar(30),
	CLAVE_CCT varchar(20),
	NUMCOMPROBANTE varchar(20),
	IMPORTEPERCEPCIONES decimal(18,2),
	IMPORTEDEDUCCIONES decimal(18,2),
	IMPORTENETO decimal(18,2),
	TIPOCONCEPTO varchar(10),
	CONCEPTO varchar(20),
	IMPORTE decimal(18,2),
	CLAVE_PLAZA varchar(50),
	FECHAALTA varchar(10),
	FECHABAJA varchar(10), 
	BAJAMOTIVO varchar(50),
	ESTATUS varchar(10),
	QNA_INI varchar(10),
	QNA_FIN varchar(10),
	QNA_PROC varchar(10),
	ID_EMP int
)






