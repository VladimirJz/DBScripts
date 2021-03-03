DROP table if exists #TMPPERIODOS
CREATE table #TMPPERIODOS
(
    id_periodo int
)

INSERT INTO #TMPPERIODOS 
    SELECT   id_periodo 
    FROM CalenNomina 
    WHERE año=2021 and numero in (5) and Parcial in (0,20) 

SELECT top 1 * FROM histpagos

DROP table if exists TMPHISPAGOS
CREATE table TMPHISPAGOS
(
    id_emp int,
    id_concepto int,
    Pesos decimal(12,4) ,
    id_plaza int,
    id_referencia int,
    id_periodo int
)



INSERT INTO TMPHISPAGOS 
    SELECT HIS.id_emp,HIS.id_concepto,HIS.Pesos,HIS.id_plaza,HIS.id_referencia,HIS.id_periodo 
    FROM histpagos HIS 
    INNER JOIN #TMPPERIODOS PER on  HIS.id_periodo=PER.id_periodo --  20s (50,408,17)


SELECT  concat(CASE WHEN ca.Id_cia =1 THEN 'UPN' ELSE CASE WHEN ca.Id_cia=2 THEN 'BASICA' ELSE 'MANDOS MEDIOS' END END ,
' - ',
ca.año*100+ca.numero,' P',CA.PARCIAL,' ',CA.TITULOPERIODO ) QUINCENA,
h.id_periodo ID_PERIODO,
ca.leyenda1 NOMBRE_NOMINA,
aa.RFC,
aa.CURP,
h.id_emp ID_EMP,
h.id_plaza ID_PLAZA,
xx.plazaieepo PLAZA,
h.id_referencia ID_REFERENCIA,
sum(CASE WHEN c.tipo = 1  THEN pesos ELSE 0 end) as  PERCEPCIONES,
sum(CASE WHEN c.tipo = 2 THEN pesos ELSE 0 end) as DEDUCCIONES,
cast( sum  ( case when c.tipo = 1 then pesos else 0 end - case when c.tipo = 2 then pesos else 0 end) as decimal(10,2)) as NETO

--INTO   ##netosxp_test2
FROM TMPHISPAGOS H INNER JOIN Conceptos C on  h.id_concepto = c.id_concepto
INNER JOIN plazaieepo xx on xx.id_plaza = h.id_plaza INNER JOIN empleados aa on aa.id_emp =h.id_emp
JOIN CalenNomina ca on ca.id_periodo=h.id_periodo
group by h.id_periodo,ca.leyenda1,h.id_emp,aa.rfc,aa.curp,h.id_plaza,xx.PlazaIEEPO,h.id_referencia,ca.id_cia,ca.numero,ca.año,ca.TituloPeriodo,ca.parcial

-- order by neto -- 25
-- 112,389
-- 03:33
