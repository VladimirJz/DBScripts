GO
drop PROCEDURE  if exists [dbo].[MIGRESTOREKEYS]
go
create PROCEDURE [dbo].[MIGRESTOREKEYS] 
WITH EXEC AS CALLER
AS
BEGIN 
    SET NOCOUNT ON 
  
    BEGIN TRY 
        EXEC (@SQLDropFK)
    END TRY
    BEGIN CATCH
            SET @SQLErrMen=(select ERROR_MESSAGE())
             PRINT '##ERROR## ' + @SQLErrMen
    END CATCH

END