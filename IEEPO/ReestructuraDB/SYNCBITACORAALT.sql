USE [IEEPO]
GO
DROP PROCEDURE [dbo].[SYNCBITACORAALT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SYNCBITACORAALT] (@Par_ObjetoID int, @Par_NombreTabla varchar(500),@Par_DisableCheck char,@Par_InsertIDEntity char)

AS
BEGIN
DECLARE @Entero_uno     int


if(@Par_ObjetoID=0)
    BEGIN
     set @Par_ObjetoID=(select ObjectID from LASTUPDATE where ObjectName=@Par_NombreTabla)
    END                            
INSERT INTO  SYNCBITACORA(ObjectID,ObjectName,DisableCheck,InsertIDEntity,HoraTermina) values
                            (@Par_ObjetoID,@Par_NombreTabla,@Par_DisableCheck,@Par_InsertIDEntity,getdate())

END;

GO

