ALTER TABLE [dbo].[AccesosAgrupadores] DROP CONSTRAINT [DF_Relojes_Modo100]
GO

ALTER TABLE [dbo].[AccesosAgrupadores] ADD CONSTRAINT [DF_Relojes_Modo100] DEFAULT (0) FOR [id_agrupador]
GO

ALTER TABLE [dbo].[AccesosAgrupadores] DROP CONSTRAINT [DF_Relojes_Modo101]
GO

ALTER TABLE [dbo].[AccesosAgrupadores] ADD CONSTRAINT [DF_Relojes_Modo101] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[AccesosCampos] DROP CONSTRAINT [DF_Relojes_Modo416]
GO

ALTER TABLE [dbo].[AccesosCampos] ADD CONSTRAINT [DF_Relojes_Modo416] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[AccesosCias] DROP CONSTRAINT [DF_Relojes_Modo250]
GO

ALTER TABLE [dbo].[AccesosCias] ADD CONSTRAINT [DF_Relojes_Modo250] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[AccesosCias] DROP CONSTRAINT [DF_Relojes_Modo251]
GO

ALTER TABLE [dbo].[AccesosCias] ADD CONSTRAINT [DF_Relojes_Modo251] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[ACCESOSMENUS] DROP CONSTRAINT [DF_Relojes_Modo435]
GO

ALTER TABLE [dbo].[ACCESOSMENUS] ADD CONSTRAINT [DF_Relojes_Modo435] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[AccesosSistemas] DROP CONSTRAINT [DF_Relojes_Modo437]
GO

ALTER TABLE [dbo].[AccesosSistemas] ADD CONSTRAINT [DF_Relojes_Modo437] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[AccesosSistemas] DROP CONSTRAINT [DF_Relojes_Modo438]
GO

ALTER TABLE [dbo].[AccesosSistemas] ADD CONSTRAINT [DF_Relojes_Modo438] DEFAULT (0) FOR [Clave]
GO

ALTER TABLE [dbo].[AgrupadorCias] DROP CONSTRAINT [DF_Relojes_Modo102]
GO

ALTER TABLE [dbo].[AgrupadorCias] ADD CONSTRAINT [DF_Relojes_Modo102] DEFAULT (0) FOR [id_agrupador]
GO

ALTER TABLE [dbo].[AgrupadorCias] DROP CONSTRAINT [DF_Relojes_Modo103]
GO

ALTER TABLE [dbo].[AgrupadorCias] ADD CONSTRAINT [DF_Relojes_Modo103] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[AgrupadoresSeg] DROP CONSTRAINT [DF_Relojes_Modo105]
GO

ALTER TABLE [dbo].[AgrupadoresSeg] ADD CONSTRAINT [DF_Relojes_Modo105] DEFAULT (0) FOR [Id_Agrupador]
GO

ALTER TABLE [dbo].[AgrupadorMenus] DROP CONSTRAINT [DF_Relojes_Modo104]
GO

ALTER TABLE [dbo].[AgrupadorMenus] ADD CONSTRAINT [DF_Relojes_Modo104] DEFAULT (0) FOR [Id_Agrupador]
GO

ALTER TABLE [dbo].[AgrupadorSistemas] DROP CONSTRAINT [DF_Relojes_Modo98]
GO

ALTER TABLE [dbo].[AgrupadorSistemas] ADD CONSTRAINT [DF_Relojes_Modo98] DEFAULT (0) FOR [Id_Agrupador]
GO

ALTER TABLE [dbo].[AgrupadorSistemas] DROP CONSTRAINT [DF_Relojes_Modo99]
GO

ALTER TABLE [dbo].[AgrupadorSistemas] ADD CONSTRAINT [DF_Relojes_Modo99] DEFAULT (0) FOR [Clave]
GO

ALTER TABLE [dbo].[AportacionesFAhorro] DROP CONSTRAINT [DF_Relojes_Modo349]
GO

ALTER TABLE [dbo].[AportacionesFAhorro] ADD CONSTRAINT [DF_Relojes_Modo349] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[AportacionesFAhorro] DROP CONSTRAINT [DF_Relojes_Modo350]
GO

ALTER TABLE [dbo].[AportacionesFAhorro] ADD CONSTRAINT [DF_Relojes_Modo350] DEFAULT (0) FOR [Pesos]
GO

ALTER TABLE [dbo].[ArbolCompetenciasCursos] DROP CONSTRAINT [DF_Relojes_Modo497]
GO

ALTER TABLE [dbo].[ArbolCompetenciasCursos] ADD CONSTRAINT [DF_Relojes_Modo497] DEFAULT (0) FOR [Id_Nodo]
GO

ALTER TABLE [dbo].[ArbolCompetenciasCursos] DROP CONSTRAINT [DF_Relojes_Modo498]
GO

ALTER TABLE [dbo].[ArbolCompetenciasCursos] ADD CONSTRAINT [DF_Relojes_Modo498] DEFAULT (0) FOR [Id_Texto]
GO

ALTER TABLE [dbo].[ArbolCursos] DROP CONSTRAINT [DF_Relojes_Modo504]
GO

ALTER TABLE [dbo].[ArbolCursos] ADD CONSTRAINT [DF_Relojes_Modo504] DEFAULT (0) FOR [Id_Nodo]
GO

ALTER TABLE [dbo].[BaseTablasProcesos] DROP CONSTRAINT [DF_Relojes_Modo659]
GO

ALTER TABLE [dbo].[BaseTablasProcesos] ADD CONSTRAINT [DF_Relojes_Modo659] DEFAULT (0) FOR [id_proceso]
GO

ALTER TABLE [dbo].[BaseTablasProcesos] DROP CONSTRAINT [DF_Relojes_Modo660]
GO

ALTER TABLE [dbo].[BaseTablasProcesos] ADD CONSTRAINT [DF_Relojes_Modo660] DEFAULT (0) FOR [Proceso]
GO

ALTER TABLE [dbo].[BitacoraHSalarios] DROP CONSTRAINT [DF_Relojes_Modo314]
GO

ALTER TABLE [dbo].[BitacoraHSalarios] ADD CONSTRAINT [DF_Relojes_Modo314] DEFAULT (0) FOR [IdEmp]
GO

ALTER TABLE [dbo].[BloqueoPassword] DROP CONSTRAINT [DF_Relojes_Modo663]
GO

ALTER TABLE [dbo].[BloqueoPassword] ADD CONSTRAINT [DF_Relojes_Modo663] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[BolsaTrab] DROP CONSTRAINT [DF_Relojes_Modo407]
GO

ALTER TABLE [dbo].[BolsaTrab] ADD CONSTRAINT [DF_Relojes_Modo407] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BolsaTrab] DROP CONSTRAINT [DF_Relojes_Modo408]
GO

ALTER TABLE [dbo].[BolsaTrab] ADD CONSTRAINT [DF_Relojes_Modo408] DEFAULT (0) FOR [Id_Ciudad]
GO

ALTER TABLE [dbo].[BolsaTrab] DROP CONSTRAINT [DF_Relojes_Modo409]
GO

ALTER TABLE [dbo].[BolsaTrab] ADD CONSTRAINT [DF_Relojes_Modo409] DEFAULT (0) FOR [SUELDO]
GO

ALTER TABLE [dbo].[BtEmpEscol] DROP CONSTRAINT [DF_Relojes_Modo401]
GO

ALTER TABLE [dbo].[BtEmpEscol] ADD CONSTRAINT [DF_Relojes_Modo401] DEFAULT (0) FOR [Id_Escolaridad]
GO

ALTER TABLE [dbo].[BtEmpExper] DROP CONSTRAINT [DF_Relojes_Modo402]
GO

ALTER TABLE [dbo].[BtEmpExper] ADD CONSTRAINT [DF_Relojes_Modo402] DEFAULT (0) FOR [Id_Experiencia]
GO

ALTER TABLE [dbo].[BtEmpExper] DROP CONSTRAINT [DF_Relojes_Modo403]
GO

ALTER TABLE [dbo].[BtEmpExper] ADD CONSTRAINT [DF_Relojes_Modo403] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BtEmpIdio] DROP CONSTRAINT [DF_Relojes_Modo406]
GO

ALTER TABLE [dbo].[BtEmpIdio] ADD CONSTRAINT [DF_Relojes_Modo406] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BtEmpPto] DROP CONSTRAINT [DF_Relojes_Modo399]
GO

ALTER TABLE [dbo].[BtEmpPto] ADD CONSTRAINT [DF_Relojes_Modo399] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BtEmpPto] DROP CONSTRAINT [DF_Relojes_Modo400]
GO

ALTER TABLE [dbo].[BtEmpPto] ADD CONSTRAINT [DF_Relojes_Modo400] DEFAULT (0) FOR [Id_Puesto]
GO

ALTER TABLE [dbo].[BtEmpRefer] DROP CONSTRAINT [DF_Relojes_Modo404]
GO

ALTER TABLE [dbo].[BtEmpRefer] ADD CONSTRAINT [DF_Relojes_Modo404] DEFAULT (0) FOR [Id_Refer]
GO

ALTER TABLE [dbo].[BtEmpRefer] DROP CONSTRAINT [DF_Relojes_Modo405]
GO

ALTER TABLE [dbo].[BtEmpRefer] ADD CONSTRAINT [DF_Relojes_Modo405] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BtEmptur] DROP CONSTRAINT [DF_Relojes_Modo123]
GO

ALTER TABLE [dbo].[BtEmptur] ADD CONSTRAINT [DF_Relojes_Modo123] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[BtEmptur] DROP CONSTRAINT [DF_Relojes_Modo124]
GO

ALTER TABLE [dbo].[BtEmptur] ADD CONSTRAINT [DF_Relojes_Modo124] DEFAULT (0) FOR [Id_Turno]
GO

ALTER TABLE [dbo].[BtSeminarios] DROP CONSTRAINT [DF_Relojes_Modo157]
GO

ALTER TABLE [dbo].[BtSeminarios] ADD CONSTRAINT [DF_Relojes_Modo157] DEFAULT (0) FOR [Id_Seminario]
GO

ALTER TABLE [dbo].[BtSeminarios] DROP CONSTRAINT [DF_Relojes_Modo158]
GO

ALTER TABLE [dbo].[BtSeminarios] ADD CONSTRAINT [DF_Relojes_Modo158] DEFAULT (0) FOR [Id_Solicitud]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF_Relojes_Modo245]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF_Relojes_Modo245] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF_Relojes_Modo246]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF_Relojes_Modo246] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF_Relojes_Modo247]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF_Relojes_Modo247] DEFAULT (0) FOR [PerImss]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF_Relojes_Modo248]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF_Relojes_Modo248] DEFAULT (0) FOR [Parcial]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF_Relojes_Modo249]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF_Relojes_Modo249] DEFAULT (0) FOR [PeriodoMensual]
GO

ALTER TABLE [dbo].[CalenNomina] DROP CONSTRAINT [DF__Calennomi__Act_j__22930737]
GO

ALTER TABLE [dbo].[CalenNomina] ADD CONSTRAINT [DF__Calennomi__Act_j__22930737] DEFAULT (0) FOR [Act_jobs]
GO

ALTER TABLE [dbo].[CaMatriz] DROP CONSTRAINT [DF_Relojes_Modo592]
GO

ALTER TABLE [dbo].[CaMatriz] ADD CONSTRAINT [DF_Relojes_Modo592] DEFAULT (0) FOR [Id_Matriz]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] DROP CONSTRAINT [DF_Relojes_Modo441]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] ADD CONSTRAINT [DF_Relojes_Modo441] DEFAULT (0) FOR [Id_Competencia]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] DROP CONSTRAINT [DF_Relojes_Modo442]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] ADD CONSTRAINT [DF_Relojes_Modo442] DEFAULT (0) FOR [Id_Seleccion]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] DROP CONSTRAINT [DF_Relojes_Modo443]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] ADD CONSTRAINT [DF_Relojes_Modo443] DEFAULT (0) FOR [Id_Matriz]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] DROP CONSTRAINT [DF_Relojes_Modo444]
GO

ALTER TABLE [dbo].[CaMatrizRequeridos] ADD CONSTRAINT [DF_Relojes_Modo444] DEFAULT (0) FOR [Requeridos]
GO

ALTER TABLE [dbo].[Campos_Dedu_Banco] DROP CONSTRAINT [DF_Relojes_Modo600]
GO

ALTER TABLE [dbo].[Campos_Dedu_Banco] ADD CONSTRAINT [DF_Relojes_Modo600] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposCardex] DROP CONSTRAINT [DF_Relojes_Modo587]
GO

ALTER TABLE [dbo].[CamposCardex] ADD CONSTRAINT [DF_Relojes_Modo587] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposCM] DROP CONSTRAINT [DF_Relojes_Modo606]
GO

ALTER TABLE [dbo].[CamposCM] ADD CONSTRAINT [DF_Relojes_Modo606] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposCM] DROP CONSTRAINT [DF_Relojes_Modo607]
GO

ALTER TABLE [dbo].[CamposCM] ADD CONSTRAINT [DF_Relojes_Modo607] DEFAULT (0) FOR [Tamaño]
GO

