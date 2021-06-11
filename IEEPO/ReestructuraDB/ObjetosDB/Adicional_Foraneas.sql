ALTER TABLE [dbo].[Calculo_ConceptosEjecucion] ADD CONSTRAINT [IX_Calculo_ConceptosEjecucion_Id_Periodo] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
GO
ALTER TABLE [dbo].[Conceptos] WITH NOCHECK ADD CONSTRAINT [R_374] FOREIGN KEY ([Tipo]) REFERENCES [dbo].[TipoConcepto] ([Id_Tipo])
GO
ALTER TABLE [dbo].[deducsfijas] ADD CONSTRAINT [PK_deducsfijas] PRIMARY KEY NONCLUSTERED  ([Id_Prestamo], [Id_Emp])
ALTER TABLE [dbo].[deducsfijas] ADD CONSTRAINT [UX_DeducsFijas_id_prestamo_1] UNIQUE NONCLUSTERED  ([Id_Prestamo])
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK ADD CONSTRAINT [R_388] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [XPKExcepciones] PRIMARY KEY CLUSTERED  ([Id_Periodo], [Id_Emp], [Id_Clave], [Consecutivo])

ALTER TABLE [dbo].[excepcionesPlaza] ADD CONSTRAINT [XPKexcepcionesPlaza] PRIMARY KEY CLUSTERED  ([Id_plaza], [id_concepto])
GO
-- Foreign Keys

ALTER TABLE [dbo].[excepcionesPlaza] WITH NOCHECK ADD CONSTRAINT [R_44] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK ADD CONSTRAINT [R_429] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])

ALTER TABLE [dbo].[FUP_Conceptos_E7] ADD CONSTRAINT [PK_FUP_Conceptos_E7] PRIMARY KEY CLUSTERED  ([id_concepto])
GO
ALTER TABLE [dbo].[fup_generados] ADD PRIMARY KEY CLUSTERED  ([id])
GO
ALTER TABLE [dbo].[FUP_PLAZA_DRSE] ADD CONSTRAINT [FK_id_plaza_fup_plaza_drse_plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HAuditorias] WITH NOCHECK ADD CONSTRAINT [FK_HAuditorias_CalenNomina] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[hccosto] WITH NOCHECK ADD CONSTRAINT [R_542_R] FOREIGN KEY ([Id_Plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO

CREATE NONCLUSTERED INDEX [idx_histpagosdetalle_idconcepto_inc2] ON [dbo].[histpagosdetalle] ([id_concepto]) INCLUDE ([desde], [hasta])
GO
CREATE CLUSTERED INDEX [PK_histpagosdetalle_1] ON [dbo].[histpagosdetalle] ([id_emp], [id_plaza], [id_referencia], [id_periodo], [id_concepto]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO
CREATE NONCLUSTERED INDEX [idx_HistPagos_IdEmp_idplaza] ON [dbo].[histpagosdetalle] ([id_periodo]) INCLUDE ([consecutivo], [horas], [pesos], [pesosexcento], [id_periodopago], [id_procesonomina], [desde], [hasta], [id_plazapago], [C_costo])
GO
CREATE NONCLUSTERED INDEX [idx_histpagosdetalle_idperiodopago_idprocesonomina] ON [dbo].[histpagosdetalle] ([id_periodopago], [id_procesonomina])
GO

ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK ADD CONSTRAINT [R_33] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK ADD CONSTRAINT [R_33HNivelPlaza] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK ADD CONSTRAINT [R_554HNivelPlaza] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO

GO
ALTER TABLE [dbo].[HPlazas] WITH NOCHECK ADD CONSTRAINT [R_670] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO

ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK ADD CONSTRAINT [R_403] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [XPKNom_Excepciones] PRIMARY KEY CLUSTERED  ([Id_Periodo], [Id_Emp], [Id_Clave], [Consecutivo])
GO
ALTER TABLE [dbo].[Nom_HAuditorias] WITH NOCHECK ADD CONSTRAINT [R_406] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[nom_TTabulador_SE_Cat_Puesto] ADD CONSTRAINT [PK_nom_TTabulador_SE_Cat_Puesto] PRIMARY KEY CLUSTERED  ([id_Tabulador_SE_Cat_Puesto])
GO
ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [PK_Plazas] PRIMARY KEY CLUSTERED  ([Id_plaza])
GO
ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [IX_Plazas_numplaza] UNIQUE NONCLUSTERED  ([Num_Plaza])
GO
ALTER TABLE [dbo].[PlazasOrgan] WITH NOCHECK ADD CONSTRAINT [R_1] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK ADD CONSTRAINT [R_459] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[TacumuladoEjercidoDetallexRubro] WITH NOCHECK ADD CONSTRAINT [FK_TacumuladoEjercidoDetallexrubro_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
ALTER TABLE [dbo].[TacumuladoEjercidoDetallextipo] WITH NOCHECK ADD CONSTRAINT [FK_TacumuladoEjercidoDetallextipo_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO

ALTER TABLE [dbo].[TCat_Pto_SE] ADD CONSTRAINT [pk_tcat_pto_se] PRIMARY KEY CLUSTERED  ([id_Cat_Pto_SE])
GO
ALTER TABLE [dbo].[TCatConcepto] ADD CONSTRAINT [PK_TCatConcepto] PRIMARY KEY CLUSTERED  ([id])
GO

CREATE NONCLUSTERED INDEX [Idx_tct_status] ON [dbo].[TCT_Status] ([id_status]) INCLUDE ([desc_status])
GO

ALTER TABLE [dbo].[TNivel] ADD CONSTRAINT [PK_TNivel] PRIMARY KEY CLUSTERED  ([Id_Nivel])
GO

ALTER TABLE [dbo].[TNivelTablas] ADD CONSTRAINT [XPKTNivelTablas] PRIMARY KEY CLUSTERED  ([id_tabla], [id_nivel])
GO

ALTER TABLE [dbo].[TProcesosCalendario] WITH NOCHECK ADD CONSTRAINT [R_463] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO


ALTER TABLE [dbo].[TProcesosValorXPeriodo] WITH NOCHECK ADD CONSTRAINT [R_464] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO

GO
ALTER TABLE [dbo].[TacumuladoEjercido] WITH NOCHECK ADD CONSTRAINT [FK_TacumuladoEjercido_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO

--
---
--

-- Las quee marcan error

ALTER TABLE [dbo].[AccesosCias] ADD CONSTRAINT [PK_AccesosCias] PRIMARY KEY CLUSTERED  ([Id_Usuario], [Id_cia])
GO
ALTER TABLE [dbo].[Conceptos] ADD CONSTRAINT [FK_Conceptos_TCatConceptos] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[TCatConcepto] ([id])
GO


ALTER TABLE [dbo].[Calculo_ConceptosEjecucion] ADD CONSTRAINT [IX_Calculo_ConceptosEjecucion_Id_Periodo] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK ADD CONSTRAINT [R_388] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK ADD CONSTRAINT [R_429] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[HAuditorias] WITH NOCHECK ADD CONSTRAINT [FK_HAuditorias_CalenNomina] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK ADD CONSTRAINT [R_403] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[Nom_HAuditorias] WITH NOCHECK ADD CONSTRAINT [R_406] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK ADD CONSTRAINT [R_459] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[TProcesosCalendario] WITH NOCHECK ADD CONSTRAINT [R_463] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
ALTER TABLE [dbo].[TProcesosValorXPeriodo] WITH NOCHECK ADD CONSTRAINT [R_464] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO