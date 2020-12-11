USE [IEEPOSYNC]
GO
DROP PROCEDURE if exists  [dbo].[MIGBITACORAALT]
GO
CREATE PROCEDURE [dbo].[MIGBITACORAALT] (@Par_ObjetoID int, @Par_NombreTabla varchar(500),@Par_DisableCheck char,@Par_InsertIDEntity char)

AS
BEGIN
DECLARE @Entero_uno     int


if(@Par_ObjetoID=0)
    BEGIN
     set @Par_ObjetoID=(select ObjectIDDestino from IEEPOSYNC.dbo.RELACIONOBJETOSMIG  where NombreTabla=@Par_NombreTabla)
    END                            
INSERT INTO  IEEPOSYNC.dbo.MIGBITACORA(ObjectIDDestino,NombreTabla,DisableCheck,InsertIDEntity,HoraTermina) values
                            (@Par_ObjetoID,@Par_NombreTabla,@Par_DisableCheck,@Par_InsertIDEntity,getdate())

END;

GO