ALTER TABLE [dbo].[CamposCM] DROP CONSTRAINT [DF_Relojes_Modo608]
GO

ALTER TABLE [dbo].[CamposCM] ADD CONSTRAINT [DF_Relojes_Modo608] DEFAULT (0) FOR [xCia]
GO

ALTER TABLE [dbo].[CamposCM] DROP CONSTRAINT [DF_Relojes_Modo609]
GO

ALTER TABLE [dbo].[CamposCM] ADD CONSTRAINT [DF_Relojes_Modo609] DEFAULT (0) FOR [Historico]
GO

ALTER TABLE [dbo].[CamposCS] DROP CONSTRAINT [DF_Relojes_Modo613]
GO

ALTER TABLE [dbo].[CamposCS] ADD CONSTRAINT [DF_Relojes_Modo613] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposCS] DROP CONSTRAINT [DF_Relojes_Modo614]
GO

ALTER TABLE [dbo].[CamposCS] ADD CONSTRAINT [DF_Relojes_Modo614] DEFAULT (0) FOR [Tamaño]
GO

ALTER TABLE [dbo].[CamposCS] DROP CONSTRAINT [DF_Relojes_Modo615]
GO

ALTER TABLE [dbo].[CamposCS] ADD CONSTRAINT [DF_Relojes_Modo615] DEFAULT (0) FOR [xCia]
GO

ALTER TABLE [dbo].[CamposCS] DROP CONSTRAINT [DF_Relojes_Modo616]
GO

ALTER TABLE [dbo].[CamposCS] ADD CONSTRAINT [DF_Relojes_Modo616] DEFAULT (0) FOR [Historico]
GO

ALTER TABLE [dbo].[CamposCS] DROP CONSTRAINT [DF_Relojes_Modo617]
GO

ALTER TABLE [dbo].[CamposCS] ADD CONSTRAINT [DF_Relojes_Modo617] DEFAULT (0) FOR [RellenaCeros]
GO

ALTER TABLE [dbo].[CamposFiltros] DROP CONSTRAINT [DF_Relojes_Modo629]
GO

ALTER TABLE [dbo].[CamposFiltros] ADD CONSTRAINT [DF_Relojes_Modo629] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposFiltros] DROP CONSTRAINT [DF_Relojes_Modo630]
GO

ALTER TABLE [dbo].[CamposFiltros] ADD CONSTRAINT [DF_Relojes_Modo630] DEFAULT (0) FOR [Color]
GO

ALTER TABLE [dbo].[CamposOrgan] DROP CONSTRAINT [DF_Relojes_Modo97]
GO

ALTER TABLE [dbo].[CamposOrgan] ADD CONSTRAINT [DF_Relojes_Modo97] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposReporte] DROP CONSTRAINT [DF_Relojes_Modo136]
GO

ALTER TABLE [dbo].[CamposReporte] ADD CONSTRAINT [DF_Relojes_Modo136] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CamposReporte] DROP CONSTRAINT [DF_Relojes_Modo137]
GO

ALTER TABLE [dbo].[CamposReporte] ADD CONSTRAINT [DF_Relojes_Modo137] DEFAULT (0) FOR [Reporte]
GO

ALTER TABLE [dbo].[CamposReporte] DROP CONSTRAINT [DF_Relojes_Modo138]
GO

ALTER TABLE [dbo].[CamposReporte] ADD CONSTRAINT [DF_Relojes_Modo138] DEFAULT (0) FOR [Tamaño]
GO

ALTER TABLE [dbo].[CamposReporte] DROP CONSTRAINT [DF_Relojes_Modo139]
GO

ALTER TABLE [dbo].[CamposReporte] ADD CONSTRAINT [DF_Relojes_Modo139] DEFAULT (0) FOR [Ceros]
GO

ALTER TABLE [dbo].[CamposReporte] DROP CONSTRAINT [DF_Relojes_Modo140]
GO

ALTER TABLE [dbo].[CamposReporte] ADD CONSTRAINT [DF_Relojes_Modo140] DEFAULT (0) FOR [Acceso]
GO

ALTER TABLE [dbo].[CaSeleccionEmp] DROP CONSTRAINT [DF_Relojes_Modo445]
GO

ALTER TABLE [dbo].[CaSeleccionEmp] ADD CONSTRAINT [DF_Relojes_Modo445] DEFAULT (0) FOR [Id_Seleccion]
GO

ALTER TABLE [dbo].[Catalogo] DROP CONSTRAINT [DF_Relojes_Modo603]
GO

ALTER TABLE [dbo].[Catalogo] ADD CONSTRAINT [DF_Relojes_Modo603] DEFAULT (0) FOR [Tipo]
GO

ALTER TABLE [dbo].[Catalogo] DROP CONSTRAINT [DF_Relojes_Modo604]
GO

ALTER TABLE [dbo].[Catalogo] ADD CONSTRAINT [DF_Relojes_Modo604] DEFAULT (0) FOR [id_empresa]
GO

ALTER TABLE [dbo].[Catalogo] DROP CONSTRAINT [DF_Relojes_Modo605]
GO

ALTER TABLE [dbo].[Catalogo] ADD CONSTRAINT [DF_Relojes_Modo605] DEFAULT (0) FOR [Naturaleza]
GO

ALTER TABLE [dbo].[CaTCompetencia] DROP CONSTRAINT [DF_Relojes_Modo460]
GO

ALTER TABLE [dbo].[CaTCompetencia] ADD CONSTRAINT [DF_Relojes_Modo460] DEFAULT (0) FOR [Id_Competencia]
GO

ALTER TABLE [dbo].[ClavesNoModificables] DROP CONSTRAINT [DF_Relojes_Modo491]
GO

ALTER TABLE [dbo].[ClavesNoModificables] ADD CONSTRAINT [DF_Relojes_Modo491] DEFAULT (0) FOR [Cve]
GO

ALTER TABLE [dbo].[ClClasificaciones] DROP CONSTRAINT [DF_Relojes_Modo494]
GO

ALTER TABLE [dbo].[ClClasificaciones] ADD CONSTRAINT [DF_Relojes_Modo494] DEFAULT (0) FOR [Id_Clasificacion]
GO

ALTER TABLE [dbo].[CNCampos] DROP CONSTRAINT [DF_Relojes_Modo512]
GO

ALTER TABLE [dbo].[CNCampos] ADD CONSTRAINT [DF_Relojes_Modo512] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CNNombres] DROP CONSTRAINT [DF_Relojes_Modo323]
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [DF_Relojes_Modo323] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[CNNombres] DROP CONSTRAINT [DF_Relojes_Modo324]
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [DF_Relojes_Modo324] DEFAULT (0) FOR [Id_Parentesco]
GO

ALTER TABLE [dbo].[CNNombres] DROP CONSTRAINT [DF_Relojes_Modo325]
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [DF_Relojes_Modo325] DEFAULT (0) FOR [Id_Campo]
GO

ALTER TABLE [dbo].[CNNombres] DROP CONSTRAINT [DF_Relojes_Modo326]
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [DF_Relojes_Modo326] DEFAULT (0) FOR [Porciento]
GO

ALTER TABLE [dbo].[CNParentescos] DROP CONSTRAINT [DF_Relojes_Modo533]
GO

ALTER TABLE [dbo].[CNParentescos] ADD CONSTRAINT [DF_Relojes_Modo533] DEFAULT (0) FOR [Id_Parentesco]
GO

ALTER TABLE [dbo].[CNRelacion] DROP CONSTRAINT [DF_Relojes_Modo319]
GO

ALTER TABLE [dbo].[CNRelacion] ADD CONSTRAINT [DF_Relojes_Modo319] DEFAULT (0) FOR [Id_Relacion]
GO

ALTER TABLE [dbo].[CNRelacion] DROP CONSTRAINT [DF_Relojes_Modo320]
GO

ALTER TABLE [dbo].[CNRelacion] ADD CONSTRAINT [DF_Relojes_Modo320] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[CNRelacion] DROP CONSTRAINT [DF_Relojes_Modo321]
GO

ALTER TABLE [dbo].[CNRelacion] ADD CONSTRAINT [DF_Relojes_Modo321] DEFAULT (0) FOR [Id_Nombre]
GO

ALTER TABLE [dbo].[Conceptos] DROP CONSTRAINT [DF__Conceptos__Captu__45C08FB4]
GO

ALTER TABLE [dbo].[Conceptos] ADD CONSTRAINT [DF__Conceptos__Captu__45C08FB4] DEFAULT (0) FOR [Captura_ClaveCardex]
GO

ALTER TABLE [dbo].[Conceptos_Hacienda] DROP CONSTRAINT [DF_Relojes_Modo542]
GO

ALTER TABLE [dbo].[Conceptos_Hacienda] ADD CONSTRAINT [DF_Relojes_Modo542] DEFAULT (0) FOR [Id_Con_Hacienda]
GO

ALTER TABLE [dbo].[ConfigGafete] DROP CONSTRAINT [DF_Relojes_Modo506]
GO

ALTER TABLE [dbo].[ConfigGafete] ADD CONSTRAINT [DF_Relojes_Modo506] DEFAULT (0) FOR [Id_config]
GO

ALTER TABLE [dbo].[ConfigGafete] DROP CONSTRAINT [DF_Relojes_Modo507]
GO

ALTER TABLE [dbo].[ConfigGafete] ADD CONSTRAINT [DF_Relojes_Modo507] DEFAULT (0) FOR [CoorIzquierda]
GO

ALTER TABLE [dbo].[ConfigGafete] DROP CONSTRAINT [DF_Relojes_Modo508]
GO

ALTER TABLE [dbo].[ConfigGafete] ADD CONSTRAINT [DF_Relojes_Modo508] DEFAULT (0) FOR [CoorSuperior]
GO

ALTER TABLE [dbo].[ConfigGafete] DROP CONSTRAINT [DF_Relojes_Modo509]
GO

ALTER TABLE [dbo].[ConfigGafete] ADD CONSTRAINT [DF_Relojes_Modo509] DEFAULT (0) FOR [PixelesAncho]
GO

ALTER TABLE [dbo].[ConfigGafete] DROP CONSTRAINT [DF_Relojes_Modo510]
GO

ALTER TABLE [dbo].[ConfigGafete] ADD CONSTRAINT [DF_Relojes_Modo510] DEFAULT (0) FOR [PixelesLargo]
GO

ALTER TABLE [dbo].[ConfigOrgan] DROP CONSTRAINT [DF_Relojes_Modo135]
GO

ALTER TABLE [dbo].[ConfigOrgan] ADD CONSTRAINT [DF_Relojes_Modo135] DEFAULT (0) FOR [LongClaveDesc]
GO

ALTER TABLE [dbo].[ConfigPlazas] DROP CONSTRAINT [DF__ConfigPla__Multi__7712E8F2]
GO

ALTER TABLE [dbo].[ConfigPlazas] ADD CONSTRAINT [DF__ConfigPla__Multi__7712E8F2] DEFAULT (0) FOR [Multiplaza]
GO

ALTER TABLE [dbo].[ConfigPTU] DROP CONSTRAINT [DF_Relojes_Modo155]
GO

ALTER TABLE [dbo].[ConfigPTU] ADD CONSTRAINT [DF_Relojes_Modo155] DEFAULT (0) FOR [MinimoDias]
GO

ALTER TABLE [dbo].[ConfigPTU] DROP CONSTRAINT [DF_Relojes_Modo156]
GO

ALTER TABLE [dbo].[ConfigPTU] ADD CONSTRAINT [DF_Relojes_Modo156] DEFAULT (0) FOR [SalTope]
GO

ALTER TABLE [dbo].[ConfigSueldos] DROP CONSTRAINT [DF_Relojes_Modo160]
GO

ALTER TABLE [dbo].[ConfigSueldos] ADD CONSTRAINT [DF_Relojes_Modo160] DEFAULT (0) FOR [RedonPorc]
GO

ALTER TABLE [dbo].[ConfigSueldos] DROP CONSTRAINT [DF_Relojes_Modo161]
GO

ALTER TABLE [dbo].[ConfigSueldos] ADD CONSTRAINT [DF_Relojes_Modo161] DEFAULT (0) FOR [RangoRedNiv]
GO

ALTER TABLE [dbo].[ConfigSupMaestros] DROP CONSTRAINT [DF_Relojes_Modo252]
GO

ALTER TABLE [dbo].[ConfigSupMaestros] ADD CONSTRAINT [DF_Relojes_Modo252] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[ConfigTyA] DROP CONSTRAINT [DF_Relojes_Modo640]
GO

ALTER TABLE [dbo].[ConfigTyA] ADD CONSTRAINT [DF_Relojes_Modo640] DEFAULT (0) FOR [DiaDePago]
GO

ALTER TABLE [dbo].[DiasDeProceso] DROP CONSTRAINT [DF_Relojes_Modo253]
GO

ALTER TABLE [dbo].[DiasDeProceso] ADD CONSTRAINT [DF_Relojes_Modo253] DEFAULT (0) FOR [Compañia]
GO

