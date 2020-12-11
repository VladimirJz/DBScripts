
GO
drop PROCEDURE  if exists [dbo].[MIGRELACIONOBJETOS]
go
create PROCEDURE [dbo].[MIGRELACIONOBJETOS]
WITH EXEC AS CALLER
AS
BEGIN 
 SET NOCOUNT ON 

    drop table if exists IEEPOSYNC.dbo.RELACIONOBJETOSMIG -- Relacionamos los ID's de Ambas Bases 
    create table IEEPOSYNC.dbo.RELACIONOBJETOSMIG
    (
        ObjetoID int IDENTITY(1,1),
        ObjectIDDestino int, -- IEEPOSYNC
        ObjectIDOrigen int, -- IEEPO
        Esquema     varchar(20),
        NombreTabla varchar(200),
        NumFilasOrigen    bigint not null DEFAULT 0,
        NumFilasDestino    bigint not null DEFAULT 0,
        UltimoUsoOrigen    datetime
    )

    insert into IEEPOSYNC.dbo.RELACIONOBJETOSMIG(ObjectIDDestino,Esquema,NombreTabla)
        select object_id,Esquema,NombreTabla from IEEPOSYNC.sys.objects SO 
        inner join IEEPOSYNC.dbo.CATTABLASMIG CT on SO.name=CT.NombreTabla and Esquema= SCHEMA_NAME(schema_id)
        where SO.type='U' 

    -- Actualizamos información de Origen
        
    update  OBJ 
    SET OBJ.ObjectIDOrigen=SO.object_id
    from RELACIONOBJETOSMIG  OBJ 
    inner join  IEEPO.sys.objects SO on SO.name=OBJ.NombreTabla
    and Esquema= SCHEMA_NAME(schema_id)
    where SO.type='U' 

    drop table if exists IEEPOSYNC.#TMPNUMROWS
    create table IEEPOSYNC.#TMPNUMROWS
    (
        ObjectID int,
        NumRows bigint not null DEFAULT 0
    )

    insert into IEEPOSYNC.#TMPNUMROWS
        select MIG.ObjectIDOrigen,sum((coalesce([SYP].[rows],0)))Rows  
        from IEEPOSYNC.dbo.RELACIONOBJETOSMIG MIG left join IEEPO.sys.partitions  SYP
        on    MIG.ObjectIDOrigen =SYP.object_id
        group by MIG.ObjectIDOrigen
            order by sum(([SYP].[rows])) desc

    update MIG
    SET  MIG.NumFilasOrigen=TMP.NumRows
    from 
    IEEPOSYNC.dbo.RELACIONOBJETOSMIG MIG inner join IEEPOSYNC.#TMPNUMROWS TMP
    on TMP.ObjectID=MIG.ObjectIDOrigen

END