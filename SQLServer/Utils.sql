-- Obtener la mayor longitud del valor almacenado en cada columna de una tabla
GO

DECLARE @NombreTabla varchar(max)
DECLARE @SQL    varchar(max)
DECLARE @ColumNames  varchar(max)
DECLARE @From       varchar(max)
DECLARE @NombreDB   varchar(50)
SET @NombreTabla='Hcontinuidad'
SET @NombreDB ='IEEPOSYNC'

 
SET @ColumNames= (SELECT STRING_AGG(concat ('max(len([' , COLUMN_NAME ,  ']))as [Len_',COLUMN_NAME,']'  ),',' )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @NombreTabla and TABLE_CATALOG=@NombreDB)
SET @SQL= 'SELECT '  + @ColumNames

SET @From= concat(' FROM ',@NombreTabla)
SET @SQL= @SQL + @From
exec (@SQL)

go