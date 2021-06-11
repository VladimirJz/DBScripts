-- Cargar Objetos Usados por el Script-
print 'Preparando Objetos usados por el script..'
print 'Cargando Catalogo de Tablas SIA..'
USE IEEPOSYNC
exec [dbo].[MIGCARGATABLASSIA]
print '.. terminado'
print 'Cargando Catalogo de Tablas otros esquemas..'
exec [dbo].[MIGCARGATABLASOTRAS]
print '.. terminado'
print 'Obteniendo información del destino..'
exec [dbo].[MIGRELACIONOBJETOS]
print '..terminado'
print 'Deshabilitando restricciones por FK'

-- Eliminar Indices para la carga de archivos 
exec [dbo].[MIGDROPKEYS]
print '..terminado'


print 'Cargando el resto de Tablas'
exec dbo.[MIGCARGAAUTO] 10000,'M','S'
print '..terminado'



-- Reconstruir Llaves Indices
-- Reconstruir Llaves Foraneas


select * from CATTABLASMIG

select * from RELACIONOBJETOSMIG order by NumFilasOrigen desc

select top 200 * from HPlazas
select top 200 * from FUP_DetalleCampos
selec

select top 10 * from IEEPO.dbo.Nom_pagos_hist --  (p

Nom_pagos_hist -- Periodo
nom_histpagos -- Periodo
histpagosdetalle -- Periodo  -- (Ok)
Recalculo_histpagos -- Periodo (Ok)
Hvectores -- Periodo  
Folio_Recibos -- Periodo
RastreoImpuesto -- Periodo
HistPagos -- Periodo --  (OK)
Hplazas -- Movimiento OK?
FUP_DetalleCampos -- ?? 
Hcontinuidad -- añoqna


-- cargamos primero las tabla que contienen Fechas como referecia 

-- HPlazas



select top 200 * from IEEPO.dbo.Hplazas where Movimiento >='2020-01-01'