ALTER TABLE [dbo].[DiasDeProceso] DROP CONSTRAINT [DF_Relojes_Modo254]
GO

ALTER TABLE [dbo].[DiasDeProceso] ADD CONSTRAINT [DF_Relojes_Modo254] DEFAULT (0) FOR [diasdeproceso]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo552]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo552] DEFAULT (0) FOR [Id_Reporte]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo553]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo553] DEFAULT (0) FOR [NumRep]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo554]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo554] DEFAULT (0) FOR [Orientacion]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo555]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo555] DEFAULT (0) FOR [PaperSize]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo556]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo556] DEFAULT (0) FOR [LeftMarg]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo557]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo557] DEFAULT (0) FOR [RightMarg]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo558]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo558] DEFAULT (0) FOR [BotMarg]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo559]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo559] DEFAULT (0) FOR [TopMarg]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo560]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo560] DEFAULT (0) FOR [Columnas]
GO

ALTER TABLE [dbo].[DisenioRpt] DROP CONSTRAINT [DF_Relojes_Modo561]
GO

ALTER TABLE [dbo].[DisenioRpt] ADD CONSTRAINT [DF_Relojes_Modo561] DEFAULT (0) FOR [ColumnaDirection]
GO

ALTER TABLE [dbo].[dtproperties] DROP CONSTRAINT [DF__dtpropert__versi__5B78929E]
GO

ALTER TABLE [dbo].[dtproperties] ADD CONSTRAINT [DF__dtpropert__versi__5B78929E] DEFAULT (0) FOR [version]
GO

ALTER TABLE [dbo].[Escolaridad] DROP CONSTRAINT [DF_Relojes_Modo315]
GO

ALTER TABLE [dbo].[Escolaridad] ADD CONSTRAINT [DF_Relojes_Modo315] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Escolaridad] DROP CONSTRAINT [DF_Relojes_Modo316]
GO

ALTER TABLE [dbo].[Escolaridad] ADD CONSTRAINT [DF_Relojes_Modo316] DEFAULT (0) FOR [Id_Escolaridad]
GO

ALTER TABLE [dbo].[Escolaridad] DROP CONSTRAINT [DF_Relojes_Modo317]
GO

ALTER TABLE [dbo].[Escolaridad] ADD CONSTRAINT [DF_Relojes_Modo317] DEFAULT (0) FOR [Anios]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo233]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo233] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo234]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo234] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo235]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo235] DEFAULT (0) FOR [Seq]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo236]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo236] DEFAULT (0) FOR [Cantidad]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo237]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo237] DEFAULT (0) FOR [Sueldo]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo238]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo238] DEFAULT (0) FOR [Id_Categoria]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo239]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo239] DEFAULT (0) FOR [ClaveDif]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo240]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo240] DEFAULT (0) FOR [SaldoActual]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo241]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo241] DEFAULT (0) FOR [SaldoInicial]
GO

ALTER TABLE [dbo].[Excepciones] DROP CONSTRAINT [DF_Relojes_Modo242]
GO

ALTER TABLE [dbo].[Excepciones] ADD CONSTRAINT [DF_Relojes_Modo242] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[excepcionesPlaza] DROP CONSTRAINT [DF__excepcion__Id_pl__2FB8001F]
GO

ALTER TABLE [dbo].[excepcionesPlaza] ADD CONSTRAINT [DF__excepcion__Id_pl__2FB8001F] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[FBonoConstantes] DROP CONSTRAINT [DF_Relojes_Modo516]
GO

ALTER TABLE [dbo].[FBonoConstantes] ADD CONSTRAINT [DF_Relojes_Modo516] DEFAULT (0) FOR [SalarioMinimoRegion]
GO

ALTER TABLE [dbo].[FBonoEmpleados] DROP CONSTRAINT [DF_Relojes_Modo346]
GO

ALTER TABLE [dbo].[FBonoEmpleados] ADD CONSTRAINT [DF_Relojes_Modo346] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FCalculo] DROP CONSTRAINT [DF_Relojes_Modo197]
GO

ALTER TABLE [dbo].[FCalculo] ADD CONSTRAINT [DF_Relojes_Modo197] DEFAULT (0) FOR [Id_calculo]
GO

ALTER TABLE [dbo].[FCalculo] DROP CONSTRAINT [DF_Relojes_Modo198]
GO

ALTER TABLE [dbo].[FCalculo] ADD CONSTRAINT [DF_Relojes_Modo198] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[FCalculoConceptos] DROP CONSTRAINT [DF_Relojes_Modo527]
GO

ALTER TABLE [dbo].[FCalculoConceptos] ADD CONSTRAINT [DF_Relojes_Modo527] DEFAULT (0) FOR [id_concepto]
GO

ALTER TABLE [dbo].[FCalculoEmpleados] DROP CONSTRAINT [DF_Relojes_Modo191]
GO

ALTER TABLE [dbo].[FCalculoEmpleados] ADD CONSTRAINT [DF_Relojes_Modo191] DEFAULT (0) FOR [Id_calculo]
GO

ALTER TABLE [dbo].[FCalculoEmpleados] DROP CONSTRAINT [DF_Relojes_Modo192]
GO

ALTER TABLE [dbo].[FCalculoEmpleados] ADD CONSTRAINT [DF_Relojes_Modo192] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] DROP CONSTRAINT [DF_Relojes_Modo193]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] ADD CONSTRAINT [DF_Relojes_Modo193] DEFAULT (0) FOR [Id_calculo]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] DROP CONSTRAINT [DF_Relojes_Modo194]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] ADD CONSTRAINT [DF_Relojes_Modo194] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] DROP CONSTRAINT [DF_Relojes_Modo195]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] ADD CONSTRAINT [DF_Relojes_Modo195] DEFAULT (0) FOR [id_concepto]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] DROP CONSTRAINT [DF_Relojes_Modo196]
GO

ALTER TABLE [dbo].[FCalculoExcepciones] ADD CONSTRAINT [DF_Relojes_Modo196] DEFAULT (0) FOR [cantidad]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo145]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo145] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo146]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo146] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo147]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo147] DEFAULT (0) FOR [Consecutivo]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo148]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo148] DEFAULT (0) FOR [Id_calculo]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo149]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo149] DEFAULT (0) FOR [Horas]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo150]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo150] DEFAULT (0) FOR [Pesos]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo151]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo151] DEFAULT (0) FOR [Id_categ]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] DROP CONSTRAINT [DF_Relojes_Modo152]
GO

ALTER TABLE [dbo].[FCalculoHistPagos] ADD CONSTRAINT [DF_Relojes_Modo152] DEFAULT (0) FOR [PesosExcento]
GO

ALTER TABLE [dbo].[Filler] DROP CONSTRAINT [DF_Relojes_Modo415]
GO

ALTER TABLE [dbo].[Filler] ADD CONSTRAINT [DF_Relojes_Modo415] DEFAULT (0) FOR [id_filler]
GO

ALTER TABLE [dbo].[Filler_config] DROP CONSTRAINT [DF_Relojes_Modo429]
GO

ALTER TABLE [dbo].[Filler_config] ADD CONSTRAINT [DF_Relojes_Modo429] DEFAULT (0) FOR [Id_subir_bajarf]
GO

ALTER TABLE [dbo].[Filler_config] DROP CONSTRAINT [DF_Relojes_Modo430]
GO

ALTER TABLE [dbo].[Filler_config] ADD CONSTRAINT [DF_Relojes_Modo430] DEFAULT (0) FOR [Orden_filler]
GO

ALTER TABLE [dbo].[Fonacot] DROP CONSTRAINT [DF_Relojes_Modo347]
GO

ALTER TABLE [dbo].[Fonacot] ADD CONSTRAINT [DF_Relojes_Modo347] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FonacotEmp] DROP CONSTRAINT [DF_Relojes_Modo348]
GO

ALTER TABLE [dbo].[FonacotEmp] ADD CONSTRAINT [DF_Relojes_Modo348] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[FUP_Datos] DROP CONSTRAINT [DF__FUP_Datos__Id_Ti__36B8472A]
GO

ALTER TABLE [dbo].[FUP_Datos] ADD CONSTRAINT [DF__FUP_Datos__Id_Ti__36B8472A] DEFAULT (0) FOR [Id_TipoMuestra]
GO

ALTER TABLE [dbo].[FUP_MotivoMovimiento] DROP CONSTRAINT [DF__FUP_Motiv__Preva__2D6C720D]
GO

ALTER TABLE [dbo].[FUP_MotivoMovimiento] ADD CONSTRAINT [DF__FUP_Motiv__Preva__2D6C720D] DEFAULT (0) FOR [Prevalidacion]
GO

ALTER TABLE [dbo].[FUP_Relaciones] DROP CONSTRAINT [DF__FUP_relac__Accio__2C784DD4]
GO

ALTER TABLE [dbo].[FUP_Relaciones] ADD CONSTRAINT [DF__FUP_relac__Accio__2C784DD4] DEFAULT (0) FOR [Accion]
GO

ALTER TABLE [dbo].[GraficasConceptos] DROP CONSTRAINT [DF_Relojes_Modo543]
GO

ALTER TABLE [dbo].[GraficasConceptos] ADD CONSTRAINT [DF_Relojes_Modo543] DEFAULT (0) FOR [Id_VarGrafica]
GO

ALTER TABLE [dbo].[GraficasConceptos] DROP CONSTRAINT [DF_Relojes_Modo544]
GO

ALTER TABLE [dbo].[GraficasConceptos] ADD CONSTRAINT [DF_Relojes_Modo544] DEFAULT (0) FOR [Id_Concepto]
GO

ALTER TABLE [dbo].[HAreas] DROP CONSTRAINT [DF_Relojes_Modo380]
GO

ALTER TABLE [dbo].[HAreas] ADD CONSTRAINT [DF_Relojes_Modo380] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HAreas] DROP CONSTRAINT [DF_Relojes_Modo381]
GO

ALTER TABLE [dbo].[HAreas] ADD CONSTRAINT [DF_Relojes_Modo381] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HAreas] DROP CONSTRAINT [DF_Relojes_Modo382]
GO

ALTER TABLE [dbo].[HAreas] ADD CONSTRAINT [DF_Relojes_Modo382] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HAuditorias] DROP CONSTRAINT [DF_Relojes_Modo243]
GO

ALTER TABLE [dbo].[HAuditorias] ADD CONSTRAINT [DF_Relojes_Modo243] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[HAuditorias] DROP CONSTRAINT [DF_Relojes_Modo244]
GO

ALTER TABLE [dbo].[HAuditorias] ADD CONSTRAINT [DF_Relojes_Modo244] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HBajas] DROP CONSTRAINT [DF_Relojes_Modo295]
GO

ALTER TABLE [dbo].[HBajas] ADD CONSTRAINT [DF_Relojes_Modo295] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HBajas] DROP CONSTRAINT [DF_Relojes_Modo296]
GO

ALTER TABLE [dbo].[HBajas] ADD CONSTRAINT [DF_Relojes_Modo296] DEFAULT (0) FOR [Id_Motivoe]
GO

ALTER TABLE [dbo].[HBajas] DROP CONSTRAINT [DF_Relojes_Modo297]
GO

ALTER TABLE [dbo].[HBajas] ADD CONSTRAINT [DF_Relojes_Modo297] DEFAULT (0) FOR [Id_Motivss]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo308]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo308] DEFAULT (0) FOR [Id_Beca]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo309]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo309] DEFAULT (0) FOR [Id_Empleado]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo310]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo310] DEFAULT (0) FOR [Id_TipoBeca]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo311]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo311] DEFAULT (0) FOR [Id_Escuela]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo312]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo312] DEFAULT (0) FOR [Id_Especialidad]
GO

ALTER TABLE [dbo].[HBecas] DROP CONSTRAINT [DF_Relojes_Modo313]
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [DF_Relojes_Modo313] DEFAULT (0) FOR [Inasistencias]
GO

ALTER TABLE [dbo].[HCapExt] DROP CONSTRAINT [DF_Relojes_Modo524]
GO

ALTER TABLE [dbo].[HCapExt] ADD CONSTRAINT [DF_Relojes_Modo524] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HCapExt] DROP CONSTRAINT [DF_Relojes_Modo525]
GO

ALTER TABLE [dbo].[HCapExt] ADD CONSTRAINT [DF_Relojes_Modo525] DEFAULT (0) FOR [TAUSE]
GO

ALTER TABLE [dbo].[HCapExt] DROP CONSTRAINT [DF_Relojes_Modo526]
GO

ALTER TABLE [dbo].[HCapExt] ADD CONSTRAINT [DF_Relojes_Modo526] DEFAULT (0) FOR [TEXTR]
GO

ALTER TABLE [dbo].[HCastigos] DROP CONSTRAINT [DF_Relojes_Modo298]
GO

ALTER TABLE [dbo].[HCastigos] ADD CONSTRAINT [DF_Relojes_Modo298] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HCastigos] DROP CONSTRAINT [DF_Relojes_Modo299]
GO

