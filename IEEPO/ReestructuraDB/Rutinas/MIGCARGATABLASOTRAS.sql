GO
drop PROCEDURE  if exists [dbo].[MIGCARGATABLASOTRAS]
go
create PROCEDURE [dbo].[MIGCARGATABLASOTRAS]
WITH EXEC AS CALLER
AS
BEGIN 
 SET NOCOUNT ON 

insert into CATTABLASMIG(Esquema,NombreTabla)
    select SCHEMA_NAME(schema_id), name
    from sys.objects where type='U' 
    and schema_id>1
    order by schema_id 
 SET NOCOUNT OFF

END
