/*
Run this script on:

        10.186.11.19.PRUEBAXSCR    -  This database will be modified

to synchronize it with:

        10.186.11.11\MSSQLServer2.IEEPO

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.4.4.16824 from Red Gate Software Ltd at 26/11/2020 15:03:15

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

GO
PRINT N'Creating [dbo].[obtieneCTPlazaQna]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[obtieneCTPlazaQna]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE FUNCTION [dbo].[obtieneCTPlazaQna]
(@dato varchar(50), @qna varchar(50), @idPlaza int)
RETURNS varchar(50)
WITH EXEC AS CALLER
AS
BEGIN
return (
select case when @dato = ''ct'' then cast(v.Clave as varchar) when @dato = ''nodo'' then cast(v.Id_Nodo as varchar) else '''' end dato from plazaempleados a inner join (
select id_plaza, max(fecha) fecha from plazaempleados where fecha <= (select dbo.anioquincenatofecha(@qna,0)) and Id_plaza = @idPlaza 
group by id_plaza
) b on a.Id_plaza = b.Id_plaza and a.Fecha = b.Fecha
inner join VistaTablaLongitud v on v.Id_Nodo = a.id_nodo
)
END'
GO

GO
PRINT N'Creating [dbo].[obtieneEstatusQnaHplazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[obtieneEstatusQnaHplazas]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE FUNCTION [dbo].[obtieneEstatusQnaHplazas]
(@dato varchar(50), @fecha datetime, @idPlaza int)
RETURNS varchar(200)
WITH EXEC AS CALLER
AS
BEGIN
return (
select case when @dato = ''estatus'' then rtrim(s.Descri)+'' - ''+ltrim(t.destipoplaza) when @dato = ''qna'' then dbo.fechaToAnioQuincena(a.fecha) when @dato = ''codigo'' then s.StatusPlaza+''-''+t.CveTipoPlaza else '''' end dato
from hplazas a inner join (
select id_plaza, max(fecha) fecha from hplazas where fecha <= @fecha group by Id_plaza
) b on a.Id_plaza = b.Id_plaza and a.Fecha = b.Fecha and a.Id_TipoMovPlazas = 2
inner join hplazas c on c.id_plaza = a.id_plaza and c.fecha = a.fecha and c.Id_TipoMovPlazas = 1
inner join TStatusPlaza s on s.Id_StatusPlaza = a.valor_idcampo
inner join TTipoPlaza t on t.Id_TipoPlaza = c.Valor_IdCampo
where a.id_plaza = @idPlaza
)
END'
GO

GO
PRINT N'Creating [dbo].[fn_split]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_split]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE  function [dbo].[fn_split](@text varchar(max), @delimiter varchar(20) = '','')
returns @strings table
(    
  position int identity primary key,
  value varchar(max)
)
with encryption
as
begin
set @text = REPLACE(@text,char(13),'''')
set @text = REPLACE(@text,char(10),'''')
declare @index int 
set @index = -1 

while (len(@text) > 0) 
  begin  
    set @index = charindex(@delimiter , @text)  
    if (@index = 0) and (len(@text) > 0)  
      begin   
        insert into @strings values (ltrim(rtrim((@text))))
          break  
      end  

    if (@index > 1)  
      begin   
        insert into @strings values (ltrim(rtrim((left(@text, @index - 1)))))
        set @text = right(@text, (len(@text) - @index))  
      end  
    else 
      set @text = right(@text, (len(@text) - @index)) 
    end
  return

end'
GO

GO
PRINT N'Creating [dbo].[FC_CD_Nodos_varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_CD_Nodos_varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_CD_Nodos_varchar](@id_plaza as int,@fecha as datetime,@Corte as datetime,@nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''FF'' Then FF When ''LA'' Then LA Else FF End) FROM CD_Nodos where id_nodo in (select id_nodo from plazaempleados where id_plaza=@id_plaza and fecha=(select max(fecha) from plazaempleados Where id_plaza=@id_plaza and fecha<=@fecha and movimiento <= @Corte)))end'
GO

GO
PRINT N'Creating [dbo].[VW_Puestos_Direcciones_Paso]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VW_Puestos_Direcciones_Paso]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------CREA VISTA VW_Puestos_Direcciones--------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------

Create  FUNCTION [dbo].[VW_Puestos_Direcciones_Paso]()

RETURNS @test TABLE
(
id_nodo int,
Clave varchar(50),
Descripcion varchar(500),
Clave_presupuestal varchar(200),
Entidad varchar(50),
id_estructura int
)

AS
begin

	insert into @test (id_nodo ,Clave,Descripcion,Entidad,id_estructura  )
	select vistatablalongitud.id_nodo ,Clave,Descripcion,Entidad,id_estructura  from vistatablalongitud inner join (Select id_nodo,id_estructura from tablaconfigorgan inner join tablalongitud on tablaconfigorgan.id_tablalongitud = tablalongitud.id_tablalongitud ) b on b.id_nodo = vistatablalongitud.id_nodo 


	return
end


'
GO

GO
PRINT N'Creating [dbo].[fn_getMotMov]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getMotMov]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE function [dbo].[fn_getMotMov]()
returns @MotMovs table (
	idMotMov int, 
	descr varchar(max), 
	cpe bit
)
with encryption
as
begin
	/*
	declare @id_periodo int = (
		select top 1 id_periodo 
		from FUP_Informacion_Documentos 
		order by Id_Documento desc
	)
	*/

	declare @id_periodo as table (id_periodo int)
	insert into @id_periodo select id_periodo from CalenNomina where leyenda3 = 1

	insert into @MotMovs(idMotMov, descr, cpe)
	select
		a.Id_MotivoMovimiento idMotMov, 
		b.Clave + '''' + a.Clave + '': '' + a.Descripcion descr,
		iif(a.Descripcion like ''ALTA %'', 1,0) cpe
	from 
		FUP_MotivoMovimiento a join FUP_TipoMovimiento  b
		on a.Id_TipoMovimiento = b.Id_TipoMovimiento
	where 
		ReCalculo = 1 and a.Id_MotivoMovimiento in 
		(
			select distinct x.Id_MotivoMovimiento
			from FUP_Informacion_Documentos y join FUP_Documento_Detalle x
			on x.Id_Documento = y.Id_Documento
			--where y.Id_Periodo = @id_periodo
			where y.Id_Periodo in (select Id_Periodo from @id_periodo)
		)
	order by a.clave, b.Clave
	return
end

'
GO

GO
PRINT N'Creating [dbo].[FC_HCompatibilidadDeHoras_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_HCompatibilidadDeHoras_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_HCompatibilidadDeHoras_Int](@id_plaza as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns int as begin return (Select Max( Case @nomcampo When ''id_rel'' Then id_rel When ''id_user'' Then id_user When ''id_plaza'' Then id_plaza When ''id_status'' Then id_status When ''motivo'' Then motivo When ''id_tabulador_iea_plaza'' Then id_tabulador_iea_plaza When ''Hrs_Compatibilidad'' Then Hrs_Compatibilidad Else id_rel End) FROM HCompatibilidadDeHoras  where id_plaza=@id_plaza and fecha=(select max(fecha) from HCompatibilidadDeHoras Where id_plaza=@id_plaza and fecha<=@fecha and movimiento <= @Corte)) end'
GO

GO
PRINT N'Creating [dbo].[vw_EmpCvePresupuestal]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vw_EmpCvePresupuestal]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'Create  FUNCTION [dbo].[vw_EmpCvePresupuestal]()

RETURNS @test TABLE
(
no_empleado varchar(10),
Nombre_Empleado varchar(200),
id_Dependencia varchar(10),
Clave_presupuestal varchar(200),
Acro_dependencia varchar(100)
)

AS
begin

declare @test2 TABLE
(
id_nodo varchar(10),
Clave varchar(20),
Descripcion varchar(500),
Entidad varchar(10)
)

 declare @fecha datetime
 SELECT @fecha = getdate_data FROM OPENROWSET(''SQLOLEDB'', ''Server=.;Trusted_Connection=yes;'',''SELECT getdate() AS getdate_data'')
	
	insert into @test2 (id_nodo ,Clave,Descripcion,Entidad )
	select id_nodo ,Clave,Descripcion,Entidad  from vistatablalongitud

--	select id_nodo ,Clave,Descripcion,Entidad into ttttte from vistatablalongitud

	insert into @test (no_empleado,Nombre_Empleado,id_Dependencia,Clave_presupuestal,Acro_dependencia)
	Select z.no_empleado,z.Nombre_Empleado,z.id_Dependencia,z.Clave_presupuestal,z.Acro_dependencia from (
	Select h.* , i.descripcion as Clave_presupuestal, n.nomcorto as Acro_dependencia, i.entidad + ''00000000'' as id_Dependencia from 
		( @test2 i 
		inner join 
		(select c.id_emp,c.no_empleado, c.Nombre_empleado, d.id_plaza, d.id_nodo from 
 			((Select id_emp, Noempx as No_empleado , Nombre + '' '' + ApMaterno + '' '' + apPaterno as Nombre_Empleado from empleados ) c 
			inner join
			(Select a.id_plaza,a.id_emp,a.id_nodo from plazaempleados a inner join (Select id_plaza,max(fecha) as maxfecha from plazaempleados where fecha <= @fecha and movimiento <= @fecha group by id_plaza ) b on a.id_plaza = b.id_plaza and a.fecha = b.maxfecha )  d on c.id_emp = d.id_emp ) 
        		inner join 
		        (Select e.id_plaza,e.id_rel from hstatusplaza e inner join (Select id_plaza,max(fecha) as maxfecha from hstatusplaza where fecha <= @fecha and movimiento <= @fecha group by id_plaza ) f on f.id_plaza = e.id_plaza and e.fecha = f.maxfecha where id_rel in (Select id_statusplaza from tstatusplaza where procesa = 1 )  ) g  on g.id_plaza = d.id_plaza
        	where c.id_emp <> 0 ) h	on h.id_nodo = i.id_nodo )
		inner join 
			(Select k.nomcorto, m.id_nodo from ((testructura j inner join configrs k on j.id_razonsocial = k.id_razonsocial ) inner join tablalongitud l on l.id_estructura = j.id_estructura) inner join tablaconfigorgan m on m.id_tablalongitud = l.id_tablalongitud) n on n.id_nodo = h.id_nodo
	) Z		



	return
end


--select * from vw_EmpCvePresupuestal()
--drop function vw_EmpCvePresupuestal









'
GO

GO
PRINT N'Creating [dbo].[FC_TAreas_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TAreas_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TAreas_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Area'' Then Id_Area When ''STATUSB'' Then STATUSB Else Id_Area End) FROM TAreas  where id_Area in (Select id_rel from HAreas Where id_emp=@id_emp and fecha=(select max(fecha) from HAreas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TAreas_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TAreas_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TAreas_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''CVEAREA'' Then CVEAREA When ''DESAREA'' Then DESAREA Else CVEAREA End) FROM TAreas  where id_Area in (Select id_rel from HAreas Where id_emp=@id_emp and fecha=(select max(fecha) from HAreas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TCategorias_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TCategorias_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TCategorias_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Categ'' Then Id_Categ When ''Id_cia'' Then Id_cia Else Id_Categ End) FROM TCategorias  where Id_Categ in (Select id_rel from HCategorias Where id_emp=@id_emp and fecha=(select max(fecha) from HCategorias Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TCategorias_Float]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TCategorias_Float]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TCategorias_Float](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Float as begin return (Select Max( Case @nomcampo When ''SALANT'' Then SALANT When ''SALCAT'' Then SALCAT Else SALANT End) FROM TCategorias  where Id_Categ in (Select id_rel from HCategorias Where id_emp=@id_emp and fecha=(select max(fecha) from HCategorias Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TCategorias_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TCategorias_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TCategorias_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''CATEG'' Then CATEG When ''DESCAT'' Then DESCAT When ''StatusB'' Then StatusB Else CATEG End) FROM TCategorias  where Id_Categ in (Select id_rel from HCategorias Where id_emp=@id_emp and fecha=(select max(fecha) from HCategorias Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[fn_getPCompletosV2]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getPCompletosV2]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE function [dbo].[fn_getPCompletosV2](@id_mot int)
returns int
with encryption
as
begin
/*
	declare @id_periodo int = (
		select top 1 id_periodo 
		from FUP_Informacion_Documentos 
		order by Id_Documento desc
	)
*/

	declare @id_periodo as table (id_periodo int)
	insert into @id_periodo select id_periodo from CalenNomina where leyenda3 = 1

	return
	(			
		select count(distinct a.Id_Detalle)
		from 
			FUP_Documento_Detalle a join FUP_Documentos b
			on a.Id_Documento = b.Id_Documento
			join (
				select Id_Documento
				from FUP_Informacion_Documentos
				--where Id_Periodo = @id_periodo
				where Id_Periodo in (select id_periodo from @id_periodo)
			) c
			on a.Id_Documento = c.Id_Documento
			left join Recalculo_Calculo d
			on a.Id_Detalle = d.Id_Detalle
		where
			Id_MotivoMovimiento = @id_mot
			and a.Id_Estatus = 2
	)	
 end '
GO

GO
PRINT N'Creating [dbo].[FC_TDepartamentos_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TDepartamentos_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TDepartamentos_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Depto'' Then Id_Depto When ''Id_Division'' Then Id_Division When ''StatusB'' Then StatusB Else Id_Depto End) FROM TDepartamentos  where Id_Depto in (Select id_rel from HDepartamentos Where id_emp=@id_emp and fecha=(select max(fecha) from HDepartamentos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[fn_getPFaltantesV2]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getPFaltantesV2]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE function [dbo].[fn_getPFaltantesV2](@id_mot int, @tipo int, @flg_IncTipo3 bit)
returns @faltantes table (
	id_plaza int, id_emp int, id_doc int, rfc varchar(13), plaza varchar(21), folio varchar(30),
	desde int, hasta int, idCalculo int, vigencia char(1)

)
with encryption
as
begin
/*
	declare @id_periodo int = (
		select top 1 id_periodo 
		from FUP_Informacion_Documentos 
		order by Id_Documento desc
	)
*/
	declare @id_periodo as table (id_periodo int)
	insert into @id_periodo select id_periodo from CalenNomina where leyenda3 = 1

	declare @tipos as table(tipo int)
	insert into @tipos values (1),(2),(3)
	
	declare @omitir as table(tipo int)

	if @flg_IncTipo3 = 1
		delete from @tipos where tipo = 3

	if @tipo = 1
	begin
		insert into @faltantes(id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo, vigencia)
		select a.id_plaza, a.id_emp, a.id_documento, d.PlazaIEEPO Plaza, c.RFC, a.folio, a.desde, a.hasta, a.Id_Calculo idCalculo, c.Vigencia
		from
			(
				select distinct Id_Emp, Id_Plaza, a.Id_Documento, b.Folio, a.Id_Detalle, dbo.DateToQna(fechaini) desde, dbo.DateToQna(fechafin) hasta, d.Id_Calculo
				from 
					FUP_Documento_Detalle a join FUP_Documentos b
					on a.Id_Documento = b.Id_Documento
					join (
						select Id_Documento
						from FUP_Informacion_Documentos
						--where Id_Periodo = @id_periodo
						where Id_Periodo in (select Id_Periodo from @id_periodo)
					) c
					on a.Id_Documento = c.Id_Documento
					left join Recalculo_Calculo d
					on a.Id_Detalle = d.Id_Detalle
				where
					Id_MotivoMovimiento = @id_mot
					and a.Id_Estatus = 2
			) a 
			join PlazaIEEPO d
			on a.Id_plaza = d.Id_plaza
			join Empleados c
			on a.Id_Emp = c.Id_Emp
			left join (
				select distinct id_referencia
				from
					histpagosdetalle a join (select id_concepto from Conceptos where Tipo in (select tipo from @tipos)) b
					on a.id_concepto = b.id_concepto
				where
					id_referencia != 0
			) b
			on a.Id_Calculo = b.id_referencia
		where b.id_referencia is null
		order by Id_Calculo

		if @flg_IncTipo3 = 1
		begin
			;with del (id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo)
			as
			(
				select id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo
				from @faltantes a 
				where not exists (
					select * 
					from histpagosdetalle 
					where
						id_plaza = a.id_plaza
						and id_emp = a.id_emp
						and id_referencia = a.idCalculo
				)
			)
			delete from del
		end
	end
	else
	begin
		insert into @faltantes(id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo, vigencia)
		select a.id_plaza, a.id_emp, a.id_documento, d.PlazaIEEPO Plaza, c.RFC, a.folio, a.desde, a.hasta, a.Id_Calculo idCalculo, c.Vigencia
		from
			(
				select distinct Id_Emp, Id_Plaza, a.Id_Documento, b.Folio, a.Id_Detalle, dbo.DateToQna(fechaini) desde, dbo.DateToQna(fechafin) hasta, d.Id_Calculo
				from 
					FUP_Documento_Detalle a join FUP_Documentos b
					on a.Id_Documento = b.Id_Documento
					join (
						select Id_Documento
						from FUP_Informacion_Documentos
						--where Id_Periodo = @id_periodo
						where Id_Periodo in (select Id_Periodo from @id_periodo)
					) c
					on a.Id_Documento = c.Id_Documento
					left join Recalculo_Calculo d
					on a.Id_Detalle = d.Id_Detalle
				where
					Id_MotivoMovimiento = @id_mot
					and a.Id_Estatus = 2
			) a 
			join PlazaIEEPO d
			on a.Id_plaza = d.Id_plaza
			join Empleados c
			on a.Id_Emp = c.Id_Emp
			left join (
				select distinct id_referencia
				from
					Recalculo_HistPagos a join (select id_concepto from Conceptos where Tipo in (select tipo from @tipos)) b
					on a.id_concepto = b.id_concepto
				where
					id_referencia != 0
			) b
			on a.Id_Calculo = b.id_referencia
		where b.id_referencia is null
		order by Id_Calculo

		if @flg_IncTipo3 = 1
		begin
			;with del (id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo)
			as
			(
				select id_plaza, id_emp, id_doc, plaza, rfc, folio, desde, hasta, idCalculo
				from @faltantes a 
				where not exists (
					select * 
					from Recalculo_HistPagos 
					where
						id_plaza = a.id_plaza
						and id_emp = a.id_emp
						and id_referencia = a.idCalculo
				)
			)
			delete from del
		end
	end
	return
 end '
GO

GO
PRINT N'Creating [dbo].[FC_TDepartamentos_Float]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TDepartamentos_Float]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TDepartamentos_Float](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Float as begin return (Select Max( Case @nomcampo When ''COLOR'' Then COLOR Else COLOR End) FROM TDepartamentos  where Id_Depto in (Select id_rel from HDepartamentos Where id_emp=@id_emp and fecha=(select max(fecha) from HDepartamentos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TDepartamentos_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TDepartamentos_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TDepartamentos_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''CNTA1'' Then CNTA1 When ''CNTA2'' Then CNTA2 When ''CRESP'' Then CRESP When ''Depto'' Then Depto When ''DESCR'' Then DESCR When ''PRODU'' Then PRODU Else CNTA1 End) FROM TDepartamentos  where Id_Depto in (Select id_rel from HDepartamentos Where id_emp=@id_emp and fecha=(select max(fecha) from HDepartamentos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TLineas_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TLineas_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TLineas_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Linea'' Then Id_Linea Else Id_Linea End) FROM TLineas  where id_Linea in (Select id_rel from HLineas Where id_emp=@id_emp and fecha=(select max(fecha) from HLineas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TLineas_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TLineas_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TLineas_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''DESCR'' Then DESCR When ''Linea'' Then Linea When ''StatusB'' Then StatusB Else DESCR End) FROM TLineas  where id_Linea in (Select id_rel from HLineas Where id_emp=@id_emp and fecha=(select max(fecha) from HLineas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TPlantas_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TPlantas_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TPlantas_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Planta'' Then Id_Planta Else Id_Planta End) FROM TPlantas  where id_Planta in (Select id_rel from HPlantas Where id_emp=@id_emp and fecha=(select max(fecha) from HPlantas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TPlantas_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TPlantas_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TPlantas_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''CVEPLANTA'' Then CVEPLANTA When ''DESPLANTA'' Then DESPLANTA When ''STATUSB'' Then STATUSB Else CVEPLANTA End) FROM TPlantas  where id_Planta in (Select id_rel from HPlantas Where id_emp=@id_emp and fecha=(select max(fecha) from HPlantas Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[fn_getHist]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_getHist]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[fn_getHist](@id_plaza int)
returns @result table(
	id_emp int, id_plaza int, id_nodo int, sts int, mot int, desde datetime, hasta datetime,
	ct varchar(10), rfc varchar(13), plaza varchar(21)
)
with encryption
as
begin
	--declare @id_plaza int = 45454
	--declare @result table(id_emp int, id_plaza int, id_nodo int, sts int, mot int, desde datetime, hasta datetime)
	;with pemp_01
	as (
		select Row_number() over (order by fecha) r, * 
		from plazaempleados
		where 
			id_plaza = @id_plaza and 
			year(fecha) != 9999
	),
	pemp_02 
	as (
		select 
			a.id_emp, a.id_plaza, a.id_nodo, a.Fecha dpemp, 
			case when b.fecha is not null
				then
					case when DATEPART(HOUR,b.Fecha) != 0
						then b.Fecha
						else dateadd(minute, -1, b.fecha)
					end
				else
					''9999-12-21T23:59:00''
			end hpemp
		from pemp_01 a left join pemp_01 b
		on a.r + 1 = b.r
	),
	pemp_02b
	as(
		select
			id_emp, id_plaza, id_nodo, 
			case when day(dpemp) in (1,16)
				then dpemp
				else DATEADD(minute,1,dpemp)
			end dpemp, 
			hpemp
		from pemp_02
	),
	pemp_03
	as (
		select * 
		from pemp_02b
		where abs(datediff(day, dpemp, hpemp)) > 0
	),
	hp_01
	as (
		select * 
		from hplazas
		where 
			id_plaza = @id_plaza and 
			Id_TipoMovPlazas in (1,2)
	),
	hp_02
	as (
		select 
			ROW_NUMBER() over (order by a.fecha) r, 
			a.Id_plaza, a.Valor_IdCampo sts, b.Valor_IdCampo mot, a.fecha
		from hp_01 a left join hp_01 b
		on a.Fecha = b.Fecha and b.Id_TipoMovPlazas = 1
		where 
			a.Id_TipoMovPlazas = 2
	),
	hp_03
	as (
		select 
			a.Id_plaza, a.sts, b.mot, a.Fecha dhp,
			case when b.Fecha is not null
				then 
					case when datepart(HOUR, b.Fecha) != 0
						then b.fecha
						else dateadd(MINUTE, -1, b.Fecha)
					end
				else
					''9999-12-31T23:59:00''
				end hhp
		from hp_02 a left join hp_02 b
		on a.r + 1 = b.r
	),
	hp_04
	as (
		select * 
		from hp_03 
		where  abs(datediff(day, dhp, hhp)) > 1 or sts = 3
	),
	histplaza_01 
	as (
		select 
			a.id_emp, a.id_plaza, a.id_nodo, sts, mot,
			case when dpemp > dhp 
				then dpemp 
				else dhp
			end desde,
			case when hpemp < hhp
				then hpemp
				else hhp
			end hasta
		from pemp_03 a full outer join hp_04 b
		on 
			b.dhp between a.dpemp and a.hpemp or
			a.dpemp between b.dhp and b.hhp
	)
	insert into @result
	select 
		a.id_emp, a.id_plaza, a.id_nodo, sts, mot,
		case when day(desde) not in (1,16)
			then DATEADD(MINUTE, 1, desde)
			else desde
		end desde,
		hasta, b.clave ct, c.rfc, d.plazaieepo plaza
	from 
		histplaza_01 a join vistatablalongitud b
		on a.id_nodo = b.id_nodo
		join plazaieepo d
		on a.id_plaza = d.id_plaza
		left join empleados c
		on a.id_emp = c.id_emp

	delete 
	from @result
	where desde > hasta and (sts != 3 or mot not between 30 and 39)

	;with res_01
	as (
		select ROW_NUMBER() over (order by desde, hasta) r, *
		from @result
	),
	res_02 
	as (
		select a.r, a.sts, a.mot, b.sts sts_ant, b.mot mot_ant
		from res_01 a left join res_01 b
		on a.r = b.r + 1
	)
	update res_02 set mot = mot_ant where mot is null
--	select * from @result
	return
end
'
GO

GO
PRINT N'Creating [dbo].[FC_TPuestos_Int]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TPuestos_Int]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TPuestos_Int](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Int as begin return (Select Max( Case @nomcampo When ''Id_Puesto'' Then Id_Puesto Else Id_Puesto End) FROM TPuestos  where id_Puesto in (Select id_rel from HPuestos Where id_emp=@id_emp and fecha=(select max(fecha) from HPuestos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TPuestos_Float]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TPuestos_Float]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TPuestos_Float](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns Float as begin return (Select Max( Case @nomcampo When ''COSTO'' Then COSTO Else COSTO End) FROM TPuestos  where id_Puesto in (Select id_rel from HPuestos Where id_emp=@id_emp and fecha=(select max(fecha) from HPuestos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FC_TPuestos_Varchar]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FC_TPuestos_Varchar]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'create function [dbo].[FC_TPuestos_Varchar](@id_emp as int,@fecha as datetime , @Corte as datetime, @nomcampo as varchar(1000)) returns varchar(7000) as begin return (Select Max( Case @nomcampo When ''DESCI'' Then DESCI When ''DESCR'' Then DESCR When ''GRUPO'' Then GRUPO When ''Puesto'' Then Puesto When ''StatusB'' Then StatusB Else DESCI End) FROM TPuestos  where id_Puesto in (Select id_rel from HPuestos Where id_emp=@id_emp and fecha=(select max(fecha) from HPuestos Where id_emp=@id_emp and fecha<=@fecha and movimiento <= @Corte))) end
'
GO

GO
PRINT N'Creating [dbo].[FT_HistoricoPlazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_HistoricoPlazas]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'
create function [dbo].[FT_HistoricoPlazas]
(@id_emp as int, @fecha as datetime)
returns table as

  return (
SELECT     EMPLEADOS.Id_Emp, EMPLEADOS.NOEMPx AS NumeroEmpleado, PlazaEmpleados_A.Id_plaza, PlazaEmpleados_A.Fecha, Plazas.Num_Plaza, 
                      HCodigoPago.CodigoPago, HUnidad.Unidad, HSubUnidad.SubUnidad, HCat_Puesto.Cat_Puesto, HHoras.Horas, HConsecutivo.Consecutivo, 
                      CASE WHEN dbo.TLicencias_por_plaza.FechaInicio IS NULL THEN dbo.HStatusPlaza.Fecha ELSE dbo.TLicencias_por_plaza.FechaInicio END AS FechaInicio, 
                      CASE WHEN dbo.TLicencias_por_plaza.FechaFin IS NULL THEN 
						CASE WHEN
                          (SELECT     TOP (1) Fecha
                            FROM          HPlazas AS B
                            WHERE      B.Id_plaza = PlazaEmpleados_A.Id_plaza AND B.Id_TipoMovPlazas = 2 AND B.Fecha > HStatusPlaza.Fecha
                            ORDER BY B.Fecha) IS NULL THEN 
							 CASE WHEN
							  (SELECT     TOP (1) Fecha
							   FROM          PlazaEmpleados AS B
                               WHERE      B.Id_plaza = PlazaEmpleados_A.Id_plaza AND B.Id_Emp = 0 AND B.Fecha > HStatusPlaza.Fecha
                               ORDER BY B.Fecha) IS NULL THEN ''9999/12/31'' 
						  ELSE
                          (SELECT     TOP (1) Fecha
                            FROM          PlazaEmpleados AS B
                            WHERE      B.Id_plaza = PlazaEmpleados_A.Id_plaza AND B.Id_Emp = 0 AND B.Fecha > HStatusPlaza.Fecha
                            ORDER BY B.Fecha) END ELSE
                          (SELECT     TOP (1) Fecha
                            FROM          HPlazas AS B
                            WHERE      B.Id_plaza = PlazaEmpleados_A.Id_plaza AND B.Id_TipoMovPlazas = 2 AND B.Fecha > HStatusPlaza.Fecha
                            ORDER BY B.Fecha) END ELSE dbo.TLicencias_por_plaza.FechaFin END AS FechaFin, CASE WHEN dbo.TLicencias_por_plaza.StatusPlaza IS NULL 
                      THEN dbo.HstatusPlaza.id_rel ELSE dbo.TLicencias_por_plaza.StatusPlaza END AS status, CASE WHEN dbo.TLicencias_por_plaza.MotivoLicencia IS NULL 
                      THEN dbo.HtipoPlaza.id_rel ELSE dbo.TLicencias_por_plaza.MotivoLicencia END AS Motivo, TNivel3IEA.Descripcion, TNivel3IEA.clave AS Centro_Trabajo, 
                      TLicencias_por_plaza.Dias_de_Lic, HFechaSubsistema.FechaSubsistema, TTabulador_IEA_CM.Descripcion AS NivelSueldo
FROM         HTipoPlaza INNER JOIN
                      HstatusPlaza INNER JOIN
                      Plazas ON HstatusPlaza.Id_plaza = Plazas.Id_plaza ON HTipoPlaza.Id_plaza = Plazas.Id_plaza INNER JOIN
                      EMPLEADOS INNER JOIN
                          (SELECT     (CASE WHEN dbo.PlazaEmpleados.Id_Emp = 0 THEN
                                                       (SELECT     TOP (1) B.Id_Emp
                                                         FROM          dbo.PlazaEmpleados B
                                                         WHERE      B.id_plaza = dbo.PlazaEmpleados.id_Plaza AND B.Fecha < dbo.PlazaEmpleados.Fecha
                                                         ORDER BY B.fecha) ELSE dbo.PlazaEmpleados.Id_Emp END) AS id_emp, Id_plaza, Fecha, id_nodo, Documentos
                            FROM          PlazaEmpleados) AS PlazaEmpleados_A ON EMPLEADOS.Id_Emp = PlazaEmpleados_A.id_emp ON Plazas.Id_plaza = PlazaEmpleados_A.Id_plaza AND 
                      HstatusPlaza.Fecha = PlazaEmpleados_A.Fecha AND HTipoPlaza.Fecha = PlazaEmpleados_A.Fecha INNER JOIN
                      TablaConfigOrgan ON PlazaEmpleados_A.id_nodo = TablaConfigOrgan.Id_Nodo INNER JOIN
                      TNivel3IEA ON TablaConfigOrgan.ValorCampoLLave = TNivel3IEA.id_Nivel3IEA INNER JOIN
                      HTabulador_IEA_CM ON Plazas.Id_plaza = HTabulador_IEA_CM.id_plaza AND PlazaEmpleados_A.Fecha = HTabulador_IEA_CM.fecha INNER JOIN
                      HFechaSubsistema ON Plazas.Id_plaza = HFechaSubsistema.id_plaza AND PlazaEmpleados_A.Fecha = HFechaSubsistema.fecha INNER JOIN
                      TTabulador_IEA_CM ON HTabulador_IEA_CM.id_rel = TTabulador_IEA_CM.id_Tabulador_IEA_CM LEFT OUTER JOIN
                      HConsecutivo ON Plazas.Id_plaza = HConsecutivo.id_plaza AND HConsecutivo.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HConsecutivo AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC) LEFT OUTER JOIN
                      HHoras ON Plazas.Id_plaza = HHoras.id_plaza AND HHoras.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HHoras AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC) LEFT OUTER JOIN
                      HCat_Puesto ON Plazas.Id_plaza = HCat_Puesto.id_plaza AND HCat_Puesto.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HCat_Puesto AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC) LEFT OUTER JOIN
                      HSubUnidad ON Plazas.Id_plaza = HSubUnidad.id_plaza AND HSubUnidad.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HSubUnidad AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC) LEFT OUTER JOIN
                      HUnidad ON Plazas.Id_plaza = HUnidad.id_plaza AND HUnidad.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HUnidad AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC) FULL OUTER JOIN
                      TLicencias_por_plaza ON Plazas.Id_plaza = TLicencias_por_plaza.id_plaza AND PlazaEmpleados_A.Fecha = TLicencias_por_plaza.FechaInicio FULL OUTER JOIN
                      HCodigoPago ON Plazas.Id_plaza = HCodigoPago.id_plaza AND HCodigoPago.fecha =
                          (SELECT     TOP (1) fecha
                            FROM          HCodigoPago AS B
                            WHERE      (id_plaza = Plazas.Id_plaza) AND (fecha <= PlazaEmpleados_A.Fecha)
                            ORDER BY fecha DESC)
WHERE     (EMPLEADOS.id_emp = @id_emp) and (PlazaEmpleados_A.fecha >= @fecha)
--ORDER BY HConsecutivo.Consecutivo, PlazaEmpleados_A.Fecha

)'
GO

GO
PRINT N'Creating [dbo].[FN_SQLCREATETABLE]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FN_SQLCREATETABLE]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE FUNCTION [dbo].[FN_SQLCREATETABLE] (@SQLCreate AS NVARCHAR(4000), @NombreTabla AS NVARCHAR(128) = NULL) 
RETURNS NVARCHAR(4000)
AS
BEGIN

DECLARE @SQLcmd AS NVARCHAR(4000)
DECLARE @name NVARCHAR(128)
DECLARE @is_nullable BIT 
DECLARE @system_type_name NVARCHAR(128)
DECLARE @collation_name NVARCHAR(128)
DECLARE @Salto_linea NVARCHAR(2) = CHAR(13) + CHAR(10) -- CRLF

DECLARE CUR_Table CURSOR LOCAL FAST_FORWARD
FOR
    SELECT  name ,
            is_nullable ,
            system_type_name ,
            collation_name
    FROM    sys.dm_exec_describe_first_result_set(@SQLCreate, NULL, NULL)
    WHERE   is_hidden = 0
    ORDER BY column_ordinal ASC 

OPEN CUR_Table

FETCH NEXT FROM CUR_Table INTO @name, @is_nullable, @system_type_name,
    @collation_name

SET @SQLcmd = ''CREATE TABLE ['' + ISNULL(@NombreTabla, ''TableName'') + ''] (''
    + @Salto_linea

WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQLcmd += @Salto_linea + ''['' + @name + '']'' + '' '' + @system_type_name
            + CASE WHEN @collation_name IS NOT NULL
                   THEN ''  COLLATE '' + @collation_name + '' ''
                   ELSE ''''
              END + CASE WHEN @is_nullable = 0 THEN '' NOT NULL ''
                         ELSE ''''
                    END + '','' 
        FETCH NEXT FROM CUR_Table INTO @name, @is_nullable, @system_type_name,
            @collation_name
    END

SET @SQLcmd = LEFT(@SQLcmd, LEN(@SQLcmd) - 1) + @Salto_linea + '')''

CLOSE CUR_Table
DEALLOCATE CUR_Table

RETURN @SQLcmd
end '
GO

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
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	PRINT 'The database update failed'
END
GO