ALTER TABLE [dbo].[HCastigos] ADD CONSTRAINT [DF_Relojes_Modo299] DEFAULT (0) FOR [Id_Razon]
GO

ALTER TABLE [dbo].[HCategorias] DROP CONSTRAINT [DF_Relojes_Modo130]
GO

ALTER TABLE [dbo].[HCategorias] ADD CONSTRAINT [DF_Relojes_Modo130] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HCategorias] DROP CONSTRAINT [DF_Relojes_Modo131]
GO

ALTER TABLE [dbo].[HCategorias] ADD CONSTRAINT [DF_Relojes_Modo131] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HCategorias] DROP CONSTRAINT [DF_Relojes_Modo132]
GO

ALTER TABLE [dbo].[HCategorias] ADD CONSTRAINT [DF_Relojes_Modo132] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HCia] DROP CONSTRAINT [DF_Relojes_Modo255]
GO

ALTER TABLE [dbo].[HCia] ADD CONSTRAINT [DF_Relojes_Modo255] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HCia] DROP CONSTRAINT [DF_Relojes_Modo256]
GO

ALTER TABLE [dbo].[HCia] ADD CONSTRAINT [DF_Relojes_Modo256] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HCia] DROP CONSTRAINT [DF_Relojes_Modo257]
GO

ALTER TABLE [dbo].[HCia] ADD CONSTRAINT [DF_Relojes_Modo257] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HDepartamentos] DROP CONSTRAINT [DF_Relojes_Modo383]
GO

ALTER TABLE [dbo].[HDepartamentos] ADD CONSTRAINT [DF_Relojes_Modo383] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HDepartamentos] DROP CONSTRAINT [DF_Relojes_Modo384]
GO

ALTER TABLE [dbo].[HDepartamentos] ADD CONSTRAINT [DF_Relojes_Modo384] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HErroresPassword] DROP CONSTRAINT [DF_Relojes_Modo661]
GO

ALTER TABLE [dbo].[HErroresPassword] ADD CONSTRAINT [DF_Relojes_Modo661] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[HEvalua] DROP CONSTRAINT [DF_Relojes_Modo595]
GO

ALTER TABLE [dbo].[HEvalua] ADD CONSTRAINT [DF_Relojes_Modo595] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HEvalua] DROP CONSTRAINT [DF_Relojes_Modo596]
GO

ALTER TABLE [dbo].[HEvalua] ADD CONSTRAINT [DF_Relojes_Modo596] DEFAULT (0) FOR [Calificacion]
GO

ALTER TABLE [dbo].[HFaltasInd] DROP CONSTRAINT [DF_Relojes_Modo293]
GO

ALTER TABLE [dbo].[HFaltasInd] ADD CONSTRAINT [DF_Relojes_Modo293] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HFaltasInd] DROP CONSTRAINT [DF_Relojes_Modo294]
GO

ALTER TABLE [dbo].[HFaltasInd] ADD CONSTRAINT [DF_Relojes_Modo294] DEFAULT (0) FOR [Id_Razon]
GO

ALTER TABLE [dbo].[HHorarios] DROP CONSTRAINT [DF_Relojes_Modo386]
GO

ALTER TABLE [dbo].[HHorarios] ADD CONSTRAINT [DF_Relojes_Modo386] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HHorarios] DROP CONSTRAINT [DF_Relojes_Modo387]
GO

ALTER TABLE [dbo].[HHorarios] ADD CONSTRAINT [DF_Relojes_Modo387] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HHorarios] DROP CONSTRAINT [DF_Relojes_Modo388]
GO

ALTER TABLE [dbo].[HHorarios] ADD CONSTRAINT [DF_Relojes_Modo388] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HIncapacidades] DROP CONSTRAINT [DF_Relojes_Modo389]
GO

ALTER TABLE [dbo].[HIncapacidades] ADD CONSTRAINT [DF_Relojes_Modo389] DEFAULT (0) FOR [Id_EMP]
GO

ALTER TABLE [dbo].[HIncapacidades] DROP CONSTRAINT [DF_Relojes_Modo390]
GO

ALTER TABLE [dbo].[HIncapacidades] ADD CONSTRAINT [DF_Relojes_Modo390] DEFAULT (0) FOR [Id_Razon]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo620]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo620] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo621]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo621] DEFAULT (0) FOR [Id_PerImss]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo622]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo622] DEFAULT (0) FOR [Id_Salario]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo623]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo623] DEFAULT (0) FOR [IntFijaImss]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo624]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo624] DEFAULT (0) FOR [IntFijaInf]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo625]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo625] DEFAULT (0) FOR [IntVarImss]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo626]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo626] DEFAULT (0) FOR [IntVarInf]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo627]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo627] DEFAULT (0) FOR [SalImss]
GO

ALTER TABLE [dbo].[HIntegrados] DROP CONSTRAINT [DF_Relojes_Modo628]
GO

ALTER TABLE [dbo].[HIntegrados] ADD CONSTRAINT [DF_Relojes_Modo628] DEFAULT (0) FOR [SalInfo]
GO

ALTER TABLE [dbo].[HLineas] DROP CONSTRAINT [DF_Relojes_Modo391]
GO

ALTER TABLE [dbo].[HLineas] ADD CONSTRAINT [DF_Relojes_Modo391] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HLineas] DROP CONSTRAINT [DF_Relojes_Modo392]
GO

ALTER TABLE [dbo].[HLineas] ADD CONSTRAINT [DF_Relojes_Modo392] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HLineas] DROP CONSTRAINT [DF_Relojes_Modo393]
GO

ALTER TABLE [dbo].[HLineas] ADD CONSTRAINT [DF_Relojes_Modo393] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HNivel] DROP CONSTRAINT [DF_Relojes_Modo141]
GO

ALTER TABLE [dbo].[HNivel] ADD CONSTRAINT [DF_Relojes_Modo141] DEFAULT (0) FOR [id_emp]
GO

ALTER TABLE [dbo].[HNivel] DROP CONSTRAINT [DF_Relojes_Modo142]
GO

ALTER TABLE [dbo].[HNivel] ADD CONSTRAINT [DF_Relojes_Modo142] DEFAULT (0) FOR [Id_rel]
GO

ALTER TABLE [dbo].[HNivel] DROP CONSTRAINT [DF_Relojes_Modo143]
GO

ALTER TABLE [dbo].[HNivel] ADD CONSTRAINT [DF_Relojes_Modo143] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HNivelPlazas] DROP CONSTRAINT [DF__HNivelPla__Id_pl__050D993C]
GO

ALTER TABLE [dbo].[HNivelPlazas] ADD CONSTRAINT [DF__HNivelPla__Id_pl__050D993C] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[HNivelPlazas] DROP CONSTRAINT [DF__HNivelPla__Id_Re__0601BD75]
GO

ALTER TABLE [dbo].[HNivelPlazas] ADD CONSTRAINT [DF__HNivelPla__Id_Re__0601BD75] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[HNivelPlazas] DROP CONSTRAINT [DF__HNivelPla__Id_Us__06F5E1AE]
GO

ALTER TABLE [dbo].[HNivelPlazas] ADD CONSTRAINT [DF__HNivelPla__Id_Us__06F5E1AE] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HOperacion] DROP CONSTRAINT [DF_Relojes_Modo259]
GO

ALTER TABLE [dbo].[HOperacion] ADD CONSTRAINT [DF_Relojes_Modo259] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HOperacion] DROP CONSTRAINT [DF_Relojes_Modo260]
GO

ALTER TABLE [dbo].[HOperacion] ADD CONSTRAINT [DF_Relojes_Modo260] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[HOperacion] DROP CONSTRAINT [DF_Relojes_Modo261]
GO

ALTER TABLE [dbo].[HOperacion] ADD CONSTRAINT [DF_Relojes_Modo261] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HOvertime] DROP CONSTRAINT [DF_Relojes_Modo277]
GO

ALTER TABLE [dbo].[HOvertime] ADD CONSTRAINT [DF_Relojes_Modo277] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HOvertime] DROP CONSTRAINT [DF_Relojes_Modo278]
GO

ALTER TABLE [dbo].[HOvertime] ADD CONSTRAINT [DF_Relojes_Modo278] DEFAULT (0) FOR [Horas]
GO

ALTER TABLE [dbo].[HPasswords] DROP CONSTRAINT [DF_Relojes_Modo662]
GO

ALTER TABLE [dbo].[HPasswords] ADD CONSTRAINT [DF_Relojes_Modo662] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[HPerMigr] DROP CONSTRAINT [DF_Relojes_Modo433]
GO

ALTER TABLE [dbo].[HPerMigr] ADD CONSTRAINT [DF_Relojes_Modo433] DEFAULT (0) FOR [Id_Permiso]
GO

ALTER TABLE [dbo].[HPerMigr] DROP CONSTRAINT [DF_Relojes_Modo434]
GO

ALTER TABLE [dbo].[HPerMigr] ADD CONSTRAINT [DF_Relojes_Modo434] DEFAULT (0) FOR [Id_TipoPerm]
GO

ALTER TABLE [dbo].[HPlantas] DROP CONSTRAINT [DF_Relojes_Modo287]
GO

ALTER TABLE [dbo].[HPlantas] ADD CONSTRAINT [DF_Relojes_Modo287] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HPlantas] DROP CONSTRAINT [DF_Relojes_Modo288]
GO

ALTER TABLE [dbo].[HPlantas] ADD CONSTRAINT [DF_Relojes_Modo288] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HPlazas] DROP CONSTRAINT [DF__HPlazas__Id_plaz__1F937993]
GO

ALTER TABLE [dbo].[HPlazas] ADD CONSTRAINT [DF__HPlazas__Id_plaz__1F937993] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[HPlazas] DROP CONSTRAINT [DF__HPlazas__Id_User__20879DCC]
GO

ALTER TABLE [dbo].[HPlazas] ADD CONSTRAINT [DF__HPlazas__Id_User__20879DCC] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[Hpuestos] DROP CONSTRAINT [DF_Relojes_Modo289]
GO

ALTER TABLE [dbo].[Hpuestos] ADD CONSTRAINT [DF_Relojes_Modo289] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Hpuestos] DROP CONSTRAINT [DF_Relojes_Modo290]
GO

ALTER TABLE [dbo].[Hpuestos] ADD CONSTRAINT [DF_Relojes_Modo290] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[Hpuestos] DROP CONSTRAINT [DF_Relojes_Modo291]
GO

ALTER TABLE [dbo].[Hpuestos] ADD CONSTRAINT [DF_Relojes_Modo291] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HpuestosPlazas] DROP CONSTRAINT [DF__HpuestosP__Id_pl__799BE690]
GO

ALTER TABLE [dbo].[HpuestosPlazas] ADD CONSTRAINT [DF__HpuestosP__Id_pl__799BE690] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[HpuestosPlazas] DROP CONSTRAINT [DF__HpuestosP__Id_Re__77B39E1E]
GO

ALTER TABLE [dbo].[HpuestosPlazas] ADD CONSTRAINT [DF__HpuestosP__Id_Re__77B39E1E] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[HpuestosPlazas] DROP CONSTRAINT [DF__HpuestosP__Id_Us__78A7C257]
GO

ALTER TABLE [dbo].[HpuestosPlazas] ADD CONSTRAINT [DF__HpuestosP__Id_Us__78A7C257] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HRotacion] DROP CONSTRAINT [DF_Relojes_Modo284]
GO

ALTER TABLE [dbo].[HRotacion] ADD CONSTRAINT [DF_Relojes_Modo284] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HRotacion] DROP CONSTRAINT [DF_Relojes_Modo285]
GO

ALTER TABLE [dbo].[HRotacion] ADD CONSTRAINT [DF_Relojes_Modo285] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[HRotacion] DROP CONSTRAINT [DF_Relojes_Modo286]
GO

ALTER TABLE [dbo].[HRotacion] ADD CONSTRAINT [DF_Relojes_Modo286] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HSALARIOS] DROP CONSTRAINT [DF_Relojes_Modo162]
GO

ALTER TABLE [dbo].[HSALARIOS] ADD CONSTRAINT [DF_Relojes_Modo162] DEFAULT (0) FOR [Id_EMP]
GO

ALTER TABLE [dbo].[HSALARIOS] DROP CONSTRAINT [DF_Relojes_Modo163]
GO

ALTER TABLE [dbo].[HSALARIOS] ADD CONSTRAINT [DF_Relojes_Modo163] DEFAULT (0) FOR [IntegFija]
GO

ALTER TABLE [dbo].[HSALARIOS] DROP CONSTRAINT [DF_Relojes_Modo164]
GO

ALTER TABLE [dbo].[HSALARIOS] ADD CONSTRAINT [DF_Relojes_Modo164] DEFAULT (0) FOR [IntegVar]
GO

ALTER TABLE [dbo].[HSALARIOS] DROP CONSTRAINT [DF_Relojes_Modo165]
GO

ALTER TABLE [dbo].[HSALARIOS] ADD CONSTRAINT [DF_Relojes_Modo165] DEFAULT (0) FOR [Id_Calif]
GO

ALTER TABLE [dbo].[HSALARIOS] DROP CONSTRAINT [DF_Relojes_Modo166]
GO

