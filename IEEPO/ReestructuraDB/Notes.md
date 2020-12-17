## Configuracion SQLSERVER ##

### Server ##

Windows Server 2016
SQLServer 2017  (14.0.1000.169)/ con compatibilidad  2016 
Memoria:
Minumun Server Memory = 4096
Maximun Server Memory = 2147483647  (no Limit)
Index Creation Memory = 0
Minimun Memory per Query = 2048
Procesadores:
Auto Affinity Mask = True 
Auto set Affinity I/O = True
Conections:
Maximun Concurrent conexions=0
Allow remote conexion = true
Remote Query timeout =0
Database:
Default Index Factor= 80
Recovery Interval = 0
Advance:
Optimize for Ad hoc worload=true
Cost of threshold for Parrallelism =25

### Base de Datos

Files:

IEEPO_DATA   -- Rows Data    PRIMARY     F:\IEEPOSERVER\IEEPO_DATA\IEEPO_DATA.mdf
IEEPO_WORK  -- Rows Data     WORKLOAD    F:\IEEPOSERVER\IEEPO_DATA\IEEPO_WORK.ldf
IEEPO_MEM   -- FILESTREAM Data           F:\IEEPOSERVER\IEEPO_DATA\IEEPO_MEM
IEEPO_LOG   -- LOG                       E:\IEEPOSERVER\IEEPO_LOG\IEEPO_LOG.ldf


Recovery = Full Recovery mode
Compatibilida = 2016 (130)
AutoShinrk  = False
MaxDOP=8 
MaxDOP Alt= nil
Query Optmizer Fixes = ON
QueryStore = OFF



## Objetos por eliminar (Residual)

C:\IEEPO_FILES  --> Archivos usados para la carga de la Base IEEPOSYNC
C:\IEEPOSERVER --> Contiene los archivos de BD de 'IEEEPO' una vez que se terminen las pruebas se puede elimiar.
C:\SQLSERVFED --> Contiene los LOGS de la instancia FEDERACION
E:\BACKUPS --> Archivos de Backup (NO BORRAR) Device y FILE Actual (Pruebas)
E:\RESPALDO_IEEPOSYNC --> Archivos de datos y backup de la BD IEEPOSYNC intancia PRODUCCION (Borrar hasta confirmar pruebas en IEEPOSERVER)
E:\SQLSERVER --> Archivos de Instancia PRODUCCION (DEAD)
F:\SQLSERVER --> Archivos de Instancia PRODUCCION (DEAD)
F:\SQLSERVFED --> Archivos de Instancia FEDERACION (OFF)



## Pendientes proceso de Replica
    @Resolver el tema de las llaves foraneas
    @Verificar inidices nuevos
    @Rutina de defragmentación
    @Rutina de Backup Automatico
    @Instalar el FirtsKit