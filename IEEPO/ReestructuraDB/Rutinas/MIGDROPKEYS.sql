GO
drop PROCEDURE  if exists [dbo].[MIGDROPKEYS]
go
create PROCEDURE [dbo].[MIGDROPKEYS] 
WITH EXEC AS CALLER
AS
BEGIN 
    SET NOCOUNT ON 
    DECLARE @SQLErrMen  varchar(1000)
        

    DECLARE @SQLDropFK NVARCHAR(MAX) = N'';
    SELECT @SQLDropFK += N'
            ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name)  + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';'
                FROM  [IEEPOSYNC].sys.foreign_keys AS fk
                INNER JOIN  [IEEPOSYNC].sys.tables AS ct
                ON fk.parent_object_id = ct.[object_id]
                INNER JOIN  [IEEPOSYNC].sys.schemas AS cs 
                ON ct.[schema_id] = cs.[schema_id]
    BEGIN TRY 
        EXEC (@SQLDropFK)
    END TRY
    BEGIN CATCH
            SET @SQLErrMen=(select ERROR_MESSAGE())
             PRINT '##ERROR## ' + @SQLErrMen
    END CATCH

END