ALTER TABLE [dbo].[HSALARIOS] ADD CONSTRAINT [DF_Relojes_Modo166] DEFAULT (0) FOR [Actual]
GO

ALTER TABLE [dbo].[HSupervisor] DROP CONSTRAINT [DF_Relojes_Modo170]
GO

ALTER TABLE [dbo].[HSupervisor] ADD CONSTRAINT [DF_Relojes_Modo170] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HSupervisor] DROP CONSTRAINT [DF_Relojes_Modo171]
GO

ALTER TABLE [dbo].[HSupervisor] ADD CONSTRAINT [DF_Relojes_Modo171] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[HSupervisor] DROP CONSTRAINT [DF_Relojes_Modo172]
GO

ALTER TABLE [dbo].[HSupervisor] ADD CONSTRAINT [DF_Relojes_Modo172] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HTipoEmpleo] DROP CONSTRAINT [DF_Relojes_Modo282]
GO

ALTER TABLE [dbo].[HTipoEmpleo] ADD CONSTRAINT [DF_Relojes_Modo282] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HTipoEmpleo] DROP CONSTRAINT [DF_Relojes_Modo283]
GO

ALTER TABLE [dbo].[HTipoEmpleo] ADD CONSTRAINT [DF_Relojes_Modo283] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HTipoMO] DROP CONSTRAINT [DF_Relojes_Modo275]
GO

ALTER TABLE [dbo].[HTipoMO] ADD CONSTRAINT [DF_Relojes_Modo275] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HTipoMO] DROP CONSTRAINT [DF_Relojes_Modo276]
GO

ALTER TABLE [dbo].[HTipoMO] ADD CONSTRAINT [DF_Relojes_Modo276] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HTurnos] DROP CONSTRAINT [DF_Relojes_Modo280]
GO

ALTER TABLE [dbo].[HTurnos] ADD CONSTRAINT [DF_Relojes_Modo280] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HTurnos] DROP CONSTRAINT [DF_Relojes_Modo281]
GO

ALTER TABLE [dbo].[HTurnos] ADD CONSTRAINT [DF_Relojes_Modo281] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[HVacaciones] DROP CONSTRAINT [DF_Relojes_Modo279]
GO

ALTER TABLE [dbo].[HVacaciones] ADD CONSTRAINT [DF_Relojes_Modo279] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo562]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo562] DEFAULT (0) FOR [Año]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo563]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo563] DEFAULT (0) FOR [PerImss]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo564]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo564] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo565]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo565] DEFAULT (0) FOR [Id_Clave]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo566]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo566] DEFAULT (0) FOR [Horas]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo567]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo567] DEFAULT (0) FOR [Pesos]
GO

ALTER TABLE [dbo].[HVariables] DROP CONSTRAINT [DF_Relojes_Modo568]
GO

ALTER TABLE [dbo].[HVariables] ADD CONSTRAINT [DF_Relojes_Modo568] DEFAULT (0) FOR [PesosVar]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo351]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo351] DEFAULT (0) FOR [Id_Infonavit]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo352]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo352] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo353]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo353] DEFAULT (0) FOR [Porc]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo354]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo354] DEFAULT (0) FOR [PMantto]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo355]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo355] DEFAULT (0) FOR [Adeudo]
GO

ALTER TABLE [dbo].[Infonavit] DROP CONSTRAINT [DF_Relojes_Modo356]
GO

ALTER TABLE [dbo].[Infonavit] ADD CONSTRAINT [DF_Relojes_Modo356] DEFAULT (0) FOR [Factor]
GO

ALTER TABLE [dbo].[MensajesEmpleados] DROP CONSTRAINT [DF_Relojes_Modo379]
GO

ALTER TABLE [dbo].[MensajesEmpleados] ADD CONSTRAINT [DF_Relojes_Modo379] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [DF_Relojes_Modo642]
GO

ALTER TABLE [dbo].[Monedas] ADD CONSTRAINT [DF_Relojes_Modo642] DEFAULT (0) FOR [Id_Moneda]
GO

ALTER TABLE [dbo].[Monedas] DROP CONSTRAINT [DF_Relojes_Modo643]
GO

ALTER TABLE [dbo].[Monedas] ADD CONSTRAINT [DF_Relojes_Modo643] DEFAULT (0) FOR [Valor]
GO

ALTER TABLE [dbo].[NaturalezaCuenta] DROP CONSTRAINT [DF_Relojes_Modo644]
GO

ALTER TABLE [dbo].[NaturalezaCuenta] ADD CONSTRAINT [DF_Relojes_Modo644] DEFAULT (0) FOR [Naturaleza]
GO

ALTER TABLE [dbo].[NoGrupos] DROP CONSTRAINT [DF_Relojes_Modo647]
GO

ALTER TABLE [dbo].[NoGrupos] ADD CONSTRAINT [DF_Relojes_Modo647] DEFAULT (0) FOR [Id_Grupo]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo214]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo214] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo215]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo215] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo216]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo216] DEFAULT (0) FOR [Seq]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo217]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo217] DEFAULT (0) FOR [Cantidad]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo218]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo218] DEFAULT (0) FOR [Sueldo]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo219]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo219] DEFAULT (0) FOR [Id_Categoria]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo220]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo220] DEFAULT (0) FOR [ClaveDif]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo221]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo221] DEFAULT (0) FOR [SaldoActual]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo222]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo222] DEFAULT (0) FOR [SaldoInicial]
GO

ALTER TABLE [dbo].[Nom_Excepciones] DROP CONSTRAINT [DF_Relojes_Modo223]
GO

ALTER TABLE [dbo].[Nom_Excepciones] ADD CONSTRAINT [DF_Relojes_Modo223] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[Nom_HAuditorias] DROP CONSTRAINT [DF_Relojes_Modo212]
GO

ALTER TABLE [dbo].[Nom_HAuditorias] ADD CONSTRAINT [DF_Relojes_Modo212] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[Nom_HAuditorias] DROP CONSTRAINT [DF_Relojes_Modo213]
GO

ALTER TABLE [dbo].[Nom_HAuditorias] ADD CONSTRAINT [DF_Relojes_Modo213] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[NoRelGrupos] DROP CONSTRAINT [DF_Relojes_Modo357]
GO

ALTER TABLE [dbo].[NoRelGrupos] ADD CONSTRAINT [DF_Relojes_Modo357] DEFAULT (0) FOR [Id_Grupo]
GO

ALTER TABLE [dbo].[NoRelGrupos] DROP CONSTRAINT [DF_Relojes_Modo358]
GO

ALTER TABLE [dbo].[NoRelGrupos] ADD CONSTRAINT [DF_Relojes_Modo358] DEFAULT (0) FOR [Id_Empleado]
GO

ALTER TABLE [dbo].[Parametros] DROP CONSTRAINT [DF_Relojes_Modo201]
GO

ALTER TABLE [dbo].[Parametros] ADD CONSTRAINT [DF_Relojes_Modo201] DEFAULT (0) FOR [Id_Compania]
GO

ALTER TABLE [dbo].[Parametros] DROP CONSTRAINT [DF_Relojes_Modo202]
GO

ALTER TABLE [dbo].[Parametros] ADD CONSTRAINT [DF_Relojes_Modo202] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[Parametros] DROP CONSTRAINT [DF_Relojes_Modo203]
GO

ALTER TABLE [dbo].[Parametros] ADD CONSTRAINT [DF_Relojes_Modo203] DEFAULT (0) FOR [DiasNomina]
GO

ALTER TABLE [dbo].[Parametros] DROP CONSTRAINT [DF_Relojes_Modo204]
GO

ALTER TABLE [dbo].[Parametros] ADD CONSTRAINT [DF_Relojes_Modo204] DEFAULT (0) FOR [DiasAcumulaISPT]
GO

ALTER TABLE [dbo].[ParametrosImss] DROP CONSTRAINT [DF_Relojes_Modo106]
GO

ALTER TABLE [dbo].[ParametrosImss] ADD CONSTRAINT [DF_Relojes_Modo106] DEFAULT (0) FOR [Id_Parametro]
GO

ALTER TABLE [dbo].[ParametrosImss] DROP CONSTRAINT [DF_Relojes_Modo107]
GO

ALTER TABLE [dbo].[ParametrosImss] ADD CONSTRAINT [DF_Relojes_Modo107] DEFAULT (0) FOR [Relacion]
GO

ALTER TABLE [dbo].[ParametrosImss] DROP CONSTRAINT [DF_Relojes_Modo108]
GO

ALTER TABLE [dbo].[ParametrosImss] ADD CONSTRAINT [DF_Relojes_Modo108] DEFAULT (0) FOR [ValorNum]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo109]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo109] DEFAULT (0) FOR [CF]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo110]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo110] DEFAULT (0) FOR [Exc]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo111]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo111] DEFAULT (0) FOR [PD]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo112]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo112] DEFAULT (0) FOR [GMP]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo113]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo113] DEFAULT (0) FOR [RT]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo114]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo114] DEFAULT (0) FOR [IV]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo115]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo115] DEFAULT (0) FOR [GPS]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo116]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo116] DEFAULT (0) FOR [T_CF]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo117]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo117] DEFAULT (0) FOR [T_EXC]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo118]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo118] DEFAULT (0) FOR [T_PD]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo119]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo119] DEFAULT (0) FOR [T_GMP]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo120]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo120] DEFAULT (0) FOR [T_RT]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo121]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo121] DEFAULT (0) FOR [T_IV]
GO

ALTER TABLE [dbo].[ParametrosSua] DROP CONSTRAINT [DF_Relojes_Modo122]
GO

ALTER TABLE [dbo].[ParametrosSua] ADD CONSTRAINT [DF_Relojes_Modo122] DEFAULT (0) FOR [T_GPS]
GO

ALTER TABLE [dbo].[Plantillas] DROP CONSTRAINT [DF_Relojes_Modo412]
GO

ALTER TABLE [dbo].[Plantillas] ADD CONSTRAINT [DF_Relojes_Modo412] DEFAULT (0) FOR [Id_plantilla]
GO

ALTER TABLE [dbo].[Plantillas] DROP CONSTRAINT [DF_Relojes_Modo413]
GO

ALTER TABLE [dbo].[Plantillas] ADD CONSTRAINT [DF_Relojes_Modo413] DEFAULT (0) FOR [Tipo_procesador]
GO

ALTER TABLE [dbo].[Plantillas] DROP CONSTRAINT [DF_Relojes_Modo414]
GO

ALTER TABLE [dbo].[Plantillas] ADD CONSTRAINT [DF_Relojes_Modo414] DEFAULT (0) FOR [Tipo_Campos]
GO

ALTER TABLE [dbo].[Plantillas_Consultas] DROP CONSTRAINT [DF_Relojes_Modo432]
GO

ALTER TABLE [dbo].[Plantillas_Consultas] ADD CONSTRAINT [DF_Relojes_Modo432] DEFAULT (0) FOR [Id_consulta]
GO

ALTER TABLE [dbo].[Plantillas_Marcadores] DROP CONSTRAINT [DF_Relojes_Modo153]
GO

ALTER TABLE [dbo].[Plantillas_Marcadores] ADD CONSTRAINT [DF_Relojes_Modo153] DEFAULT (0) FOR [Id_plantilla]
GO

ALTER TABLE [dbo].[Plantillas_Marcadores] DROP CONSTRAINT [DF_Relojes_Modo154]
GO

ALTER TABLE [dbo].[Plantillas_Marcadores] ADD CONSTRAINT [DF_Relojes_Modo154] DEFAULT (0) FOR [Id_Marcador]
GO

ALTER TABLE [dbo].[PlazaEmpleados] DROP CONSTRAINT [DF_Relojes_Modo332]
GO

ALTER TABLE [dbo].[PlazaEmpleados] ADD CONSTRAINT [DF_Relojes_Modo332] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[PlazaEmpleados] DROP CONSTRAINT [DF_Relojes_Modo333]
GO

ALTER TABLE [dbo].[PlazaEmpleados] ADD CONSTRAINT [DF_Relojes_Modo333] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[PlazaEmpleados] DROP CONSTRAINT [DF_Relojes_Modo334]
GO

ALTER TABLE [dbo].[PlazaEmpleados] ADD CONSTRAINT [DF_Relojes_Modo334] DEFAULT (0) FOR [Id_User]
GO

ALTER TABLE [dbo].[PlazaEmpleados] DROP CONSTRAINT [DF__Plazaempl__id_pl__61C66C42]
GO

ALTER TABLE [dbo].[PlazaEmpleados] ADD CONSTRAINT [DF__Plazaempl__id_pl__61C66C42] DEFAULT (0) FOR [id_plazaanterior]
GO

ALTER TABLE [dbo].[Plazas] DROP CONSTRAINT [DF_Relojes_Modo673]
GO

ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [DF_Relojes_Modo673] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[Plazas] DROP CONSTRAINT [DF_Relojes_Modo674]
GO

ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [DF_Relojes_Modo674] DEFAULT (0) FOR [Id_EmpProp]
GO

