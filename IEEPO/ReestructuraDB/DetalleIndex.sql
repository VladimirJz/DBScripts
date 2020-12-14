
USE [IEEPOSYNC]

-- Nom_Pagos_hist
DROP INDEX [idx_Nom_histpagos_clustered_n] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
DROP INDEX [idx_Nompagoshist_IdEmp_idplaza] ON IEEPOSYNC. [dbo].[Nom_pagos_hist]
DROP INDEX [ix_emp_plaza_desde_hasta_concepto] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
DROP INDEX [IX_Nom_histpagos_periodo_emp_plaza_Periodopago] ON IEEPOSYNC.[dbo].[Nom_pagos_hist] WITH ( ONLINE = OFF )
DROP INDEX [IX_Nom_histpagos_perpzaref] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]

-- nom_histpagos
DROP INDEX [IX_Nom_histpagos_idemp_idplaza_idperiodo_idconcepto] ON IEEPOSYNC.[dbo].[nom_histpagos]
DROP INDEX [IX_Nom_histpagos_idperiodo_idplaza_idreferencia] ON IEEPOSYNC.[dbo].[nom_histpagos] WITH ( ONLINE = OFF )

--  histpagosdetalle

DROP INDEX [PK_histpagosdetalle_1] ON IEEPOSYNC.[dbo].[histpagosdetalle] WITH ( ONLINE = OFF )
DROP INDEX [idx_histpagosdetalle_idconcepto_inc2] ON IEEPOSYNC.[dbo].[histpagosdetalle]
DROP INDEX [idx_histpagosdetalle_idperiodopago_idprocesonomina] ON IEEPOSYNC.[dbo].[histpagosdetalle]
DROP INDEX [idx_HistPagos_IdEmp_idplaza] ON IEEPOSYNC.[dbo].[histpagosdetalle]

-- [Recalculo_histpagos]
DROP INDEX [idx_Recalculo_HistPagos_1] ON IEEPOSYNC.[dbo].[Recalculo_histpagos] WITH ( ONLINE = OFF )
DROP INDEX [idx_Recalculo_HistPagos2_1] ON IEEPOSYNC.[dbo].[Recalculo_histpagos]

-- [Hvectores]
ALTER TABLE IEEPOSYNC.[dbo].[Hvectores] DROP CONSTRAINT [PK_Hvectores] WITH ( ONLINE = OFF )
DROP INDEX [idx_Hvectores_idPeriodo_idVector] ON IEEPOSYNC.[dbo].[Hvectores]
DROP INDEX [IDX_id_periodo] ON IEEPOSYNC.[dbo].[Hvectores]





-- Creamos nuevamente los indices:  
##############
##Revisar el archivo de DAtos en donde se crea el indice
################
-- Nom_pagos_hist 
CREATE NONCLUSTERED INDEX [idx_Nom_histpagos_clustered_n] ON IEEPOSYNC. [dbo].[Nom_pagos_hist]
(
	[id_concepto] ASC,
	[Id_Periodo] ASC,
	[Id_Emp] ASC,
	[id_plaza] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [NPH]

CREATE NONCLUSTERED INDEX [idx_Nompagoshist_IdEmp_idplaza] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
(
	[Id_Emp] ASC,
	[id_plaza] ASC
)
INCLUDE([Pesos],[Id_Referencia],[Id_ProcesoNomina]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [NPH]

CREATE NONCLUSTERED INDEX [ix_emp_plaza_desde_hasta_concepto] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
(
	[Id_Periodo] ASC,
	[Id_Emp] ASC,
	[id_plaza] ASC,
	[Desde] ASC,
	[Hasta] ASC,
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [NPH]

CREATE CLUSTERED INDEX [IX_Nom_histpagos_periodo_emp_plaza_Periodopago] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
(
	[Id_Emp] ASC,
	[id_plaza] ASC,
	[Id_Periodo] ASC,
	[id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [NPH]

CREATE NONCLUSTERED INDEX [IX_Nom_histpagos_perpzaref] ON IEEPOSYNC.[dbo].[Nom_pagos_hist]
(
	[Id_Periodo] ASC,
	[id_plaza] ASC,
	[Id_Referencia] ASC
)
INCLUDE([Desde]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [NPH]
GO


-- nom_histpagos
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


--   histpagosdetalle
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


-- [Recalculo_histpagos]
CREATE CLUSTERED INDEX [idx_Recalculo_HistPagos_1] ON IEEPOSYNC.[dbo].[Recalculo_histpagos]
(
	[Id_Calculo] ASC,
	[Id_Periodo] ASC,
	[Id_Concepto] ASC,
	[Id_Emp] ASC,
	[Id_Plaza] ASC,
	[id_periodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 85) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [idx_Recalculo_HistPagos2_1] ON IEEPOSYNC.[dbo].[Recalculo_histpagos]
(
	[Id_Emp] ASC,
	[Id_Plaza] ASC,
	[Id_Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF, FILLFACTOR = 85) ON [PRIMARY]




-- [Hvectores]

ALTER TABLE IEEPOSYNC.[dbo].[Hvectores] ADD  CONSTRAINT [PK_Hvectores] PRIMARY KEY CLUSTERED 
(
	[id_Emp] ASC,
	[id_Plaza] ASC,
	[id_Periodo] ASC,
	[id_periodo_aplicacion] ASC,
	[id_Vector] ASC,
	[Fecha] ASC,
	[Id_Referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [idx_Hvectores_idPeriodo_idVector] ON IEEPOSYNC.[dbo].[Hvectores]
(
	[id_Periodo] ASC,
	[id_Vector] ASC
)
INCLUDE([id_user],[id_documento],[Observaciones],[Id_ProcesoNomina]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

CREATE NONCLUSTERED INDEX [IDX_id_periodo] ON IEEPOSYNC.[dbo].[Hvectores]
(
	[id_Periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


