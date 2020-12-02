/*
Run this script on:

        10.186.11.19.PRUEBAXSCR    -  This database will be modified

to synchronize it with:

        10.186.11.11\MSSQLServer2.IEEPO

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.4.4.16824 from Red Gate Software Ltd at 26/11/2020 19:18:55

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
PRINT N'Creating [dbo].[vistaNosotros62]'
GO
IF OBJECT_ID(N'[dbo].[vistaNosotros62]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaNosotros62]
AS
SELECT     histpagos.Id_Emp, histpagos.id_plaza, dbo.Conceptos.resultado AS conceptoNos, SUM(histpagos.Pesos + histpagos.PesosExcento) AS importeNOS
FROM         dbo.hp1311e AS histpagos INNER JOIN
                      dbo.Conceptos ON histpagos.id_concepto = dbo.Conceptos.id_concepto
WHERE     (histpagos.Id_Periodo = 963) AND (histpagos.id_concepto IN (2523, 2524, 2525, 2526, 2527, 2536, 2537, 2538))
GROUP BY histpagos.Id_Emp, histpagos.id_plaza, dbo.Conceptos.resultado'
GO
PRINT N'Creating [dbo].[vistaEllos62]'
GO
IF OBJECT_ID(N'[dbo].[vistaEllos62]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaEllos62]
AS
SELECT     c.concepto AS conceptoellos, c.importe AS importeellos, c.perded, nom.plaza, nom.filiacio, nom.id_emp, nom.id_plaza
FROM         (SELECT     tippag, ud, ct, plaza, puesto, stapla, motivo, rfc, filiacio, curp, nombre, ingsep, sexo, cheque, qnapago, desde, hasta, liquido, pagele, pro, spro, zna, 
                                              punteror, car_pd, id_emp, id_plaza
                       FROM          dbo.nom1310_1605
                       WHERE      (tippag = 1)) AS nom INNER JOIN
                          (SELECT     cheque, concepto, signo, importe, perded, desde, hasta, pro, spr, tippag, punteror, car_pd, qnasapli, qnastot, id_concepto, id_emp
                            FROM          dbo.cto1310_1605
                            WHERE      (tippag = 1) AND (concepto IN (''62''))) AS c ON nom.cheque = c.cheque'
GO
PRINT N'Creating [dbo].[vistaSoloEllos62]'
GO
IF OBJECT_ID(N'[dbo].[vistaSoloEllos62]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaSoloEllos62]
AS
Select a.*,  
(select max(resultado) from conceptos where resultado=a.conceptoellos) as conceptonos, 0 as importenos   
from   
vistaEllos62 a left join  
vistaNosotros62 B  
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza 
where b.id_emp is null'
GO
PRINT N'Creating [dbo].[vistaEnlos2_62]'
GO
IF OBJECT_ID(N'[dbo].[vistaEnlos2_62]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaEnlos2_62]
AS
Select a.*,b.conceptonos,b.importenos   
from   
vistaEllos62 a inner join  
vistaNosotros62 B  
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza'
GO
PRINT N'Creating [dbo].[vistaTodos62]'
GO
IF OBJECT_ID(N'[dbo].[vistaTodos62]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaTodos62]
AS
select * from vistaEnlos2_62 
union all  
select * from vistaSoloEllos62'
GO
PRINT N'Creating [dbo].[vistaNosotros1328]'
GO
IF OBJECT_ID(N'[dbo].[vistaNosotros1328]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaNosotros1328]
AS
SELECT     histpagos.Id_Emp, histpagos.id_plaza, histpagos.C_costo AS conceptoNos, SUM(histpagos.Pesos + histpagos.PesosExcento) AS importeNOS
FROM         dbo.hp1311e AS histpagos INNER JOIN
                      dbo.Conceptos ON histpagos.id_concepto = dbo.Conceptos.id_concepto
WHERE     (histpagos.Id_Periodo = 963) AND (histpagos.id_concepto = 1328)
GROUP BY histpagos.Id_Emp, histpagos.id_plaza, histpagos.C_costo'
GO
PRINT N'Creating [dbo].[vistaEllos1328]'
GO
IF OBJECT_ID(N'[dbo].[vistaEllos1328]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaEllos1328]
AS
SELECT     c.concepto AS conceptoellos, c.importe AS importeellos, c.perded, nom.plaza, nom.filiacio, nom.id_emp, nom.id_plaza
FROM         (SELECT     tippag, ud, ct, plaza, puesto, stapla, motivo, rfc, filiacio, curp, nombre, ingsep, sexo, cheque, qnapago, desde, hasta, liquido, pagele, pro, spro, zna, 
                                              punteror, car_pd, id_emp, id_plaza
                       FROM          dbo.nom1310_1605
                       WHERE      (tippag = 1)) AS nom INNER JOIN
                          (SELECT     cheque, concepto, signo, importe, perded, desde, hasta, pro, spr, tippag, punteror, car_pd, qnasapli, qnastot, id_concepto, id_emp
                            FROM          dbo.cto1310_1605
                            WHERE      (tippag = 1) AND (concepto IN (''AA'', ''AB'', ''AC'', ''AD'', ''AE'', ''AF'', ''AG'', ''AH'', ''AI'', ''AJ'', ''AK'', ''AL'', ''AM'', ''AN'', ''AO'', ''AP'', ''AQ'', ''AR'', ''AS'', ''AT'', ''AU'' , ''AV'', ''AW'', ''AX'', ''AY'', 
                                                   ''AZ'', ''PA'', ''PB'', ''PC'', ''PD'', ''PE'', ''PF'', ''PG'', ''PH'', ''PI'', ''PJ'', ''PK'', ''PL'', ''PN'', ''PO'', ''PP'', ''PQ'', ''PR'', ''PS'', ''PT'', ''PZ'', ''QA'', ''QB'', ''QC'', ''QD'', ''QE'', ''QF'', ''QG'', ''QH'', 
                                                   ''QI'', ''QJ'', ''QK'', ''QL'', ''QM'', ''QN'', ''QO'', ''QP'', ''QQ'', ''QR'', ''QS'', ''QT'', ''QU'', ''QV'', ''QW'', ''QX'', ''QY'', ''QZ''))) AS c ON nom.cheque = c.cheque'
GO
PRINT N'Creating [dbo].[vistaEnlos2_1328]'
GO
IF OBJECT_ID(N'[dbo].[vistaEnlos2_1328]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaEnlos2_1328] as  
Select a.*,b.conceptonos,b.importenos   
from   
vistaEllos1328 a inner join  
vistaNosotros1328 B  
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza'
GO
PRINT N'Creating [dbo].[vistaSoloEllos1328]'
GO
IF OBJECT_ID(N'[dbo].[vistaSoloEllos1328]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaSoloEllos1328] as  
Select a.*,  
(select max(resultado) from conceptos where resultado=a.conceptoellos) as conceptonos, 0 as importenos   
from   
vistaEllos1328 a left join  
vistaNosotros1328 B  
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza 
where b.id_emp is null'
GO
PRINT N'Creating [dbo].[HTipo_Nomina]'
GO
IF OBJECT_ID(N'[dbo].[HTipo_Nomina]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[HTipo_Nomina]
AS 
SELECT 
DISTINCT 
                      PlazaEmpleados.id_PLAZA, CASE WHEN unidad = 1 AND subunidad = 19 AND (SUBSTRING(LTRIM(CAT_PUESTO), 1, 2) = ''ce'' OR
                      SUBSTRING(LTRIM(CAT_PUESTO), 1, 2) = ''ee'' OR
                      SUBSTRING(LTRIM(CAT_PUESTO), 1, 2) = ''ao'' OR
                      SUBSTRING(LTRIM(CAT_PUESTO), 1, 2) = '' so '') THEN '' 2 '' ELSE CASE WHEN Unidad = 1 AND 
                      Subunidad = 18 THEN ''3'' ELSE CASE WHEN Unidad = 1 AND Subunidad = 17 THEN ''4'' ELSE CASE WHEN SUBSTRING(TNivel3IEA.clave, 7, 8) 
                      = ''DUP0002H'' THEN ''5'' ELSE CASE WHEN SUBSTRING(LTRIM(CAT_PUESTO), 1, 1) = ''H'' AND SUBSTRING(TNivel3IEA.clave, 7, 8) 
                      <> ''DUP0002H'' THEN ''6'' ELSE CASE WHEN SUBSTRING(LTRIM(CAT_PUESTO), 1, 1) = ''H'' AND SUBSTRING(TNivel3IEA.clave, 7, 8) 
                      = ''DUP0002H'' THEN ''7'' ELSE CASE WHEN SUBSTRING(LTRIM(CAT_PUESTO), 1, 7) 
                      = ''HO34814'' THEN ''8'' ELSE CASE WHEN SUBSTRING(LTRIM(CAT_PUESTO), 1, 7) = ''CFI7810'' OR
                      SUBSTRING(LTRIM(CAT_PUESTO), 1, 6) = ''EIO271'' OR
                      SUBSTRING(LTRIM(CAT_PUESTO), 1, 6) = ''HI0271'' THEN ''9'' ELSE CASE WHEN SUBSTRING(LTRIM(CAT_PUESTO), 1, 6) 
                      = ''SB0011'' THEN ''10'' ELSE ''1'' END END END END END END END END END AS id_rel, HCat_Puesto.fecha AS fecha, ''0'' AS id_user, 
                      HCat_Puesto.fecha AS movimiento
FROM         (SELECT     HUnidad.id_plaza, HUnidad.Unidad, HUnidad.fecha, HUnidad.id_user, HUnidad.movimiento
                       FROM          HUnidad INNER JOIN
                                                  (SELECT     id_plaza, MAX(fecha) AS fechita
                                                    FROM          HUnidad
                                                    GROUP BY id_plaza) maxi ON HUnidad.id_plaza = maxi.id_plaza AND HUnidad.fecha = maxi.fechita) AS HUnidad INNER JOIN
                      PlazaEmpleados ON HUnidad.id_plaza = PlazaEmpleados.Id_plaza INNER JOIN
                          (SELECT     HSubUnidad.id_plaza, HSubUnidad.SubUnidad, HSubUnidad.fecha, HSubUnidad.id_user, HSubUnidad.movimiento
                            FROM          HSubUnidad INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fechita
                                                         FROM          HsubUnidad
                                                         GROUP BY id_plaza) maxi ON HSubUnidad.id_plaza = maxi.id_plaza AND HSubUnidad.fecha = maxi.fechita) AS HSubUnidad ON 
                      PlazaEmpleados.Id_plaza = HSubUnidad.id_plaza INNER JOIN
                          (SELECT     HCat_Puesto.id_plaza, HCat_Puesto.Cat_Puesto, HCat_Puesto.fecha, HCat_Puesto.id_user, HCat_Puesto.movimiento
                            FROM          HCat_Puesto INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fechita
                                                         FROM          Hcat_puesto
                                                         GROUP BY id_plaza) maxi ON HCat_Puesto.id_plaza = maxi.id_plaza AND HCat_Puesto.fecha = maxi.fechita) AS HCat_Puesto ON 
                      PlazaEmpleados.Id_plaza = HCat_Puesto.id_plaza INNER JOIN
                      TablaConfigOrgan ON PlazaEmpleados.id_nodo = TablaConfigOrgan.Id_Nodo INNER JOIN
                      TNivel3IEA ON TablaConfigOrgan.ValorCampoLLave = TNivel3IEA.id_Nivel3IEA
WHERE     PlazaEmpleados.id_EMP > 0

'
GO
PRINT N'Creating [dbo].[vistaTodos1328]'
GO
IF OBJECT_ID(N'[dbo].[vistaTodos1328]', 'V') IS NULL
EXEC sp_executesql N'create view [dbo].[vistaTodos1328] as  
select * from vistaEnlos2_1328  
union all  
select * from vistaSoloEllos1328'
GO
PRINT N'Creating [dbo].[VistaTablaLongitudPadres]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitudPadres]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitudPadres]
AS
SELECT     dbo.VistaTablaLongitud.*, padre.Descripcion AS padre_desc, padre.Clave AS padre_clave, areapad.Descripcion AS areapadre_desc, 
                      areapad.Clave AS areapadre_clave
FROM         dbo.VistaTablaLongitud INNER JOIN
                      dbo.VistaTablaLongitud padre ON dbo.VistaTablaLongitud.Dep = padre.Dep LEFT OUTER JOIN
                      dbo.VistaTablaLongitud areapad ON dbo.VistaTablaLongitud.area = areapad.area AND areapad.Subarea = ''00'' AND 
                      areapad.Dep = dbo.VistaTablaLongitud.Dep
WHERE     (padre.area = ''00'') AND (padre.Subarea = ''00'')
'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud05]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud05]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud05] AS Select TablaConfigOrgan.Id_Nodo, TestrucOrgISEA.clave_estrucISEA as Clave  ,TestrucOrgISEA.descr_estrucISEA as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TestrucOrgISEA ON TablaConfigOrgan.ValorCampoLLave = TestrucOrgISEA.id_estrucOrgISEA where (TablaConfigOrgan.id_TablaLongitud = 5)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud08]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud08]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud08] AS Select TablaConfigOrgan.Id_Nodo, TestrucOrgISEA.clave_estrucISEA as Clave  ,TestrucOrgISEA.descr_estrucISEA as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TestrucOrgISEA ON TablaConfigOrgan.ValorCampoLLave = TestrucOrgISEA.id_estrucOrgISEA where (TablaConfigOrgan.id_TablaLongitud = 8)'
GO
PRINT N'Creating [dbo].[diferenciascuadrebaseHistpagos]'
GO
IF OBJECT_ID(N'[dbo].[diferenciascuadrebaseHistpagos]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[diferenciascuadrebaseHistpagos]
AS
SELECT     C.id_concepto, C.resultado, C.Tipo, A.cantidad AS cantidadEllos, A.cantidadDEPagos AS cantidaddepagosEllos, B.cantidad AS CantidadNOS, 
                      B.cantidadDEPagos AS cantidaddepagosNos, A.cantidad - B.cantidad AS diferencia, A.cantidadDEPagos - B.cantidadDEPagos AS diferenciaPagos
FROM         (SELECT     id_concepto, SUM(Pesos + PesosExcento) AS cantidad, COUNT(id_concepto) AS cantidadDEPagos
                       FROM          dbo.hp1311e
                       GROUP BY id_concepto) AS B LEFT OUTER JOIN
                          (SELECT     id_concepto, SUM(importe) / 100 AS cantidad, COUNT(concepto) AS cantidadDEPagos
                            FROM          dbo.cto1310_1605
                            WHERE      (tippag = 1)
                            GROUP BY id_concepto) AS A ON A.id_concepto = B.id_concepto INNER JOIN
                      dbo.Conceptos AS C ON C.id_concepto = B.id_concepto
WHERE     (C.Tipo IN (1, 2))'
GO
PRINT N'Creating [dbo].[vistaNosotros]'
GO
IF OBJECT_ID(N'[dbo].[vistaNosotros]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaNosotros]
AS
SELECT     histpagos.Id_Emp, histpagos.id_plaza, histpagos.id_concepto, dbo.Conceptos.resultado AS conceptoNos, dbo.Conceptos.Tipo, 
                      SUM(histpagos.Pesos + histpagos.PesosExcento) AS importeNOS, dbo.Plazas_CT_NOS.CT_Nos, dbo.Plazas_CT_NOS.Zona_Nos, dbo.Plazas_CT_NOS.Niv_Nos, 
                      dbo.Plazas_Tipo_Nos.TipoPlaza, dbo.Plazas_Status_Nos.StatusPlaza
FROM         dbo.hp1311e AS histpagos INNER JOIN
                      dbo.Conceptos ON histpagos.id_concepto = dbo.Conceptos.id_concepto LEFT OUTER JOIN
                      dbo.Plazas_CT_NOS ON dbo.Plazas_CT_NOS.id_plaza = histpagos.id_plaza LEFT OUTER JOIN
                      dbo.Plazas_Tipo_Nos ON dbo.Plazas_Tipo_Nos.id_plaza = histpagos.id_plaza LEFT OUTER JOIN
                      dbo.Plazas_Status_Nos ON dbo.Plazas_Status_Nos.id_plaza = histpagos.id_plaza
WHERE     (histpagos.Id_Periodo = 963)
GROUP BY histpagos.Id_Emp, histpagos.id_plaza, histpagos.id_concepto, dbo.Conceptos.resultado, dbo.Conceptos.Tipo, dbo.Plazas_CT_NOS.CT_Nos, 
                      dbo.Plazas_CT_NOS.Zona_Nos, dbo.Plazas_CT_NOS.Niv_Nos, dbo.Plazas_Tipo_Nos.TipoPlaza, dbo.Plazas_Status_Nos.StatusPlaza'
GO
PRINT N'Creating [dbo].[vistaEllosAgrupados]'
GO
IF OBJECT_ID(N'[dbo].[vistaEllosAgrupados]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaEllosAgrupados]
AS
SELECT     c.id_concepto, SUM(c.importe) AS importeellos, c.perded, nom.plaza, nom.ct AS Ct_Ellos, nom.zna AS Zona_ellos, nom.filiacio, nom.id_emp, nom.id_plaza, 
                      nom.stapla, nom.motivo
FROM         (SELECT     tippag, ud, ct, plaza, puesto, stapla, motivo, rfc, filiacio, curp, nombre, ingsep, sexo, cheque, qnapago, desde, hasta, liquido, pagele, pro, spro, zna, 
                                              punteror, car_pd, id_emp, id_plaza
                       FROM          dbo.nom1310_1605
                       WHERE      (tippag = 1)) AS nom INNER JOIN
                          (SELECT     cheque, concepto, signo, importe, perded, desde, hasta, pro, spr, tippag, punteror, car_pd, qnasapli, qnastot, id_concepto, id_emp
                            FROM          dbo.cto1310_1605
                            WHERE      (tippag = 1)) AS c ON nom.cheque = c.cheque
GROUP BY c.id_concepto, c.perded, nom.plaza, nom.ct, nom.zna, nom.filiacio, nom.id_emp, nom.id_plaza, nom.stapla, nom.motivo'
GO
PRINT N'Creating [dbo].[vistaSoloEllosAgrupados]'
GO
IF OBJECT_ID(N'[dbo].[vistaSoloEllosAgrupados]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaSoloEllosAgrupados] as            
Select a.*,            
b.conceptonos, 0 as importenos,a.importeellos/100 as diferencia,        
c.CT_NOS,c.Zona_Nos,c.Niv_Nos,d.tipoplaza,e.statusplaza              
from             
(((vistaEllosAgrupados a left join            
vistaNosotros B            
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza and a.id_concepto = b.id_concepto  )        
left join Plazas_CT_NOS c on c.id_plaza = a.id_plaza   )      
left join Plazas_Tipo_Nos d on d.id_plaza = a.id_plaza  )      
left join Plazas_Status_Nos e on e.id_plaza = a.id_plaza       
where b.id_emp is null

'
GO
PRINT N'Creating [dbo].[vistaEnlos2Agrupados]'
GO
IF OBJECT_ID(N'[dbo].[vistaEnlos2Agrupados]', 'V') IS NULL
EXEC sp_executesql N'
CREATE view [dbo].[vistaEnlos2Agrupados] as          
Select a.*,b.conceptonos,b.importenos, (a.importeellos/100 - b.importenos) as diferencia ,b.CT_NOS,b.Zona_Nos,b.Niv_Nos,b.TipoPlaza,b.Statusplaza     
from           
vistaEllosAgrupados a inner join          
vistaNosotros B          
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza and a.id_concepto = b.id_concepto 
'
GO
PRINT N'Creating [dbo].[vistaTodosAgrupados]'
GO
IF OBJECT_ID(N'[dbo].[vistaTodosAgrupados]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaTodosAgrupados] as          
select * from vistaEnlos2Agrupados          
union all          
select * from vistaSoloEllosAgrupados

'
GO
PRINT N'Creating [dbo].[THonorarios_Valores]'
GO
IF OBJECT_ID(N'[dbo].[THonorarios_Valores]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[THonorarios_Valores]
AS
SELECT     TTabulador_IEA_Plaza_2.id_Tabulador_IEA_Plaza AS Id_Honorarios_Valores, TTabulador_IEA_Plaza_2.id_Tabulador_IEA_Plaza, 
                      CASE WHEN LTRIM(nivel3.categoria) = ''EI0271'' THEN '' HI0271'' ELSE CASE WHEN (LEN(LTRIM(nivel3.categoria)) = 5) 
                      THEN ''HO'' + LTRIM(nivel3.categoria) ELSE CASE WHEN (LEN(LTRIM(nivel3.categoria)) = 6) THEN ''H'' + LTRIM(nivel3.categoria) 
                      ELSE CASE WHEN (LEN(LTRIM(nivel3.categoria)) = 7) THEN ''H'' + SUBSTRING(nivel3.categoria, 2, 6) ELSE ''M'' END END END END AS Categoria, 
                      nivel3.id_Tabulador_IEA_CM, nivel3.Fecha, nivel3.valor AS valorNivel3, nivel1.valor AS ValorNivel1
FROM         (SELECT     dbo.TTabulador_IEA_Plaza.categoria, dbo.ValoresMatriz4.id_Tabulador_IEA_CM, dbo.ValoresMatriz4.Fecha, SUM(dbo.ValoresMatriz4.Valor) 
                                              AS valor
                       FROM          dbo.TTabulador_IEA_Plaza INNER JOIN
                                              dbo.ValoresMatriz4 ON dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza = dbo.ValoresMatriz4.id_Tabulador_IEA_Plaza
                       WHERE      (dbo.ValoresMatriz4.id_concepto = 1306 OR
                                              dbo.ValoresMatriz4.id_concepto = 1701 OR
                                              dbo.ValoresMatriz4.id_concepto = 1307 OR
                                              dbo.ValoresMatriz4.id_concepto = 1309 OR
                                              dbo.ValoresMatriz4.id_concepto = 1355 OR
                                              dbo.ValoresMatriz4.id_concepto = 1359 OR
                                              dbo.ValoresMatriz4.id_concepto = 1431) AND (dbo.ValoresMatriz4.id_Tabulador_IEA_CM = 3)
                       GROUP BY dbo.TTabulador_IEA_Plaza.categoria, dbo.ValoresMatriz4.id_Tabulador_IEA_CM, dbo.ValoresMatriz4.Fecha) AS nivel3 INNER JOIN
                          (SELECT     TTabulador_IEA_Plaza_1.categoria, ValoresMatriz4_1.id_Tabulador_IEA_CM, ValoresMatriz4_1.Fecha, SUM(ValoresMatriz4_1.Valor) 
                                                   AS valor
                            FROM          dbo.TTabulador_IEA_Plaza AS TTabulador_IEA_Plaza_1 INNER JOIN
                                                   dbo.ValoresMatriz4 AS ValoresMatriz4_1 ON 
                                                   TTabulador_IEA_Plaza_1.id_Tabulador_IEA_Plaza = ValoresMatriz4_1.id_Tabulador_IEA_Plaza
                            WHERE      (ValoresMatriz4_1.id_concepto = 1701) AND (ValoresMatriz4_1.id_Tabulador_IEA_CM = 3)
                            GROUP BY TTabulador_IEA_Plaza_1.categoria, ValoresMatriz4_1.id_Tabulador_IEA_CM, ValoresMatriz4_1.Fecha) AS nivel1 ON 
                      nivel1.categoria = nivel3.categoria AND nivel3.Fecha = nivel1.Fecha INNER JOIN
                      dbo.TTabulador_IEA_Plaza AS TTabulador_IEA_Plaza_2 ON nivel1.categoria = TTabulador_IEA_Plaza_2.categoria
GROUP BY nivel3.categoria, nivel3.id_Tabulador_IEA_CM, nivel3.Fecha, nivel3.valor, nivel1.valor, TTabulador_IEA_Plaza_2.id_Tabulador_IEA_Plaza
'
GO
PRINT N'Creating [dbo].[TVCD_Plazas]'
GO
IF OBJECT_ID(N'[dbo].[TVCD_Plazas]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[TVCD_Plazas]
AS
SELECT     TOP 100 PERCENT dbo.Plazas.Id_plaza AS id_VCD_Plazas, dbo.Plazas.Id_plaza, hcodigopago.CodigoPago, hunidad.Unidad, hsubunidad.SubUnidad, 
                      hcat_puesto.Cat_Puesto, horas.Horas, hconsecutivo.Consecutivo, LTRIM(RTRIM(hcodigopago.copago)) + LTRIM(RTRIM(hunidad.UNIDA)) 
                      + LTRIM(RTRIM(hsubunidad.subunida)) + RTRIM(hcat_puesto.PUESTO) + LTRIM(RTRIM(horas.hor)) + LTRIM(RTRIM(hconsecutivo.consec)) 
                      AS PLAZA_ENTERA, hfechasubsistema.FechaSubsistema, hstatusplaza.id_rel AS estatus, htipoplaza.Motivo
FROM         dbo.Plazas LEFT OUTER JOIN
                          (SELECT     HSubUnidad.id_plaza, HSubUnidad.SubUnidad, HSubUnidad.fecha, HSubUnidad.id_user, HSubUnidad.movimiento, REPLICATE(''0'', 
                                                   2 - LEN(LTRIM(CAST(HSUBUNIDAD.SubUnidad AS char)))) + CAST(HSUBUNIDAD.SubUnidad AS char) AS subunida
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HsubUnidad
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) hsubUNI INNER JOIN
                                                   HSubUnidad ON hsubUNI.id_plaza = HSubUnidad.id_plaza AND hsubUNI.maxima = HSubUnidad.fecha) hsubunidad ON 
                      dbo.Plazas.Id_plaza = hsubunidad.id_plaza LEFT OUTER JOIN
                          (SELECT     HUnidad.id_plaza, HUnidad.Unidad, HUnidad.fecha, HUnidad.id_user, HUnidad.movimiento, REPLICATE(''0'', 
                                                   2 - LEN(LTRIM(CAST(HUNIDAD.Unidad AS char)))) + CAST(HUNIDAD.Unidad AS char) AS UNIDA
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HUNIDAD
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) hUNI INNER JOIN
                                                   HUnidad ON hUNI.id_plaza = HUnidad.id_plaza AND hUNI.maxima = HUnidad.fecha) hunidad ON 
                      dbo.Plazas.Id_plaza = hunidad.id_plaza LEFT OUTER JOIN
                          (SELECT     HCodigoPago.id_plaza, HCodigoPago.CodigoPago, HCodigoPago.fecha, HCodigoPago.id_user, HCodigoPago.movimiento, REPLICATE(''0'', 
                                                   2 - LEN(LTRIM(CAST(Hcodigopago.CodigoPago AS char)))) + CAST(hcodigopago.codigoPago AS char) AS copago
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HCodigoPago
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) hcodpago INNER JOIN
                                                   HCodigoPago ON hcodpago.id_plaza = HCodigoPago.id_plaza AND hcodpago.maxima = HCodigoPago.fecha) hcodigopago ON 
                      dbo.Plazas.Id_plaza = hcodigopago.id_plaza LEFT OUTER JOIN
                          (SELECT     HCat_Puesto.id_plaza, HCat_Puesto.Cat_Puesto, HCat_Puesto.fecha, HCat_Puesto.id_user, HCat_Puesto.movimiento, REPLICATE('' '', 
                                                   7 - LEN(LTRIM(CAST(HCat_Puesto.Cat_Puesto AS char)))) + LTRIM(CAST(HCat_Puesto.Cat_Puesto AS char)) AS PUESTO
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HCat_Puesto
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) hcategoria INNER JOIN
                                                   HCat_Puesto ON hcategoria.id_plaza = HCat_Puesto.id_plaza AND hcategoria.maxima = HCat_Puesto.fecha) hcat_puesto ON 
                      dbo.Plazas.Id_plaza = hcat_puesto.id_plaza LEFT OUTER JOIN
                          (SELECT     HConsecutivo.id_plaza, HConsecutivo.Consecutivo, HConsecutivo.fecha, HConsecutivo.id_user, HConsecutivo.movimiento, 
                                                   REPLICATE(''0'', 6 - LEN(LTRIM(CAST(HConsecutivo.Consecutivo AS char)))) + CAST(HConsecutivo.Consecutivo AS char) AS consec
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HConsecutivo
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) consecutivo INNER JOIN
                                                   HConsecutivo ON consecutivo.id_plaza = HConsecutivo.id_plaza AND consecutivo.maxima = HConsecutivo.fecha) hconsecutivo ON 
                      dbo.Plazas.Id_plaza = hconsecutivo.id_plaza LEFT OUTER JOIN
                          (SELECT     HHoras.id_plaza, HHoras.Horas, HHoras.fecha, HHoras.id_user, HHoras.movimiento, REPLICATE(''0'', 
                                                   3 - LEN(LTRIM(CAST(HHoras.Horas * 10 AS char)))) + CAST(HHoras.Horas * 10 AS char) AS hor
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          Hhoras
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) hhor INNER JOIN
                                                   HHoras ON hhor.id_plaza = HHoras.id_plaza AND hhor.maxima = HHoras.fecha) horas ON 
                      dbo.Plazas.Id_plaza = horas.id_plaza LEFT OUTER JOIN
                          (SELECT     HFechaSubsistema.id_plaza, HFechaSubsistema.FechaSubsistema, HFechaSubsistema.fecha, HFechaSubsistema.id_user, 
                                                   HFechaSubsistema.movimiento
                            FROM          (SELECT     id_plaza, MAX(fecha) AS maxima
                                                    FROM          HFechaSubsistema
                                                    WHERE      fecha <= getdate()
                                                    GROUP BY id_plaza) fechasub INNER JOIN
                                                   HFechaSubsistema ON fechasub.id_plaza = HFechaSubsistema.id_plaza AND fechasub.maxima = HFechaSubsistema.fecha) 
                      hfechasubsistema ON dbo.Plazas.Id_plaza = hfechasubsistema.id_plaza LEFT OUTER JOIN
                          (SELECT     HTipoPlaza.Id_plaza, HTipoPlaza.id_rel, HTipoPlaza.Fecha, HTipoPlaza.Id_User, HTipoPlaza.Movimiento, HTipoPlaza.Motivo
                            FROM          HTipoPlaza INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fecha
                                                         FROM          htipoplaza
                                                         WHERE      fecha <= getdate()
                                                         GROUP BY id_plaza) AS fechas ON HTipoPlaza.Id_plaza = fechas.id_plaza AND HTipoPlaza.Fecha = fechas.fecha) htipoplaza ON 
                      dbo.Plazas.Id_plaza = htipoplaza.Id_plaza LEFT OUTER JOIN
                          (SELECT     HstatusPlaza.Id_plaza, HstatusPlaza.id_rel, HstatusPlaza.Fecha, HstatusPlaza.Id_User, HstatusPlaza.Movimiento
                            FROM          HstatusPlaza INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fecha
                                                         FROM          hstatusplaza
                                                         WHERE      fecha <= getdate()
                                                         GROUP BY id_plaza) fechas ON HstatusPlaza.Id_plaza = fechas.id_plaza AND HstatusPlaza.Fecha = fechas.fecha) hstatusplaza ON 
                      dbo.Plazas.Id_plaza = hstatusplaza.Id_plaza
ORDER BY hfechasubsistema.id_plaza
'
GO
PRINT N'Creating [dbo].[RVCD_Plazas]'
GO
IF OBJECT_ID(N'[dbo].[RVCD_Plazas]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[RVCD_Plazas]
AS
SELECT     id_plaza, id_plaza AS id_VCD_Plazas
FROM         dbo.TVCD_Plazas
'
GO
PRINT N'Creating [dbo].[TVista_Honorarios_Valores]'
GO
IF OBJECT_ID(N'[dbo].[TVista_Honorarios_Valores]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[TVista_Honorarios_Valores]
AS
SELECT     dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza AS Id_vista_honorarios_valores, dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza, 
                      dbo.ValoresMatriz4.Valor, dbo.ValoresMatriz4.id_Tabulador_IEA_CM, dbo.ValoresMatriz4.Fecha
FROM         dbo.TTabulador_IEA_Plaza INNER JOIN
                      dbo.ValoresMatriz4 ON dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza = dbo.ValoresMatriz4.id_Tabulador_IEA_Plaza
GROUP BY dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza, dbo.TTabulador_IEA_Plaza.categoria, dbo.ValoresMatriz4.Valor, 
                      dbo.ValoresMatriz4.id_Tabulador_IEA_CM, dbo.ValoresMatriz4.Fecha
HAVING      (dbo.TTabulador_IEA_Plaza.categoria LIKE ''h%'') OR
                      (dbo.TTabulador_IEA_Plaza.categoria LIKE '' h%'')
'
GO
PRINT N'Creating [dbo].[HVista_Honorarios_Valores]'
GO
IF OBJECT_ID(N'[dbo].[HVista_Honorarios_Valores]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[HVista_Honorarios_Valores]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.Plazas.Id_plaza, dbo.TVista_Honorarios_Valores.id_Tabulador_IEA_Plaza AS id_rel, dbo.TVista_Honorarios_Valores.Fecha, 
                      1 AS id_user, dbo.TVista_Honorarios_Valores.Fecha AS movimiento
FROM         dbo.TVista_Honorarios_Valores INNER JOIN
                      dbo.Plazas INNER JOIN
                      dbo.HTabulador_IEA_Plaza ON dbo.Plazas.Id_plaza = dbo.HTabulador_IEA_Plaza.id_plaza INNER JOIN
                      dbo.TTabulador_IEA_Plaza ON dbo.HTabulador_IEA_Plaza.id_rel = dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza ON 
                      dbo.TVista_Honorarios_Valores.id_Tabulador_IEA_Plaza = dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza
ORDER BY dbo.Plazas.Id_plaza
'
GO
PRINT N'Creating [dbo].[vw_acumulados_concepto]'
GO
IF OBJECT_ID(N'[dbo].[vw_acumulados_concepto]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vw_acumulados_concepto]
AS
select n.id_emp,n.id_periodo,n.id_plaza,n.id_concepto,n.pesos+n.pesosexcento as Impte,
   							c.resultado as Cpto, c.subclave as PA_Ant, 
								Case c.tipo When 1 Then ''P''
														When 2 Then ''D'' 
														end as Per_Ded
								from hp1219m n 
								inner join 
								conceptos c 
								on c.id_concepto = n.id_concepto
								where id_periodo in (select id_periodo 
														                  from calennomina 
														                  where id_cia = 2 and año = 2012 and devolucion <> 1)
	   						and  c.tipo in(1,2) and c.totaliza = 1'
GO
PRINT N'Creating [dbo].[vistaEllos]'
GO
IF OBJECT_ID(N'[dbo].[vistaEllos]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaEllos]
AS
SELECT     c.concepto AS conceptoellos, c.importe AS importeellos, c.perded, nom.plaza, nom.ct AS Ct_Ellos, nom.zna AS Zona_ellos, nom.filiacio, nom.id_emp, 
                      nom.id_plaza
FROM         (SELECT     tippag, ud, ct, plaza, puesto, stapla, motivo, rfc, filiacio, curp, nombre, ingsep, sexo, cheque, qnapago, desde, hasta, liquido, pagele, pro, spro, zna, 
                                              punteror, car_pd, id_emp, id_plaza
                       FROM          dbo.nom1310_1605
                       WHERE      (tippag = 1)) AS nom INNER JOIN
                          (SELECT     cheque, concepto, signo, importe, perded, desde, hasta, pro, spr, tippag, punteror, car_pd, qnasapli, qnastot, id_concepto, id_emp
                            FROM          dbo.cto1310_1605
                            WHERE      (tippag = 1)) AS c ON nom.cheque = c.cheque'
GO
PRINT N'Creating [dbo].[vistaEnlos2]'
GO
IF OBJECT_ID(N'[dbo].[vistaEnlos2]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaEnlos2] as    
Select a.*,b.id_concepto,b.conceptonos,b.importenos, (a.importeellos/100 - b.importenos) as diferencia ,b.CT_NOS,b.Zona_Nos,b.Niv_Nos     
from     
vistaEllos a inner join    
vistaNosotros B    
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza and a.conceptoellos = b.conceptonos and a.perded = b.tipo'
GO
PRINT N'Creating [dbo].[vistaSoloEllos]'
GO
IF OBJECT_ID(N'[dbo].[vistaSoloEllos]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaSoloEllos] as    
Select a.*,(select max(id_concepto) from conceptos where resultado=a.conceptoellos and tipo = a.perded) as id_concepto,    
(select max(resultado) from conceptos where resultado=a.conceptoellos and tipo = a.perded) as conceptonos, 0 as importenos,a.importeellos/100 as diferencia,
c.CT_NOS,c.Zona_Nos,c.Niv_Nos      
from     
(vistaEllos a left join    
vistaNosotros B    
on a.id_emp = b.id_emp and a.id_plaza = b.id_plaza and a.conceptoellos = b.conceptonos and a.perded = b.tipo )
left join Plazas_CT_NOS c on c.id_plaza = a.id_plaza 
where b.id_emp is null'
GO
PRINT N'Creating [dbo].[VistaAcumulado]'
GO
IF OBJECT_ID(N'[dbo].[VistaAcumulado]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[VistaAcumulado] as select * from xTablacuadre
'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud06]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud06]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud06] AS Select TablaConfigOrgan.Id_Nodo, TNivel_IMAE.clave as Clave  ,TNivel_IMAE.Descripcion as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel_IMAE ON TablaConfigOrgan.ValorCampoLLave = TNivel_IMAE.id_Nivel_IMAE where (TablaConfigOrgan.id_TablaLongitud = 6)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud07]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud07]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud07] AS Select TablaConfigOrgan.Id_Nodo, TNivel_IMAE2.clave as Clave  ,TNivel_IMAE2.Descripcion as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel_IMAE2 ON TablaConfigOrgan.ValorCampoLLave = TNivel_IMAE2.id_Nivel_IMAE2 where (TablaConfigOrgan.id_TablaLongitud = 7)'
GO
PRINT N'Creating [dbo].[TCentros_de_Trabajo]'
GO
IF OBJECT_ID(N'[dbo].[TCentros_de_Trabajo]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[TCentros_de_Trabajo]
AS
SELECT     TOP (100) PERCENT dbo.TablaConfigOrgan.ValorCampoLLave AS id_Centros_de_Trabajo, dbo.TablaConfigOrgan.Id_Nodo, dbo.TNivel3SE.clave, 
                      ''01'' + RIGHT(dbo.TNivel3SE.clave, 8) AS CentroTrabajo, dbo.TNivel3SE.Descripcion, dbo.TablaLongitudProp_24.Direccion, 
                      dbo.TablaLongitudProp_24.No_Alumnos, dbo.TablaLongitudProp_24.No_Grupos, dbo.TablaLongitudProp_24.Poblacion, 
                      dbo.TablaLongitudProp_24.Telefono, dbo.TablaLongitudProp_24.FechaCreacion, SUBSTRING(dbo.TNivel3SE.clave, 4, 3) AS CentroCostos, 
                      dbo.TCT_Coordinaciones.descripcion AS Coordinacion, dbo.TCT_Organizacion.descripcion AS Organización, dbo.TCT_Status.desc_status AS Estatus, 
                      dbo.TCT_Turno.descripcion AS Turno, dbo.TCT_UDCH.descripcion AS UDCH, dbo.TCT_Tipo.descripcion AS Tipo, dbo.TCT_BajoDes.descr_BajoDes, 
                      dbo.TCT_SupervisorZE.descr_SupervisorZE, dbo.TCT_ZEsc.desc_zesc, dbo.TCT_UResp.descr_Uresp, dbo.TCT_Czeb.descr_Czeb, 
                      dbo.TCT_Mun_Loc.Municipio, dbo.TCT_Mun_Loc.Localidad, dbo.TablaConfigOrgan.Posicion AS faltan, dbo.TCT_dep_norm.Descrip AS dep_norm, 
                      dbo.TCT_Coordinaciones.clave AS ClaveCoordinacion
FROM         dbo.TNivel3SE FULL OUTER JOIN
                      dbo.TCT_Status INNER JOIN
                      dbo.RCT_Status ON dbo.TCT_Status.id_CT_Status = dbo.RCT_Status.id_rel RIGHT OUTER JOIN
                      dbo.RCT_Czeb INNER JOIN
                      dbo.TCT_Czeb ON dbo.RCT_Czeb.id_rel = dbo.TCT_Czeb.id_CT_Czeb RIGHT OUTER JOIN
                      dbo.TCT_Mun_Loc INNER JOIN
                      dbo.RCT_Mun_Loc ON dbo.TCT_Mun_Loc.id_CT_Mun_Loc = dbo.RCT_Mun_Loc.id_rel RIGHT OUTER JOIN
                      dbo.TCT_ZEsc INNER JOIN
                      dbo.RCT_ZEsc ON dbo.TCT_ZEsc.id_CT_ZEsc = dbo.RCT_ZEsc.id_rel INNER JOIN
                      dbo.TablaConfigOrgan ON dbo.RCT_ZEsc.id_nodo = dbo.TablaConfigOrgan.Id_Nodo INNER JOIN
                      dbo.TCT_UResp INNER JOIN
                      dbo.RCT_UResp ON dbo.TCT_UResp.id_CT_UResp = dbo.RCT_UResp.id_rel ON dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_UResp.id_nodo ON 
                      dbo.RCT_Mun_Loc.id_nodo = dbo.TablaConfigOrgan.Id_Nodo LEFT OUTER JOIN
                      dbo.TCT_dep_norm INNER JOIN
                      dbo.rct_dep_norm ON dbo.TCT_dep_norm.id_CT_dep_norm = dbo.rct_dep_norm.id_rel ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.rct_dep_norm.id_nodo LEFT OUTER JOIN
                      dbo.RCT_SupervisorZE INNER JOIN
                      dbo.TCT_SupervisorZE ON dbo.RCT_SupervisorZE.id_rel = dbo.TCT_SupervisorZE.id_CT_SupervisorZE ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_SupervisorZE.id_nodo LEFT OUTER JOIN
                      dbo.TCT_Turno INNER JOIN
                      dbo.RCT_Turno ON dbo.TCT_Turno.id_CT_Turno = dbo.RCT_Turno.id_rel ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_Turno.id_nodo LEFT OUTER JOIN
                      dbo.TCT_BajoDes INNER JOIN
                      dbo.RCT_BajoDes ON dbo.TCT_BajoDes.id_CT_BajoDes = dbo.RCT_BajoDes.id_rel ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_BajoDes.id_nodo ON dbo.RCT_Czeb.id_nodo = dbo.TablaConfigOrgan.Id_Nodo LEFT OUTER JOIN
                      dbo.RCT_Tipo INNER JOIN
                      dbo.TCT_Tipo ON dbo.RCT_Tipo.id_rel = dbo.TCT_Tipo.id_CT_Tipo ON dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_Tipo.id_nodo ON 
                      dbo.RCT_Status.id_nodo = dbo.TablaConfigOrgan.Id_Nodo LEFT OUTER JOIN
                      dbo.RCT_Coordinaciones INNER JOIN
                      dbo.TCT_Coordinaciones ON dbo.RCT_Coordinaciones.id_rel = dbo.TCT_Coordinaciones.id_CT_Coordinaciones ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_Coordinaciones.id_nodo LEFT OUTER JOIN
                      dbo.TCT_Organizacion INNER JOIN
                      dbo.RCT_Organizacion ON dbo.TCT_Organizacion.id_CT_Organizacion = dbo.RCT_Organizacion.id_rel ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_Organizacion.id_nodo LEFT OUTER JOIN
                      dbo.TCT_UDCH INNER JOIN
                      dbo.RCT_UDCH ON dbo.TCT_UDCH.id_CT_UDCH = dbo.RCT_UDCH.id_rel ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.RCT_UDCH.id_nodo LEFT OUTER JOIN
                      dbo.TablaLongitudProp_24 ON dbo.TablaConfigOrgan.Id_Nodo = dbo.TablaLongitudProp_24.id_nodo LEFT OUTER JOIN
                      dbo.TablaLongitud ON dbo.TablaConfigOrgan.Id_TablaLongitud = dbo.TablaLongitud.Id_TablaLongitud ON 
                      dbo.TNivel3SE.id_Nivel3SE = dbo.TablaConfigOrgan.ValorCampoLLave
WHERE     (dbo.TablaConfigOrgan.Id_TablaLongitud = 24)
'
GO
PRINT N'Creating [dbo].[Ctas_Canceladas]'
GO
IF OBJECT_ID(N'[dbo].[Ctas_Canceladas]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[Ctas_Canceladas]
AS
SELECT     TOP (100) PERCENT dbo.EMPLEADOS.Id_Emp, dbo.EMPLEADOS.NOEMPx, dbo.EMPLEADOS.RFC, dbo.EMPLEADOS.Nombre, 
                      dbo.EMPLEADOS.ApPaterno, dbo.EMPLEADOS.ApMaterno, dbo.EMPLEADOS.Vigencia, dbo.EMPLEADOS.Fecha_Alta, dbo.EMPLEADOS.Id_Banco, 
                      dbo.EMPLEADOS.Cuenta_Invernomina, histpagos.Fecha, histpagos.id_concepto, dbo.PlazaEmpleados.Id_plaza, dbo.PlazaEmpleados.id_nodo, 
                      dbo.TCentros_de_Trabajo.CentroTrabajo, dbo.TCentros_de_Trabajo.Coordinacion, dbo.HPlazas.Valor_IdCampo
FROM         dbo.EMPLEADOS INNER JOIN
                          (SELECT     HistPagos_1.Id_Emp, HistPagos_1.Fecha, HistPagos_1.id_concepto, HistPagos_1.id_plaza, HistPagos_1.Fecha AS Expr1
                            FROM          (SELECT     Id_Emp, MAX(Fecha) AS maxima, id_plaza
                                                    FROM          dbo.HistPagos AS HistPagos_2
                                                    WHERE      (id_concepto = 1700) AND (Fecha <
                                                                               (SELECT     MIN(FechaIni) - 92 AS fechax
                                                                                 FROM          dbo.CalenNomina
                                                                                 WHERE      (Id_cia = 22) AND (YEAR(FechaIni) = 2008) AND (Actualizado = 0)))
                                                    GROUP BY Id_Emp, id_plaza) AS hispag INNER JOIN
                                                   dbo.HistPagos AS HistPagos_1 ON HistPagos_1.Id_Emp = hispag.Id_Emp AND HistPagos_1.Fecha = hispag.maxima) AS histpagos ON 
                      dbo.EMPLEADOS.Id_Emp = histpagos.Id_Emp AND dbo.EMPLEADOS.Vigencia = ''A'' AND histpagos.id_concepto = 1700 AND 
                      dbo.EMPLEADOS.Cuenta_Invernomina <> ''00'' INNER JOIN
                      dbo.PlazaEmpleados ON dbo.PlazaEmpleados.Id_Emp = dbo.EMPLEADOS.Id_Emp AND 
                      dbo.PlazaEmpleados.Id_plaza = histpagos.id_plaza INNER JOIN
                      dbo.TCentros_de_Trabajo ON dbo.TCentros_de_Trabajo.Id_Nodo = dbo.PlazaEmpleados.id_nodo INNER JOIN
                      dbo.HPlazas ON dbo.PlazaEmpleados.Id_plaza = dbo.HPlazas.Id_plaza AND dbo.HPlazas.Valor_IdCampo IN (10, 20, 24, 25, 95, 96, 48) AND 
                      dbo.PlazaEmpleados.Fecha = dbo.HPlazas.Fecha
ORDER BY dbo.EMPLEADOS.Id_Emp
'
GO
PRINT N'Creating [dbo].[vistaTodos]'
GO
IF OBJECT_ID(N'[dbo].[vistaTodos]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[vistaTodos] as    
select * from vistaEnlos2    
union all    
select * from vistaSoloEllos'
GO
PRINT N'Creating [dbo].[vistadatosempleados]'
GO
IF OBJECT_ID(N'[dbo].[vistadatosempleados]', 'V') IS NULL
EXEC sp_executesql N'Create View [dbo].[vistadatosempleados] as
Select A.id_emp,RFC,CURP,B.F_Ingreso_Gob,ApPaterno as Pat, ApMaterno as Mat, Nombre as Nom_Emp, C.Tel_particular,C.Tel_Celular,D.Tel_emergencia,rfcfecha as f_nacimiento,
Case when upper(rtrim(ltrim(sexo))) = ''M'' then ''Masculino'' else ''Femenino'' End as Sexo,
Case when upper(rtrim(ltrim(Edocivil))) = ''C'' then ''Casado(a)'' else (Case when upper(rtrim(ltrim(Edocivil))) = ''D'' then ''Divorciado(a)'' else (Case when upper(rtrim(ltrim(Edocivil))) = ''S'' then ''Soltero(a)'' else (Case when upper(rtrim(ltrim(Edocivil))) = ''V'' then ''Viudo(a)'' else (Case when upper(rtrim(ltrim(Edocivil))) = ''U'' then ''Union Libre'' else '' '' end ) end ) end ) end  ) end as Edo_Civil,
c.Calle,c.Colonia,C.Municipio,C.Ent_Federativa,C.CP,
 email as Correo_Electronico,Q.Tipo_Nomina, imss,A.Noempx as Cve_Emp, E.Descr as Banco,F.descripcion as Tipo_Pago,A.Cuenta_Invernomina as cuenta,
g.descr as Nacionalidad,H.Descr as Edo_Nacimiento,lunac as Lugar_Nacimiento,P.Horario_Trabajo, I.foto as Fotografia, J.tipo_sangre,
K.estatura, L.Peso, Cast(M.Talla_Saco_Camisa as varchar) + ''/'' + Cast(N.Talla_Pantalon as varchar ) as Talla,
o.Donador_organos, R.Tipo_Baja
 from ((((((((((((((((
empleados A 
left join (Select id_emp,min(fecha) as F_Ingreso_Gob from hsalarios where movim = ''A'' group by id_emp  ) b
on b.id_emp = a.id_emp )
left join ( Select Id_Direccion,Telefono as Tel_Particular,celular as Tel_Celular,calle, tcolonia.descr as Colonia, tciudad.descr as Municipio, testados.descr as Ent_Federativa, codpostal as CP from (( Tdirecciones left join tcolonia on Tdirecciones.id_colonia = tcolonia.id_colonia ) left join Tciudad on tciudad.id_ciudad = Tdirecciones.id_ciudad ) left join Testados on Testados.id_estado = Tdirecciones.id_estado ) C
on a.id_direccion = C.id_direccion )
left join (Select id_emp, max(Telefonoe) as Tel_emergencia from cnnombres where id_parentesco in ( Select id_parentesco_Datosemergencia from config ) group by id_emp) D
on D.id_emp = A.id_emp )
left join Tbancos E 
on e.id_banco = a.id_banco )
left join Tmediopago F 
on f.id_mediopago = A.id_cod )
left join tnacionalidad G
on g.id_nacionalidad = A.id_nacionalidad )
left join Testados H
on H.id_estado = A.id_estadoNac )
left join Cd_Empleado I
on I.id_emp = A.id_emp )
left join (Select id_emp,tipo as Tipo_Sangre from RTipo_Sangre inner join TTipo_Sangre on TTipo_Sangre.id_tipo_sangre = RTipo_Sangre.id_tipo_sangre  ) J
on J.id_emp = A.id_emp )
left join (Select id_emp,Estatura from restatura inner join testatura on testatura.id_estatura = restatura.id_estatura )K
on K.id_emp = A.id_emp )
left join (Select id_emp,Peso from rpeso inner join tpeso on tpeso.id_peso = rpeso.id_peso )L
on L.id_emp = A.id_emp )
left join ( Select id_emp,Talla as Talla_Saco_Camisa from RTalla_Saco_Camisa inner join TTalla_Saco_Camisa on TTalla_Saco_Camisa.id_Talla_saco_camisa = RTalla_Saco_Camisa.id_Talla_saco_camisa ) M
on M.id_emp = A.id_emp )
left join (Select id_emp,Talla as Talla_Pantalon from RTalla_Pantalon inner join TTalla_Pantalon on TTalla_Pantalon.id_Talla_Pantalon = RTalla_Pantalon.id_Talla_Pantalon ) N
on N.id_emp = A.id_emp )
left join (Select id_emp,Donador as Donador_Organos from rdonador inner join tdonador on tdonador.id_donador = rdonador.id_donador  ) O
on o.id_emp = A.id_emp )
left join ( Select HHorarios.id_emp,Thorarios.Horario as Horario_Trabajo from ( HHorarios inner join (Select id_emp,max(fecha) as Max from hhorarios  where fecha <= getdate() group by id_emp ) HHorariosMax on HHorariosMax.id_emp = HHorarios.id_emp and HHorariosMax.Max = HHorarios.fecha )inner join thorarios on thorarios.id_horario = HHorarios.id_rel ) P
on P.id_emp = A.id_emp )
left join ( Select Hcia.id_emp,Tcia.cia as Tipo_Nomina from ( Hcia inner join (Select id_emp,max(fecha) as Max from Hcia  where fecha <= getdate() group by id_emp ) HciaMax on HciaMax.id_emp = Hcia.id_emp and HciaMax.Max = Hcia.fecha ) inner join Tcia on Tcia.id_cia = Hcia.id_rel ) Q
on Q.id_emp = A.id_emp )
left join ( Select hbajas.id_emp, hbajas.descr as Tipo_Baja from hbajas inner join ( select id_emp,max(fecha) as maximo from hbajas group by id_emp) Max on Max.id_emp = Hbajas.id_emp and Max.maximo = Hbajas.fecha ) R
on R.id_emp = A.id_emp
where a.id_emp <> 0 

'
GO
PRINT N'Creating [dbo].[view_activos_reporte]'
GO
IF OBJECT_ID(N'[dbo].[view_activos_reporte]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[view_activos_reporte]                    
as                    
(                    
select distinct hpp.Id_plaza, hp.valor_idcampo as status, hpp.Valor_IdCampo mot,                    
dbo.fechatoanioquincena(hp.fecha) as desde,                   
case when hp.id_plaza = 60592 then ''999924''           
     when hp.id_plaza = 84655 then ''999924''          
     when hp.id_plaza = 84547 then ''999924''      
  when hp.id_plaza = 203765 then ''999924''            
else dbo.fechatoanioquincena(b.fecha) end as hasta,            
--dbo.fechatoanioquincena(b.fecha) as hasta,                    
t3.Id_Emp, e.rfc,e.curp, pe.PlazaIEEPO,                    
horas=case when pe.categoria not like '' e%'' then 30 else                     
case when pe.horas =''000'' then tt.Hrs_Compatibilidad                     
else case when substring(pe.horas,1,1)=0                     
then substring(pe.horas,2,1) else substring(pe.horas,1,2) end end end                    
from (                    
select Id_plaza, MAX(fecha) fecha                     
from  hplazas h with(nolock) where  h.Fecha <= ''20200816''                  
group by Id_plaza                       
) h                     
inner join HPlazas hp with(nolock) on h.Id_plaza = hp.Id_plaza and h.Fecha = hp.Fecha and hp.Id_TipoMovPlazas = 2 and hp.valor_idcampo in (1,6,14,15)                    
inner join HPlazas hpp with(nolock) on hpp.Id_plaza = hp.Id_plaza and hp.Fecha = hpp.fecha and hpp.Id_TipoMovPlazas = 1                     
inner join(                    
select t1.*, pe.Id_Emp  from                     
(select MAX(fecha)fecha, id_plaza  from PlazaEmpleados with(nolock) where Id_Emp <> 0  group by Id_plaza) t1                    
inner  join PlazaEmpleados pe with(nolock) on t1.fecha = pe.Fecha and t1.Id_plaza = pe.Id_plaza and pe.Id_Emp <> 0)                    
t3 on t3.Id_plaza = hp.Id_plaza                    
inner join (                    
select a.id_plaza, min(a.fecha) fecha from plazaempleados a with(nolock) inner join (                    
select a.* from plazaempleados a with(nolock) inner join (                    
select id_plaza, max(fecha) fecha from plazaempleados with(nolock) where fecha <= ''20200816''                    
group by id_plaza                     
) b on a.id_plaza = b.id_plaza and a.fecha = b.fecha                    
--where a.id_plaza = 46550                     
) b on b.id_plaza = a.id_plaza where a.fecha > b.fecha group by a.id_plaza                    
) b on t3.id_plaza = b.id_plaza --and a.fecha = b.fecha                    
inner join empleados e with(nolock) on t3.id_emp = e.id_Emp                     
inner join PlazaIEEPO pe with(nolock) on hpp.Id_plaza = pe.Id_plaza                    
inner join TTabulador_SE_Cat_Puesto tt on pe.Categoria=case when len(tt.categoria)=7 then                    
substring(tt.categoria,2,10) else tt.categoria end                         
)'
GO
PRINT N'Creating [dbo].[DiferenciasCuadreBaseNOMPRO]'
GO
IF OBJECT_ID(N'[dbo].[DiferenciasCuadreBaseNOMPRO]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[DiferenciasCuadreBaseNOMPRO]
AS
SELECT     C.id_concepto, C.resultado, C.Tipo, A.cantidad AS cantidadEllos, A.cantidadDEPagos AS cantidaddepagosEllos, B.cantidad AS CantidadNOS, 
                      B.cantidadDEPagos AS cantidaddepagosNos, A.cantidad - B.cantidad AS diferencia, A.cantidadDEPagos - B.cantidadDEPagos AS diferenciaPagos
FROM         (SELECT     id_concepto, SUM(importe) / 100 AS cantidad, COUNT(concepto) AS cantidadDEPagos
                       FROM          dbo.cto1310_1605
                       WHERE      (tippag = 1)
                       GROUP BY id_concepto) AS A LEFT OUTER JOIN
                          (SELECT     id_concepto, SUM(Pesos + PesosExcento) AS cantidad, COUNT(id_concepto) AS cantidadDEPagos
                            FROM          dbo.hp1311e
                            GROUP BY id_concepto) AS B ON A.id_concepto = B.id_concepto LEFT JOIN
                      dbo.Conceptos AS C ON C.id_concepto = A.id_concepto'
GO
PRINT N'Creating [dbo].[view_fup_lic_procesadas_singoce]'
GO
IF OBJECT_ID(N'[dbo].[view_fup_lic_procesadas_singoce]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[view_fup_lic_procesadas_singoce] as (  
select a.* from view_fup_lics_sin_goce a  
inner join (  
select max(fecha_inicial) as fecha_inicial,id_plaza from view_fup_lics_sin_goce  
group by id_plaza  
) b on a.Id_Plaza=b.Id_Plaza and a.fecha_inicial=b.fecha_inicial  
union
select ''CAED491025HOCBNR01'' as curp,''CAED491025GP9'' as rfc,13394 as id_emp,''14-41'' as operacion,
''198901'' as fecha_inicial,''198922'' as fecha_final,plazaieepo,id_plaza from plazaieepo where plazaieepo in (
''074820 E0963040200197''	             		 
,''074820 E0963040200200''	             		 
,''074820 E0963040200202''	           		 
,''074820 E0963040200203''	           		 
,''074820 E0963040200204''	             		 
,''074820 E0963040200205''	             		 
,''074820 E0963060200339''	            		 
) and Id_plaza not in (
select valor_idcampo from hplazas where Id_TipoMovPlazas=4
)
)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud29]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud29]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud29] AS Select TablaConfigOrgan.Id_Nodo, TNivel1IEA.clave as Clave  ,TNivel1IEA.Descripcion as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel1IEA ON TablaConfigOrgan.ValorCampoLLave = TNivel1IEA.id_Nivel1IEA where (TablaConfigOrgan.id_TablaLongitud = 29)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud01]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud01]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud01] AS Select TablaConfigOrgan.Id_Nodo, TNivelGob.Clave as Clave  ,TNivelGob.Descripcion as Descripcion  FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivelGob ON TablaConfigOrgan.ValorCampoLLave = TNivelGob.id_NivelGob where (TablaConfigOrgan.id_TablaLongitud = 1)
'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud02]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud02]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud02] AS Select TablaConfigOrgan.Id_Nodo, TNivelGob2.Clave as Clave  ,TNivelGob2.Descripcion as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivelGob2 ON TablaConfigOrgan.ValorCampoLLave = TNivelGob2.id_NivelGob2 where (TablaConfigOrgan.id_TablaLongitud = 2)
'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud03]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud03]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud03] AS Select TablaConfigOrgan.Id_Nodo, TNivelGob3.Clave as Clave  ,TNivelGob3.Descripción as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivelGob3 ON TablaConfigOrgan.ValorCampoLLave = TNivelGob3.id_NivelGob3 where (TablaConfigOrgan.id_TablaLongitud = 3)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud04]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud04]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud04] AS Select TablaConfigOrgan.Id_Nodo, TNivelGob4.Clave as Clave  ,TNivelGob4.Descripción as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivelGob4 ON TablaConfigOrgan.ValorCampoLLave = TNivelGob4.id_NivelGob4 where (TablaConfigOrgan.id_TablaLongitud = 4)'
GO
PRINT N'Creating [dbo].[PlazasMAtrizesHoy]'
GO
IF OBJECT_ID(N'[dbo].[PlazasMAtrizesHoy]', 'V') IS NULL
EXEC sp_executesql N'CREATE View [dbo].[PlazasMAtrizesHoy] as 
Select a.id_Plaza,a.id_Tabulador_SE_CM,a.id_Tabulador_SE_Zona,a.id_Tabulador_SE_Cat_Puesto,
a.id_Tabulador_SE_Nivel_Pago, b.id_concepto,b.resultado,b.valor as valor from DatosPlazaHoy A inner join 
(select A.*, b.resultado from MatrizHoy a inner join conceptos b on a.id_concepto = b.id_concepto) B 
on  a.id_Tabulador_SE_CM = b.id_Tabulador_SE_CM and 
a.id_Tabulador_SE_Zona = b.id_Tabulador_SE_Zona and 
a.id_Tabulador_SE_Cat_Puesto = b.id_Tabulador_SE_Cat_Puesto and 
a.id_Tabulador_SE_Nivel_Pago = b.id_Tabulador_SE_Nivel_Pago
'
GO
PRINT N'Creating [dbo].[PlazasReporte]'
GO
IF OBJECT_ID(N'[dbo].[PlazasReporte]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[PlazasReporte] as 
Select a.*,b.id_emp as Ultimo_id_emp,b.fecha as FechaDesligue,b.clave as CT,b.descripcion as DescripcionCT
from PlazasMAtrizesHoy A left join (
Select a.id_plaza,a.id_emp,a.fecha,C.clave,c.descripcion from (plazaempleados A inner join (
Select id_plaza,max(fecha) as fecha from plazaempleados where fecha <= getdate() group by id_plaza ) B 
on a.id_plaza = b.id_plaza and a.fecha = b.fecha )
left join vistatablalongitud C on c.id_nodo = a.id_nodo ) B 
on a.id_plaza= b.id_plaza

'
GO
PRINT N'Creating [dbo].[PlaneacionConceptos]'
GO
IF OBJECT_ID(N'[dbo].[PlaneacionConceptos]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[PlaneacionConceptos]
AS
SELECT     TOP (100) PERCENT dbo.EMPLEADOS.Id_Emp, dbo.EMPLEADOS.RFC, dbo.EMPLEADOS.CURP, dbo.EMPLEADOS.Nombre, 
                      dbo.EMPLEADOS.ApPaterno, dbo.EMPLEADOS.ApMaterno, ''01'' + SUBSTRING(dbo.TNivel3IEA.clave, 7, 15) AS CTrabajo, dbo.TVCD_Plazas.Cat_Puesto, 
                      dbo.TTabulador_IEA_Plaza.TNivel_Pto_IEA_id_Nivel_Pto_IEA, dbo.TTabulador_IEA_CM.Descripcion AS NivelSueldo, statusplaza.id_rel AS status, 
                      tipoplaza.id_rel AS MOTIVO, dbo.TVCD_Plazas.Consecutivo, dbo.TVCD_Plazas.Horas, 
                      dbo.TSubsubsistema_IEA.descripcion AS Subsistemacorrespondiente, dbo.PlazaEmpleados.Id_plaza, dbo.CalenNomina.Id_Periodo, 
                      dbo.TTabulador_IEA_Plaza.TSubsubsistema_IEA_id_Subsubsistema_IEA AS subsistemaa, dbo.HFecha_Alta_SEP.Fecha_Alta_SEP, 
                      dbo.TVCD_Plazas.FechaSubsistema, dbo.EMPLEADOS.SEXO, LTRIM(RTRIM(CAST(dbo.CalenNomina.Año AS char))) 
                      + LTRIM(RTRIM(CAST(dbo.CalenNomina.Numero AS char))) AS quincena, CASE WHEN DAY(CalenNomina.FechaIni) >= 1 AND 
                      DAY(CalenNomina.FechaIni) < 16 THEN ltrim(rtrim(CAST(YEAR(CalenNomina.FechaIni) AS char))) + ltrim(rtrim(CAST(REPLICATE(''0'', 
                      2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaIni) * 2) - 1 AS char)))) + CAST((MONTH(CalenNomina.FechaIni) * 2) - 1 AS char) AS char))) 
                      ELSE ltrim(rtrim(CAST(YEAR(CalenNomina.FechaIni) AS char))) + CAST(REPLICATE(''0'', 2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaIni) * 2) 
                      AS char)))) + CAST((MONTH(CalenNomina.FechaIni) * 2) AS char) AS char) END AS FechaInicial, CASE WHEN DAY(CalenNomina.FechaFin) >= 1 AND 
                      DAY(CalenNomina.FechaFin) < 16 THEN ltrim(rtrim(CAST(YEAR(CalenNomina.FechaFin) AS char))) + ltrim(rtrim(CAST(REPLICATE(''0'', 
                      2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaFin) * 2) - 1 AS char)))) + CAST((MONTH(CalenNomina.FechaFin) * 2) - 1 AS char) AS char))) 
                      ELSE ltrim(rtrim(CAST(YEAR(CalenNomina.FechaFin) AS char))) + CAST(REPLICATE(''0'', 2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaFin) * 2) 
                      AS char)))) + CAST((MONTH(CalenNomina.FechaFin) * 2) AS char) AS char) END AS FechaFinal, dbo.Nom_histpagos.Pesos AS total, 
                      dbo.HTipo_Seg_Social.id_rel AS TipoCotizacion, dbo.Conceptos.descripcion AS detalle, dbo.TGrado_Academico.campo AS GRADOACADEMICO
FROM         (SELECT     maxi.id_plaza AS PLAZA, MAX(maxi.fecha) AS Expr1, HTabulador_IEA_CM_1.id_rel
                       FROM          (SELECT     id_plaza, MAX(fecha) AS fecha
                                               FROM          dbo.HTabulador_IEA_CM
                                               WHERE      (fecha <= GETDATE())
                                               GROUP BY id_plaza) AS maxi INNER JOIN
                                              dbo.HTabulador_IEA_CM AS HTabulador_IEA_CM_1 ON maxi.id_plaza = HTabulador_IEA_CM_1.id_plaza
                       GROUP BY maxi.id_plaza, HTabulador_IEA_CM_1.id_rel) AS htabuladorr INNER JOIN
                      dbo.TTabulador_IEA_CM ON htabuladorr.id_rel = dbo.TTabulador_IEA_CM.id_Tabulador_IEA_CM RIGHT OUTER JOIN
                      dbo.TablaConfigOrgan INNER JOIN
                      dbo.TNivel3IEA ON dbo.TablaConfigOrgan.ValorCampoLLave = dbo.TNivel3IEA.id_Nivel3IEA RIGHT OUTER JOIN
                      dbo.CalenNomina INNER JOIN
                      dbo.Conceptos INNER JOIN
                      dbo.Nom_histpagos ON dbo.Conceptos.id_concepto = dbo.Nom_histpagos.id_concepto ON 
                      dbo.CalenNomina.Id_Periodo = dbo.Nom_histpagos.Id_Periodo RIGHT OUTER JOIN
                      dbo.PlazaEmpleados ON dbo.Nom_histpagos.id_plaza = dbo.PlazaEmpleados.Id_plaza AND 
                      dbo.Nom_histpagos.Id_Emp = dbo.PlazaEmpleados.Id_Emp LEFT OUTER JOIN
                      dbo.TVCD_Plazas ON dbo.PlazaEmpleados.Id_plaza = dbo.TVCD_Plazas.Id_plaza ON 
                      dbo.TablaConfigOrgan.Id_Nodo = dbo.PlazaEmpleados.id_nodo ON htabuladorr.PLAZA = dbo.PlazaEmpleados.Id_plaza LEFT OUTER JOIN
                          (SELECT     maxi.Id_plaza, maxi.fecha, HTipoPlaza_1.id_rel
                            FROM          (SELECT     Id_plaza, MAX(Fecha) AS fecha
                                                    FROM          dbo.HTipoPlaza
                                                    WHERE      (Fecha <= GETDATE())
                                                    GROUP BY Id_plaza) AS maxi INNER JOIN
                                                   dbo.HTipoPlaza AS HTipoPlaza_1 ON maxi.Id_plaza = HTipoPlaza_1.Id_plaza AND maxi.fecha = HTipoPlaza_1.Fecha) AS tipoplaza ON 
                      dbo.PlazaEmpleados.Id_plaza = tipoplaza.Id_plaza LEFT OUTER JOIN
                          (SELECT     maxi.Id_plaza, maxi.fecha, HstatusPlaza_1.id_rel
                            FROM          (SELECT     Id_plaza, MAX(Fecha) AS fecha
                                                    FROM          dbo.HstatusPlaza
                                                    WHERE      (Fecha <= GETDATE())
                                                    GROUP BY Id_plaza) AS maxi INNER JOIN
                                                   dbo.HstatusPlaza AS HstatusPlaza_1 ON maxi.Id_plaza = HstatusPlaza_1.Id_plaza AND maxi.fecha = HstatusPlaza_1.Fecha) 
                      AS statusplaza ON dbo.PlazaEmpleados.Id_plaza = statusplaza.Id_plaza LEFT OUTER JOIN
                      dbo.TGrado_Academico INNER JOIN
                      dbo.RGrado_Academico ON dbo.TGrado_Academico.id_Grado_Academico = dbo.RGrado_Academico.id_Grado_Academico ON 
                      dbo.PlazaEmpleados.Id_Emp = dbo.RGrado_Academico.id_emp LEFT OUTER JOIN
                      dbo.HTipo_Seg_Social ON dbo.PlazaEmpleados.Id_plaza = dbo.HTipo_Seg_Social.id_plaza LEFT OUTER JOIN
                      dbo.HFecha_Alta_SEP ON dbo.PlazaEmpleados.Id_Emp = dbo.HFecha_Alta_SEP.id_emp LEFT OUTER JOIN
                      dbo.TTabulador_IEA_Plaza INNER JOIN
                      dbo.TSubsubsistema_IEA ON 
                      dbo.TTabulador_IEA_Plaza.TSubsubsistema_IEA_id_Subsubsistema_IEA = dbo.TSubsubsistema_IEA.id_Subsubsistema_IEA INNER JOIN
                          (SELECT     HTabulador_IEA_Plaza_2.id_plaza, HTabulador_IEA_Plaza_2.id_rel, HTabulador_IEA_Plaza_2.fecha, HTabulador_IEA_Plaza_2.id_user, 
                                                   HTabulador_IEA_Plaza_2.movimiento
                            FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_2 INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fechita
                                                         FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_1
                                                         WHERE      (fecha <= GETDATE())
                                                         GROUP BY id_plaza) AS DERIVEDTBL ON HTabulador_IEA_Plaza_2.id_plaza = DERIVEDTBL.id_plaza AND 
                                                   HTabulador_IEA_Plaza_2.fecha = DERIVEDTBL.fechita) AS HTabulador_IEA_Plaza ON 
                      dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza = HTabulador_IEA_Plaza.id_rel ON 
                      dbo.PlazaEmpleados.Id_plaza = HTabulador_IEA_Plaza.id_plaza LEFT OUTER JOIN
                      dbo.EMPLEADOS ON dbo.PlazaEmpleados.Id_Emp = dbo.EMPLEADOS.Id_Emp
WHERE     (dbo.Conceptos.id_concepto = 1300) AND (statusplaza.id_rel = 1 OR
                      statusplaza.id_rel = 6) AND (dbo.CalenNomina.Id_Periodo = 1389)
ORDER BY dbo.PlazaEmpleados.Id_plaza
'
GO
PRINT N'Creating [dbo].[QCamposVariables]'
GO
IF OBJECT_ID(N'[dbo].[QCamposVariables]', 'V') IS NULL
EXEC sp_executesql N'

CREATE VIEW [dbo].[QCamposVariables] AS
SELECT     EAdic.Id_Emp, TAdic.Id_Adic, TAdic.DESCR,EAdic.Valor
FROM         TAdic INNER JOIN
                      EAdic ON TAdic.Id_Adic = EAdic.Id_Adic

'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud18]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud18]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud18] AS Select TablaConfigOrgan.Id_Nodo, TNivel1ISEAfed.clave_Nivel1ISEAfed as Clave  ,TNivel1ISEAfed.descr_Nivel1ISEAfed as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel1ISEAfed ON TablaConfigOrgan.ValorCampoLLave = TNivel1ISEAfed.id_Nivel1ISEAfed where (TablaConfigOrgan.id_TablaLongitud = 18)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud19]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud19]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud19] AS Select TablaConfigOrgan.Id_Nodo, TNivel2ISEAfed.clave_Nivel2ISEAfed as Clave  ,TNivel2ISEAfed.descr_Nivel2ISEAfed as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel2ISEAfed ON TablaConfigOrgan.ValorCampoLLave = TNivel2ISEAfed.id_Nivel2ISEAfed where (TablaConfigOrgan.id_TablaLongitud = 19)'
GO
PRINT N'Creating [dbo].[Pago]'
GO
IF OBJECT_ID(N'[dbo].[Pago]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[Pago]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT dbo.EMPLEADOS.Id_Emp, dbo.EMPLEADOS.RFC, dbo.EMPLEADOS.Nombre, dbo.EMPLEADOS.ApPaterno, 
                      dbo.EMPLEADOS.ApMaterno, ''01'' + SUBSTRING(dbo.TNivel3IEA.clave, 7, 15) AS CTrabajo, dbo.TVCD_Plazas.Cat_Puesto, 
                      dbo.TTabulador_IEA_CM.Descripcion AS NivelSueldo, statusplaza.id_rel AS status, tipoplaza.id_rel AS MOTIVO, 
                      dbo.HFecha_Alta_SEP.Fecha_Alta_SEP, dbo.EMPLEADOS.SEXO, LTRIM(RTRIM(CAST(dbo.CalenNomina.Año AS char))) 
                      + LTRIM(RTRIM(CAST(dbo.CalenNomina.Numero AS char))) AS quincena, CASE WHEN DAY(CalenNomina.FechaIni) >= 1 AND 
                      DAY(CalenNomina.FechaIni) < 16 THEN ltrim(rtrim(CAST(YEAR(CalenNomina.FechaIni) AS char))) + ltrim(rtrim(CAST(REPLICATE(''0'', 
                      2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaIni) * 2) - 1 AS char)))) + CAST((MONTH(CalenNomina.FechaIni) * 2) - 1 AS char) AS char))) 
                      ELSE ltrim(rtrim(CAST(YEAR(CalenNomina.FechaIni) AS char))) + CAST(REPLICATE(''0'', 2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaIni) * 2) 
                      AS char)))) + CAST((MONTH(CalenNomina.FechaIni) * 2) AS char) AS char) END AS FechaInicial, CASE WHEN DAY(CalenNomina.FechaFin) >= 1 AND 
                      DAY(CalenNomina.FechaFin) < 16 THEN ltrim(rtrim(CAST(YEAR(CalenNomina.FechaFin) AS char))) + ltrim(rtrim(CAST(REPLICATE(''0'', 
                      2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaFin) * 2) - 1 AS char)))) + CAST((MONTH(CalenNomina.FechaFin) * 2) - 1 AS char) AS char))) 
                      ELSE ltrim(rtrim(CAST(YEAR(CalenNomina.FechaFin) AS char))) + CAST(REPLICATE(''0'', 2 - LEN(LTRIM(CAST((MONTH(CalenNomina.FechaFin) * 2) 
                      AS char)))) + CAST((MONTH(CalenNomina.FechaFin) * 2) AS char) AS char) END AS FechaFinal, dbo.TVCD_Plazas.PLAZA_ENTERA, 
                      PlazaEmpleados.Id_plaza, dbo.EMPLEADOS.Cuenta_Invernomina AS Cuenta, sueldo.Total_Percepcion, sueldo.Total_Deduccion, sueldo.Neto
FROM         dbo.HFecha_Alta_SEP RIGHT OUTER JOIN
                      dbo.Plazas INNER JOIN
                          (SELECT     Plazas_1.Id_plaza, Plazas_1.Num_Plaza, dbo.HistPagos.Id_Periodo, dbo.HistPagos.Pesos AS Total_Percepcion, 
                                                   dbo.HistPagos.Pesos - HistPagos_1.Pesos AS Total_Deduccion, HistPagos_1.Pesos AS Neto
                            FROM          dbo.Plazas AS Plazas_1 INNER JOIN
                                                   dbo.HistPagos ON Plazas_1.Id_plaza = dbo.HistPagos.id_plaza INNER JOIN
                                                   dbo.HistPagos AS HistPagos_1 ON dbo.HistPagos.id_plaza = HistPagos_1.id_plaza AND 
                                                   dbo.HistPagos.Id_Emp = HistPagos_1.Id_Emp AND dbo.HistPagos.Id_Periodo = HistPagos_1.Id_Periodo
                            WHERE      (HistPagos_1.id_concepto = 1721) AND (dbo.HistPagos.id_concepto = 1708)) AS sueldo INNER JOIN
                      dbo.CalenNomina ON sueldo.Id_Periodo = dbo.CalenNomina.Id_Periodo ON dbo.Plazas.Id_plaza = sueldo.Id_plaza RIGHT OUTER JOIN
                          (SELECT     PlazaEmpleados_2.Id_Emp, PlazaEmpleados_2.Id_plaza, PlazaEmpleados_2.Fecha, PlazaEmpleados_2.Id_User, 
                                                   PlazaEmpleados_2.Movimiento, PlazaEmpleados_2.id_nodo, PlazaEmpleados_2.Documentos, PlazaEmpleados_2.Id, 
                                                   PlazaEmpleados_2.id_plazaanterior
                            FROM          dbo.PlazaEmpleados AS PlazaEmpleados_2 INNER JOIN
                                                       (SELECT     TOP (100) PERCENT Id_plaza, MAX(Fecha) AS Expr1
                                                         FROM          dbo.PlazaEmpleados AS PlazaEmpleados_1
                                                         GROUP BY Id_plaza
                                                         ORDER BY Id_plaza) AS maximafecha ON PlazaEmpleados_2.Fecha = maximafecha.Expr1 AND 
                                                   PlazaEmpleados_2.Id_plaza = maximafecha.Id_plaza) AS PlazaEmpleados INNER JOIN
                      dbo.TVCD_Plazas ON PlazaEmpleados.Id_plaza = dbo.TVCD_Plazas.Id_plaza ON dbo.Plazas.Id_plaza = PlazaEmpleados.Id_plaza LEFT OUTER JOIN
                      dbo.TablaConfigOrgan INNER JOIN
                      dbo.TNivel3IEA ON dbo.TablaConfigOrgan.ValorCampoLLave = dbo.TNivel3IEA.id_Nivel3IEA ON 
                      PlazaEmpleados.id_nodo = dbo.TablaConfigOrgan.Id_Nodo LEFT OUTER JOIN
                          (SELECT     maxi.id_plaza AS PLAZA, MAX(maxi.fecha) AS Expr1, HTabulador_IEA_CM_1.id_rel
                            FROM          (SELECT     id_plaza, MAX(fecha) AS fecha
                                                    FROM          dbo.HTabulador_IEA_CM
                                                    WHERE      (fecha <= GETDATE())
                                                    GROUP BY id_plaza) AS maxi INNER JOIN
                                                   dbo.HTabulador_IEA_CM AS HTabulador_IEA_CM_1 ON maxi.id_plaza = HTabulador_IEA_CM_1.id_plaza
                            GROUP BY maxi.id_plaza, HTabulador_IEA_CM_1.id_rel) AS htabuladorr INNER JOIN
                      dbo.TTabulador_IEA_CM ON htabuladorr.id_rel = dbo.TTabulador_IEA_CM.id_Tabulador_IEA_CM ON 
                      PlazaEmpleados.Id_plaza = htabuladorr.PLAZA LEFT OUTER JOIN
                          (SELECT     maxi_2.Id_plaza, maxi_2.fecha, HTipoPlaza_1.id_rel
                            FROM          (SELECT     Id_plaza, MAX(Fecha) AS fecha
                                                    FROM          dbo.HTipoPlaza
                                                    WHERE      (Fecha <= GETDATE())
                                                    GROUP BY Id_plaza) AS maxi_2 INNER JOIN
                                                   dbo.HTipoPlaza AS HTipoPlaza_1 ON maxi_2.Id_plaza = HTipoPlaza_1.Id_plaza AND maxi_2.fecha = HTipoPlaza_1.Fecha) 
                      AS tipoplaza ON PlazaEmpleados.Id_plaza = tipoplaza.Id_plaza LEFT OUTER JOIN
                          (SELECT     maxi_1.Id_plaza, maxi_1.fecha, HstatusPlaza_1.id_rel
                            FROM          (SELECT     Id_plaza, MAX(Fecha) AS fecha
                                                    FROM          dbo.HstatusPlaza
                                                    WHERE      (Fecha <= GETDATE())
                                                    GROUP BY Id_plaza) AS maxi_1 INNER JOIN
                                                   dbo.HstatusPlaza AS HstatusPlaza_1 ON maxi_1.Id_plaza = HstatusPlaza_1.Id_plaza AND maxi_1.fecha = HstatusPlaza_1.Fecha) 
                      AS statusplaza ON PlazaEmpleados.Id_plaza = statusplaza.Id_plaza LEFT OUTER JOIN
                      dbo.TGrado_Academico INNER JOIN
                      dbo.RGrado_Academico ON dbo.TGrado_Academico.id_Grado_Academico = dbo.RGrado_Academico.id_Grado_Academico ON 
                      PlazaEmpleados.Id_Emp = dbo.RGrado_Academico.id_emp LEFT OUTER JOIN
                      dbo.HTipo_Seg_Social ON PlazaEmpleados.Id_plaza = dbo.HTipo_Seg_Social.id_plaza ON 
                      dbo.HFecha_Alta_SEP.id_emp = PlazaEmpleados.Id_Emp LEFT OUTER JOIN
                      dbo.TTabulador_IEA_Plaza INNER JOIN
                      dbo.TSubsubsistema_IEA ON 
                      dbo.TTabulador_IEA_Plaza.TSubsubsistema_IEA_id_Subsubsistema_IEA = dbo.TSubsubsistema_IEA.id_Subsubsistema_IEA INNER JOIN
                          (SELECT     HTabulador_IEA_Plaza_2.id_plaza, HTabulador_IEA_Plaza_2.id_rel, HTabulador_IEA_Plaza_2.fecha, HTabulador_IEA_Plaza_2.id_user, 
                                                   HTabulador_IEA_Plaza_2.movimiento
                            FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_2 INNER JOIN
                                                       (SELECT     id_plaza, MAX(fecha) AS fechita
                                                         FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_1
                                                         WHERE      (fecha <= GETDATE())
                                                         GROUP BY id_plaza) AS DERIVEDTBL ON HTabulador_IEA_Plaza_2.id_plaza = DERIVEDTBL.id_plaza AND 
                                                   HTabulador_IEA_Plaza_2.fecha = DERIVEDTBL.fechita) AS HTabulador_IEA_Plaza ON 
                      dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza = HTabulador_IEA_Plaza.id_rel ON 
                      PlazaEmpleados.Id_plaza = HTabulador_IEA_Plaza.id_plaza LEFT OUTER JOIN
                      dbo.EMPLEADOS ON PlazaEmpleados.Id_Emp = dbo.EMPLEADOS.Id_Emp
WHERE     (statusplaza.id_rel = 1) OR
                      (statusplaza.id_rel = 6)
ORDER BY PlazaEmpleados.Id_plaza
'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud20]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud20]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud20] AS Select TablaConfigOrgan.Id_Nodo, TNivel3ISEAfed.clave_Nivel3ISEAfed as Clave  ,TNivel3ISEAfed.descr_Nivel3ISEAfed as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel3ISEAfed ON TablaConfigOrgan.ValorCampoLLave = TNivel3ISEAfed.id_Nivel3ISEAfed where (TablaConfigOrgan.id_TablaLongitud = 20)'
GO
PRINT N'Creating [dbo].[VistaTablaLongitud21]'
GO
IF OBJECT_ID(N'[dbo].[VistaTablaLongitud21]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[VistaTablaLongitud21] AS Select TablaConfigOrgan.Id_Nodo, TNivel4ISEAfed.clave_Nivel4ISEAfed as Clave  ,TNivel4ISEAfed.descr_Nivel4ISEAfed as Descripcion FROM TablaConfigOrgan INNER JOIN TablaLongitud ON TablaConfigOrgan.Id_TablaLongitud = TablaLongitud.Id_TablaLongitud INNER JOIN TNivel4ISEAfed ON TablaConfigOrgan.ValorCampoLLave = TNivel4ISEAfed.id_Nivel4ISEAfed where (TablaConfigOrgan.id_TablaLongitud = 21)'
GO
PRINT N'Creating [dbo].[RHonorarios_Valores]'
GO
IF OBJECT_ID(N'[dbo].[RHonorarios_Valores]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[RHonorarios_Valores]
AS
SELECT DISTINCT dbo.THonorarios_Valores.Id_Honorarios_Valores, categoria.id_plaza
FROM         (SELECT     TOP (100) PERCENT dbo.HCat_Puesto.id_plaza, dbo.HCat_Puesto.Cat_Puesto
                       FROM          dbo.HCat_Puesto INNER JOIN
                                                  (SELECT     id_plaza, MAX(fecha) AS FECHAMAX
                                                    FROM          dbo.HCat_Puesto AS HCat_Puesto_1
                                                    GROUP BY id_plaza) AS FECHAS ON FECHAS.id_plaza = dbo.HCat_Puesto.id_plaza AND 
                                              dbo.HCat_Puesto.fecha = FECHAS.FECHAMAX
                       ORDER BY dbo.HCat_Puesto.id_plaza) AS categoria INNER JOIN
                      dbo.THonorarios_Valores ON categoria.Cat_Puesto = dbo.THonorarios_Valores.Categoria
'
GO
PRINT N'Creating [dbo].[ViewVistaTablalongitudy]'
GO
IF OBJECT_ID(N'[dbo].[ViewVistaTablalongitudy]', 'V') IS NULL
EXEC sp_executesql N'Create view 
[dbo].[ViewVistaTablalongitudy] 
as
select v.*,descripcionentidad from vistatablalongitud v
inner join
(select Substring(Clave, 1, 2) AS Entidad,descripcion as descripcionentidad from tnivelgob) a
on a.entidad= v.entidad

'
GO
PRINT N'Creating [dbo].[TPrevio_CostoPlaza]'
GO
IF OBJECT_ID(N'[dbo].[TPrevio_CostoPlaza]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[TPrevio_CostoPlaza]
AS
SELECT     dbo.Plazas.Id_plaza, VM4.id_concepto, dbo.Conceptos.resultado AS Concepto, VM4.Valor AS Importe, VM4.Fecha
FROM         dbo.Plazas INNER JOIN
                          (SELECT     id_plaza, id_rel, fecha
                            FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_2
                            WHERE      (fecha =
                                                       (SELECT     MAX(fecha) AS MaxFecha
                                                         FROM          dbo.HTabulador_IEA_Plaza AS HTabulador_IEA_Plaza_1
                                                         WHERE      (id_plaza = HTabulador_IEA_Plaza_2.id_plaza)))) AS HT_Plaza ON dbo.Plazas.Id_plaza = HT_Plaza.id_plaza INNER JOIN
                      dbo.TTabulador_IEA_Plaza ON HT_Plaza.id_rel = dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza INNER JOIN
                          (SELECT     id_concepto, Valor, Fecha, Movimiento, id_user, id_Tabulador_IEA_Plaza, id_Tabulador_IEA_CM, id_Tabulador_IEA_Zona
                            FROM          dbo.ValoresMatriz4
                            WHERE      (Fecha =
                                                       (SELECT     MAX(Fecha) AS MaXFecha
                                                         FROM          dbo.ValoresMatriz4 AS ValoresMatriz4_1
                                                         WHERE      (id_Tabulador_IEA_Plaza = dbo.ValoresMatriz4.id_Tabulador_IEA_Plaza)))) AS VM4 ON 
                      dbo.TTabulador_IEA_Plaza.id_Tabulador_IEA_Plaza = VM4.id_Tabulador_IEA_Plaza INNER JOIN
                      dbo.Conceptos ON VM4.id_concepto = dbo.Conceptos.id_concepto INNER JOIN
                          (SELECT     id_plaza, id_rel, fecha
                            FROM          dbo.HTabulador_IEA_CM AS HTabulador_IEA_CM_2
                            WHERE      (fecha =
                                                       (SELECT     MAX(fecha) AS MaxFecha
                                                         FROM          dbo.HTabulador_IEA_CM AS HTabulador_IEA_CM_1
                                                         WHERE      (id_plaza = HTabulador_IEA_CM_2.id_plaza)))) AS HT_CM ON dbo.Plazas.Id_plaza = HT_CM.id_plaza INNER JOIN
                      dbo.TTabulador_IEA_CM ON HT_CM.id_rel = dbo.TTabulador_IEA_CM.id_Tabulador_IEA_CM AND 
                      VM4.id_Tabulador_IEA_CM = dbo.TTabulador_IEA_CM.id_Tabulador_IEA_CM
'
GO
PRINT N'Creating [dbo].[Vista_PlazasCompletas]'
GO
IF OBJECT_ID(N'[dbo].[Vista_PlazasCompletas]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[Vista_PlazasCompletas]
AS
SELECT     dbo.Plazas.Num_Plaza AS Num_Plaza, dbo.TNivel3IEA.clave AS CentroTabajo, dbo.TNivel2IEA.clave AS Padre_Organ, 
                      dbo.TNivel2IEA.Descripcion AS Desc_Padre_Organ, dbo.PlazaEmpleados.Id_plaza AS Expr1, dbo.PlazaEmpleados.Fecha AS Expr2, 
                      dbo.PlazaEmpleados.id_nodo AS Expr3, dbo.CD_PLAZA.id_plaza, dbo.CD_PLAZA.CodigoPago, dbo.CD_PLAZA.SubUnidad, dbo.CD_PLAZA.Cat_puesto, 
                      dbo.CD_PLAZA.Unidad, dbo.CD_PLAZA.Horas, dbo.CD_PLAZA.Consecutivo, dbo.CD_PLAZA.FechaSubsistema
FROM         dbo.Plazas INNER JOIN
                      dbo.PlazaEmpleados ON dbo.Plazas.Id_plaza = dbo.PlazaEmpleados.Id_plaza INNER JOIN
                      dbo.CD_PLAZA ON dbo.Plazas.Id_plaza = dbo.CD_PLAZA.id_plaza INNER JOIN
                      dbo.TablaConfigOrgan ON dbo.PlazaEmpleados.id_nodo = dbo.TablaConfigOrgan.Id_Nodo INNER JOIN
                      dbo.TNivel3IEA ON dbo.TablaConfigOrgan.Id_Nodo = dbo.TNivel3IEA.id_Nivel3IEA INNER JOIN
                      dbo.TablaConfigOrgan TablaConfigOrgan_1 ON dbo.TablaConfigOrgan.Id_Nodopadre = TablaConfigOrgan_1.Id_Nodo INNER JOIN
                      dbo.TNivel2IEA ON TablaConfigOrgan_1.Id_TablaLongitud = dbo.TNivel2IEA.id_Nivel2IEA
WHERE     (dbo.Plazas.Id_plaza >= 200000)
'
GO
PRINT N'Creating [dbo].[view_fup_pagos]'
GO
IF OBJECT_ID(N'[dbo].[view_fup_pagos]', 'V') IS NULL
EXEC sp_executesql N'	CREATE view [dbo].[view_fup_pagos] 
	as(
	select rfc,curp,clave_plaza,clave_cct--,importe_neto as liquido
	,id_emp,id_plaza,quincena from [172.16.77.19].federacion.dbo.detalle_nomina 
	where --quincena=''201711'' and 
	estatus=''validación correcta''
	--and id_emp=150538
	union all
	select b.rfc,b.curp,b.plaza as clave_plaza,b.ct as clave_cct--,b.monto as liquido
	,b.id_emp,pi.id_plaza, 
	cast(c.año_pago as varchar(4)) + RIGHT(''00'' + Ltrim(Rtrim(c.qna_pago)),2) as quincena
	from [172.16.77.19].federacion.dbo.detalle_nomina a
	inner join [172.16.77.19].federacion.dbo.hist_nomina b on a.id_emp=b.id_emp
	inner join plazaieepo pi on b.plaza=replace(pi.plazaieepo,'' '','''')
	inner join [172.16.77.19].federacion.dbo.calendario c on b.id_periodo=c.id_periodo
	where --a.quincena=''201710'' and 
	a.estatus<>''validación correcta''
	--and b.id_emp=150538 --and c.qna_pago=10 and c.año_pago=''2017''
	and  not exists (
	select 1 from [172.16.77.19].federacion.dbo.detalle_nomina v
	where --quincena=''201710'' and 
	v.estatus=''validación correcta'' and v.clave_plaza=b.plaza and v.quincena=cast(c.año_pago as varchar(4)) + RIGHT(''00'' + Ltrim(Rtrim(c.qna_pago)),2)
	))
'
GO
PRINT N'Creating [dbo].[VistaSeguridadOrganigramas]'
GO
IF OBJECT_ID(N'[dbo].[VistaSeguridadOrganigramas]', 'V') IS NULL
EXEC sp_executesql N'CREATE view [dbo].[VistaSeguridadOrganigramas] as
select token,no_empx,cast(0 as bit)as expirado,getdate() as fecha_creacion, ''RHAgsSEGI'' as sistema from vistaorganigrama


'
GO
PRINT N'Creating [dbo].[cto1219Basica$]'
GO
IF OBJECT_ID(N'[dbo].[cto1219Basica$]', 'V') IS NULL
EXEC sp_executesql N'create view [dbo].[cto1219Basica$] as 
Select * from cto1219 where tippag = 1'
GO
PRINT N'Creating [dbo].[nom1219basica$]'
GO
IF OBJECT_ID(N'[dbo].[nom1219basica$]', 'V') IS NULL
EXEC sp_executesql N'create view [dbo].[nom1219basica$] as
Select * from nom1219 where tippag = 1  ---101070 registros'
GO
PRINT N'Creating [dbo].[viewtblconceptos]'
GO
IF OBJECT_ID(N'[dbo].[viewtblconceptos]', 'V') IS NULL
EXEC sp_executesql N'create view [dbo].[viewtblconceptos] as select * from tblconceptos
'
GO
PRINT N'Creating [dbo].[vistaTipoMovNomSia]'
GO
IF OBJECT_ID(N'[dbo].[vistaTipoMovNomSia]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[vistaTipoMovNomSia]
AS
select ''1_nomAntes1444'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 14 and motivo = 44
union all
select ''2_nomAntes1548'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 15 and motivo = 48
union all
select ''3_HnomAntes0620'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 6 and motivo = 20 and plaza like ''%A%''
union all
select ''4_nomAntes0620'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 6 and motivo = 20 and plaza not like ''%A%''
union all
select ''5_nomAntes0110'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 1 and motivo = 10
union all
select ''6_nomAntes0195'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 1 and motivo = 95
union all
select ''7_nomAntes0624'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 6 and motivo = 24
union all
select ''8_nomAntes0625'' tipo, count(*) cantidad from nom1308f where tippag = 1 and stapla = 6 and motivo = 25
union all
select ''1_nomAct1444'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 14 and motivo = 44
union all
select ''2_nomAct1548'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 15 and motivo = 48
union all
select ''3_HnomAct0620'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 6 and motivo = 20 and plaza like ''%A%''
union all
select ''4_nomAct0620'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 6 and motivo = 20 and plaza not like ''%A%''
union all
select ''5_nomAct0110'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 1 and motivo = 10
union all
select ''6_nomAct0195'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 1 and motivo = 95
union all
select ''7_nomAct0624'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 6 and motivo = 24
union all
select ''8_nomAct0625'' tipo, count(*) cantidad from nom1309_0105 where tippag = 1 and stapla = 6 and motivo = 25
union all
select ''1_sia1444_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 14 and CveMotivo = 44 and id_emp > 0 and id_plaza > 0
union all
select ''2_sia1548_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 15 and CveMotivo = 48 and id_emp > 0  and id_plaza > 0
union all
select ''3_Hsia0620_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 20 and plazaieepo like ''%A%'' and id_emp > 0  and id_plaza > 0
union all
select ''4_sia0620_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 20 and plazaieepo not like ''%A%'' and id_emp > 0  and id_plaza > 0
union all
select ''5_sia0110_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 01 and CveMotivo = 10 and id_emp > 0  and id_plaza > 0
union all
select ''6_sia0195_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 01 and CveMotivo = 95 and id_emp > 0  and id_plaza > 0
union all
select ''7_sia0624_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 24 and id_emp > 0  and id_plaza > 0
union all
select ''8_sia0625_0305'' tipo, count(*) cantidad from RepDatosImportacion_0305$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 25 and id_emp > 0  and id_plaza > 0
union all
select ''1_sia1444'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 14 and CveMotivo = 44 and id_emp > 0 and id_plaza > 0
union all
select ''2_sia1548'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 15 and CveMotivo = 48 and id_emp > 0  and id_plaza > 0
union all
select ''3_Hsia0620'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 20 and plazaieepo like ''%A%'' and id_emp > 0  and id_plaza > 0
union all
select ''4_sia0620'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 20 and plazaieepo not like ''%A%'' and id_emp > 0  and id_plaza > 0
union all
select ''5_sia0110'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 01 and CveMotivo = 10 and id_emp > 0  and id_plaza > 0
union all
select ''6_sia0195'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 01 and CveMotivo = 95 and id_emp > 0  and id_plaza > 0
union all
select ''7_sia0624'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 24 and id_emp > 0  and id_plaza > 0
union all
select ''8_sia0625'' tipo, count(*) cantidad from RepDatosImportacion$ where TModelo_SE_id_Modelo_SE in(1,2,3,4,5,6,8,9) and StatusPlaza = 06 and CveMotivo = 25 and id_emp > 0  and id_plaza > 0'
GO
PRINT N'Creating extended properties'
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EMPLEADOS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "histpagos"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 121
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlazaEmpleados"
            Begin Extent = 
               Top = 6
               Left = 533
               Bottom = 121
               Right = 723
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCentros_de_Trabajo"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HPlazas"
            Begin Extent = 
               Top = 126
               Left = 270
               Bottom = 241
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         ', 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'Ctas_Canceladas', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'DiferenciasCuadreBaseNOMPRO', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[12] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 110
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 233
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'DiferenciasCuadreBaseNOMPRO', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'DiferenciasCuadreBaseNOMPRO', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'DiferenciasCuadreBaseNOMPRO', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[20] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TVista_Honorarios_Valores"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plazas"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 121
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 6
               Left = 497
               Bottom = 121
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 333
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or ', 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'= 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'HVista_Honorarios_Valores', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HFecha_Alta_SEP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plazas"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 121
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CalenNomina"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlazaEmpleados"
            Begin Extent = 
               Top = 126
               Left = 290
               Bottom = 241
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TVCD_Plazas"
            Begin Extent = 
               Top = 126
               Left = 486
               Bottom = 241
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaConfigOrgan"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TNivel3IEA"
            Begin Extent = 
               Top = 246
               Left = 242
               Bottom = 346
               Right = 394
            En', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "htabuladorr"
            Begin Extent = 
               Top = 246
               Left = 432
               Bottom = 346
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_CM"
            Begin Extent = 
               Top = 348
               Left = 242
               Bottom = 448
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tipoplaza"
            Begin Extent = 
               Top = 348
               Left = 467
               Bottom = 448
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "statusplaza"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 466
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TGrado_Academico"
            Begin Extent = 
               Top = 450
               Left = 228
               Bottom = 550
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RGrado_Academico"
            Begin Extent = 
               Top = 450
               Left = 447
               Bottom = 550
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HTipo_Seg_Social"
            Begin Extent = 
               Top = 468
               Left = 38
               Bottom = 583
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 552
               Left = 228
               Bottom = 667
               Right = 523
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TSubsubsistema_IEA"
            Begin Extent = 
               Top = 672
               Left = 38
               Bottom = 787
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 552
               Left = 561
               Bottom = 667
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLEADOS"
            Begin Extent = 
               Top = 672
               Left = 337
               Bottom = 787
               Right = 566
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sueldo"
            Begin Extent = 
               Top = 6
               Left = 459
               Bottom = 121
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
        ', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane3', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane3', N' Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'Pago', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "htabuladorr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 106
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_CM"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 106
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaConfigOrgan"
            Begin Extent = 
               Top = 6
               Left = 453
               Bottom = 121
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TNivel3IEA"
            Begin Extent = 
               Top = 108
               Left = 38
               Bottom = 208
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CalenNomina"
            Begin Extent = 
               Top = 108
               Left = 228
               Bottom = 223
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Conceptos"
            Begin Extent = 
               Top = 126
               Left = 480
               Bottom = 241
               Right = 668
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Nom_histpagos"
            Begin Extent = 
               Top = 210
               Left = 38
               Bottom = 325
               Right = 193
            ', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlazaEmpleados"
            Begin Extent = 
               Top = 228
               Left = 231
               Bottom = 343
               Right = 389
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TVCD_Plazas"
            Begin Extent = 
               Top = 246
               Left = 427
               Bottom = 361
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tipoplaza"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 430
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "statusplaza"
            Begin Extent = 
               Top = 348
               Left = 228
               Bottom = 448
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TGrado_Academico"
            Begin Extent = 
               Top = 366
               Left = 418
               Bottom = 466
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RGrado_Academico"
            Begin Extent = 
               Top = 432
               Left = 38
               Bottom = 532
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HTipo_Seg_Social"
            Begin Extent = 
               Top = 450
               Left = 257
               Bottom = 565
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HFecha_Alta_SEP"
            Begin Extent = 
               Top = 468
               Left = 447
               Bottom = 583
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 570
               Left = 38
               Bottom = 685
               Right = 333
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TSubsubsistema_IEA"
            Begin Extent = 
               Top = 588
               Left = 371
               Bottom = 703
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 690
               Left = 38
               Bottom = 805
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EMPLEADOS"
            Begin Extent = 
               Top = 708
               Left = 228
               Bottom = 823
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
  ', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane3', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane3', N'       Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'PlaneacionConceptos', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'RHonorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "categoria"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 91
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "THonorarios_Valores"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'RHonorarios_Valores', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'RHonorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'RHonorarios_Valores', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[33] 2[43] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[26] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[39] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TCT_Status"
            Begin Extent = 
               Top = 345
               Left = 993
               Bottom = 457
               Right = 1144
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Status"
            Begin Extent = 
               Top = 390
               Left = 612
               Bottom = 494
               Right = 763
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Czeb"
            Begin Extent = 
               Top = 334
               Left = 361
               Bottom = 412
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_Czeb"
            Begin Extent = 
               Top = 511
               Left = 602
               Bottom = 604
               Right = 753
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TCT_Mun_Loc"
            Begin Extent = 
               Top = 902
               Left = 410
               Bottom = 1010
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Mun_Loc"
            Begin Extent = 
               Top = 386
               Left = 18
               Bottom = 464
               Right = 169
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TCT_ZEsc"
            Begin Extent = 
               Top = 618
               Left = 616
               Bottom = 711
               Right = 767
            End
     ', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'       DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RCT_ZEsc"
            Begin Extent = 
               Top = 548
               Left = 416
               Bottom = 626
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaConfigOrgan"
            Begin Extent = 
               Top = 27
               Left = 339
               Bottom = 179
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TCT_UResp"
            Begin Extent = 
               Top = 724
               Left = 622
               Bottom = 817
               Right = 773
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_UResp"
            Begin Extent = 
               Top = 670
               Left = 404
               Bottom = 775
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_dep_norm"
            Begin Extent = 
               Top = 3
               Left = 738
               Bottom = 103
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rct_dep_norm"
            Begin Extent = 
               Top = 20
               Left = 509
               Bottom = 105
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_SupervisorZE"
            Begin Extent = 
               Top = 513
               Left = 40
               Bottom = 591
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_SupervisorZE"
            Begin Extent = 
               Top = 1016
               Left = 389
               Bottom = 1109
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_Turno"
            Begin Extent = 
               Top = 1114
               Left = 389
               Bottom = 1207
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Turno"
            Begin Extent = 
               Top = 508
               Left = 235
               Bottom = 586
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_BajoDes"
            Begin Extent = 
               Top = 801
               Left = 413
               Bottom = 894
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_BajoDes"
            Begin Extent = 
               Top = 409
               Left = 224
               Bottom = 487
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Tipo"
            Begin Extent = 
               Top = 430
               Left = 813
               Bottom = 567
               Right = 964
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_Tipo"
            Begin Extent = 
               Top = 482
               Left = 997
               Bottom = 575
               Right = 1148
            End
            Disp', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane3', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane3', N'layFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Coordinaciones"
            Begin Extent = 
               Top = 288
               Left = 597
               Bottom = 384
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TCT_Coordinaciones"
            Begin Extent = 
               Top = 249
               Left = 993
               Bottom = 364
               Right = 1179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_Organizacion"
            Begin Extent = 
               Top = 148
               Left = 1017
               Bottom = 261
               Right = 1192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_Organizacion"
            Begin Extent = 
               Top = 193
               Left = 598
               Bottom = 286
               Right = 819
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TCT_UDCH"
            Begin Extent = 
               Top = 35
               Left = 1050
               Bottom = 128
               Right = 1201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RCT_UDCH"
            Begin Extent = 
               Top = 87
               Left = 733
               Bottom = 192
               Right = 884
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaLongitudProp_24"
            Begin Extent = 
               Top = 145
               Left = 23
               Bottom = 253
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaLongitud"
            Begin Extent = 
               Top = 27
               Left = 34
               Bottom = 135
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TNivel3SE"
            Begin Extent = 
               Top = 180
               Left = 234
               Bottom = 273
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 29
         Width = 284
         Width = 2085
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 5700
         Width = 4770
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 2040
         Width = 1440
         Width = 2760
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 1935
         Width = 1440
         Width = 1440
         Width = 1440
         Width = 2850
         Width = 4680
         Width = 1440
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'TCentros_de_Trabajo', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'THonorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[22] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nivel3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nivel1"
            Begin Extent = 
               Top = 5
               Left = 233
               Bottom = 120
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_Plaza_2"
            Begin Extent = 
               Top = 0
               Left = 456
               Bottom = 115
               Right = 767
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2640
         Width = 3420
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'THonorarios_Valores', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'THonorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'THonorarios_Valores', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Plazas"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 6
               Left = 510
               Bottom = 123
               Right = 813
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Conceptos"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 243
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TTabulador_IEA_CM"
            Begin Extent = 
               Top = 126
               Left = 753
               Bottom = 228
               Right = 951
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HT_Plaza"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 108
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VM4"
            Begin Extent = 
               Top = 108
               Left = 274
               Bottom = 225
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HT_CM"
            Begin Extent = 
               Top = 126
               Left = 517
               Bottom = 228
               Right = 715
            End
            D', 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'isplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'TPrevio_CostoPlaza', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'TVista_Honorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[19] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TTabulador_IEA_Plaza"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ValoresMatriz4"
            Begin Extent = 
               Top = 6
               Left = 387
               Bottom = 121
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2085
         Width = 1500
         Width = 1500
         Width = 2010
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'TVista_Honorarios_Valores', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'TVista_Honorarios_Valores', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'TVista_Honorarios_Valores', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'diferenciascuadrebaseHistpagos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 233
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 110
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'diferenciascuadrebaseHistpagos', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'diferenciascuadrebaseHistpagos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'diferenciascuadrebaseHistpagos', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos1328', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 125
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos1328', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos1328', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos1328', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos62', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 125
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos62', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos62', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos62', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllosAgrupados', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 125
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllosAgrupados', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllosAgrupados', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaEllosAgrupados', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[30] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 125
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaEllos', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros1328', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Conceptos"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "histpagos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros1328', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros1328', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros1328', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros62', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "histpagos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Conceptos"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros62', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros62', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros62', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane1', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[12] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Conceptos"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plazas_CT_NOS"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plazas_Tipo_Nos"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 434
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Plazas_Status_Nos"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 542
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "histpagos"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 125
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         ', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL
GO
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPane2', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty(N'MS_DiagramPaneCount', 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL))
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vistaNosotros', NULL, NULL
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