ALTER TABLE [dbo].[Plazas] DROP CONSTRAINT [DF_Relojes_Modo678]
GO

ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [DF_Relojes_Modo678] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Plazas] DROP CONSTRAINT [DF_Relojes_Modo679]
GO

ALTER TABLE [dbo].[Plazas] ADD CONSTRAINT [DF_Relojes_Modo679] DEFAULT (0) FOR [Id_EmpAnt]
GO

ALTER TABLE [dbo].[PlazasOrgan] DROP CONSTRAINT [DF__PlazasOrg__Id_pl__12397E75]
GO

ALTER TABLE [dbo].[PlazasOrgan] ADD CONSTRAINT [DF__PlazasOrg__Id_pl__12397E75] DEFAULT (0) FOR [Id_plaza]
GO

ALTER TABLE [dbo].[ProcesoPTU] DROP CONSTRAINT [DF_Relojes_Modo94]
GO

ALTER TABLE [dbo].[ProcesoPTU] ADD CONSTRAINT [DF_Relojes_Modo94] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Registro] DROP CONSTRAINT [DF_Relojes_Modo375]
GO

ALTER TABLE [dbo].[Registro] ADD CONSTRAINT [DF_Relojes_Modo375] DEFAULT (0) FOR [IdEmpleado]
GO

ALTER TABLE [dbo].[Registro] DROP CONSTRAINT [DF_Relojes_Modo376]
GO

ALTER TABLE [dbo].[Registro] ADD CONSTRAINT [DF_Relojes_Modo376] DEFAULT (0) FOR [AutorizoRetardo]
GO

ALTER TABLE [dbo].[Registro] DROP CONSTRAINT [DF__registro__Id_Raz__1F8B09D7]
GO

ALTER TABLE [dbo].[Registro] ADD CONSTRAINT [DF__registro__Id_Raz__1F8B09D7] DEFAULT (0) FOR [Id_Razon]
GO

ALTER TABLE [dbo].[Registro_Pat] DROP CONSTRAINT [DF_Relojes_Modo502]
GO

ALTER TABLE [dbo].[Registro_Pat] ADD CONSTRAINT [DF_Relojes_Modo502] DEFAULT (0) FOR [ID_REGPAT]
GO

ALTER TABLE [dbo].[Registro_Pat] DROP CONSTRAINT [DF_Relojes_Modo503]
GO

ALTER TABLE [dbo].[Registro_Pat] ADD CONSTRAINT [DF_Relojes_Modo503] DEFAULT (0) FOR [ID_PLANTA]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] DROP CONSTRAINT [DF_Relojes_Modo461]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] ADD CONSTRAINT [DF_Relojes_Modo461] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] DROP CONSTRAINT [DF_Relojes_Modo462]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] ADD CONSTRAINT [DF_Relojes_Modo462] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] DROP CONSTRAINT [DF_Relojes_Modo463]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] ADD CONSTRAINT [DF_Relojes_Modo463] DEFAULT (0) FOR [Id_Rel]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] DROP CONSTRAINT [DF_Relojes_Modo464]
GO

ALTER TABLE [dbo].[RelacionesEmpleados] ADD CONSTRAINT [DF_Relojes_Modo464] DEFAULT (0) FOR [Id_campo]
GO

ALTER TABLE [dbo].[reldirecciones] DROP CONSTRAINT [DF_Relojes_Modo318]
GO

ALTER TABLE [dbo].[reldirecciones] ADD CONSTRAINT [DF_Relojes_Modo318] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[Reloj_Registro] DROP CONSTRAINT [DF_Relojes_Modo95]
GO

ALTER TABLE [dbo].[Reloj_Registro] ADD CONSTRAINT [DF_Relojes_Modo95] DEFAULT (0) FOR [IdEmpleado]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo650]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo650] DEFAULT (0) FOR [Id_reloj]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo651]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo651] DEFAULT (0) FOR [Intervalo2]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo652]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo652] DEFAULT (0) FOR [DestruirObjeto]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo653]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo653] DEFAULT (0) FOR [Monitor]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo654]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo654] DEFAULT (0) FOR [ActualizaHora]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo655]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo655] DEFAULT (0) FOR [SubirInfo]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo656]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo656] DEFAULT (0) FOR [Teclado]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo657]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo657] DEFAULT (0) FOR [Status]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF_Relojes_Modo658]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF_Relojes_Modo658] DEFAULT (0) FOR [Modo]
GO

ALTER TABLE [dbo].[Relojes] DROP CONSTRAINT [DF__relojes__LeerIP__1E96E59E]
GO

ALTER TABLE [dbo].[Relojes] ADD CONSTRAINT [DF__relojes__LeerIP__1E96E59E] DEFAULT (1) FOR [LeerIP]
GO

ALTER TABLE [dbo].[RelojSupervisor] DROP CONSTRAINT [DF_Relojes_Modo180]
GO

ALTER TABLE [dbo].[RelojSupervisor] ADD CONSTRAINT [DF_Relojes_Modo180] DEFAULT (0) FOR [Id_reloj]
GO

ALTER TABLE [dbo].[RelojSupervisor] DROP CONSTRAINT [DF_Relojes_Modo181]
GO

ALTER TABLE [dbo].[RelojSupervisor] ADD CONSTRAINT [DF_Relojes_Modo181] DEFAULT (0) FOR [Id_Supervisor]
GO

ALTER TABLE [dbo].[ReportesNomina] DROP CONSTRAINT [DF_Relojes_Modo518]
GO

ALTER TABLE [dbo].[ReportesNomina] ADD CONSTRAINT [DF_Relojes_Modo518] DEFAULT (0) FOR [Id_Reporte]
GO

ALTER TABLE [dbo].[ReportesNomina] DROP CONSTRAINT [DF_Relojes_Modo519]
GO

ALTER TABLE [dbo].[ReportesNomina] ADD CONSTRAINT [DF_Relojes_Modo519] DEFAULT (0) FOR [id_usuario]
GO

ALTER TABLE [dbo].[ReportesNomina] DROP CONSTRAINT [DF_Relojes_Modo520]
GO

ALTER TABLE [dbo].[ReportesNomina] ADD CONSTRAINT [DF_Relojes_Modo520] DEFAULT (0) FOR [Tipo]
GO

ALTER TABLE [dbo].[ReportesNomina] DROP CONSTRAINT [DF_Relojes_Modo521]
GO

ALTER TABLE [dbo].[ReportesNomina] ADD CONSTRAINT [DF_Relojes_Modo521] DEFAULT (0) FOR [NivelReporte]
GO

ALTER TABLE [dbo].[ReportesNomina] DROP CONSTRAINT [DF_Relojes_Modo522]
GO

ALTER TABLE [dbo].[ReportesNomina] ADD CONSTRAINT [DF_Relojes_Modo522] DEFAULT (0) FOR [Charttype]
GO

ALTER TABLE [dbo].[RHExcepciones] DROP CONSTRAINT [DF_Relojes_Modo265]
GO

ALTER TABLE [dbo].[RHExcepciones] ADD CONSTRAINT [DF_Relojes_Modo265] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[RHExcepciones] DROP CONSTRAINT [DF_Relojes_Modo266]
GO

ALTER TABLE [dbo].[RHExcepciones] ADD CONSTRAINT [DF_Relojes_Modo266] DEFAULT (0) FOR [Sal_Prop]
GO

ALTER TABLE [dbo].[RptDiseñoFormatos] DROP CONSTRAINT [DF__rptDiseño__QCort__74FDFFD1]
GO

ALTER TABLE [dbo].[RptDiseñoFormatos] ADD CONSTRAINT [DF__rptDiseño__QCort__74FDFFD1] DEFAULT (0) FOR [QCorteBaseCaptura]
GO

ALTER TABLE [dbo].[RT_Cia] DROP CONSTRAINT [DF_Relojes_Modo488]
GO

ALTER TABLE [dbo].[RT_Cia] ADD CONSTRAINT [DF_Relojes_Modo488] DEFAULT (0) FOR [id_regpat]
GO

ALTER TABLE [dbo].[RT_Cia] DROP CONSTRAINT [DF_Relojes_Modo489]
GO

ALTER TABLE [dbo].[RT_Cia] ADD CONSTRAINT [DF_Relojes_Modo489] DEFAULT (0) FOR [rt]
GO

ALTER TABLE [dbo].[RT_Cia] DROP CONSTRAINT [DF_Relojes_Modo490]
GO

ALTER TABLE [dbo].[RT_Cia] ADD CONSTRAINT [DF_Relojes_Modo490] DEFAULT (0) FOR [t_rt]
GO

ALTER TABLE [dbo].[SaldosRecibos] DROP CONSTRAINT [DF_Relojes_Modo199]
GO

ALTER TABLE [dbo].[SaldosRecibos] ADD CONSTRAINT [DF_Relojes_Modo199] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[SeccionesRpt] DROP CONSTRAINT [DF_Relojes_Modo496]
GO

ALTER TABLE [dbo].[SeccionesRpt] ADD CONSTRAINT [DF_Relojes_Modo496] DEFAULT (0) FOR [Id_Reporte]
GO

ALTER TABLE [dbo].[Sistemas] DROP CONSTRAINT [DF_Relojes_Modo537]
GO

ALTER TABLE [dbo].[Sistemas] ADD CONSTRAINT [DF_Relojes_Modo537] DEFAULT (0) FOR [Clave]
GO

ALTER TABLE [dbo].[SM_Supervisores] DROP CONSTRAINT [DF_Relojes_Modo174]
GO

ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [DF_Relojes_Modo174] DEFAULT (0) FOR [id_sm]
GO

ALTER TABLE [dbo].[SM_Supervisores] DROP CONSTRAINT [DF_Relojes_Modo175]
GO

ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [DF_Relojes_Modo175] DEFAULT (0) FOR [Id_Supervisor]
GO

ALTER TABLE [dbo].[SM_Supervisores] DROP CONSTRAINT [DF_Relojes_Modo176]
GO

ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [DF_Relojes_Modo176] DEFAULT (0) FOR [cia_super]
GO

ALTER TABLE [dbo].[SupMaestros] DROP CONSTRAINT [DF_Relojes_Modo177]
GO

ALTER TABLE [dbo].[SupMaestros] ADD CONSTRAINT [DF_Relojes_Modo177] DEFAULT (0) FOR [id_sm]
GO

ALTER TABLE [dbo].[SupMaestros] DROP CONSTRAINT [DF_Relojes_Modo178]
GO

ALTER TABLE [dbo].[SupMaestros] ADD CONSTRAINT [DF_Relojes_Modo178] DEFAULT (0) FOR [Id_Supervisorm]
GO

ALTER TABLE [dbo].[SupMaestros] DROP CONSTRAINT [DF_Relojes_Modo179]
GO

ALTER TABLE [dbo].[SupMaestros] ADD CONSTRAINT [DF_Relojes_Modo179] DEFAULT (0) FOR [Id_cia]
GO

CREATE TABLE [dbo].[SYNCBITACORA] (
  [BitacoraID] int  IDENTITY(1,1) NOT NULL,
  [ObjectID] int  NULL,
  [ObjectName] varchar(500)  NULL,
  [DisableCheck] char(1)  NULL,
  [InsertIDEntity] char(1)  NULL,
  [HoraTermina] datetime  NULL
)
GO

ALTER TABLE [dbo].[SYSCAMPOS] DROP CONSTRAINT [DF_Relojes_Modo92]
GO

ALTER TABLE [dbo].[SYSCAMPOS] ADD CONSTRAINT [DF_Relojes_Modo92] DEFAULT (0) FOR [idTipoDato]
GO

ALTER TABLE [dbo].[SYSTABLAS] DROP CONSTRAINT [DF__systablas__reque__4B720FE8]
GO

ALTER TABLE [dbo].[SYSTABLAS] ADD CONSTRAINT [DF__systablas__reque__4B720FE8] DEFAULT (0) FOR [requerido]
GO

ALTER TABLE [dbo].[SystemLog] DROP CONSTRAINT [DF_Relojes_Modo575]
GO

ALTER TABLE [dbo].[SystemLog] ADD CONSTRAINT [DF_Relojes_Modo575] DEFAULT (0) FOR [EspacioLibre]
GO

ALTER TABLE [dbo].[SystemLog] DROP CONSTRAINT [DF_Relojes_Modo576]
GO

ALTER TABLE [dbo].[SystemLog] ADD CONSTRAINT [DF_Relojes_Modo576] DEFAULT (0) FOR [EspacioTotal]
GO

ALTER TABLE [dbo].[SystemLog] DROP CONSTRAINT [DF_Relojes_Modo577]
GO

ALTER TABLE [dbo].[SystemLog] ADD CONSTRAINT [DF_Relojes_Modo577] DEFAULT (0) FOR [Ram]
GO

ALTER TABLE [dbo].[SystemLog] DROP CONSTRAINT [DF_Relojes_Modo578]
GO

ALTER TABLE [dbo].[SystemLog] ADD CONSTRAINT [DF_Relojes_Modo578] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[SysTipoDato] DROP CONSTRAINT [DF_Relojes_Modo93]
GO

