* System class : System requeriments and basic functions

Define Class System as Custom
	Version					= ''
	SystemName				= ''
	Development				= .F.
	UserName				= ''
	UserId					= 0
	UserGroup				= ''
	MasterUser				= .F.
	PlatformPath			= ''
	SystemPath				= ''
	PlatformClassPath		= ''
	PlatformClassLibPath	= ''
	PlatformProgramPath		= ''
	PlatformFormPath		= ''
	ProgramPath				= ''
	FormPath				= ''	
	TempPath				= ''
	ConfigFile				= ''
	SystemConnection		= ''
	ClassImagePath			= ''
	ImagePath				= ''
	IconPath				= ''
	Menu					= NULL
	MainMenu				= NULL
	Dimension Notes[1]					
	
	* Basic system procedures.
	Proc Init(tcPlatformPath as String);
	HelpString 'Init system object.'
	********************************
		this.PlatformPath = tcPlatformPath  
		this.InitParameters()
	EndProc
	
	Proc InitParameters
		this.Version				= '1.00.000'
		this.SystemName				= 'Atom'
		this.Development			= .T.
		this.UserName				= ''
		this.UserId					= 0
		this.UserGroup				= ''
		this.SystemPath				= AddBs(FullPath(CurDir()))
		this.PlatformClassPath		= AddBs(this.PlatformPath)	+'Classes\'
		this.PlatformClassLibPath	= AddBs(this.PlatformPath)	+'ClassLibs\'
		this.PlatformProgramPath	= AddBs(this.PlatformPath)	+'Programs\'
		this.PlatformFormPath		= AddBs(this.PlatformPath)	+'Forms\'
		this.ProgramPath			= AddBs(this.SystemPath)	+'Programs\'
		this.FormPath				= AddBs(this.SystemPath)	+'Forms\'	
		this.TempPath				= AddBs(GetEnv("Temp"))		+'Atom\'
		this.ConfigFile				= AddBs(this.SystemPath)	+'Files\Config.ini'
		this.SystemConnection		= 'Sys'
		this.ClassImagePath			= AddBs(this.PlatformPath)	+'images\'
		this.ImagePath				= AddBs(this.SystemPath)	+'images\'
		this.IconPath				= AddBs(this.SystemPath)	+'icon\'
		this.Menu					= CreateObject('Menu')
		this.Menu.Name				= 'mnuMain'
			
	EndProc
	
	Proc CreateObject (tcClass as String) as Object;
	HelpString 'Returns a object from a class.'
	*******************************************

		* Function Class.
		If tcClass == 'Function'
			Return( NewObject('Function',ForcePath('cFunction.prg',This.PlatformClassPath)) )
		EndIf
		
		* Sql Class.
		If tcClass == 'Sql'
			Return( NewObject('Sql',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf

		* Select Class.
		If tcClass == 'Select'
			Return( NewObject('Select',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf

		* Insert Class.
		If tcClass == 'Insert'
			Return( NewObject('Insert',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf

		* Update Class.
		If tcClass == 'Update'
			Return( NewObject('Update',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf

		* Delete Class.
		If tcClass == 'Delete'
			Return( NewObject('Delete',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf

		* Command Class.
		If tcClass == 'Command'
			Return( NewObject('Command',ForcePath('cSql.prg',This.PlatformClassPath)) )
		EndIf				

		Return( CreateObject(tcClass) )
	EndProc 
	
	Proc SetClassLibrary (tcClassLibrary as String);
	HelpString 'Set a Class Library to system.'
	*******************************************
		Set ClassLib to (tcClassLibrary) Additive 
	EndProc

	Proc SetPath(tcPath as String) as Boolean;
	HelpString 'Set a Path to system.'
	**********************************
		Set Path to '&tcPath' Additive 
	EndProc
	
	Proc Ambientate;
	HelpString 'Make necessary sets.'
	*********************************
		Set Century On
		Set Clock Status
		Set Confirm On	
		Set Cursor On
		Set Date British
		Set Decimal TO 8
		Set Delete On
		Set EngineBehavior 80
		Set Escape Off
		Set Exact Off
		Set Excl Off
		Set Hours To 24
		Set MemoWidth To 1024
		Set Near Off
		Set Notify Off
		Set Point To ','
		Set ReadBorder On
		Set Reprocess To 3 Seconds
		Set Safety Off
		Set Sepa To '.'
		Set Talk Off
		Set TextMerge Off
	EndProc
	
	Proc ConfigureEnvironment;
	HelpString 'Configure the environment of the system.'
	*****************************
		
		* Screen settings.
		_Screen.Visible 	= .T.
		_Screen.WindowState	= 2
		_Screen.MaxButton	= .T.
		_Screen.Caption 	= this.systemname
				
		* On error setting.
		On Error System.ErrorHandler(Error(),Message(),Program(),LineNo())
		
		* On shutdown setting.
		On Shutdown System.CloseSystem()
		
		*On Key Label CTRL+Q
		On Key Label CTRL+Q System.CloseSystem()
		
		* On KeyLabel setting.
		On Key Label CTRL+F2 activate window command 
		
		* Defining development environment.
		If _vfp.StartMode = 0
			System.Development = .T.
			On Error
			On Shutdown
		EndIf	 

		* Mapping paths
		this.SetPath(this.FormPath)
		this.SetPath(this.ProgramPath)
		
		* Mapping platform path in development environment
		If System.Development = .T.
			this.SetPath(this.PlatformFormPath)
			this.SetPath(this.PlatformProgramPath)
		EndIf			

		* Menu setting.
		Set SysMenu to 
		
		* Creating Temporary Path.
		System.CreateTempPath()
		
		*seta libraries
		System.SetClassLibrary(ForcePath('MENU',System.PlatformClassLibPath))
		System.SetClassLibrary(ForcePath('Notes',System.PlatformClassLibPath))
				
		* Indexing cursor of system connections.
		Sele tmpSysConnections
		Index on IdConnection to comuns.TempFile()
		
		* Adding system connection.
		Sql.AddConnection(this.ReadConfig('CS'),System.SystemConnection,1)
		
				
	EndProc
	
	Proc ReadConfig(tcConfig as String) as String;
	HelpString 'Read parameters in .ini file.'
	******************************************
		
		If Not File(this.ConfigFile)
			Return('')	
		EndIf
		
		Local lcParameter,lcFile as String
		
		lcFile 		= FileToStr(this.ConfigFile)
		lcParameter = StrExtract(lcFile,tcConfig+'="','";',1)

		Return(lcParameter)
	EndProc

	Proc CreateTempPath as Boolean;
	HelpString 'Create a Temp Path configured to the system.'
	*********************************************************

		Local llReturn as Boolean
		Store .F. to llReturn
		
		Try 
			MD (System.TempPath)
		Catch
		EndTry

		If Directory(System.TempPath)
			llReturn = .T.
		EndIf
		
		Return(llReturn)
	EndProc
	
	Proc ErrorHandler as Boolean;
	HelpString 'Handle errors in system.'
	*************************************
	LParameters tcError, tcMessage, tcProgram, tnLineNo
		
		Local lcSystemErrorMessage as String
		* Default error message.
		Text to lcSystemErrorMessage NoShow TextMerge PreText 3
			An error ocurred in your program and it will be close.
			For more information see de details above.
			
			Error: <<tcError>>
			Message:<<tcMessage>>
			Program:<<tcProgram>>
			Line:<<tnLineno>>
		EndText
		
		comuns.Message(lcSystemErrorMessage)
		
		Return to Master 
	EndProc
	
	Proc LoadSystem as Boolean; 
	HelpString 'Load the system.'
	*****************************
		IF ! SQL.CONNECT(this.SystemConnection)
			COMUNS.MESSAGE('Nao pode conectar!')
			this.CloseSystem()
		ENDIF
		
		
		&&Coloca Logo
		_screen.AddObject('LOGO','IMAGE')
		_screen.logo.picture    = this.ClassImagePath+'logo.png'
		_screen.logo.visible 	= .t.
		_screen.logo.width 		= 500
		_screen.logo.height		= 213
		this.LogoScreen()
		=BINDEVENT(_screen,'Resize',System,'LogoScreen')
		
		System.ShowMenus()	
		System.LoadNotes()
		=BINDEVENT(_screen,'DblClick',System,'AddNote')
	EndProc
	
	
	PROC ShowMenus()
		*Inicia Menu Interativo
		System.MainMenu = System.Createobject('frmMenuGuia')
		System.MainMenu.Show()
		
				
		*****************
		** CRIA MENU TOPO
		*****************
			SET SYSMENU TO 
			
			
			system.Menu.CreateMenuTopo('popArquivo','Arquivo','A')
			system.Menu.topo.popArquivo.Addbar('Atualizar Menus','System.ShowMenus()','','','Ctrl+R')
			system.Menu.topo.popArquivo.Addbar('Sair','System.CloseSystem()','','','Ctrl+Q')
			system.Menu.topo.popArquivo.Config()
			
			System.menu.MenuEditar()
			
			
			*CARREGA MODULOS
			TEXT TO lcCOMANDO NOSHOW PRETEXT 7
				SELECT
					* 
				FROM
					TB_MODULOS
				ORDER BY 
					NR_ORDEM
			ENDTEXT
			SQL.ExecuteQuery(lcCOMANDO,'TMPMODULOS')
			
			LOCAL cName,cCommand AS String
			SELE TMPMODULOS
			GO TOP
			SCAN WHILE NOT EOF('TMPMODULOS')
				
				cName = 'popTOPO'+TRANSFORM(tmpModulos.PK_ID) 		
				System.Menu.CreateMenuTopo(cName,ALLTRIM(tmpModulos.Ds_Modulo))
				
				lcCOMANDO='SELECT * FROM TB_TELAS WHERE FK_MODULO = <<p1>> ORDER BY NR_ORDEM'
				SQL.SetSelectParameter(1,tmpModulos.PK_ID)
				SQL.ExecuteQuery(lcCOMANDO,'TMPTELAS')
				
				SELE TMPTELAS
				GO TOP
				SCAN WHILE NOT EOF('TMPTELAS')
					
					cCommand = "System.OpenForm("+Comuns.Aspas(Alltrim(TMPTELAS.DS_FORM))+")"
					
					
					System.Menu.Topo.&cName..Addbar(Alltrim(tmpTelas.Ds_tela),cCommand,,ForceExt(Alltrim(TMPTELAS.DS_FORM),'png'))
					
				ENDSCAN
				
				System.Menu.Topo.&cName..Config()
		
			ENDSCAN
	endproc
	
	PROC LogoScreen()
		
		_screen.logo.top 		= _screen.Height - _screen.logo.height
		_screen.logo.left		= _screen.Width - _screen.logo.Width 
		_screen.logo.stretch	= 2
	
	ENDPROC
	 	 
	 
	Proc CloseSystem;
	HelpString 'Close the system.'
	******************************
		If Type('Sql')='O'
			Sql.CloseAllConnections()
		EndIf
		Wait clear 
		On Shutdown 
		Clear Windows
		Close Data
		Set Procedure to
		Set Path to
		Clear Events 
		If Type('System')='O'
			Set SysMenu to Default
			Clear ClassLib ForcePath('MENU',System.PlatformClassLibPath)
			Clear ClassLib ForcePath('Notes',System.PlatformClassLibPath)
			System.Unload()
			Try
				Clear All
			Catch
			EndTry	
			Cancel
			Return
		ENDIF
	
		SELE _TBNOTES
		USe			
		
		IF !System.Development			
			quit
		endif
				
	EndProc
	
	Proc Unload;
	HelpString 'Unload object.'
	***************************
		Release All
	EndProc
	
	Proc OpenForm (tcFormName as String,tcConfig,tuP1,tuP2,tuP3,tuP4,tuP5,tuP6,tuP7,tuP8) as Variant;
	HelpString 'Open a form.'
	*************************
		
		* Validating parameters.
		If Type('tcFormName') <> 'C'
			tcFormName = ''
		EndIf

		If Type('tcConfig') <> 'C'
			tcConfig = ''
		EndIf
		
		If Empty(tcFormName)
			Return(.F.)
		EndIf
		
		tcFormName = AllTrim(tcFormName)
		
		Local lcFile, lcCommand, lcConfig as String
		Local luReturn as Variant
		Store '' to lcFile, lcCommand, lcConfig
		
		* Defining configurations.
		If 'GETRETURN' $ UPPER(tcConfig)
			lcConfig = lcConfig + ' to luReturn'
		EndIf
		
		* Defining the path of the form.
		lcFile = ForceExt(this.FormPath + tcFormName,'Scx')

		* Validating form existance.
		If Not File(lcFile)
			comuns.Message('Failed to open a form.'+chr(13)+;
							'File does not exist in forms folder.'+chr(13)+;
							'File: '+tcFormName)
			Return(.F.)
		EndIf
		
		* Open the form repassing parameters.
		lcCommand = 'Do Form "'+lcFile+'" With tuP1,tuP2,tuP3,tuP4,tuP5,tuP6,tuP7,tuP8'+lcConfig
		
		&lcCommand
		
		Return(luReturn)
	ENDPROC
		
	Proc LoadNotes()
		
		IF Used('_TBNOTES')
			Use In _TBNOTES
		ENDIF
		
		lcARQNOTES = System.TempPath+'Tb_Notes.dbf'
		
		IF !File(lcARQNOTES)
			Create Table;
			 	(lcARQNOTES);
			 	(Texto m,Largura i,Altura i, PosX i, PosY i ,Nome c(40))  
			 SELE TB_NOTES
			USE 
		EndIf
		
		Use ( lcARQNOTES ) IN 0 ALIAS '_TBNOTES'

		LOCAL XI AS Integer
		LOCAL lnJANELA,lnXI,lnLEN as Integer
		XI = 0

		Sele _TBNOTES
		Go top
		Count to lnLEN 
		
		
		
		IF lnLEN> 0
			Dimension System.Notes[lnLEN]

			Sele _TBNOTES
			GO TOP
			Scan While NOT EOF('_TBNOTES')
				XI = XI + 1
				System.Notes[XI] = CREATEOBJECT('frmNOTE')
				System.Notes[XI].HEIGHT = _TBNOTES.Altura 
				System.Notes[XI].WIDTH = _TBNOTES.Largura 
				System.Notes[XI].TOP = _TBNOTES.posY 
				System.Notes[XI].LEFT =_TBNOTES.posx
				System.Notes[XI].NAME = _TBNOTES.NOME
				System.Notes[XI].VALUE =  _TBNOTES.TEXTO

				ACTIVATE WINDOW (System.Notes[XI].NAME) IN WINDOW (_Screen.Name)
				
			EndScan
			
		ENDIF

		
	EndProc

	
	Proc AddNote()
	
		LOCAL lnJANELA,lnXI,lnLEN as Integer

		lnLEN= ALEN(System.Notes)

		FOR lnXI = 1 TO lnLEN
			lnLEN= ALEN(System.Notes)
			IF TYPE("System.Notes[lnXI]") # "O" OR ISNULL(System.Notes[lnXI])
				lnJANELA= lnXI
				EXIT
			ENDIF
			IF lnXI = lnLEN
				DIMENSION System.Notes[lnLEN+1]
				lnJANELA= lnXI+1
			ENDIF
		ENDFOR

		System.Notes[LNJANELA] = CREATEOBJECT('frmNOTE')
		System.Notes[LNJANELA].HEIGHT = 200
		System.Notes[LNJANELA].WIDTH = 200
		System.Notes[LNJANELA].TOP = MROW('Screen',3)
		System.Notes[LNJANELA].LEFT = MCOL('Screen',3)
		System.Notes[LNJANELA].NAME = 'NOTE'+TRANSFORM(LNJANELA)
		System.Notes[LNJANELA].SALVAR()

		ACTIVATE WINDOW (System.Notes[lnJANELA].NAME) IN WINDOW (_Screen.NAME)
			
	EndProc
	
EndDefine




Define Class Menu as Custom
	
	Topo 	= ''
	QtMenuTopo = 0
	QtBar  = 0
	Bars		= ''
	MenuString = ''
	

	PROC Clear()
		this.Bars 	= System.Createobject('empty')	
		this.QtBar  = 0
	endproc
	

	PROC CreateMenuTopo(cName, cCaption,cKeymap)
		this.QtMenuTopo = this.QtMenuTopo + 1	

		LOCAL lcMacro as String
		lcMacro = cName &&'mnuTopo'+Transf(this.QtMenuTopo)
		
		IF TYPE('THIS.Topo') <> 'O'
			THIS.Topo = System.Createobject('EMPTY')
		ENDIF
		
		=ADDPROPERTY(THIS.TOPO,lcMacro)
		
		this.topo.&lcMacro = System.Createobject('TopMenu')
 		this.topo.&lcMacro..name = lcMacro
		this.topo.&lcMacro..set(cCaption,lcMacro,cKeymap)
	ENDPROC
	
	Proc Define(lSubMenu as Boolean)
		
		lcMacro = 'DEFINE POPUP '+ALLTRIM(this.Name)
		
		
		IF lSubMenu 
			lcMacro = lcMacro + ' MARGIN RELATIVE SHADOW COLOR SCHEME 4'
		ELSE
			lcMacro = lcMacro + ' SHORTCUT RELATIVE FROM MROW(),MCOL() FONT "Arial" STYLE "N"'
		ENDIF

		&lcMacro 
		
	EndProc  
	
	Proc Config(lSubMenu as Boolean)
		LOCAL lcMACRO,lcBAR  AS String
		LOCAL i as Integer
	
		this.Define(lSubMenu)
		
		FOR i=1 to THIS.QTBAR
						
			lcBAR = 'this.Bars.Bar'+TRANSFORM(i)
			
			IF &lcBAR..CLASS == 'Menubar'	
				lcMACRO= 'DEFINE BAR '+TRANSF(&lcBAR..IdBar)+' OF '+THIS.Name+' PROMPT ' + Comuns.Aspas(&lcBAR..CAPTION)
				
				IF !EMPTY(&lcBAR..KEY)
					lcMACRO = lcMACRO + ' KEY '+&lcBAR..KEY
				ENDIF
				
				IF !EMPTY(&lcBAR..SKIPFOR)
					lcMACRO = lcMACRO + ' SKIP FOR '+&lcBAR..SKIPFOR
				ENDIF
		
				IF !EMPTY(&lcBAR..Icon)
					lcMACRO = lcMACRO + ' PICTURE ' + Comuns.Aspas(Comuns.PutIcon(&lcBAR..Icon))
				ENDIF
				
				
				&lcMACRO
				 
				
				IF &lcBAR..QTBAR > 0
					
					&lcBAR..Config(.t.)
					lcMACRO = 'ON BAR ' + TRANSF(&lcBAR..IdBar) + ' OF ' + THIS.Name +' ACTIVATE POPUP '+&lcBAR..NAME					
					
				ELSE
				
					lcMACRO = 'ON SELECTION  BAR ' + TRANSF(&lcBAR..IdBar) + ' OF ' + THIS.Name + ' ' + STRT(&lcBAR..COMMAND,'THISFORM.','_SCREEN.ActiveForm.')
				
				ENDIF

				&lcMACRO
								
			ENDIF
		
		ENDFOR
		
							
	ENDPROC
	
	PROC SHOW()
	
		this.Config()
		LOCAL lcMACRO AS String
		lcMACRO = 'ACTIVATE POPUP '+THIS.Name
		&lcMACRO 
		
	ENDPROC

	
	
	Proc AddBar(cCaption,cCommand,cAlias,cPicture,cKey,cSkipFor)
		
		this.QtBar = this.QtBar + 1
		LOCAL lcMacro as String	
		
		IF TYPE('this.Bars') <> 'O'
			this.Bars = System.Createobject('empty')
		ENDIF
		
		lcMacro = 'bar'+TRANSFORM(this.QtBar)
		
		=ADDPROPERTY(this.bars,lcMacro)
		this.bars.&lcMacro = System.Createobject('MenuBar')
		
		IF ! EMPTY(cAlias)
			=ADDPROPERTY(this.bars,cAlias)	
			this.bars.&cAlias = this.bars.&lcMacro 
		ENDIF
			
		
		this.bars.&lcMacro..name		= lcMacro
		this.bars.&lcMacro..IdBar		= this.QtBar
		this.bars.&lcMacro..Caption  	= cCaption
		this.bars.&lcMacro..Key 		= cKey
		this.bars.&lcMacro..SkipFor		= cSkipFor
		this.bars.&lcMacro..Command 	= cCommand
		this.bars.&lcMacro..Icon		= cPicture
				
	ENDPROC
	
	Proc MenuEditar()
		
		DEFINE PAD EDITAR OF _MSYSMENU PROMPT "\<Editar" COLOR 3;
		NEGOTIATE  NONE, LEFT ;
		KEY ALT+E, "" 
		ON PAD EDITAR OF _MSYSMENU ACTIVATE POPUP popEDITAR
		
		DEFINE POPUP popEDITAR MARGIN RELATIVE SHADOW COLOR SCHEME 4
		DEFINE BAR _med_undo OF popEDITAR PROMPT "Desfa\<zer" ;
			KEY CTRL+Z, "Ctrl+Z" ;
			PICTRES _med_undo 
		DEFINE BAR _med_redo OF popEDITAR PROMPT "\<Refazer" ;
			KEY CTRL+R, "Ctrl+R" ;
			PICTRES _med_redo 
		DEFINE BAR _med_sp100 OF popEDITAR PROMPT "\-" ;
			PICTRES _med_sp100
		DEFINE BAR _med_copy OF popEDITAR PROMPT "\<Copiar" ;
			KEY CTRL+C, "Ctrl+C" ;
			PICTRES _med_copy 
		DEFINE BAR _med_paste OF popEDITAR PROMPT "Co\<lar" ;
			KEY CTRL+V, "Ctrl+V" ;
			PICTRES _med_paste 
		DEFINE BAR _med_cut OF popEDITAR PROMPT "Recor\<tar" ;
			KEY CTRL+X, "Ctrl+X" ;
			PICTRES _med_cut
	
	EndProc 
	
EndDefine


Define Class TopMenu as Menu 
	
	Hidden Proc CreateMenuTopo()
	
	ENDPROC
	
	Proc Define(lSubMenu as Boolean)
		lcMacro = 'DEFINE POPUP '+ALLTRIM(this.Name)+' MARGIN RELATIVE SHADOW COLOR SCHEME 4'
		&lcMacro 
		lcMACRO =" ON PAD "+ALLTRIM(this.name)+" OF _MSYSMENU ACTIVATE POPUP "+ALLTRIM(this.Name) &&system.menu.topo."+this.name+".show()"  
		&lcMacro
	Endproc
		
	PROC Set(cCaption,cName,cKeymap)
		Local cMacro as string

		cMacro = "DEFINE PAD " + cName + " OF _MSYSMENU PROMPT '" + cCaption + "' COLOR SCHEME 3 " +;
			"NEGOTIATE  NONE, LEFT "+;
			IIF(EMPTY(cKeymap),'',"KEY ALT+"+ cKeymap +", ''")
		
		&cMacro 
		
	ENDPROC
	

	
ENDDEFINE

Define Class MenuBar as Menu
	
	IdBar = 0
	Caption = ''
	Key = ''
	SkipFoR	= ''
	Command = ''
	Icon = ''
	
EndDefine