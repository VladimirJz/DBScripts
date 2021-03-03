select top 200 *  from nompagos


       select MIG.ObjectIDDestino,MIG.NombreTabla,MIG.NumFilasOrigen
        from RELACIONOBJETOSMIG MIG left join MIGBITACORA TMP on MIG.ObjectIDDestino=TMP.ObjectIDDestino
        where 
             isnull(TMP.BitacoraID,0)=0 
            order by MIG.NumFilasOrigen desc



            select * from RELACIONOBJETOSMIG order by NumFilasOrigen desc

            select top 200  * from HistPagos
            -- ID_Periodo
            -- id_Concepto
            -- 

            select top 200 * from Nom_histpagos


            select top 200 * from HVectores