ALTER TABLE [dbo].[SysTipoDato] ADD CONSTRAINT [DF_Relojes_Modo93] DEFAULT (0) FOR [idTipoDato]
GO

ALTER TABLE [dbo].[TablaConfigOrgan] DROP CONSTRAINT [DF_Relojes_Modo669]
GO

ALTER TABLE [dbo].[TablaConfigOrgan] ADD CONSTRAINT [DF_Relojes_Modo669] DEFAULT (0) FOR [Id_TablaLongitud]
GO

ALTER TABLE [dbo].[TablaLongitud] DROP CONSTRAINT [DF_Relojes_Modo670]
GO

ALTER TABLE [dbo].[TablaLongitud] ADD CONSTRAINT [DF_Relojes_Modo670] DEFAULT (0) FOR [Id_TablaLongitud]
GO

ALTER TABLE [dbo].[TablaLongitud] DROP CONSTRAINT [DF_Relojes_Modo671]
GO

ALTER TABLE [dbo].[TablaLongitud] ADD CONSTRAINT [DF_Relojes_Modo671] DEFAULT (0) FOR [Longitud]
GO

ALTER TABLE [dbo].[TAdic] DROP CONSTRAINT [DF_Relojes_Modo599]
GO

ALTER TABLE [dbo].[TAdic] ADD CONSTRAINT [DF_Relojes_Modo599] DEFAULT (0) FOR [Id_Adic]
GO

ALTER TABLE [dbo].[TBancos] DROP CONSTRAINT [DF_Relojes_Modo580]
GO

ALTER TABLE [dbo].[TBancos] ADD CONSTRAINT [DF_Relojes_Modo580] DEFAULT (0) FOR [Id_Banco]
GO

ALTER TABLE [dbo].[TBancos] DROP CONSTRAINT [DF_Relojes_Modo581]
GO

ALTER TABLE [dbo].[TBancos] ADD CONSTRAINT [DF_Relojes_Modo581] DEFAULT (0) FOR [BANCO]
GO

ALTER TABLE [dbo].[TBecEscue] DROP CONSTRAINT [DF_Relojes_Modo612]
GO

ALTER TABLE [dbo].[TBecEscue] ADD CONSTRAINT [DF_Relojes_Modo612] DEFAULT (0) FOR [Id_Escuela]
GO

ALTER TABLE [dbo].[TBecEspec] DROP CONSTRAINT [DF_Relojes_Modo618]
GO

ALTER TABLE [dbo].[TBecEspec] ADD CONSTRAINT [DF_Relojes_Modo618] DEFAULT (0) FOR [Id_Especialidad]
GO

ALTER TABLE [dbo].[TBecGrados] DROP CONSTRAINT [DF_Relojes_Modo631]
GO

ALTER TABLE [dbo].[TBecGrados] ADD CONSTRAINT [DF_Relojes_Modo631] DEFAULT (0) FOR [Id_Grados]
GO

ALTER TABLE [dbo].[TBecTipo] DROP CONSTRAINT [DF_Relojes_Modo636]
GO

ALTER TABLE [dbo].[TBecTipo] ADD CONSTRAINT [DF_Relojes_Modo636] DEFAULT (0) FOR [Id_TipoBeca]
GO

ALTER TABLE [dbo].[TBtEscol] DROP CONSTRAINT [DF_Relojes_Modo638]
GO

ALTER TABLE [dbo].[TBtEscol] ADD CONSTRAINT [DF_Relojes_Modo638] DEFAULT (0) FOR [Id_Escolaridad]
GO

ALTER TABLE [dbo].[TBtEscol] DROP CONSTRAINT [DF_Relojes_Modo639]
GO

ALTER TABLE [dbo].[TBtEscol] ADD CONSTRAINT [DF_Relojes_Modo639] DEFAULT (0) FOR [NUMER]
GO

ALTER TABLE [dbo].[TBtIdioma] DROP CONSTRAINT [DF_Relojes_Modo645]
GO

ALTER TABLE [dbo].[TBtIdioma] ADD CONSTRAINT [DF_Relojes_Modo645] DEFAULT (0) FOR [Id_Idioma]
GO

ALTER TABLE [dbo].[TBtIdioma] DROP CONSTRAINT [DF_Relojes_Modo646]
GO

ALTER TABLE [dbo].[TBtIdioma] ADD CONSTRAINT [DF_Relojes_Modo646] DEFAULT (0) FOR [numer]
GO

ALTER TABLE [dbo].[TBtPuesto] DROP CONSTRAINT [DF_Relojes_Modo648]
GO

ALTER TABLE [dbo].[TBtPuesto] ADD CONSTRAINT [DF_Relojes_Modo648] DEFAULT (0) FOR [Id_Puestos]
GO

ALTER TABLE [dbo].[TBtPuesto] DROP CONSTRAINT [DF_Relojes_Modo649]
GO

ALTER TABLE [dbo].[TBtPuesto] ADD CONSTRAINT [DF_Relojes_Modo649] DEFAULT (0) FOR [NUMER]
GO

ALTER TABLE [dbo].[TCategorias] DROP CONSTRAINT [DF_Relojes_Modo133]
GO

ALTER TABLE [dbo].[TCategorias] ADD CONSTRAINT [DF_Relojes_Modo133] DEFAULT (0) FOR [Id_Categorias]
GO

ALTER TABLE [dbo].[TCategorias] DROP CONSTRAINT [DF_Relojes_Modo134]
GO

ALTER TABLE [dbo].[TCategorias] ADD CONSTRAINT [DF_Relojes_Modo134] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[TCia] DROP CONSTRAINT [DF_Relojes_Modo258]
GO

ALTER TABLE [dbo].[TCia] ADD CONSTRAINT [DF_Relojes_Modo258] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[TCiudad] DROP CONSTRAINT [DF_Relojes_Modo410]
GO

ALTER TABLE [dbo].[TCiudad] ADD CONSTRAINT [DF_Relojes_Modo410] DEFAULT (0) FOR [Id_Ciudad]
GO

ALTER TABLE [dbo].[TClaCardex] DROP CONSTRAINT [DF_Relojes_Modo417]
GO

ALTER TABLE [dbo].[TClaCardex] ADD CONSTRAINT [DF_Relojes_Modo417] DEFAULT (0) FOR [Id_ClaCardex]
GO

ALTER TABLE [dbo].[TClaCardex] DROP CONSTRAINT [DF_Relojes_Modo418]
GO

ALTER TABLE [dbo].[TClaCardex] ADD CONSTRAINT [DF_Relojes_Modo418] DEFAULT (0) FOR [Color]
GO

ALTER TABLE [dbo].[TE_AutPrevio] DROP CONSTRAINT [DF_Relojes_Modo371]
GO

ALTER TABLE [dbo].[TE_AutPrevio] ADD CONSTRAINT [DF_Relojes_Modo371] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[TE_AutPrevio] DROP CONSTRAINT [DF_Relojes_Modo372]
GO

ALTER TABLE [dbo].[TE_AutPrevio] ADD CONSTRAINT [DF_Relojes_Modo372] DEFAULT (0) FOR [Id_UserActivo]
GO

ALTER TABLE [dbo].[TiempoIncompleto] DROP CONSTRAINT [DF_Relojes_Modo377]
GO

ALTER TABLE [dbo].[TiempoIncompleto] ADD CONSTRAINT [DF_Relojes_Modo377] DEFAULT (0) FOR [IdEmpleado]
GO

ALTER TABLE [dbo].[TiempoxDia] DROP CONSTRAINT [DF_Relojes_Modo374]
GO

ALTER TABLE [dbo].[TiempoxDia] ADD CONSTRAINT [DF_Relojes_Modo374] DEFAULT (0) FOR [IdEmpleado]
GO

CREATE TABLE [dbo].[TMPUSEDSPACE] (
  [NombreTabla] varchar(70)  NULL,
  [DataMB] int  NULL,
  [IndexMB] int  NULL
)
GO

ALTER TABLE [dbo].[TNacionalidad] DROP CONSTRAINT [DF_Relojes_Modo448]
GO

ALTER TABLE [dbo].[TNacionalidad] ADD CONSTRAINT [DF_Relojes_Modo448] DEFAULT (0) FOR [Id_Nacionalidad]
GO

ALTER TABLE [dbo].[TOperaciones] DROP CONSTRAINT [DF_Relojes_Modo431]
GO

ALTER TABLE [dbo].[TOperaciones] ADD CONSTRAINT [DF_Relojes_Modo431] DEFAULT (0) FOR [Id_Operacion]
GO

ALTER TABLE [dbo].[TPais] DROP CONSTRAINT [DF_Relojes_Modo495]
GO

ALTER TABLE [dbo].[TPais] ADD CONSTRAINT [DF_Relojes_Modo495] DEFAULT (0) FOR [Id_Pais]
GO

ALTER TABLE [dbo].[TProcesosCalendario] DROP CONSTRAINT [DF_Relojes_Modo207]
GO

ALTER TABLE [dbo].[TProcesosCalendario] ADD CONSTRAINT [DF_Relojes_Modo207] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[TProcesosValorXDia] DROP CONSTRAINT [DF_Relojes_Modo335]
GO

ALTER TABLE [dbo].[TProcesosValorXDia] ADD CONSTRAINT [DF_Relojes_Modo335] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[TProcesosValorXPeriodo] DROP CONSTRAINT [DF_Relojes_Modo205]
GO

ALTER TABLE [dbo].[TProcesosValorXPeriodo] ADD CONSTRAINT [DF_Relojes_Modo205] DEFAULT (0) FOR [Id_Periodo]
GO

ALTER TABLE [dbo].[TProcesosValorXPeriodo] DROP CONSTRAINT [DF_Relojes_Modo206]
GO

ALTER TABLE [dbo].[TProcesosValorXPeriodo] ADD CONSTRAINT [DF_Relojes_Modo206] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[TRazBaj] DROP CONSTRAINT [DF_Relojes_Modo513]
GO

ALTER TABLE [dbo].[TRazBaj] ADD CONSTRAINT [DF_Relojes_Modo513] DEFAULT (0) FOR [Id_Razon]
GO

ALTER TABLE [dbo].[TRazCas] DROP CONSTRAINT [DF_Relojes_Modo523]
GO

ALTER TABLE [dbo].[TRazCas] ADD CONSTRAINT [DF_Relojes_Modo523] DEFAULT (0) FOR [Id_RazCas]
GO

ALTER TABLE [dbo].[TRazFal] DROP CONSTRAINT [DF_Relojes_Modo531]
GO

ALTER TABLE [dbo].[TRazFal] ADD CONSTRAINT [DF_Relojes_Modo531] DEFAULT (0) FOR [Id_RazFal]
GO

ALTER TABLE [dbo].[TRazInc] DROP CONSTRAINT [DF_Relojes_Modo532]
GO

ALTER TABLE [dbo].[TRazInc] ADD CONSTRAINT [DF_Relojes_Modo532] DEFAULT (0) FOR [Id_RazInc]
GO

ALTER TABLE [dbo].[TRecibos] DROP CONSTRAINT [DF__TRecibos__Lineas__10F22C77]
GO

ALTER TABLE [dbo].[TRecibos] ADD CONSTRAINT [DF__TRecibos__Lineas__10F22C77] DEFAULT (11) FOR [Lineas]
GO

ALTER TABLE [dbo].[TRepLegal] DROP CONSTRAINT [DF_Relojes_Modo367]
GO

ALTER TABLE [dbo].[TRepLegal] ADD CONSTRAINT [DF_Relojes_Modo367] DEFAULT (0) FOR [Id_Represent]
GO

ALTER TABLE [dbo].[TRepLegal] DROP CONSTRAINT [DF_Relojes_Modo368]
GO

ALTER TABLE [dbo].[TRepLegal] ADD CONSTRAINT [DF_Relojes_Modo368] DEFAULT (0) FOR [Id_Empleado]
GO

ALTER TABLE [dbo].[TRotacion] DROP CONSTRAINT [DF_Relojes_Modo534]
GO

ALTER TABLE [dbo].[TRotacion] ADD CONSTRAINT [DF_Relojes_Modo534] DEFAULT (0) FOR [Id_Rotacion]
GO

ALTER TABLE [dbo].[TRotacion] DROP CONSTRAINT [DF_Relojes_Modo535]
GO

ALTER TABLE [dbo].[TRotacion] ADD CONSTRAINT [DF_Relojes_Modo535] DEFAULT (0) FOR [GpoRotacion]
GO

ALTER TABLE [dbo].[Tseccionrecibo] DROP CONSTRAINT [DF__Tseccionr__Segui__62BA907B]
GO

ALTER TABLE [dbo].[Tseccionrecibo] ADD CONSTRAINT [DF__Tseccionr__Segui__62BA907B] DEFAULT (0) FOR [Seguimiento]
GO

ALTER TABLE [dbo].[TSitLab] DROP CONSTRAINT [DF_Relojes_Modo536]
GO

ALTER TABLE [dbo].[TSitLab] ADD CONSTRAINT [DF_Relojes_Modo536] DEFAULT (0) FOR [Id_SitLab]
GO

