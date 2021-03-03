       select MIG.ObjectIDDestino,MIG.NombreTabla,MIG.NumFilasOrigen
        from RELACIONOBJETOSMIG MIG left join MIGBITACORA TMP on MIG.ObjectIDDestino=TMP.ObjectIDDestino
        where MIG.NumFilasOrigen <@NumMaxReg 
            and MIG.NumFilasOrigen>@Entero_cero 
            and isnull(TMP.BitacoraID,0)=0 
            order by MIG.NumFilasOrigen desc


select top 500 * from PlazaEmpleados
select top 500 * from empleados
select * from RELACIONOBJETOSMIG order by NumFilasOrigen desc
select top 500 * from HPLAZAS
select top 500 * from PLAZAIEEPO

select max(Categoria) from PlazaIEEPO GROUP by Categoria -- 401
select max(Unidad) from PlazaIEEPO GROUP by Unidad -- 54


select top 300 * from RelacionesEmpleados
select top 400 *  from HistPagos  -- 3211 => 3052 


-- Periodos 
select min(ID_Periodo), max(Id_Periodo) from HistPagos  -- 3211 => 3052 
select min(ID_Periodo), max(Id_Periodo) from nom_histpagos  -- 3206 => 3044
select min(ID_Periodo), max(Id_Periodo) from Nom_pagos_hist  -- 2=> 2711


-- ACTS
    -- Pesos
    -- Cantidad (Count)
-- DIM
    -- PeriodoID (Id_Periodo)
    -- ConceptoID (id_concepto)
    -- Anio
-- 

select top 200 * from HistPagos

Nom_pagos_hist
HistPagos
select top 200 * from HPlazas



select top 1 dbo.fechaToAnioQuincena(fechaini) from calennomina where Procesado = 1 and actualizado = 0 and parcial = 0
select top 1 fechaini from calennomina where Procesado = 1 and actualizado = 0 and parcial = 0
    select dbo.fechaToAnioQuincena(max(fechaini)) from calennomina where procesado = 1 and Actualizado = 1 and Parcial = 0
 
Select  concat(case when ca.Id_cia =1 then 'UPN' else CaSe when ca.Id_cia=2 then 'BASICA' else 'MANDOS MEDIOS' END END ,
' - ',
ca.año*100+ca.numero,' P',CA.PARCIAL,' ',CA.TITULOPERIODO ) QUINCENA,
h.id_periodo ID_PERIODO,ca.leyenda1 NOMBRE_NOMINA,aa.RFC,aa.CURP,h.id_emp ID_EMP,h.id_plaza ID_PLAZA,xx.plazaieepo PLAZA,h.id_referencia ID_REFERENCIA,
sum(case when c.tipo = 1  then pesos else 0 end) as  PERCEPCIONES,
sum(case when c.tipo = 2 then pesos else 0 end) as DEDUCCIONES,
cast( sum  ( case when c.tipo = 1 then pesos else 0 end - case when c.tipo = 2 then pesos else 0 end) as decimal(10,2)) as NETO

into  ##netosxp -- drop table ##netosxp

from histpagos H inner join Conceptos C on  h.id_concepto = c.id_concepto
inner join plazaieepo xx on xx.id_plaza = h.id_plaza inner join empleados aa on aa.id_emp =h.id_emp
join CalenNomina ca on ca.id_periodo=h.id_periodo
where  h.id_periodo in (select id_periodo from CalenNomina where año=2021 and numero in (5) and Parcial in (0,20))
group by h.id_periodo,ca.leyenda1,h.id_emp,aa.rfc,aa.curp,h.id_plaza,xx.PlazaIEEPO,h.id_referencia,ca.id_cia,ca.numero,ca.año,ca.TituloPeriodo,ca.parcial
order by neto


drop table if exists #TMPPERIODOS

create table #TMPPERIODOS
(
    id_periodo int
)
insert into #TMPPERIODOS 
select   id_periodo 
from CalenNomina 
where año=2021 and numero in (5) and Parcial in (0,20) 

select top 1 * from histpagos

drop table if exists TMPHISPAGOS
create table TMPHISPAGOS
(
    id_emp int,
    id_concepto int,
    Pesos decimal(11,4) ,
    id_plaza int,
    id_referencia int,
    id_periodo int
)

create index idx_concepto on TMPHISPAGOS(id_concepto)
create index idx_periodo on TMPHISPAGOS(id_periodo)
create index idx_plaza_emp on TMPHISPAGOS(id_Plaza,id_emp)

insert into TMPHISPAGOS 
    select HIS.id_emp,HIS.id_concepto,HIS.Pesos,HIS.id_plaza,HIS.id_referencia,HIS.id_periodo 
    from histpagos HIS 
    inner join #TMPPERIODOS PER on  HIS.id_periodo=PER.id_periodo --  20s (50,408,17)


Select  concat(case when ca.Id_cia =1 then 'UPN' else CaSe when ca.Id_cia=2 then 'BASICA' else 'MANDOS MEDIOS' END END ,
' - ',
ca.año*100+ca.numero,' P',CA.PARCIAL,' ',CA.TITULOPERIODO ) QUINCENA,
h.id_periodo ID_PERIODO,ca.leyenda1 NOMBRE_NOMINA,aa.RFC,aa.CURP,h.id_emp ID_EMP,h.id_plaza ID_PLAZA,xx.plazaieepo PLAZA,h.id_referencia ID_REFERENCIA,
sum(case when c.tipo = 1  then pesos else 0 end) as  PERCEPCIONES,
sum(case when c.tipo = 2 then pesos else 0 end) as DEDUCCIONES,
cast( sum  ( case when c.tipo = 1 then pesos else 0 end - case when c.tipo = 2 then pesos else 0 end) as decimal(10,2)) as NETO
into   ##netosxp_test2
from TMPHISPAGOS H inner join Conceptos C on  h.id_concepto = c.id_concepto
inner join plazaieepo xx on xx.id_plaza = h.id_plaza inner join empleados aa on aa.id_emp =h.id_emp
join CalenNomina ca on ca.id_periodo=h.id_periodo
group by h.id_periodo,ca.leyenda1,h.id_emp,aa.rfc,aa.curp,h.id_plaza,xx.PlazaIEEPO,h.id_referencia,ca.id_cia,ca.numero,ca.año,ca.TituloPeriodo,ca.parcial
order by neto -- 25

select * from ##netosxp_test2