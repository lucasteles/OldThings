Parameters tcParamExe1, tcParamExe2, tcParamExe3, tcParamExe4, tcParamExe

* Configure you platform path here.
Local lcPlatformPath as String
Store FULLPATH('..\base\') to lcPlatformPath

* Platform path 
Set path to &lcPlatformPath
* System Path
Set path to CurDir() Additive

* Load system variables.
Public Comuns		AS Function of 'Classes\cFunction.prg'
Public Sql 			AS Sql of 'Classes\cSql.prg' 
Public System		AS System of 'Classes\cSystem.prg'

System	= NewObject('System','Classes\cSystem.prg','',lcPlatformPath)	
Comuns	= System.CreateObject('Function')
Sql 	= System.CreateObject('Sql')

* Ambientate
System.Ambientate()

* Configuring Environment.
System.ConfigureEnvironment()

* Load system.
System.LoadSystem()

Read Events