ALTER TABLE [dbo].[TSupervisor] DROP CONSTRAINT [DF_Relojes_Modo182]
GO

ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [DF_Relojes_Modo182] DEFAULT (0) FOR [Id_Supervisor]
GO

ALTER TABLE [dbo].[TSupervisor] DROP CONSTRAINT [DF_Relojes_Modo183]
GO

ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [DF_Relojes_Modo183] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[TSupervisor] DROP CONSTRAINT [DF_Relojes_Modo185]
GO

ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [DF_Relojes_Modo185] DEFAULT (0) FOR [AQUIEN]
GO

ALTER TABLE [dbo].[TSupervisor] DROP CONSTRAINT [DF_Relojes_Modo186]
GO

ALTER TABLE [dbo].[TSupervisor] ADD CONSTRAINT [DF_Relojes_Modo186] DEFAULT (0) FOR [StatusB]
GO

ALTER TABLE [dbo].[TTiempoExtra] DROP CONSTRAINT [DF_Relojes_Modo189]
GO

ALTER TABLE [dbo].[TTiempoExtra] ADD CONSTRAINT [DF_Relojes_Modo189] DEFAULT (0) FOR [Id_Emp]
GO

ALTER TABLE [dbo].[TTiempoExtra] DROP CONSTRAINT [DF_Relojes_Modo190]
GO

ALTER TABLE [dbo].[TTiempoExtra] ADD CONSTRAINT [DF_Relojes_Modo190] DEFAULT (0) FOR [Id_cia]
GO

ALTER TABLE [dbo].[TTipPerm] DROP CONSTRAINT [DF_Relojes_Modo579]
GO

ALTER TABLE [dbo].[TTipPerm] ADD CONSTRAINT [DF_Relojes_Modo579] DEFAULT (0) FOR [Id_TipoPerm]
GO

ALTER TABLE [dbo].[TTrabajos] DROP CONSTRAINT [DF__TTrabajos__Activ__219EE2FE]
GO

ALTER TABLE [dbo].[TTrabajos] ADD CONSTRAINT [DF__TTrabajos__Activ__219EE2FE] DEFAULT (0) FOR [Activacion]
GO

ALTER TABLE [dbo].[TVacaciones] DROP CONSTRAINT [DF_Relojes_Modo169]
GO

ALTER TABLE [dbo].[TVacaciones] ADD CONSTRAINT [DF_Relojes_Modo169] DEFAULT (0) FOR [CIA]
GO

ALTER TABLE [dbo].[UltimoID] DROP CONSTRAINT [DF_Relojes_Modo514]
GO

ALTER TABLE [dbo].[UltimoID] ADD CONSTRAINT [DF_Relojes_Modo514] DEFAULT (0) FOR [Ca06]
GO

ALTER TABLE [dbo].[UltimoID] DROP CONSTRAINT [DF_Relojes_Modo515]
GO

ALTER TABLE [dbo].[UltimoID] ADD CONSTRAINT [DF_Relojes_Modo515] DEFAULT (0) FOR [Ca07]
GO

ALTER TABLE [dbo].[UltimoIdEmp] DROP CONSTRAINT [DF_Relojes_Modo517]
GO

ALTER TABLE [dbo].[UltimoIdEmp] ADD CONSTRAINT [DF_Relojes_Modo517] DEFAULT (0) FOR [Empleados]
GO

ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF_Relojes_Modo540]
GO

ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [DF_Relojes_Modo540] DEFAULT (0) FOR [Id_Usuario]
GO

ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [DF_Relojes_Modo541]
GO

ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [DF_Relojes_Modo541] DEFAULT (0) FOR [Full]
GO

ALTER TABLE [dbo].[Vales] DROP CONSTRAINT [DF_Relojes_Modo528]
GO

ALTER TABLE [dbo].[Vales] ADD CONSTRAINT [DF_Relojes_Modo528] DEFAULT (0) FOR [Id_Vale]
GO

ALTER TABLE [dbo].[VariablesGraficas] DROP CONSTRAINT [DF_Relojes_Modo529]
GO

ALTER TABLE [dbo].[VariablesGraficas] ADD CONSTRAINT [DF_Relojes_Modo529] DEFAULT (0) FOR [Id_VarGrafica]
GO

ALTER TABLE [dbo].[VariablesGraficas] DROP CONSTRAINT [DF_Relojes_Modo530]
GO

ALTER TABLE [dbo].[VariablesGraficas] ADD CONSTRAINT [DF_Relojes_Modo530] DEFAULT (0) FOR [Id_usuario]
GO

ALTER TABLE [dbo].[AccesosCampos] ADD CONSTRAINT [R_373] FOREIGN KEY ([Id_Campo]) REFERENCES [dbo].[CamposMaestro] ([Id_Campo]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpEscol] ADD CONSTRAINT [R_492] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpExper] ADD CONSTRAINT [R_491] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpIdio] ADD CONSTRAINT [R_486] FOREIGN KEY ([Id_Idioma]) REFERENCES [dbo].[TBtIdioma] ([Id_Idioma]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpIdio] ADD CONSTRAINT [R_485] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpPto] ADD CONSTRAINT [R_495] FOREIGN KEY ([Id_Puesto]) REFERENCES [dbo].[TBtPuesto] ([Id_Puestos]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpPto] ADD CONSTRAINT [R_494] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmpRefer] ADD CONSTRAINT [R_490] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtEmptur] ADD CONSTRAINT [R_496] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[BtSeminarios] ADD CONSTRAINT [R_497] FOREIGN KEY ([Id_Solicitud]) REFERENCES [dbo].[BolsaTrab] ([Id_Solicitud]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [R_504] FOREIGN KEY ([Id_Campo]) REFERENCES [dbo].[CNCampos] ([Id_Campo]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[CNNombres] ADD CONSTRAINT [R_505] FOREIGN KEY ([Id_Parentesco]) REFERENCES [dbo].[CNParentescos] ([Id_Parentesco]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Conceptos] ADD CONSTRAINT [FK_Conceptos_TCatConceptos] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[TCatConcepto] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Empleados] ADD CONSTRAINT [R_522] FOREIGN KEY ([id_PuestoEquiv]) REFERENCES [dbo].[PuestoEquiv] ([id_PuestoEquiv]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBajas] ADD CONSTRAINT [R_549] FOREIGN KEY ([Id_Motivoe]) REFERENCES [dbo].[TRazBaj] ([Id_Razon]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBajas] ADD CONSTRAINT [R_551] FOREIGN KEY ([Id_Motivss]) REFERENCES [dbo].[TRazBaj] ([Id_Razon]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [R_530] FOREIGN KEY ([Id_Escuela]) REFERENCES [dbo].[TBecEscue] ([Id_Escuela]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [R_532] FOREIGN KEY ([Id_Especialidad]) REFERENCES [dbo].[TBecEspec] ([Id_Especialidad]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [R_531] FOREIGN KEY ([Id_Grados]) REFERENCES [dbo].[TBecGrados] ([Id_Grados]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HBecas] ADD CONSTRAINT [R_529] FOREIGN KEY ([Id_TipoBeca]) REFERENCES [dbo].[TBecTipo] ([Id_TipoBeca]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HPerMigr] ADD CONSTRAINT [R_566] FOREIGN KEY ([Id_TipoPerm]) REFERENCES [dbo].[TTipPerm] ([Id_TipoPerm]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[HSupervisor] ADD CONSTRAINT [R_581] FOREIGN KEY ([Id_Rel]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[plazas_vr_estatus] ADD CONSTRAINT [FK_plazas_vr_estatus_plazas_vr_catestatus_idestatus] FOREIGN KEY ([idestatus]) REFERENCES [dbo].[plazas_vr_catestatus] ([idestatus]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[plazas_vr_roles_permisos] ADD CONSTRAINT [FK__plazas_vr__permi__1F351EF1] FOREIGN KEY ([permiso]) REFERENCES [dbo].[plazas_vr_permisos] ([permiso]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[plazas_vr_roles_permisos] ADD CONSTRAINT [FK__plazas_vr_r__rol__2029432A] FOREIGN KEY ([rol]) REFERENCES [dbo].[plazas_vr_roles] ([rol]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[plazas_vr_usuarios_roles] ADD CONSTRAINT [FK__plazas_vr__usuar__211D6763] FOREIGN KEY ([usuario]) REFERENCES [dbo].[plazas_vr_usuarios] ([usuario]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[plazas_vr_usuarios_roles] ADD CONSTRAINT [FK__plazas_vr_u__rol__22118B9C] FOREIGN KEY ([rol]) REFERENCES [dbo].[plazas_vr_roles] ([rol]) ON DELETE NO ACTION ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[RelGrupoSicapron] ADD CONSTRAINT [FK__RelGrupoS__Id_Gr__295BDA14] FOREIGN KEY ([Id_Grupo]) REFERENCES [dbo].[TGrupoSicapron] ([Id_Grupo]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RelojSupervisor] ADD CONSTRAINT [R_315] FOREIGN KEY ([Id_Supervisor]) REFERENCES [dbo].[TSupervisor] ([Id_Supervisor]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RelojSupervisor] ADD CONSTRAINT [R_314] FOREIGN KEY ([Id_reloj]) REFERENCES [dbo].[Relojes] ([Id_reloj]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RPartidaPre_Conceptos] ADD CONSTRAINT [fk_parconrel] FOREIGN KEY ([id_rel]) REFERENCES [dbo].[TPartidaPre_Conceptos] ([id_PartidaPre_Conceptos]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptCamposFormatos] ADD CONSTRAINT [R_457] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptFiguraFormatos] ADD CONSTRAINT [R_451] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptLineaFormatos] ADD CONSTRAINT [R_455] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptPictureFormatos] ADD CONSTRAINT [R_452] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptSeccionGrupoFormatos] ADD CONSTRAINT [R_453] FOREIGN KEY ([id_seccion]) REFERENCES [dbo].[RptSeccionesFormatos] ([id_seccion]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[RptSeccionGrupoFormatos] ADD CONSTRAINT [R_454] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[SeccionesRpt] ADD CONSTRAINT [R_483] FOREIGN KEY ([Id_Reporte]) REFERENCES [dbo].[DisenioRpt] ([Id_Reporte]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[SM_Supervisores] ADD CONSTRAINT [R_329] FOREIGN KEY ([id_sm]) REFERENCES [dbo].[SupMaestros] ([id_sm]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[SYSCAMPOS] ADD CONSTRAINT [R_604] FOREIGN KEY ([IdTipoCampo]) REFERENCES [dbo].[SysTipoCampo] ([IdTipoCampo]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[SYSTABLAS] ADD CONSTRAINT [R_598] FOREIGN KEY ([IdBaseDatos]) REFERENCES [dbo].[SysBaseDatos] ([IdBaseDatos]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[SYSTABLAS] ADD CONSTRAINT [fk_Id_SubAgrupador] FOREIGN KEY ([id_SubAgrupador]) REFERENCES [dbo].[TSubAgrupadores] ([id_SubAgrupador]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas] ADD CONSTRAINT [FK__Tabla_Fac__IdRs___009EFEAF] FOREIGN KEY ([IdRs_Cliente]) REFERENCES [dbo].[Trs_Cliente] ([Id_RazonSocial]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas] ADD CONSTRAINT [FK__Tabla_Fac__Id_Em__7FAADA76] FOREIGN KEY ([Id_Empresa]) REFERENCES [dbo].[Catalogo_Empresas_Facturacion] ([Id_Empresa]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas_Detalle] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__02874721] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas_Detalle] ADD CONSTRAINT [FK__Tabla_Fac__Id_co__037B6B5A] FOREIGN KEY ([Id_conceptos]) REFERENCES [dbo].[Catalogo_Conceptos_Facturas_NC] ([Id_Conceptos]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas_Distribucion] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__0B2B72CD] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Tabla_Facturas_Periodos] ADD CONSTRAINT [FK__Tabla_Fac__Id_Fa__74A863BC] FOREIGN KEY ([Id_Factura]) REFERENCES [dbo].[Tabla_Facturas] ([Id_Factura]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TablaLongitud] ADD CONSTRAINT [R_657] FOREIGN KEY ([Id_Estructura]) REFERENCES [dbo].[TEstructura] ([Id_Estructura]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TDirecciones] ADD CONSTRAINT [R_510] FOREIGN KEY ([Id_Pais]) REFERENCES [dbo].[TPais] ([Id_Pais]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TFormulasRelaciones] ADD CONSTRAINT [R_381] FOREIGN KEY ([Pago]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TFormulasRelaciones] NOCHECK CONSTRAINT [R_381]
GO

ALTER TABLE [dbo].[TFormulasRelaciones] ADD CONSTRAINT [R_382] FOREIGN KEY ([Horas]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TFormulasRelaciones] NOCHECK CONSTRAINT [R_382]
GO

ALTER TABLE [dbo].[TFormulasTipo] ADD CONSTRAINT [R_383] FOREIGN KEY ([idFormula]) REFERENCES [dbo].[Tformulas_28092012a] ([idFormula]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TFormulasTipo] NOCHECK CONSTRAINT [R_383]