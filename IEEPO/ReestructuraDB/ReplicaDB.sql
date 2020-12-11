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

-- 1 ) ObjetosDB/CATTABLES.sql Catalogo de Objetos definidos por sistemas.

-- Borramos las tablas usadas por el script de procesos anteriores.

-- Cargamos los Catalogos de Tablas

exec dbo.[MIGCARGAAUTO] 10000,'S','S'

select * from CATTABLASMIG

select * from RELACIONOBJETOSMIG

