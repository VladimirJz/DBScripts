
USE [IEEPOSYNC]
-- nom_histpagos
DROP INDEX [IX_Nom_histpagos_idemp_idplaza_idperiodo_idconcepto] ON IEEPOSYNC.[dbo].[nom_histpagos]
DROP INDEX [IX_Nom_histpagos_idperiodo_idplaza_idreferencia] ON IEEPOSYNC.[dbo].[nom_histpagos] WITH ( ONLINE = OFF )

-- Creamos nuevamente los indices:
CREATE NONCLUSTERED INDEX [IX_Nom_histpagos_idemp_idplaza_idperiodo_idconcepto] ON IEEPOSYNC.[dbo].[nom_histpagos]
(
	[Id_Emp] ASC,
	[id_plaza] ASC,
	[Id_Periodo] ASC,
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]

CREATE CLUSTERED INDEX [IX_Nom_histpagos_idperiodo_idplaza_idreferencia] ON IEEPOSYNC. [dbo].[nom_histpagos]
(
	[Id_Periodo] ASC,
	[id_plaza] ASC,
	[Id_Referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

--  histpagosdetalle

DROP INDEX [PK_histpagosdetalle_1] ON IEEPOSYNC.[dbo].[histpagosdetalle] WITH ( ONLINE = OFF )
DROP INDEX [idx_histpagosdetalle_idconcepto_inc2] ON IEEPOSYNC.[dbo].[histpagosdetalle]
DROP INDEX [idx_histpagosdetalle_idperiodopago_idprocesonomina] ON IEEPOSYNC.[dbo].[histpagosdetalle]
DROP INDEX [idx_HistPagos_IdEmp_idplaza] ON IEEPOSYNC.[dbo].[histpagosdetalle]
GO
-- CREAR
CREATE CLUSTERED INDEX [PK_histpagosdetalle_1] ON IEEPOSYNC.[dbo].[histpagosdetalle]
(
	[id_emp] ASC,
	[id_plaza] ASC,
	[id_referencia] ASC,
	[id_periodo] ASC,
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF, FILLFACTOR = 85) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_histpagosdetalle_idconcepto_inc2] ON IEEPOSYNC.[dbo].[histpagosdetalle]
(
	[id_concepto] ASC
)
INCLUDE([desde],[hasta]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_histpagosdetalle_idperiodopago_idprocesonomina] ON IEEPOSYNC.[dbo].[histpagosdetalle]
(
	[id_periodopago] ASC,
	[id_procesonomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_HistPagos_IdEmp_idplaza] ON IEEPOSYNC.[dbo].[histpagosdetalle]
(
	[id_periodo] ASC
)
INCLUDE([consecutivo],[horas],[pesos],[pesosexcento],[id_periodopago],[id_procesonomina],[desde],[hasta],[id_plazapago],[C_costo]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO



