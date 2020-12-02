/*
Run this script on:

        10.186.11.19.WSCALCULO    -  This database will be modified

to synchronize it with:

        10.186.11.11\MSSQLServer2.IEEPO

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.4.4.16824 from Red Gate Software Ltd at 27/11/2020 4:12:12

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Adding foreign keys to [dbo].[ACCESOSMENUS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_361]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCESOSMENUS]', 'U'))
ALTER TABLE [dbo].[ACCESOSMENUS] WITH NOCHECK  ADD CONSTRAINT [R_361] FOREIGN KEY ([ClaveMenu]) REFERENCES [dbo].[MENU] ([ClaveMenu])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_362]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCESOSMENUS]', 'U'))
ALTER TABLE [dbo].[ACCESOSMENUS] WITH NOCHECK  ADD CONSTRAINT [R_362] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[AccesosAgrupadores]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_363]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosAgrupadores]', 'U'))
ALTER TABLE [dbo].[AccesosAgrupadores] WITH NOCHECK  ADD CONSTRAINT [R_363] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_364]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosAgrupadores]', 'U'))
ALTER TABLE [dbo].[AccesosAgrupadores] WITH NOCHECK  ADD CONSTRAINT [R_364] FOREIGN KEY ([id_agrupador]) REFERENCES [dbo].[AgrupadoresSeg] ([Id_Agrupador])
GO
PRINT N'Adding foreign keys to [dbo].[AccesosCampos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_372]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosCampos]', 'U'))
ALTER TABLE [dbo].[AccesosCampos] WITH NOCHECK  ADD CONSTRAINT [R_372] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_373]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosCampos]', 'U'))
ALTER TABLE [dbo].[AccesosCampos] WITH NOCHECK  ADD CONSTRAINT [R_373] FOREIGN KEY ([Id_Campo]) REFERENCES [dbo].[CamposMaestro] ([Id_Campo])
GO
PRINT N'Adding foreign keys to [dbo].[AccesosCias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_370]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosCias]', 'U'))
ALTER TABLE [dbo].[AccesosCias] WITH NOCHECK  ADD CONSTRAINT [R_370] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_371]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosCias]', 'U'))
ALTER TABLE [dbo].[AccesosCias] WITH NOCHECK  ADD CONSTRAINT [R_371] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[AccesosSistemas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_368]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosSistemas]', 'U'))
ALTER TABLE [dbo].[AccesosSistemas] WITH NOCHECK  ADD CONSTRAINT [R_368] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_369]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AccesosSistemas]', 'U'))
ALTER TABLE [dbo].[AccesosSistemas] WITH NOCHECK  ADD CONSTRAINT [R_369] FOREIGN KEY ([Clave]) REFERENCES [dbo].[Sistemas] ([Clave])
GO
PRINT N'Adding foreign keys to [dbo].[AgrupadorCias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_359]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorCias]', 'U'))
ALTER TABLE [dbo].[AgrupadorCias] WITH NOCHECK  ADD CONSTRAINT [R_359] FOREIGN KEY ([id_agrupador]) REFERENCES [dbo].[AgrupadoresSeg] ([Id_Agrupador])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_360]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorCias]', 'U'))
ALTER TABLE [dbo].[AgrupadorCias] WITH NOCHECK  ADD CONSTRAINT [R_360] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[AgrupadorMenus]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_357]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorMenus]', 'U'))
ALTER TABLE [dbo].[AgrupadorMenus] WITH NOCHECK  ADD CONSTRAINT [R_357] FOREIGN KEY ([ClaveMenu]) REFERENCES [dbo].[MENU] ([ClaveMenu])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_358]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorMenus]', 'U'))
ALTER TABLE [dbo].[AgrupadorMenus] WITH NOCHECK  ADD CONSTRAINT [R_358] FOREIGN KEY ([Id_Agrupador]) REFERENCES [dbo].[AgrupadoresSeg] ([Id_Agrupador])
GO
PRINT N'Adding foreign keys to [dbo].[AgrupadorSistemas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_365]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorSistemas]', 'U'))
ALTER TABLE [dbo].[AgrupadorSistemas] WITH NOCHECK  ADD CONSTRAINT [R_365] FOREIGN KEY ([Id_Agrupador]) REFERENCES [dbo].[AgrupadoresSeg] ([Id_Agrupador])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_366]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorSistemas]', 'U'))
ALTER TABLE [dbo].[AgrupadorSistemas] WITH NOCHECK  ADD CONSTRAINT [R_366] FOREIGN KEY ([Id_Agrupador]) REFERENCES [dbo].[AgrupadoresSeg] ([Id_Agrupador])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_367]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AgrupadorSistemas]', 'U'))
ALTER TABLE [dbo].[AgrupadorSistemas] WITH NOCHECK  ADD CONSTRAINT [R_367] FOREIGN KEY ([Clave]) REFERENCES [dbo].[Sistemas] ([Clave])
GO
PRINT N'Adding foreign keys to [dbo].[AportacionesFAhorro]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_413]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AportacionesFAhorro]', 'U'))
ALTER TABLE [dbo].[AportacionesFAhorro] WITH NOCHECK  ADD CONSTRAINT [R_413] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_415]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[AportacionesFAhorro]', 'U'))
ALTER TABLE [dbo].[AportacionesFAhorro] WITH NOCHECK  ADD CONSTRAINT [R_415] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[BitacoraHSalarios]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_527]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BitacoraHSalarios]', 'U'))
ALTER TABLE [dbo].[BitacoraHSalarios] WITH NOCHECK  ADD CONSTRAINT [R_527] FOREIGN KEY ([IdMovimiento]) REFERENCES [dbo].[TMovimientos] ([IdMovimiento])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_528]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BitacoraHSalarios]', 'U'))
ALTER TABLE [dbo].[BitacoraHSalarios] WITH NOCHECK  ADD CONSTRAINT [R_528] FOREIGN KEY ([IdEmp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[BloqueoPassword]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_649]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BloqueoPassword]', 'U'))
ALTER TABLE [dbo].[BloqueoPassword] WITH NOCHECK  ADD CONSTRAINT [R_649] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[BolsaTrab]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_487]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BolsaTrab]', 'U'))
ALTER TABLE [dbo].[BolsaTrab] WITH NOCHECK  ADD CONSTRAINT [R_487] FOREIGN KEY ([Id_Colonia]) REFERENCES [dbo].[TColonia] ([Id_Colonia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_488]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BolsaTrab]', 'U'))
ALTER TABLE [dbo].[BolsaTrab] WITH NOCHECK  ADD CONSTRAINT [R_488] FOREIGN KEY ([Id_Ciudad]) REFERENCES [dbo].[TCiudad] ([Id_Ciudad])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_489]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BolsaTrab]', 'U'))
ALTER TABLE [dbo].[BolsaTrab] WITH NOCHECK  ADD CONSTRAINT [R_489] FOREIGN KEY ([Id_Estado]) REFERENCES [dbo].[TEstados] ([Id_Estado])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmpEscol]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_492]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpEscol]', 'U'))
ALTER TABLE [dbo].[BtEmpEscol] WITH NOCHECK  ADD CONSTRAINT [R_492] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_493]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpEscol]', 'U'))
ALTER TABLE [dbo].[BtEmpEscol] WITH NOCHECK  ADD CONSTRAINT [R_493] FOREIGN KEY ([Id_Escolaridad]) REFERENCES [dbo].[TBtEscol] ([Id_Escolaridad])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmpExper]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_491]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpExper]', 'U'))
ALTER TABLE [dbo].[BtEmpExper] WITH NOCHECK  ADD CONSTRAINT [R_491] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmpIdio]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_485]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpIdio]', 'U'))
ALTER TABLE [dbo].[BtEmpIdio] WITH NOCHECK  ADD CONSTRAINT [R_485] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_486]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpIdio]', 'U'))
ALTER TABLE [dbo].[BtEmpIdio] WITH NOCHECK  ADD CONSTRAINT [R_486] FOREIGN KEY ([Id_Idioma]) REFERENCES [dbo].[TBtIdioma] ([Id_Idioma])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmpPto]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_494]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpPto]', 'U'))
ALTER TABLE [dbo].[BtEmpPto] WITH NOCHECK  ADD CONSTRAINT [R_494] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_495]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpPto]', 'U'))
ALTER TABLE [dbo].[BtEmpPto] WITH NOCHECK  ADD CONSTRAINT [R_495] FOREIGN KEY ([Id_Puesto]) REFERENCES [dbo].[TBtPuesto] ([Id_Puestos])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmpRefer]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_490]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmpRefer]', 'U'))
ALTER TABLE [dbo].[BtEmpRefer] WITH NOCHECK  ADD CONSTRAINT [R_490] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmptur]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_496]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmptur]', 'U'))
ALTER TABLE [dbo].[BtEmptur] WITH NOCHECK  ADD CONSTRAINT [R_496] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
PRINT N'Adding foreign keys to [dbo].[BtSeminarios]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_497]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtSeminarios]', 'U'))
ALTER TABLE [dbo].[BtSeminarios] WITH NOCHECK  ADD CONSTRAINT [R_497] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud])
GO
PRINT N'Adding foreign keys to [dbo].[CNNombres]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_504]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CNNombres]', 'U'))
ALTER TABLE [dbo].[CNNombres] WITH NOCHECK  ADD CONSTRAINT [R_504] FOREIGN KEY ([Id_Campo]) REFERENCES [dbo].[CNCampos] ([Id_Campo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_505]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CNNombres]', 'U'))
ALTER TABLE [dbo].[CNNombres] WITH NOCHECK  ADD CONSTRAINT [R_505] FOREIGN KEY ([Id_Parentesco]) REFERENCES [dbo].[CNParentescos] ([Id_Parentesco])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_506]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CNNombres]', 'U'))
ALTER TABLE [dbo].[CNNombres] WITH NOCHECK  ADD CONSTRAINT [R_506] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[CNRelacion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_507]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CNRelacion]', 'U'))
ALTER TABLE [dbo].[CNRelacion] WITH NOCHECK  ADD CONSTRAINT [R_507] FOREIGN KEY ([Id_Nombre]) REFERENCES [dbo].[CNNombres] ([id_nombre])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_509]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CNRelacion]', 'U'))
ALTER TABLE [dbo].[CNRelacion] WITH NOCHECK  ADD CONSTRAINT [R_509] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[CaMatrizRequeridos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_347]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CaMatrizRequeridos]', 'U'))
ALTER TABLE [dbo].[CaMatrizRequeridos] WITH NOCHECK  ADD CONSTRAINT [R_347] FOREIGN KEY ([Id_Competencia]) REFERENCES [dbo].[CaTCompetencia] ([Id_Competencia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_350]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CaMatrizRequeridos]', 'U'))
ALTER TABLE [dbo].[CaMatrizRequeridos] WITH NOCHECK  ADD CONSTRAINT [R_350] FOREIGN KEY ([Id_Seleccion]) REFERENCES [dbo].[CaSeleccionEmp] ([Id_Seleccion])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_626]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CaMatrizRequeridos]', 'U'))
ALTER TABLE [dbo].[CaMatrizRequeridos] WITH NOCHECK  ADD CONSTRAINT [R_626] FOREIGN KEY ([Id_Matriz]) REFERENCES [dbo].[CaMatriz] ([Id_Matriz])
GO
PRINT N'Adding foreign keys to [dbo].[CalenNomina]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ClasifigNominaCalen]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CalenNomina]', 'U'))
ALTER TABLE [dbo].[CalenNomina] WITH NOCHECK  ADD CONSTRAINT [ClasifigNominaCalen] FOREIGN KEY ([Id_ClasifNomina]) REFERENCES [dbo].[ClasificacionNomina] ([Id_ClasifNomina])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_385]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CalenNomina]', 'U'))
ALTER TABLE [dbo].[CalenNomina] WITH NOCHECK  ADD CONSTRAINT [R_385] FOREIGN KEY ([devolucion]) REFERENCES [dbo].[TipoParcial] ([IdTipoParcial])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_386]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CalenNomina]', 'U'))
ALTER TABLE [dbo].[CalenNomina] WITH NOCHECK  ADD CONSTRAINT [R_386] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[CamposPrograma]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_642]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CamposPrograma]', 'U'))
ALTER TABLE [dbo].[CamposPrograma] WITH NOCHECK  ADD CONSTRAINT [R_642] FOREIGN KEY ([Id_Programa]) REFERENCES [dbo].[Tprocesos] ([IdProceso])
GO
PRINT N'Adding foreign keys to [dbo].[CamposReestringidos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_636]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CamposReestringidos]', 'U'))
ALTER TABLE [dbo].[CamposReestringidos] WITH NOCHECK  ADD CONSTRAINT [R_636] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_637]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CamposReestringidos]', 'U'))
ALTER TABLE [dbo].[CamposReestringidos] WITH NOCHECK  ADD CONSTRAINT [R_637] FOREIGN KEY ([IdCampo]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[CaracterControl]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CaracterC__Id_Co__76F9FD47]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CaracterControl]', 'U'))
ALTER TABLE [dbo].[CaracterControl] WITH NOCHECK  ADD CONSTRAINT [FK__CaracterC__Id_Co__76F9FD47] FOREIGN KEY ([Id_Config]) REFERENCES [dbo].[TConfigCaracterControl] ([Id_Config])
GO
PRINT N'Adding foreign keys to [dbo].[Catalogo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_442]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalogo]', 'U'))
ALTER TABLE [dbo].[Catalogo] WITH NOCHECK  ADD CONSTRAINT [R_442] FOREIGN KEY ([Naturaleza]) REFERENCES [dbo].[NaturalezaCuenta] ([Naturaleza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_443]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Catalogo]', 'U'))
ALTER TABLE [dbo].[Catalogo] WITH NOCHECK  ADD CONSTRAINT [R_443] FOREIGN KEY ([Tipo]) REFERENCES [dbo].[TipoCuenta] ([Tipo])
GO
PRINT N'Adding foreign keys to [dbo].[Conceptos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_374]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Conceptos]', 'U'))
ALTER TABLE [dbo].[Conceptos] WITH NOCHECK  ADD CONSTRAINT [R_374] FOREIGN KEY ([Tipo]) REFERENCES [dbo].[TipoConcepto] ([Id_Tipo])
GO
PRINT N'Adding foreign keys to [dbo].[ConfigGafete]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_627]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigGafete]', 'U'))
ALTER TABLE [dbo].[ConfigGafete] WITH NOCHECK  ADD CONSTRAINT [R_627] FOREIGN KEY ([IdProceso]) REFERENCES [dbo].[Tprocesos] ([IdProceso])
GO
PRINT N'Adding foreign keys to [dbo].[ConfigHistPlazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_13]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigHistPlazas]', 'U'))
ALTER TABLE [dbo].[ConfigHistPlazas] WITH NOCHECK  ADD CONSTRAINT [R_13] FOREIGN KEY ([IdTablaH]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_6]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigHistPlazas]', 'U'))
ALTER TABLE [dbo].[ConfigHistPlazas] WITH NOCHECK  ADD CONSTRAINT [R_6] FOREIGN KEY ([IdTabla]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_7]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigHistPlazas]', 'U'))
ALTER TABLE [dbo].[ConfigHistPlazas] WITH NOCHECK  ADD CONSTRAINT [R_7] FOREIGN KEY ([IdCampoClave]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_8]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigHistPlazas]', 'U'))
ALTER TABLE [dbo].[ConfigHistPlazas] WITH NOCHECK  ADD CONSTRAINT [R_8] FOREIGN KEY ([Id_TipoMovPlazas]) REFERENCES [dbo].[TTipoMovPlazas] ([Id_TipoMovPlazas])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_9]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigHistPlazas]', 'U'))
ALTER TABLE [dbo].[ConfigHistPlazas] WITH NOCHECK  ADD CONSTRAINT [R_9] FOREIGN KEY ([IdCampoDescr]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[ConfigSupMaestros]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_313]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigSupMaestros]', 'U'))
ALTER TABLE [dbo].[ConfigSupMaestros] WITH NOCHECK  ADD CONSTRAINT [R_313] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[Coordenadas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_480]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Coordenadas]', 'U'))
ALTER TABLE [dbo].[Coordenadas] WITH NOCHECK  ADD CONSTRAINT [R_480] FOREIGN KEY ([Id_Plantilla]) REFERENCES [dbo].[PlantillasNavegador] ([Id_Plantilla])
GO
PRINT N'Adding foreign keys to [dbo].[DiasDeProceso]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_300]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[DiasDeProceso]', 'U'))
ALTER TABLE [dbo].[DiasDeProceso] WITH NOCHECK  ADD CONSTRAINT [R_300] FOREIGN KEY ([Compañia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[Empleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_519]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]', 'U'))
ALTER TABLE [dbo].[Empleados] WITH NOCHECK  ADD CONSTRAINT [R_519] FOREIGN KEY ([Id_Nacionalidad]) REFERENCES [dbo].[TNacionalidad] ([Id_Nacionalidad])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_521]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]', 'U'))
ALTER TABLE [dbo].[Empleados] WITH NOCHECK  ADD CONSTRAINT [R_521] FOREIGN KEY ([Id_EstadoNac]) REFERENCES [dbo].[TEstados] ([Id_Estado])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_522]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]', 'U'))
ALTER TABLE [dbo].[Empleados] WITH NOCHECK  ADD CONSTRAINT [R_522] FOREIGN KEY ([id_PuestoEquiv]) REFERENCES [dbo].[PuestoEquiv] ([id_PuestoEquiv])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_523]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]', 'U'))
ALTER TABLE [dbo].[Empleados] WITH NOCHECK  ADD CONSTRAINT [R_523] FOREIGN KEY ([Id_Banco]) REFERENCES [dbo].[TBancos] ([Id_Banco])
GO
PRINT N'Adding foreign keys to [dbo].[Escolaridad]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_517]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Escolaridad]', 'U'))
ALTER TABLE [dbo].[Escolaridad] WITH NOCHECK  ADD CONSTRAINT [R_517] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_518]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Escolaridad]', 'U'))
ALTER TABLE [dbo].[Escolaridad] WITH NOCHECK  ADD CONSTRAINT [R_518] FOREIGN KEY ([Id_Escolaridad]) REFERENCES [dbo].[TBtEscol] ([Id_Escolaridad])
GO
PRINT N'Adding foreign keys to [dbo].[Excepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_387]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Excepciones]', 'U'))
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_387] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_388]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Excepciones]', 'U'))
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_388] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_389]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Excepciones]', 'U'))
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_389] FOREIGN KEY ([Id_Clave]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_390]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Excepciones]', 'U'))
ALTER TABLE [dbo].[Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_390] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[ExpCampos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpCampos__id_ex__0D8D8053]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpCampos]', 'U'))
ALTER TABLE [dbo].[ExpCampos] WITH NOCHECK  ADD CONSTRAINT [FK__ExpCampos__id_ex__0D8D8053] FOREIGN KEY ([id_expdetalle]) REFERENCES [dbo].[ExpDetalles] ([id_expdetalle])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpCampos__idFor__0C995C1A]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpCampos]', 'U'))
ALTER TABLE [dbo].[ExpCampos] WITH NOCHECK  ADD CONSTRAINT [FK__ExpCampos__idFor__0C995C1A] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[ExpDetalles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpDetall__id_ex__09BCEF6F]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpDetalles]', 'U'))
ALTER TABLE [dbo].[ExpDetalles] WITH NOCHECK  ADD CONSTRAINT [FK__ExpDetall__id_ex__09BCEF6F] FOREIGN KEY ([id_expformato]) REFERENCES [dbo].[ExpFormatos] ([id_expformato])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpDetall__idCon__08C8CB36]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpDetalles]', 'U'))
ALTER TABLE [dbo].[ExpDetalles] WITH NOCHECK  ADD CONSTRAINT [FK__ExpDetall__idCon__08C8CB36] FOREIGN KEY ([idCondicion]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[FBonoEmpleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_420]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FBonoEmpleados]', 'U'))
ALTER TABLE [dbo].[FBonoEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_420] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[FCalculoConceptos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_425]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoConceptos]', 'U'))
ALTER TABLE [dbo].[FCalculoConceptos] WITH NOCHECK  ADD CONSTRAINT [R_425] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[FCalculoEmpleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_433]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoEmpleados]', 'U'))
ALTER TABLE [dbo].[FCalculoEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_433] FOREIGN KEY ([Id_calculo]) REFERENCES [dbo].[FCalculo] ([Id_calculo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_434]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoEmpleados]', 'U'))
ALTER TABLE [dbo].[FCalculoEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_434] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[FCalculoExcepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_422]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoExcepciones]', 'U'))
ALTER TABLE [dbo].[FCalculoExcepciones] WITH NOCHECK  ADD CONSTRAINT [R_422] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_423]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoExcepciones]', 'U'))
ALTER TABLE [dbo].[FCalculoExcepciones] WITH NOCHECK  ADD CONSTRAINT [R_423] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_432]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoExcepciones]', 'U'))
ALTER TABLE [dbo].[FCalculoExcepciones] WITH NOCHECK  ADD CONSTRAINT [R_432] FOREIGN KEY ([Id_calculo]) REFERENCES [dbo].[FCalculo] ([Id_calculo])
GO
PRINT N'Adding foreign keys to [dbo].[FCalculoHistPagos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_427]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoHistPagos]', 'U'))
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK  ADD CONSTRAINT [R_427] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_428]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoHistPagos]', 'U'))
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK  ADD CONSTRAINT [R_428] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_429]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoHistPagos]', 'U'))
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK  ADD CONSTRAINT [R_429] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_431]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculoHistPagos]', 'U'))
ALTER TABLE [dbo].[FCalculoHistPagos] WITH NOCHECK  ADD CONSTRAINT [R_431] FOREIGN KEY ([Id_calculo]) REFERENCES [dbo].[FCalculo] ([Id_calculo])
GO
PRINT N'Adding foreign keys to [dbo].[FCalculo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_424]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FCalculo]', 'U'))
ALTER TABLE [dbo].[FCalculo] WITH NOCHECK  ADD CONSTRAINT [R_424] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[FonacotEmp]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_417]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FonacotEmp]', 'U'))
ALTER TABLE [dbo].[FonacotEmp] WITH NOCHECK  ADD CONSTRAINT [R_417] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[Fonacot]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_418]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Fonacot]', 'U'))
ALTER TABLE [dbo].[Fonacot] WITH NOCHECK  ADD CONSTRAINT [R_418] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[HAreas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HAreas_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAreas]', 'U'))
ALTER TABLE [dbo].[HAreas] WITH NOCHECK  ADD CONSTRAINT [FK_HAreas_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HAreas_TAreas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAreas]', 'U'))
ALTER TABLE [dbo].[HAreas] WITH NOCHECK  ADD CONSTRAINT [FK_HAreas_TAreas] FOREIGN KEY ([Id_rel]) REFERENCES [dbo].[TAreas] ([Id_Areas])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_546]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAreas]', 'U'))
ALTER TABLE [dbo].[HAreas] WITH NOCHECK  ADD CONSTRAINT [R_546] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HAuditorias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HAuditorias_CalenNomina]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAuditorias]', 'U'))
ALTER TABLE [dbo].[HAuditorias] WITH NOCHECK  ADD CONSTRAINT [FK_HAuditorias_CalenNomina] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HAuditorias_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAuditorias]', 'U'))
ALTER TABLE [dbo].[HAuditorias] WITH NOCHECK  ADD CONSTRAINT [FK_HAuditorias_EMPLEADOS] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_397]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HAuditorias]', 'U'))
ALTER TABLE [dbo].[HAuditorias] WITH NOCHECK  ADD CONSTRAINT [R_397] FOREIGN KEY ([Id_Concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[HBajas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_548]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBajas]', 'U'))
ALTER TABLE [dbo].[HBajas] WITH NOCHECK  ADD CONSTRAINT [R_548] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_549]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBajas]', 'U'))
ALTER TABLE [dbo].[HBajas] WITH NOCHECK  ADD CONSTRAINT [R_549] FOREIGN KEY ([Id_Motivoe]) REFERENCES [dbo].[TRazBaj] ([Id_Razon])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_551]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBajas]', 'U'))
ALTER TABLE [dbo].[HBajas] WITH NOCHECK  ADD CONSTRAINT [R_551] FOREIGN KEY ([Id_Motivss]) REFERENCES [dbo].[TRazBaj] ([Id_Razon])
GO
PRINT N'Adding foreign keys to [dbo].[HBecas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_529]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBecas]', 'U'))
ALTER TABLE [dbo].[HBecas] WITH NOCHECK  ADD CONSTRAINT [R_529] FOREIGN KEY ([Id_TipoBeca]) REFERENCES [dbo].[TBecTipo] ([Id_TipoBeca])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_530]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBecas]', 'U'))
ALTER TABLE [dbo].[HBecas] WITH NOCHECK  ADD CONSTRAINT [R_530] FOREIGN KEY ([Id_Escuela]) REFERENCES [dbo].[TBecEscue] ([Id_Escuela])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_531]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBecas]', 'U'))
ALTER TABLE [dbo].[HBecas] WITH NOCHECK  ADD CONSTRAINT [R_531] FOREIGN KEY ([Id_Grados]) REFERENCES [dbo].[TBecGrados] ([Id_Grados])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_532]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBecas]', 'U'))
ALTER TABLE [dbo].[HBecas] WITH NOCHECK  ADD CONSTRAINT [R_532] FOREIGN KEY ([Id_Especialidad]) REFERENCES [dbo].[TBecEspec] ([Id_Especialidad])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_533]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HBecas]', 'U'))
ALTER TABLE [dbo].[HBecas] WITH NOCHECK  ADD CONSTRAINT [R_533] FOREIGN KEY ([Id_Empleado]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[HCastigos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_544]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCastigos]', 'U'))
ALTER TABLE [dbo].[HCastigos] WITH NOCHECK  ADD CONSTRAINT [R_544] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_545]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCastigos]', 'U'))
ALTER TABLE [dbo].[HCastigos] WITH NOCHECK  ADD CONSTRAINT [R_545] FOREIGN KEY ([Id_Razon]) REFERENCES [dbo].[TRazCas] ([Id_RazCas])
GO
PRINT N'Adding foreign keys to [dbo].[HCategorias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HCategorias_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCategorias]', 'U'))
ALTER TABLE [dbo].[HCategorias] WITH NOCHECK  ADD CONSTRAINT [FK_HCategorias_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HCategorias_TCategorias]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCategorias]', 'U'))
ALTER TABLE [dbo].[HCategorias] WITH NOCHECK  ADD CONSTRAINT [FK_HCategorias_TCategorias] FOREIGN KEY ([Id_rel]) REFERENCES [dbo].[TCategorias] ([Id_Categorias])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_553]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCategorias]', 'U'))
ALTER TABLE [dbo].[HCategorias] WITH NOCHECK  ADD CONSTRAINT [R_553] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HCia]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HCia_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCia]', 'U'))
ALTER TABLE [dbo].[HCia] WITH NOCHECK  ADD CONSTRAINT [FK_HCia_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HCia_TCia]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCia]', 'U'))
ALTER TABLE [dbo].[HCia] WITH NOCHECK  ADD CONSTRAINT [FK_HCia_TCia] FOREIGN KEY ([Id_rel]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_555]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HCia]', 'U'))
ALTER TABLE [dbo].[HCia] WITH NOCHECK  ADD CONSTRAINT [R_555] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HDepartamentos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HDepartamentos_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HDepartamentos]', 'U'))
ALTER TABLE [dbo].[HDepartamentos] WITH NOCHECK  ADD CONSTRAINT [FK_HDepartamentos_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HDepartamentos_TDepartamentos]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HDepartamentos]', 'U'))
ALTER TABLE [dbo].[HDepartamentos] WITH NOCHECK  ADD CONSTRAINT [FK_HDepartamentos_TDepartamentos] FOREIGN KEY ([Id_rel]) REFERENCES [dbo].[TDepartamentos] ([Id_Departamentos])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_559]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HDepartamentos]', 'U'))
ALTER TABLE [dbo].[HDepartamentos] WITH NOCHECK  ADD CONSTRAINT [R_559] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HErroresPassword]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_648]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HErroresPassword]', 'U'))
ALTER TABLE [dbo].[HErroresPassword] WITH NOCHECK  ADD CONSTRAINT [R_648] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HFaltasInd]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_556]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HFaltasInd]', 'U'))
ALTER TABLE [dbo].[HFaltasInd] WITH NOCHECK  ADD CONSTRAINT [R_556] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_557]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HFaltasInd]', 'U'))
ALTER TABLE [dbo].[HFaltasInd] WITH NOCHECK  ADD CONSTRAINT [R_557] FOREIGN KEY ([Id_Razon]) REFERENCES [dbo].[TRazFal] ([Id_RazFal])
GO
PRINT N'Adding foreign keys to [dbo].[HHorarios]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HHorarios_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HHorarios]', 'U'))
ALTER TABLE [dbo].[HHorarios] WITH NOCHECK  ADD CONSTRAINT [FK_HHorarios_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_564]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HHorarios]', 'U'))
ALTER TABLE [dbo].[HHorarios] WITH NOCHECK  ADD CONSTRAINT [R_564] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HIncapacidades]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HIncapacidades_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HIncapacidades]', 'U'))
ALTER TABLE [dbo].[HIncapacidades] WITH NOCHECK  ADD CONSTRAINT [FK_HIncapacidades_EMPLEADOS] FOREIGN KEY ([Id_EMP]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_565]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HIncapacidades]', 'U'))
ALTER TABLE [dbo].[HIncapacidades] WITH NOCHECK  ADD CONSTRAINT [R_565] FOREIGN KEY ([Id_Razon]) REFERENCES [dbo].[TRazInc] ([Id_RazInc])
GO
PRINT N'Adding foreign keys to [dbo].[HLineas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HLineas_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HLineas]', 'U'))
ALTER TABLE [dbo].[HLineas] WITH NOCHECK  ADD CONSTRAINT [FK_HLineas_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HLineas_TLineas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HLineas]', 'U'))
ALTER TABLE [dbo].[HLineas] WITH NOCHECK  ADD CONSTRAINT [FK_HLineas_TLineas] FOREIGN KEY ([Id_rel]) REFERENCES [dbo].[TLineas] ([Id_Lineas])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_547]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HLineas]', 'U'))
ALTER TABLE [dbo].[HLineas] WITH NOCHECK  ADD CONSTRAINT [R_547] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HNivelPlazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HNivelPlaza_TNivel]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivelPlazas]', 'U'))
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK  ADD CONSTRAINT [FK_HNivelPlaza_TNivel] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TNivel] ([Id_Nivel])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_33]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivelPlazas]', 'U'))
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK  ADD CONSTRAINT [R_33] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_33HNivelPlaza]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivelPlazas]', 'U'))
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK  ADD CONSTRAINT [R_33HNivelPlaza] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_554HNivelPlaza]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivelPlazas]', 'U'))
ALTER TABLE [dbo].[HNivelPlazas] WITH NOCHECK  ADD CONSTRAINT [R_554HNivelPlaza] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HNivel]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HNivel_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivel]', 'U'))
ALTER TABLE [dbo].[HNivel] WITH NOCHECK  ADD CONSTRAINT [FK_HNivel_EMPLEADOS] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_554]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HNivel]', 'U'))
ALTER TABLE [dbo].[HNivel] WITH NOCHECK  ADD CONSTRAINT [R_554] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HOperacion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_591]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HOperacion]', 'U'))
ALTER TABLE [dbo].[HOperacion] WITH NOCHECK  ADD CONSTRAINT [R_591] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TOperaciones] ([Id_Operacion])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_592]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HOperacion]', 'U'))
ALTER TABLE [dbo].[HOperacion] WITH NOCHECK  ADD CONSTRAINT [R_592] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_593]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HOperacion]', 'U'))
ALTER TABLE [dbo].[HOperacion] WITH NOCHECK  ADD CONSTRAINT [R_593] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HOvertime]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_594]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HOvertime]', 'U'))
ALTER TABLE [dbo].[HOvertime] WITH NOCHECK  ADD CONSTRAINT [R_594] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[HPasswords]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_647]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPasswords]', 'U'))
ALTER TABLE [dbo].[HPasswords] WITH NOCHECK  ADD CONSTRAINT [R_647] FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HPlantas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_567]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlantas]', 'U'))
ALTER TABLE [dbo].[HPlantas] WITH NOCHECK  ADD CONSTRAINT [R_567] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TPlantas] ([Id_plantas])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_568]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlantas]', 'U'))
ALTER TABLE [dbo].[HPlantas] WITH NOCHECK  ADD CONSTRAINT [R_568] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_569]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlantas]', 'U'))
ALTER TABLE [dbo].[HPlantas] WITH NOCHECK  ADD CONSTRAINT [R_569] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[HPlazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_5]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlazas]', 'U'))
ALTER TABLE [dbo].[HPlazas] WITH NOCHECK  ADD CONSTRAINT [R_5] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_670]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlazas]', 'U'))
ALTER TABLE [dbo].[HPlazas] WITH NOCHECK  ADD CONSTRAINT [R_670] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_671]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPlazas]', 'U'))
ALTER TABLE [dbo].[HPlazas] WITH NOCHECK  ADD CONSTRAINT [R_671] FOREIGN KEY ([Id_TipoMovPlazas]) REFERENCES [dbo].[TTipoMovPlazas] ([Id_TipoMovPlazas])
GO
PRINT N'Adding foreign keys to [dbo].[HRotacion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_573]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HRotacion]', 'U'))
ALTER TABLE [dbo].[HRotacion] WITH NOCHECK  ADD CONSTRAINT [R_573] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_574]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HRotacion]', 'U'))
ALTER TABLE [dbo].[HRotacion] WITH NOCHECK  ADD CONSTRAINT [R_574] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TRotacion] ([Id_Rotacion])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_575]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HRotacion]', 'U'))
ALTER TABLE [dbo].[HRotacion] WITH NOCHECK  ADD CONSTRAINT [R_575] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HSALARIOS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HSALARIOS_EMPLEADOS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HSALARIOS]', 'U'))
ALTER TABLE [dbo].[HSALARIOS] WITH NOCHECK  ADD CONSTRAINT [FK_HSALARIOS_EMPLEADOS] FOREIGN KEY ([Id_EMP]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_572]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HSALARIOS]', 'U'))
ALTER TABLE [dbo].[HSALARIOS] WITH NOCHECK  ADD CONSTRAINT [R_572] FOREIGN KEY ([MotivoIncremento]) REFERENCES [dbo].[TMotivoIncr] ([id_motivoIncremento])
GO
PRINT N'Adding foreign keys to [dbo].[HSupervisor]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_580]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HSupervisor]', 'U'))
ALTER TABLE [dbo].[HSupervisor] WITH NOCHECK  ADD CONSTRAINT [R_580] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_581]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HSupervisor]', 'U'))
ALTER TABLE [dbo].[HSupervisor] WITH NOCHECK  ADD CONSTRAINT [R_581] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_582]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HSupervisor]', 'U'))
ALTER TABLE [dbo].[HSupervisor] WITH NOCHECK  ADD CONSTRAINT [R_582] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HTipoMO]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_596]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTipoMO]', 'U'))
ALTER TABLE [dbo].[HTipoMO] WITH NOCHECK  ADD CONSTRAINT [R_596] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_597]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTipoMO]', 'U'))
ALTER TABLE [dbo].[HTipoMO] WITH NOCHECK  ADD CONSTRAINT [R_597] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HTurnos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_586]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTurnos]', 'U'))
ALTER TABLE [dbo].[HTurnos] WITH NOCHECK  ADD CONSTRAINT [R_586] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TTurnos] ([Id_Turno])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_587]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTurnos]', 'U'))
ALTER TABLE [dbo].[HTurnos] WITH NOCHECK  ADD CONSTRAINT [R_587] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_588]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTurnos]', 'U'))
ALTER TABLE [dbo].[HTurnos] WITH NOCHECK  ADD CONSTRAINT [R_588] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[HVacaciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_589]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HVacaciones]', 'U'))
ALTER TABLE [dbo].[HVacaciones] WITH NOCHECK  ADD CONSTRAINT [R_589] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[Hpuestos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_560]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Hpuestos]', 'U'))
ALTER TABLE [dbo].[Hpuestos] WITH NOCHECK  ADD CONSTRAINT [R_560] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TPuestos] ([Id_Puestos])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_561]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Hpuestos]', 'U'))
ALTER TABLE [dbo].[Hpuestos] WITH NOCHECK  ADD CONSTRAINT [R_561] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_562]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Hpuestos]', 'U'))
ALTER TABLE [dbo].[Hpuestos] WITH NOCHECK  ADD CONSTRAINT [R_562] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[Infonavit]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_411]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Infonavit]', 'U'))
ALTER TABLE [dbo].[Infonavit] WITH NOCHECK  ADD CONSTRAINT [R_411] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[MensajesEmpleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_301]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[MensajesEmpleados]', 'U'))
ALTER TABLE [dbo].[MensajesEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_301] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[NoRelGrupos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_394]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[NoRelGrupos]', 'U'))
ALTER TABLE [dbo].[NoRelGrupos] WITH NOCHECK  ADD CONSTRAINT [R_394] FOREIGN KEY ([Id_Grupo]) REFERENCES [dbo].[NoGrupos] ([Id_Grupo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_395]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[NoRelGrupos]', 'U'))
ALTER TABLE [dbo].[NoRelGrupos] WITH NOCHECK  ADD CONSTRAINT [R_395] FOREIGN KEY ([Id_Empleado]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[Nom_Excepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_402]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_Excepciones]', 'U'))
ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_402] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_403]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_Excepciones]', 'U'))
ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_403] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_404]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_Excepciones]', 'U'))
ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_404] FOREIGN KEY ([Id_Clave]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_405]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_Excepciones]', 'U'))
ALTER TABLE [dbo].[Nom_Excepciones] WITH NOCHECK  ADD CONSTRAINT [R_405] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[Nom_HAuditorias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_406]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_HAuditorias]', 'U'))
ALTER TABLE [dbo].[Nom_HAuditorias] WITH NOCHECK  ADD CONSTRAINT [R_406] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_408]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_HAuditorias]', 'U'))
ALTER TABLE [dbo].[Nom_HAuditorias] WITH NOCHECK  ADD CONSTRAINT [R_408] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[Nom_pagos_hist]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_399_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] WITH NOCHECK  ADD CONSTRAINT [fk_R_399_n] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_400_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] WITH NOCHECK  ADD CONSTRAINT [fk_R_400_n] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_401_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] WITH NOCHECK  ADD CONSTRAINT [fk_R_401_n] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[Plantillas_Marcadores]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_479]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Plantillas_Marcadores]', 'U'))
ALTER TABLE [dbo].[Plantillas_Marcadores] WITH NOCHECK  ADD CONSTRAINT [R_479] FOREIGN KEY ([Id_plantilla]) REFERENCES [dbo].[Plantillas] ([Id_plantilla])
GO
PRINT N'Adding foreign keys to [dbo].[PlazaEmpleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_474]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlazaEmpleados]', 'U'))
ALTER TABLE [dbo].[PlazaEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_474] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_476]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlazaEmpleados]', 'U'))
ALTER TABLE [dbo].[PlazaEmpleados] WITH NOCHECK  ADD CONSTRAINT [R_476] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[PlazasOrgan]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_1]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlazasOrgan]', 'U'))
ALTER TABLE [dbo].[PlazasOrgan] WITH NOCHECK  ADD CONSTRAINT [R_1] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
PRINT N'Adding foreign keys to [dbo].[ProcesoPTU]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_629]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcesoPTU]', 'U'))
ALTER TABLE [dbo].[ProcesoPTU] WITH NOCHECK  ADD CONSTRAINT [R_629] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[RHExcepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_634]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RHExcepciones]', 'U'))
ALTER TABLE [dbo].[RHExcepciones] WITH NOCHECK  ADD CONSTRAINT [R_634] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[RelojSupervisor]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_314]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RelojSupervisor]', 'U'))
ALTER TABLE [dbo].[RelojSupervisor] WITH NOCHECK  ADD CONSTRAINT [R_314] FOREIGN KEY ([Id_reloj]) REFERENCES [dbo].[Relojes] ([Id_reloj])
GO
PRINT N'Adding foreign keys to [dbo].[RptSeccionGrupoFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_454]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptSeccionGrupoFormatos]', 'U'))
ALTER TABLE [dbo].[RptSeccionGrupoFormatos] WITH NOCHECK  ADD CONSTRAINT [R_454] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[SNoCobrados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_458]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SNoCobrados]', 'U'))
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK  ADD CONSTRAINT [R_458] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_459]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SNoCobrados]', 'U'))
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK  ADD CONSTRAINT [R_459] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_460]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SNoCobrados]', 'U'))
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK  ADD CONSTRAINT [R_460] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_461]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SNoCobrados]', 'U'))
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK  ADD CONSTRAINT [R_461] FOREIGN KEY ([Id_UserActivo]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_462]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SNoCobrados]', 'U'))
ALTER TABLE [dbo].[SNoCobrados] WITH NOCHECK  ADD CONSTRAINT [R_462] FOREIGN KEY ([Id_UserPagDep]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[SYSCAMPOS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_603]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSCAMPOS]', 'U'))
ALTER TABLE [dbo].[SYSCAMPOS] WITH NOCHECK  ADD CONSTRAINT [R_603] FOREIGN KEY ([IdTabla]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_604]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSCAMPOS]', 'U'))
ALTER TABLE [dbo].[SYSCAMPOS] WITH NOCHECK  ADD CONSTRAINT [R_604] FOREIGN KEY ([IdTipoCampo]) REFERENCES [dbo].[SysTipoCampo] ([IdTipoCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_640]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSCAMPOS]', 'U'))
ALTER TABLE [dbo].[SYSCAMPOS] WITH NOCHECK  ADD CONSTRAINT [R_640] FOREIGN KEY ([idTipoDato]) REFERENCES [dbo].[SysTipoDato] ([idTipoDato])
GO
PRINT N'Adding foreign keys to [dbo].[SYSRELACIONES]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_601]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSRELACIONES]', 'U'))
ALTER TABLE [dbo].[SYSRELACIONES] WITH NOCHECK  ADD CONSTRAINT [R_601] FOREIGN KEY ([IdTabla1]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_602]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSRELACIONES]', 'U'))
ALTER TABLE [dbo].[SYSRELACIONES] WITH NOCHECK  ADD CONSTRAINT [R_602] FOREIGN KEY ([IdTabla2]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_605]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSRELACIONES]', 'U'))
ALTER TABLE [dbo].[SYSRELACIONES] WITH NOCHECK  ADD CONSTRAINT [R_605] FOREIGN KEY ([IdCampoRel1]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_606]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSRELACIONES]', 'U'))
ALTER TABLE [dbo].[SYSRELACIONES] WITH NOCHECK  ADD CONSTRAINT [R_606] FOREIGN KEY ([IdCampoRel2]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[SYSTABLACATEGORIAS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_600]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSTABLACATEGORIAS]', 'U'))
ALTER TABLE [dbo].[SYSTABLACATEGORIAS] WITH NOCHECK  ADD CONSTRAINT [R_600] FOREIGN KEY ([IdTabla]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
PRINT N'Adding foreign keys to [dbo].[SYSTABLAS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_598]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSTABLAS]', 'U'))
ALTER TABLE [dbo].[SYSTABLAS] WITH NOCHECK  ADD CONSTRAINT [R_598] FOREIGN KEY ([IdBaseDatos]) REFERENCES [dbo].[SysBaseDatos] ([IdBaseDatos])
GO
PRINT N'Adding foreign keys to [dbo].[SalariosIntegrados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_615]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SalariosIntegrados]', 'U'))
ALTER TABLE [dbo].[SalariosIntegrados] WITH NOCHECK  ADD CONSTRAINT [R_615] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[SeccionesRpt]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_483]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SeccionesRpt]', 'U'))
ALTER TABLE [dbo].[SeccionesRpt] WITH NOCHECK  ADD CONSTRAINT [R_483] FOREIGN KEY ([Id_Reporte]) REFERENCES [dbo].[DisenioRpt] ([Id_Reporte])
GO
PRINT N'Adding foreign keys to [dbo].[SysParametros]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_610]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SysParametros]', 'U'))
ALTER TABLE [dbo].[SysParametros] WITH NOCHECK  ADD CONSTRAINT [R_610] FOREIGN KEY ([IdTabla]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
PRINT N'Adding foreign keys to [dbo].[SysProcesosTablas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_607]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SysProcesosTablas]', 'U'))
ALTER TABLE [dbo].[SysProcesosTablas] WITH NOCHECK  ADD CONSTRAINT [R_607] FOREIGN KEY ([IdTabla]) REFERENCES [dbo].[SYSTABLAS] ([IdTabla])
GO
PRINT N'Adding foreign keys to [dbo].[TConceptosNoProcesados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TConcepto__id_co__34030393]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TConceptosNoProcesados]', 'U'))
ALTER TABLE [dbo].[TConceptosNoProcesados] WITH NOCHECK  ADD CONSTRAINT [FK__TConcepto__id_co__34030393] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[TDiasIntegrados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_617]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TDiasIntegrados]', 'U'))
ALTER TABLE [dbo].[TDiasIntegrados] WITH NOCHECK  ADD CONSTRAINT [R_617] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TDirecciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_510]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TDirecciones]', 'U'))
ALTER TABLE [dbo].[TDirecciones] WITH NOCHECK  ADD CONSTRAINT [R_510] FOREIGN KEY ([Id_Pais]) REFERENCES [dbo].[TPais] ([Id_Pais])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_511]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TDirecciones]', 'U'))
ALTER TABLE [dbo].[TDirecciones] WITH NOCHECK  ADD CONSTRAINT [R_511] FOREIGN KEY ([Id_Ciudad]) REFERENCES [dbo].[TCiudad] ([Id_Ciudad])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_512]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TDirecciones]', 'U'))
ALTER TABLE [dbo].[TDirecciones] WITH NOCHECK  ADD CONSTRAINT [R_512] FOREIGN KEY ([Id_Colonia]) REFERENCES [dbo].[TColonia] ([Id_Colonia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_513]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TDirecciones]', 'U'))
ALTER TABLE [dbo].[TDirecciones] WITH NOCHECK  ADD CONSTRAINT [R_513] FOREIGN KEY ([Id_Estado]) REFERENCES [dbo].[TEstados] ([Id_Estado])
GO
PRINT N'Adding foreign keys to [dbo].[TE_AutPrevio]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_317]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TE_AutPrevio]', 'U'))
ALTER TABLE [dbo].[TE_AutPrevio] WITH NOCHECK  ADD CONSTRAINT [R_317] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_318]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TE_AutPrevio]', 'U'))
ALTER TABLE [dbo].[TE_AutPrevio] WITH NOCHECK  ADD CONSTRAINT [R_318] FOREIGN KEY ([Id_UserActivo]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[TFormulasRelaciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_381]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasRelaciones]', 'U'))
ALTER TABLE [dbo].[TFormulasRelaciones] WITH NOCHECK  ADD CONSTRAINT [R_381] FOREIGN KEY ([Pago]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_382]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasRelaciones]', 'U'))
ALTER TABLE [dbo].[TFormulasRelaciones] WITH NOCHECK  ADD CONSTRAINT [R_382] FOREIGN KEY ([Horas]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[TFormulasTipo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_383]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasTipo]', 'U'))
ALTER TABLE [dbo].[TFormulasTipo] WITH NOCHECK  ADD CONSTRAINT [R_383] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosCalendario]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_463]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosCalendario]', 'U'))
ALTER TABLE [dbo].[TProcesosCalendario] WITH NOCHECK  ADD CONSTRAINT [R_463] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosExcepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_471]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosExcepciones]', 'U'))
ALTER TABLE [dbo].[TProcesosExcepciones] WITH NOCHECK  ADD CONSTRAINT [R_471] FOREIGN KEY ([id_Clave]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosFormulas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_469]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosFormulas]', 'U'))
ALTER TABLE [dbo].[TProcesosFormulas] WITH NOCHECK  ADD CONSTRAINT [R_469] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosValorXDia]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_468]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosValorXDia]', 'U'))
ALTER TABLE [dbo].[TProcesosValorXDia] WITH NOCHECK  ADD CONSTRAINT [R_468] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosValorXPeriodo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_464]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosValorXPeriodo]', 'U'))
ALTER TABLE [dbo].[TProcesosValorXPeriodo] WITH NOCHECK  ADD CONSTRAINT [R_464] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_467]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosValorXPeriodo]', 'U'))
ALTER TABLE [dbo].[TProcesosValorXPeriodo] WITH NOCHECK  ADD CONSTRAINT [R_467] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TPropNodos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_37]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPropNodos]', 'U'))
ALTER TABLE [dbo].[TPropNodos] WITH NOCHECK  ADD CONSTRAINT [R_37] FOREIGN KEY ([id_CampoLlave]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_38]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPropNodos]', 'U'))
ALTER TABLE [dbo].[TPropNodos] WITH NOCHECK  ADD CONSTRAINT [R_38] FOREIGN KEY ([id_CampoClave]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_39]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPropNodos]', 'U'))
ALTER TABLE [dbo].[TPropNodos] WITH NOCHECK  ADD CONSTRAINT [R_39] FOREIGN KEY ([id_CampoNombre]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[TRepLegal]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_336]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TRepLegal]', 'U'))
ALTER TABLE [dbo].[TRepLegal] WITH NOCHECK  ADD CONSTRAINT [R_336] FOREIGN KEY ([Id_Empleado]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TTiempoExtra]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_444]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TTiempoExtra]', 'U'))
ALTER TABLE [dbo].[TTiempoExtra] WITH NOCHECK  ADD CONSTRAINT [R_444] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TTipoMovPlazas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_3]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TTipoMovPlazas]', 'U'))
ALTER TABLE [dbo].[TTipoMovPlazas] WITH NOCHECK  ADD CONSTRAINT [R_3] FOREIGN KEY ([IdCampo]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[TablaLongitud]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_657]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TablaLongitud]', 'U'))
ALTER TABLE [dbo].[TablaLongitud] WITH NOCHECK  ADD CONSTRAINT [R_657] FOREIGN KEY ([Id_Estructura]) REFERENCES [dbo].[TEstructura] ([Id_Estructura])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_658]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TablaLongitud]', 'U'))
ALTER TABLE [dbo].[TablaLongitud] WITH NOCHECK  ADD CONSTRAINT [R_658] FOREIGN KEY ([Id_CampoLlave]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_659]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TablaLongitud]', 'U'))
ALTER TABLE [dbo].[TablaLongitud] WITH NOCHECK  ADD CONSTRAINT [R_659] FOREIGN KEY ([Id_CampoClave]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_660]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TablaLongitud]', 'U'))
ALTER TABLE [dbo].[TablaLongitud] WITH NOCHECK  ADD CONSTRAINT [R_660] FOREIGN KEY ([Id_CampoNombre]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercidoDetallexRubro]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercidoDetallexrubro_Plazas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercidoDetallexRubro]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercidoDetallexRubro] WITH NOCHECK  ADD CONSTRAINT [FK_TacumuladoEjercidoDetallexrubro_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercidoDetallextipo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercidoDetallextipo_Plazas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercidoDetallextipo]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercidoDetallextipo] WITH NOCHECK  ADD CONSTRAINT [FK_TacumuladoEjercidoDetallextipo_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercido]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercido_Plazas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercido]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercido] WITH NOCHECK  ADD CONSTRAINT [FK_TacumuladoEjercido_Plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
PRINT N'Adding foreign keys to [dbo].[Tconceptos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_375]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tconceptos]', 'U'))
ALTER TABLE [dbo].[Tconceptos] WITH NOCHECK  ADD CONSTRAINT [R_375] FOREIGN KEY ([IdProceso]) REFERENCES [dbo].[Tprocesos] ([IdProceso])
GO
PRINT N'Adding foreign keys to [dbo].[TiempoIncompleto]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_305]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TiempoIncompleto]', 'U'))
ALTER TABLE [dbo].[TiempoIncompleto] WITH NOCHECK  ADD CONSTRAINT [R_305] FOREIGN KEY ([IdEmpleado]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[TiempoxDia]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_308]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TiempoxDia]', 'U'))
ALTER TABLE [dbo].[TiempoxDia] WITH NOCHECK  ADD CONSTRAINT [R_308] FOREIGN KEY ([IdEmpleado]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[excepcionesPlaza]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_44]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[excepcionesPlaza]', 'U'))
ALTER TABLE [dbo].[excepcionesPlaza] WITH NOCHECK  ADD CONSTRAINT [R_44] FOREIGN KEY ([Id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_45]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[excepcionesPlaza]', 'U'))
ALTER TABLE [dbo].[excepcionesPlaza] WITH NOCHECK  ADD CONSTRAINT [R_45] FOREIGN KEY ([id_concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
PRINT N'Adding foreign keys to [dbo].[hbancos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMP]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hbancos]', 'U'))
ALTER TABLE [dbo].[hbancos] WITH NOCHECK  ADD CONSTRAINT [FK_EMP] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[hccosto]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_542_R]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hccosto]', 'U'))
ALTER TABLE [dbo].[hccosto] WITH NOCHECK  ADD CONSTRAINT [R_542_R] FOREIGN KEY ([Id_Plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_543_R]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hccosto]', 'U'))
ALTER TABLE [dbo].[hccosto] WITH NOCHECK  ADD CONSTRAINT [R_543_R] FOREIGN KEY ([Id_User]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[hcuentas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPCTA]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hcuentas]', 'U'))
ALTER TABLE [dbo].[hcuentas] WITH NOCHECK  ADD CONSTRAINT [FK_EMPCTA] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[hcuentas_pension2]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPCTA2]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hcuentas_pension2]', 'U'))
ALTER TABLE [dbo].[hcuentas_pension2] WITH NOCHECK  ADD CONSTRAINT [FK_EMPCTA2] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[importacionCatalogosCampos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_449]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[importacionCatalogosCampos]', 'U'))
ALTER TABLE [dbo].[importacionCatalogosCampos] WITH NOCHECK  ADD CONSTRAINT [R_449] FOREIGN KEY ([IdCampo]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[importacionConfig]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_450]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[importacionConfig]', 'U'))
ALTER TABLE [dbo].[importacionConfig] WITH NOCHECK  ADD CONSTRAINT [R_450] FOREIGN KEY ([IdCampo]) REFERENCES [dbo].[SYSCAMPOS] ([IdCampo])
GO
PRINT N'Adding foreign keys to [dbo].[reldirecciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_515]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[reldirecciones]', 'U'))
ALTER TABLE [dbo].[reldirecciones] WITH NOCHECK  ADD CONSTRAINT [R_515] FOREIGN KEY ([Id_Emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[BolsaImprevistosEntidad]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BolsaImprevistosEntidad_fk_ConfigRS_id_razonsocial]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BolsaImprevistosEntidad]', 'U'))
ALTER TABLE [dbo].[BolsaImprevistosEntidad] ADD CONSTRAINT [BolsaImprevistosEntidad_fk_ConfigRS_id_razonsocial] FOREIGN KEY ([id_Razonsocial]) REFERENCES [dbo].[ConfigRS] ([id_razonsocial])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BolsaImprevistosEntidad_fk_Trubros_id_rubro]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BolsaImprevistosEntidad]', 'U'))
ALTER TABLE [dbo].[BolsaImprevistosEntidad] ADD CONSTRAINT [BolsaImprevistosEntidad_fk_Trubros_id_rubro] FOREIGN KEY ([id_rubro]) REFERENCES [dbo].[Trubros] ([id_rubro])
GO
PRINT N'Adding foreign keys to [dbo].[BtEmptur]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_turno]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BtEmptur]', 'U'))
ALTER TABLE [dbo].[BtEmptur] ADD CONSTRAINT [fk_turno] FOREIGN KEY ([Id_Turno]) REFERENCES [dbo].[TTurnos] ([Id_Turno])
GO
PRINT N'Adding foreign keys to [dbo].[Calculo_ConceptosEjecucion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_Calculo_ConceptosEjecucion_Id_Concepto]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Calculo_ConceptosEjecucion]', 'U'))
ALTER TABLE [dbo].[Calculo_ConceptosEjecucion] ADD CONSTRAINT [IX_Calculo_ConceptosEjecucion_Id_Concepto] FOREIGN KEY ([Id_Concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_Calculo_ConceptosEjecucion_Id_Periodo]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Calculo_ConceptosEjecucion]', 'U'))
ALTER TABLE [dbo].[Calculo_ConceptosEjecucion] ADD CONSTRAINT [IX_Calculo_ConceptosEjecucion_Id_Periodo] FOREIGN KEY ([Id_Periodo]) REFERENCES [dbo].[CalenNomina] ([Id_Periodo])
GO
PRINT N'Adding foreign keys to [dbo].[CalenNomina]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_agru]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[CalenNomina]', 'U'))
ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [fk_agru] FOREIGN KEY ([id_AgrupPeriodos]) REFERENCES [dbo].[T_AgrupPeriodos] ([id_AgrupPeriodos])
GO
PRINT N'Adding foreign keys to [dbo].[Conceptos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Conceptos_TCatConceptos]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Conceptos]', 'U'))
ALTER TABLE [dbo].[Conceptos] ADD CONSTRAINT [FK_Conceptos_TCatConceptos] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[TCatConcepto] ([id])
GO
PRINT N'Adding foreign keys to [dbo].[ConfigNominasWizard]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NomWiz]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ConfigNominasWizard]', 'U'))
ALTER TABLE [dbo].[ConfigNominasWizard] ADD CONSTRAINT [FK_NomWiz] FOREIGN KEY ([Id_Cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[FUP_CT_DRSE]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_drse_fup_ct_drse_fup_drse]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_CT_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_CT_DRSE] ADD CONSTRAINT [FK_id_drse_fup_ct_drse_fup_drse] FOREIGN KEY ([id_drse]) REFERENCES [dbo].[FUP_DRSE] ([id_drse]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_region_fup_ct_drse_tct_region]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_CT_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_CT_DRSE] ADD CONSTRAINT [FK_id_region_fup_ct_drse_tct_region] FOREIGN KEY ([id_region]) REFERENCES [dbo].[TCT_Region] ([id_CT_Region]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[FUP_PLAZA_DRSE]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_drse_fup_plaza_drse_fup_drse]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_PLAZA_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_PLAZA_DRSE] ADD CONSTRAINT [FK_id_drse_fup_plaza_drse_fup_drse] FOREIGN KEY ([id_drse]) REFERENCES [dbo].[FUP_DRSE] ([id_drse]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_plaza_fup_plaza_drse_plazas]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_PLAZA_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_PLAZA_DRSE] ADD CONSTRAINT [FK_id_plaza_fup_plaza_drse_plazas] FOREIGN KEY ([id_plaza]) REFERENCES [dbo].[Plazas] ([Id_plaza]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[FUP_RelMotMovTemplate]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FUP_RelMo__Id_Mo__31C8EF27]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_RelMotMovTemplate]', 'U'))
ALTER TABLE [dbo].[FUP_RelMotMovTemplate] ADD CONSTRAINT [FK__FUP_RelMo__Id_Mo__31C8EF27] FOREIGN KEY ([Id_MotivoMovimiento]) REFERENCES [dbo].[FUP_MotivoMovimiento] ([Id_MotivoMovimiento])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FUP_RelMo__Id_Te__32BD1360]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_RelMotMovTemplate]', 'U'))
ALTER TABLE [dbo].[FUP_RelMotMovTemplate] ADD CONSTRAINT [FK__FUP_RelMo__Id_Te__32BD1360] FOREIGN KEY ([Id_Template]) REFERENCES [dbo].[FUP_Template] ([Id_Template])
GO
PRINT N'Adding foreign keys to [dbo].[FUP_USUARIO_DRSE]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_drse_fup_usuario_drse_fup_drse]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_USUARIO_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_USUARIO_DRSE] ADD CONSTRAINT [FK_id_drse_fup_usuario_drse_fup_drse] FOREIGN KEY ([id_drse]) REFERENCES [dbo].[FUP_DRSE] ([id_drse]) ON DELETE CASCADE ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_usuario_fup_usuario_drse_usuarios]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[FUP_USUARIO_DRSE]', 'U'))
ALTER TABLE [dbo].[FUP_USUARIO_DRSE] ADD CONSTRAINT [FK_id_usuario_fup_usuario_drse_usuarios] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[HPerMigr]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_566]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HPerMigr]', 'U'))
ALTER TABLE [dbo].[HPerMigr] ADD CONSTRAINT [R_566] FOREIGN KEY ([Id_TipoPerm]) REFERENCES [dbo].[TTipPerm] ([Id_TipoPerm])
GO
PRINT N'Adding foreign keys to [dbo].[HTipoMO]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_595]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[HTipoMO]', 'U'))
ALTER TABLE [dbo].[HTipoMO] ADD CONSTRAINT [R_595] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TTipoMO] ([id_TipoMO])
GO
PRINT N'Adding foreign keys to [dbo].[MensajesEmpleados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_302]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[MensajesEmpleados]', 'U'))
ALTER TABLE [dbo].[MensajesEmpleados] ADD CONSTRAINT [R_302] FOREIGN KEY ([idmsg]) REFERENCES [dbo].[Mensajes] ([idmsg])
GO
PRINT N'Adding foreign keys to [dbo].[MensajesFiltros]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_304]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[MensajesFiltros]', 'U'))
ALTER TABLE [dbo].[MensajesFiltros] ADD CONSTRAINT [R_304] FOREIGN KEY ([idmsg]) REFERENCES [dbo].[Mensajes] ([idmsg])
GO
PRINT N'Adding foreign keys to [dbo].[Parametros]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_398]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Parametros]', 'U'))
ALTER TABLE [dbo].[Parametros] ADD CONSTRAINT [R_398] FOREIGN KEY ([Id_Compania]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[Perfil_Usuarios]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Perfil_Us__id_us__5ED1AF96]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Perfil_Usuarios]', 'U'))
ALTER TABLE [dbo].[Perfil_Usuarios] ADD FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[PlantillasCalculoCia]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Plantilla__Id_ci__7BC7396A]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasCalculoCia]', 'U'))
ALTER TABLE [dbo].[PlantillasCalculoCia] ADD CONSTRAINT [FK__Plantilla__Id_ci__7BC7396A] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Plantilla__Id_Pl__7AD31531]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasCalculoCia]', 'U'))
ALTER TABLE [dbo].[PlantillasCalculoCia] ADD CONSTRAINT [FK__Plantilla__Id_Pl__7AD31531] FOREIGN KEY ([Id_Plantillascalculo]) REFERENCES [dbo].[TPlantillasCalculo] ([Id_PlantillasCalculo])
GO
PRINT N'Adding foreign keys to [dbo].[PlantillasConceptos_Detalle]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_PlantillasConceptos_Detalle_Id_Concepto]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasConceptos_Detalle]', 'U'))
ALTER TABLE [dbo].[PlantillasConceptos_Detalle] ADD CONSTRAINT [IX_PlantillasConceptos_Detalle_Id_Concepto] FOREIGN KEY ([Id_Concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_PlantillasConceptos_Detalle_Id_PlantillasConceptos]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasConceptos_Detalle]', 'U'))
ALTER TABLE [dbo].[PlantillasConceptos_Detalle] ADD CONSTRAINT [IX_PlantillasConceptos_Detalle_Id_PlantillasConceptos] FOREIGN KEY ([Id_PlantillasConceptos]) REFERENCES [dbo].[TplantillasConceptos] ([Id_PlantillasConceptos])
GO
PRINT N'Adding foreign keys to [dbo].[PlantillasConceptos_RS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_PlantillasConceptos_RS_Id_PlantillasConceptos]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasConceptos_RS]', 'U'))
ALTER TABLE [dbo].[PlantillasConceptos_RS] ADD CONSTRAINT [IX_PlantillasConceptos_RS_Id_PlantillasConceptos] FOREIGN KEY ([Id_PlantillasConceptos]) REFERENCES [dbo].[TplantillasConceptos] ([Id_PlantillasConceptos])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[IX_PlantillasConceptos_RS_Id_RS]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlantillasConceptos_RS]', 'U'))
ALTER TABLE [dbo].[PlantillasConceptos_RS] ADD CONSTRAINT [IX_PlantillasConceptos_RS_Id_RS] FOREIGN KEY ([Id_RS]) REFERENCES [dbo].[ConfigRS] ([id_razonsocial])
GO
PRINT N'Adding foreign keys to [dbo].[PlazasOrgan]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_2]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[PlazasOrgan]', 'U'))
ALTER TABLE [dbo].[PlazasOrgan] ADD CONSTRAINT [R_2] FOREIGN KEY ([Id_Nodo]) REFERENCES [dbo].[TablaConfigOrgan] ([Id_Nodo])
GO
PRINT N'Adding foreign keys to [dbo].[RPartidaPre_Conceptos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_parconrel]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RPartidaPre_Conceptos]', 'U'))
ALTER TABLE [dbo].[RPartidaPre_Conceptos] ADD CONSTRAINT [fk_parconrel] FOREIGN KEY ([id_rel]) REFERENCES [dbo].[TPartidaPre_Conceptos] ([id_PartidaPre_Conceptos])
GO
PRINT N'Adding foreign keys to [dbo].[RelConceptoSicapron]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RelConcep__id_Ti__0FD1DD92]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RelConceptoSicapron]', 'U'))
ALTER TABLE [dbo].[RelConceptoSicapron] ADD FOREIGN KEY ([id_TipoConcepto]) REFERENCES [dbo].[TipoConceptoSicapron] ([id_TipoConcepto])
GO
PRINT N'Adding foreign keys to [dbo].[RelGrupoSicapron]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RelGrupoS__Id_Gr__295BDA14]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RelGrupoSicapron]', 'U'))
ALTER TABLE [dbo].[RelGrupoSicapron] ADD FOREIGN KEY ([Id_Grupo]) REFERENCES [dbo].[TGrupoSicapron] ([Id_Grupo])
GO
PRINT N'Adding foreign keys to [dbo].[Rel_SPD_Nombramiento_Funcion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_tipo_funcion]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Rel_SPD_Nombramiento_Funcion]', 'U'))
ALTER TABLE [dbo].[Rel_SPD_Nombramiento_Funcion] ADD CONSTRAINT [FK_id_tipo_funcion] FOREIGN KEY ([id_tipo_funcion]) REFERENCES [dbo].[SPD_Tipo_Funciones] ([id_tipo_funcion])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_tipo_nombramiento]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Rel_SPD_Nombramiento_Funcion]', 'U'))
ALTER TABLE [dbo].[Rel_SPD_Nombramiento_Funcion] ADD CONSTRAINT [FK_id_tipo_nombramiento] FOREIGN KEY ([id_tipo_nombramiento]) REFERENCES [dbo].[SPD_Tipo_Nombramiento] ([id_tipo_nombramiento])
GO
PRINT N'Adding foreign keys to [dbo].[RelojSupervisor]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_315]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RelojSupervisor]', 'U'))
ALTER TABLE [dbo].[RelojSupervisor] ADD CONSTRAINT [R_315] FOREIGN KEY ([Id_Supervisor]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor])
GO
PRINT N'Adding foreign keys to [dbo].[RptCamposFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_457]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptCamposFormatos]', 'U'))
ALTER TABLE [dbo].[RptCamposFormatos] ADD CONSTRAINT [R_457] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion])
GO
PRINT N'Adding foreign keys to [dbo].[RptExportacionFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_622]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptExportacionFormatos]', 'U'))
ALTER TABLE [dbo].[RptExportacionFormatos] ADD CONSTRAINT [R_622] FOREIGN KEY ([Id_Reporte]) REFERENCES [dbo].[Tprocesos] ([IdProceso])
GO
PRINT N'Adding foreign keys to [dbo].[RptFiguraFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_451]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptFiguraFormatos]', 'U'))
ALTER TABLE [dbo].[RptFiguraFormatos] ADD CONSTRAINT [R_451] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion])
GO
PRINT N'Adding foreign keys to [dbo].[RptLineaFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_455]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptLineaFormatos]', 'U'))
ALTER TABLE [dbo].[RptLineaFormatos] ADD CONSTRAINT [R_455] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion])
GO
PRINT N'Adding foreign keys to [dbo].[RptPictureFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_452]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptPictureFormatos]', 'U'))
ALTER TABLE [dbo].[RptPictureFormatos] ADD CONSTRAINT [R_452] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion])
GO
PRINT N'Adding foreign keys to [dbo].[RptSeccionGrupoFormatos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_453]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[RptSeccionGrupoFormatos]', 'U'))
ALTER TABLE [dbo].[RptSeccionGrupoFormatos] ADD CONSTRAINT [R_453] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion])
GO
PRINT N'Adding foreign keys to [dbo].[SM_Supervisores]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_329]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SM_Supervisores]', 'U'))
ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [R_329] FOREIGN KEY ([id_sm]) REFERENCES [dbo].[SupMaestros] ([id_sm])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_330]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SM_Supervisores]', 'U'))
ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [R_330] FOREIGN KEY ([Id_Supervisor]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_331]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SM_Supervisores]', 'U'))
ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [R_331] FOREIGN KEY ([cia_super]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Asignatura_Basica]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spd_asignatura_basica]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Asignatura_Basica]', 'U'))
ALTER TABLE [dbo].[SPD_Asignatura_Basica] ADD CONSTRAINT [FK_spd_asignatura_basica] FOREIGN KEY ([id_nivel_educativo]) REFERENCES [dbo].[SPD_Nivel_Educativo] ([id_nivel_educativo])
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Evaluados]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spd_id_emp]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Evaluados]', 'U'))
ALTER TABLE [dbo].[SPD_Evaluados] ADD CONSTRAINT [FK_spd_id_emp] FOREIGN KEY ([id_emp]) REFERENCES [dbo].[Empleados] ([Id_Emp])
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Evaluados_Detalle]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_registro_spd]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Evaluados_Detalle]', 'U'))
ALTER TABLE [dbo].[SPD_Evaluados_Detalle] ADD CONSTRAINT [FK_id_registro_spd] FOREIGN KEY ([id_registro_spd]) REFERENCES [dbo].[SPD_Evaluados] ([id_registro_spd])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_tipo_concurso]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Evaluados_Detalle]', 'U'))
ALTER TABLE [dbo].[SPD_Evaluados_Detalle] ADD CONSTRAINT [FK_id_tipo_concurso] FOREIGN KEY ([id_tipo_concurso]) REFERENCES [dbo].[SPD_Tipo_Concurso] ([id_tipo_concurso])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_tipo_evaluacion]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Evaluados_Detalle]', 'U'))
ALTER TABLE [dbo].[SPD_Evaluados_Detalle] ADD CONSTRAINT [FK_id_tipo_evaluacion] FOREIGN KEY ([id_tipo_evaluacion]) REFERENCES [dbo].[SPD_Tipo_Evaluacion] ([id_tipo_evaluacion])
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Evaluados_Hist]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_detalle_spd]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Evaluados_Hist]', 'U'))
ALTER TABLE [dbo].[SPD_Evaluados_Hist] ADD CONSTRAINT [FK_id_detalle_spd] FOREIGN KEY ([id_detalle_spd]) REFERENCES [dbo].[SPD_Evaluados_Detalle] ([id_detalle_spd])
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Tipo_Nombramiento]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_id_tipo_vacante]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Tipo_Nombramiento]', 'U'))
ALTER TABLE [dbo].[SPD_Tipo_Nombramiento] ADD CONSTRAINT [FK_id_tipo_vacante] FOREIGN KEY ([id_tipo_vacante]) REFERENCES [dbo].[SPD_Tipo_Vacante] ([id_tipo_vacante]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[SPD_Tipo_Servicio]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_spd_tipo_servicio]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SPD_Tipo_Servicio]', 'U'))
ALTER TABLE [dbo].[SPD_Tipo_Servicio] ADD CONSTRAINT [FK_spd_tipo_servicio] FOREIGN KEY ([id_nivel_educativo]) REFERENCES [dbo].[SPD_Nivel_Educativo] ([id_nivel_educativo])
GO
PRINT N'Adding foreign keys to [dbo].[SYSTABLACATEGORIAS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_599]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSTABLACATEGORIAS]', 'U'))
ALTER TABLE [dbo].[SYSTABLACATEGORIAS] ADD CONSTRAINT [R_599] FOREIGN KEY ([IdCategoria]) REFERENCES [dbo].[SysCategorias] ([IdCategoria])
GO
PRINT N'Adding foreign keys to [dbo].[SYSTABLAS]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_Id_SubAgrupador]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSTABLAS]', 'U'))
ALTER TABLE [dbo].[SYSTABLAS] ADD CONSTRAINT [fk_Id_SubAgrupador] FOREIGN KEY ([id_SubAgrupador]) REFERENCES [dbo].[TSubAgrupadores] ([id_SubAgrupador])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SYSTABLAS_Tagrupador]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SYSTABLAS]', 'U'))
ALTER TABLE [dbo].[SYSTABLAS] ADD CONSTRAINT [FK_SYSTABLAS_Tagrupador] FOREIGN KEY ([id_agrupador]) REFERENCES [dbo].[Tagrupador] ([id_agrupador])
GO
PRINT N'Adding foreign keys to [dbo].[SaldosRecibos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_421]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SaldosRecibos]', 'U'))
ALTER TABLE [dbo].[SaldosRecibos] ADD CONSTRAINT [R_421] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[SupMaestros]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_327]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SupMaestros]', 'U'))
ALTER TABLE [dbo].[SupMaestros] ADD CONSTRAINT [R_327] FOREIGN KEY ([Id_Supervisorm]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_328]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SupMaestros]', 'U'))
ALTER TABLE [dbo].[SupMaestros] ADD CONSTRAINT [R_328] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[SysFuncionesParam]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_608]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[SysFuncionesParam]', 'U'))
ALTER TABLE [dbo].[SysFuncionesParam] ADD CONSTRAINT [R_608] FOREIGN KEY ([IdFuncion]) REFERENCES [dbo].[SysFunciones] ([IdFuncion])
GO
PRINT N'Adding foreign keys to [dbo].[TCategorias]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_552]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TCategorias]', 'U'))
ALTER TABLE [dbo].[TCategorias] ADD CONSTRAINT [R_552] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[TLayoutsEmpleado]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_id_Cia]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TLayoutsEmpleado]', 'U'))
ALTER TABLE [dbo].[TLayoutsEmpleado] ADD CONSTRAINT [fk_id_Cia] FOREIGN KEY ([id_Cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[TPlantillasCalculoConfig]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TPlantill__Id_Co__78EACCBF]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPlantillasCalculoConfig]', 'U'))
ALTER TABLE [dbo].[TPlantillasCalculoConfig] ADD CONSTRAINT [FK__TPlantill__Id_Co__78EACCBF] FOREIGN KEY ([Id_Concepto]) REFERENCES [dbo].[Conceptos] ([id_concepto])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TPlantill__Id_Pl__77F6A886]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPlantillasCalculoConfig]', 'U'))
ALTER TABLE [dbo].[TPlantillasCalculoConfig] ADD CONSTRAINT [FK__TPlantill__Id_Pl__77F6A886] FOREIGN KEY ([Id_Plantillascalculo]) REFERENCES [dbo].[TPlantillasCalculo] ([Id_PlantillasCalculo])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosCalendario]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_465]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosCalendario]', 'U'))
ALTER TABLE [dbo].[TProcesosCalendario] ADD CONSTRAINT [R_465] FOREIGN KEY ([Id_Proceso]) REFERENCES [dbo].[Tconceptos] ([IdConcepto])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosExcepciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_470]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosExcepciones]', 'U'))
ALTER TABLE [dbo].[TProcesosExcepciones] ADD CONSTRAINT [R_470] FOREIGN KEY ([Id_Proceso]) REFERENCES [dbo].[Tconceptos] ([IdConcepto])
GO
PRINT N'Adding foreign keys to [dbo].[TProcesosVariables]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_645]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TProcesosVariables]', 'U'))
ALTER TABLE [dbo].[TProcesosVariables] ADD CONSTRAINT [R_645] FOREIGN KEY ([IdProceso]) REFERENCES [dbo].[Tprocesos] ([IdProceso])
GO
PRINT N'Adding foreign keys to [dbo].[TPropNodos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_43]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TPropNodos]', 'U'))
ALTER TABLE [dbo].[TPropNodos] ADD CONSTRAINT [R_43] FOREIGN KEY ([Id_TablaLongitud]) REFERENCES [dbo].[TablaLongitud] ([Id_TablaLongitud])
GO
PRINT N'Adding foreign keys to [dbo].[TSupervisor]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_576]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TSupervisor]', 'U'))
ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [R_576] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_577]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TSupervisor]', 'U'))
ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [R_577] FOREIGN KEY ([Id_Turno]) REFERENCES [dbo].[TTurnos] ([Id_Turno])
GO
PRINT N'Adding foreign keys to [dbo].[TTiempoExtra]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_445]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TTiempoExtra]', 'U'))
ALTER TABLE [dbo].[TTiempoExtra] ADD CONSTRAINT [R_445] FOREIGN KEY ([Id_cia]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[TTipoExcepcionesTyA]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_643]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TTipoExcepcionesTyA]', 'U'))
ALTER TABLE [dbo].[TTipoExcepcionesTyA] ADD CONSTRAINT [R_643] FOREIGN KEY ([Id_ClaCardex]) REFERENCES [dbo].[TClaCardex] ([Id_ClaCardex])
GO
PRINT N'Adding foreign keys to [dbo].[TVacaciones]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_590]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TVacaciones]', 'U'))
ALTER TABLE [dbo].[TVacaciones] ADD CONSTRAINT [R_590] FOREIGN KEY ([CIA]) REFERENCES [dbo].[TCia] ([Id_cia])
GO
PRINT N'Adding foreign keys to [dbo].[TablaConfigOrgan]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_661]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TablaConfigOrgan]', 'U'))
ALTER TABLE [dbo].[TablaConfigOrgan] ADD CONSTRAINT [R_661] FOREIGN KEY ([Id_TablaLongitud]) REFERENCES [dbo].[TablaLongitud] ([Id_TablaLongitud])
GO
PRINT N'Adding foreign keys to [dbo].[Tabla_Facturas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__Id_Em__7FAADA76]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas] ADD CONSTRAINT [FK__Tabla_Fac__Id_Em__7FAADA76] FOREIGN KEY ([Id_Empresa]) REFERENCES [dbo].[Catalogo_Empresas_Facturacion] ([Id_Empresa])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__IdRs___009EFEAF]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas] ADD CONSTRAINT [FK__Tabla_Fac__IdRs___009EFEAF] FOREIGN KEY ([IdRs_Cliente]) REFERENCES [dbo].[Trs_Cliente] ([Id_RazonSocial])
GO
PRINT N'Adding foreign keys to [dbo].[Tabla_Facturas_Detalle]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__Id_co__037B6B5A]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas_Detalle]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas_Detalle] ADD CONSTRAINT [FK__Tabla_Fac__Id_co__037B6B5A] FOREIGN KEY ([Id_conceptos]) REFERENCES [dbo].[Catalogo_Conceptos_Facturas_NC] ([Id_Conceptos])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__Id_Fa__02874721]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas_Detalle]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas_Detalle] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__02874721] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura])
GO
PRINT N'Adding foreign keys to [dbo].[Tabla_Facturas_Distribucion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__Id_Fa__0B2B72CD]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas_Distribucion]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas_Distribucion] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__0B2B72CD] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura])
GO
PRINT N'Adding foreign keys to [dbo].[Tabla_Facturas_Periodos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tabla_Fac__Id_Fa__74A863BC]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabla_Facturas_Periodos]', 'U'))
ALTER TABLE [dbo].[Tabla_Facturas_Periodos] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__74A863BC] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercidoDetallexRubro]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercidoDetallexrubro_Trubros]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercidoDetallexRubro]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercidoDetallexRubro] ADD CONSTRAINT [FK_TacumuladoEjercidoDetallexrubro_Trubros] FOREIGN KEY ([id_rubro]) REFERENCES [dbo].[Trubros] ([id_rubro])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercidoDetallextipo]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercidoDetallextipo_TTipoPresupuesto]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercidoDetallextipo]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercidoDetallextipo] ADD CONSTRAINT [FK_TacumuladoEjercidoDetallextipo_TTipoPresupuesto] FOREIGN KEY ([id_tipo]) REFERENCES [dbo].[TTipoPresupuesto] ([idtipo])
GO
PRINT N'Adding foreign keys to [dbo].[TacumuladoEjercido]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TacumuladoEjercido_TablaConfigOrgan]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TacumuladoEjercido]', 'U'))
ALTER TABLE [dbo].[TacumuladoEjercido] ADD CONSTRAINT [FK_TacumuladoEjercido_TablaConfigOrgan] FOREIGN KEY ([id_nodo]) REFERENCES [dbo].[TablaConfigOrgan] ([Id_Nodo])
GO
PRINT N'Adding foreign keys to [dbo].[Tformulas_28092012a]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_377]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Tformulas_28092012a]', 'U'))
ALTER TABLE [dbo].[Tformulas_28092012a] ADD CONSTRAINT [R_377] FOREIGN KEY ([IdConcepto]) REFERENCES [dbo].[Tconceptos] ([IdConcepto])
GO
PRINT N'Adding foreign keys to [dbo].[hbancos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BAN]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hbancos]', 'U'))
ALTER TABLE [dbo].[hbancos] ADD CONSTRAINT [FK_BAN] FOREIGN KEY ([id_rel]) REFERENCES [dbo].[TBancos] ([Id_Banco])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USER]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hbancos]', 'U'))
ALTER TABLE [dbo].[hbancos] ADD CONSTRAINT [FK_USER] FOREIGN KEY ([id_user]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[hcuentas]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERCTA]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hcuentas]', 'U'))
ALTER TABLE [dbo].[hcuentas] ADD CONSTRAINT [FK_USERCTA] FOREIGN KEY ([id_user]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[hcuentas_pension2]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USERCTA2]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[hcuentas_pension2]', 'U'))
ALTER TABLE [dbo].[hcuentas_pension2] ADD CONSTRAINT [FK_USERCTA2] FOREIGN KEY ([id_user]) REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [dbo].[importacionCatalogosCampos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[r_448]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[importacionCatalogosCampos]', 'U'))
ALTER TABLE [dbo].[importacionCatalogosCampos] ADD CONSTRAINT [r_448] FOREIGN KEY ([idCatalogo]) REFERENCES [dbo].[importacionCatalogos] ([idCatalogo]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[importacionCatalogos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_447]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[importacionCatalogos]', 'U'))
ALTER TABLE [dbo].[importacionCatalogos] ADD CONSTRAINT [R_447] FOREIGN KEY ([idTipoCatalogo]) REFERENCES [dbo].[importacionTipoCatalogos] ([idTipoCatalogo])
GO
PRINT N'Adding foreign keys to [dbo].[importacionConfig]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_446]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[importacionConfig]', 'U'))
ALTER TABLE [dbo].[importacionConfig] ADD CONSTRAINT [R_446] FOREIGN KEY ([idCatalogo]) REFERENCES [dbo].[importacionCatalogos] ([idCatalogo])
GO
PRINT N'Adding foreign keys to [dbo].[plazas_vr_estatus]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_plazas_vr_estatus_plazas_vr_catestatus_idestatus]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[plazas_vr_estatus]', 'U'))
ALTER TABLE [dbo].[plazas_vr_estatus] ADD CONSTRAINT [FK_plazas_vr_estatus_plazas_vr_catestatus_idestatus] FOREIGN KEY ([idestatus]) REFERENCES [dbo].[plazas_vr_catestatus] ([idestatus])
GO
PRINT N'Adding foreign keys to [dbo].[plazas_vr_roles_permisos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__plazas_vr__permi__1F351EF1]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[plazas_vr_roles_permisos]', 'U'))
ALTER TABLE [dbo].[plazas_vr_roles_permisos] ADD FOREIGN KEY ([permiso]) REFERENCES [dbo].[plazas_vr_permisos] ([permiso]) ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__plazas_vr_r__rol__2029432A]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[plazas_vr_roles_permisos]', 'U'))
ALTER TABLE [dbo].[plazas_vr_roles_permisos] ADD FOREIGN KEY ([rol]) REFERENCES [dbo].[plazas_vr_roles] ([rol]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[plazas_vr_usuarios_roles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__plazas_vr_u__rol__22118B9C]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[plazas_vr_usuarios_roles]', 'U'))
ALTER TABLE [dbo].[plazas_vr_usuarios_roles] ADD FOREIGN KEY ([rol]) REFERENCES [dbo].[plazas_vr_roles] ([rol]) ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__plazas_vr__usuar__211D6763]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[plazas_vr_usuarios_roles]', 'U'))
ALTER TABLE [dbo].[plazas_vr_usuarios_roles] ADD FOREIGN KEY ([usuario]) REFERENCES [dbo].[plazas_vr_usuarios] ([usuario]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [rjc].[horarioempleado]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__horarioem__idare__7AEB9A3A]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[horarioempleado]', 'U'))
ALTER TABLE [rjc].[horarioempleado] ADD FOREIGN KEY ([idarea]) REFERENCES [rjc].[area] ([idarea])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__horarioem__idhor__7BDFBE73]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[horarioempleado]', 'U'))
ALTER TABLE [rjc].[horarioempleado] ADD FOREIGN KEY ([idhorario]) REFERENCES [rjc].[horarios] ([idhorario])
GO
PRINT N'Adding foreign keys to [rjc].[horarios]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__horarios__idturn__7CD3E2AC]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[horarios]', 'U'))
ALTER TABLE [rjc].[horarios] ADD FOREIGN KEY ([idturno]) REFERENCES [rjc].[turno] ([idturno])
GO
PRINT N'Adding foreign keys to [rjc].[permisos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__permisos__idperm__7DC806E5]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[permisos]', 'U'))
ALTER TABLE [rjc].[permisos] ADD FOREIGN KEY ([idpermisotipo]) REFERENCES [rjc].[permisotipo] ([idpermisotipo])
GO
PRINT N'Adding foreign keys to [rjc].[sis_roles_permisos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__sis_roles__idper__7EBC2B1E]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[sis_roles_permisos]', 'U'))
ALTER TABLE [rjc].[sis_roles_permisos] ADD FOREIGN KEY ([idpermiso]) REFERENCES [rjc].[sis_permisos] ([idpermiso])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__sis_roles__idrol__7FB04F57]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[sis_roles_permisos]', 'U'))
ALTER TABLE [rjc].[sis_roles_permisos] ADD FOREIGN KEY ([idrol]) REFERENCES [rjc].[sis_roles] ([idrol])
GO
PRINT N'Adding foreign keys to [rjc].[sis_usuarios_roles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__sis_usuar__idrol__00A47390]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[sis_usuarios_roles]', 'U'))
ALTER TABLE [rjc].[sis_usuarios_roles] ADD FOREIGN KEY ([idrol]) REFERENCES [rjc].[sis_roles] ([idrol])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__sis_usuar__idusu__019897C9]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[sis_usuarios_roles]', 'U'))
ALTER TABLE [rjc].[sis_usuarios_roles] ADD FOREIGN KEY ([idusuario]) REFERENCES [rjc].[sis_usuarios] ([idusuario])
GO
PRINT N'Adding foreign keys to [rjc].[visitantes]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__visitante__idare__028CBC02]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[visitantes]', 'U'))
ALTER TABLE [rjc].[visitantes] ADD FOREIGN KEY ([idarea]) REFERENCES [rjc].[area] ([idarea])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rjc].[FK__visitante__idemp__0380E03B]','F') AND parent_object_id = OBJECT_ID(N'[rjc].[visitantes]', 'U'))
ALTER TABLE [rjc].[visitantes] ADD FOREIGN KEY ([idempresa]) REFERENCES [rjc].[empresas] ([idempresa])
GO
PRINT N'Adding foreign keys to [ses].[Documentacion]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Documenta__Id_Ca__4171274B]','F') AND parent_object_id = OBJECT_ID(N'[ses].[Documentacion]', 'U'))
ALTER TABLE [ses].[Documentacion] ADD FOREIGN KEY ([Id_CatalogoDocumentos]) REFERENCES [ses].[CatalogoDocumentos] ([Id_CatalogoDocumentos])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Documenta__Idsol__42654B84]','F') AND parent_object_id = OBJECT_ID(N'[ses].[Documentacion]', 'U'))
ALTER TABLE [ses].[Documentacion] ADD FOREIGN KEY ([Idsolicitud]) REFERENCES [ses].[SolicitudConstancia] ([idSolicitud])
GO
PRINT N'Adding foreign keys to [ses].[EvolucionSalarial]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Evolucion__idSol__4541B82F]','F') AND parent_object_id = OBJECT_ID(N'[ses].[EvolucionSalarial]', 'U'))
ALTER TABLE [ses].[EvolucionSalarial] ADD FOREIGN KEY ([idSolicitud]) REFERENCES [ses].[SolicitudConstancia] ([idSolicitud])
GO
PRINT N'Adding foreign keys to [ses].[HistoriaReportes]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__HistoriaR__Id_Ca__481E24DA]','F') AND parent_object_id = OBJECT_ID(N'[ses].[HistoriaReportes]', 'U'))
ALTER TABLE [ses].[HistoriaReportes] ADD FOREIGN KEY ([Id_CatalogoReportes]) REFERENCES [ses].[CatalogoReportes] ([Id_CatalogoReportes])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__HistoriaR__id_Us__49124913]','F') AND parent_object_id = OBJECT_ID(N'[ses].[HistoriaReportes]', 'U'))
ALTER TABLE [ses].[HistoriaReportes] ADD FOREIGN KEY ([id_Usuario]) REFERENCES [ses].[Usuario] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [ses].[OficiosRespuesta]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__OficiosRe__Id_So__2F818A16]','F') AND parent_object_id = OBJECT_ID(N'[ses].[OficiosRespuesta]', 'U'))
ALTER TABLE [ses].[OficiosRespuesta] ADD FOREIGN KEY ([Id_Solicitante]) REFERENCES [ses].[CatalogoSolicitantes] ([Id_Solicitante])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__OficiosRe__Idsol__2D9941A4]','F') AND parent_object_id = OBJECT_ID(N'[ses].[OficiosRespuesta]', 'U'))
ALTER TABLE [ses].[OficiosRespuesta] ADD FOREIGN KEY ([Idsolicitud]) REFERENCES [ses].[SolicitudConstancia] ([idSolicitud])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__OficiosRe__Id_Us__2E8D65DD]','F') AND parent_object_id = OBJECT_ID(N'[ses].[OficiosRespuesta]', 'U'))
ALTER TABLE [ses].[OficiosRespuesta] ADD FOREIGN KEY ([Id_Usuario]) REFERENCES [ses].[Usuario] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [ses].[Rol_usuario]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Rol_usuar__Id_Ro__599D5303]','F') AND parent_object_id = OBJECT_ID(N'[ses].[Rol_usuario]', 'U'))
ALTER TABLE [ses].[Rol_usuario] ADD FOREIGN KEY ([Id_Rol]) REFERENCES [ses].[Rol] ([Id_Rol])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Rol_usuar__Id_Us__4DD6FE30]','F') AND parent_object_id = OBJECT_ID(N'[ses].[Rol_usuario]', 'U'))
ALTER TABLE [ses].[Rol_usuario] ADD FOREIGN KEY ([Id_Usuario]) REFERENCES [ses].[Usuario] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [ses].[SolicitudConstancia]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Solicitud__IdSta__3DA09667]','F') AND parent_object_id = OBJECT_ID(N'[ses].[SolicitudConstancia]', 'U'))
ALTER TABLE [ses].[SolicitudConstancia] ADD FOREIGN KEY ([IdStatusSolicitud]) REFERENCES [ses].[EstatusSolicitud] ([IdStatusSolicitud])
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ses].[FK__Solicitud__Id_Us__3E94BAA0]','F') AND parent_object_id = OBJECT_ID(N'[ses].[SolicitudConstancia]', 'U'))
ALTER TABLE [ses].[SolicitudConstancia] ADD FOREIGN KEY ([Id_Usuario]) REFERENCES [ses].[Usuario] ([Id_Usuario])
GO
PRINT N'Adding foreign keys to [sirei].[sys_roles_permisos]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[sirei].[FK__sys_roles__permi__651929D7]','F') AND parent_object_id = OBJECT_ID(N'[sirei].[sys_roles_permisos]', 'U'))
ALTER TABLE [sirei].[sys_roles_permisos] ADD FOREIGN KEY ([permiso]) REFERENCES [sirei].[sys_permisos] ([permiso]) ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[sirei].[FK__sys_roles_p__rol__6425059E]','F') AND parent_object_id = OBJECT_ID(N'[sirei].[sys_roles_permisos]', 'U'))
ALTER TABLE [sirei].[sys_roles_permisos] ADD FOREIGN KEY ([rol]) REFERENCES [sirei].[sys_roles] ([rol]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [sirei].[sys_usuarios_roles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[sirei].[FK__sys_usuario__rol__6BC62766]','F') AND parent_object_id = OBJECT_ID(N'[sirei].[sys_usuarios_roles]', 'U'))
ALTER TABLE [sirei].[sys_usuarios_roles] ADD FOREIGN KEY ([rol]) REFERENCES [sirei].[sys_roles] ([rol]) ON UPDATE CASCADE
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[sirei].[FK__sys_usuar__usuar__6AD2032D]','F') AND parent_object_id = OBJECT_ID(N'[sirei].[sys_usuarios_roles]', 'U'))
ALTER TABLE [sirei].[sys_usuarios_roles] ADD FOREIGN KEY ([usuario]) REFERENCES [sirei].[sys_usuarios] ([usuario]) ON UPDATE CASCADE
GO
PRINT N'Disabling constraints on [dbo].[Nom_pagos_hist]'
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_399_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] NOCHECK CONSTRAINT [fk_R_399_n]
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_400_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] NOCHECK CONSTRAINT [fk_R_400_n]
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_R_401_n]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Nom_pagos_hist]', 'U'))
ALTER TABLE [dbo].[Nom_pagos_hist] NOCHECK CONSTRAINT [fk_R_401_n]
GO
PRINT N'Disabling constraints on [dbo].[TFormulasRelaciones]'
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_381]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasRelaciones]', 'U'))
ALTER TABLE [dbo].[TFormulasRelaciones] NOCHECK CONSTRAINT [R_381]
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_382]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasRelaciones]', 'U'))
ALTER TABLE [dbo].[TFormulasRelaciones] NOCHECK CONSTRAINT [R_382]
GO
PRINT N'Disabling constraints on [dbo].[TFormulasTipo]'
GO
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_383]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[TFormulasTipo]', 'U'))
ALTER TABLE [dbo].[TFormulasTipo] NOCHECK CONSTRAINT [R_383]
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
