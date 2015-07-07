PUBLIC viewPort As xyPair
PUBLIC eye As Single
PUBLIC exitFlag as Boolean
PUBLIC allObjs2 As objStruct
PUBLIC allObjs[11] as objStruct
Public radian  As Double

radian  = 0.017453292519943



** INICIA O PROGRAMA 
_SCREEN.Visible = .F.
_SCREEN.WindowState = 2
_SCREEN.Visible = .T.
_SCREEN.Caption = '3D'

ON SHUTDOWN SAIR() 

DO FORMATAR
viewPort = CREATEOBJECT('xyPair')
allObjs2 = CREATEOBJECT('objStruct')
allObjs2.xyz = CREATEOBJECT('xyzPosStruct')
allObjs2.deg = CREATEOBJECT('orientStruct')
allObjs2.whd = CREATEOBJECT('dimsStruct')

FOR i=1 to 11
	allObjs[i]=allObjs2
NEXT

 
DO FORM PRINCIPAL.scx
READ EVENTS

PROCEDURE FORMATAR 
	SET DATE BRITISH
	SET DELETED ON
	SET CENTURY ON
	SET HOURS TO 24
	SET EXCLUSIVE OFF

PROCEDURE PROERRO()
&&ON ERROR DO PROERRO WITH ERROR(),MESSAGE()

	PARAMETERS errnum,message
	MESSAGEBOX('Seu aplicativo est� com um erro!'+ CHR(13)+ '         Erro n�mero: ' + ALLTRIM(STR(ERRNUM)),64,'ERRO')

	RETURN
	
	
PROCEDURE SAIR()
	IF MESSAGEBOX('Deseja encerrar o aplicativo?',4+32,'3D') = 7
		RETURN 
	ENDIF
	CLOSE ALL
	CLEAR ALL
	WAIT CLEAR
	SET SYSMENU TO DEFA
	ON SHUTDOWN QUIT
    QUIT
   
   
 &&get screen position
Function getXY(xyzCords As xyzPosStruct,VScroll1  as Integer) As renderStruct
	LOCAL tmpSrcObj As objStruct
	LOCAL rtmObj As renderStruct
	tmpSrcObj	 = CREATEOBJECT('objStruct')
	tmpSrcObj.xyz = CREATEOBJECT('xyzPosStruct')
	tmpSrcObj.deg = CREATEOBJECT('orientStruct')
	tmpSrcObj.whd = CREATEOBJECT('dimsStruct')
	
	rtmObj = CREATEOBJECT('renderStruct')
	getXY = CREATEOBJECT('renderStruct')
	
	tmpSrcObj.xyz = xyzCords
	rtmObj = rotTranMul(tmpSrcObj, allObjs(1))
	rtmObj.z = rtmObj.z + (VScroll1 - 400)
	getXY.x = rtmObj.x * eye / (rtmObj.z + eye) + viewPort.x
	getXY.y = rtmObj.w * eye / (rtmObj.z + eye) + (eye / (rtmObj.z + eye)) + viewPort.y
	getXY.z = rtmObj.z
	getXY.w = eye / ((rtmObj.z + eye) + 0.001)
	RETURN getXY 
EndFunc


Function rotTranMul(srcObj As objStruct, refOBJ As objStruct) As renderStruct
	 DIMENSION _trig[8, 2] As Single
	 LOCAL i As Integer, tSing As Single
	 local tmpObj As renderStruct
	 tmpObj =CREATEOBJECT('renderStruct')
	 
	&& rotate x,y,z
	 tSing = srcObj.deg.xDeg + refOBJ.deg.xDeg
	 For i = 1 To 3
	  _trig[i, 1] = SIN(tSing * radian)
	  _trig[i, 2] = COS(tSing * radian)
	  _trig[i + 4, 1] = Sin(-tSing * radian)
	  _trig[i + 4, 2] = Cos(-tSing * radian)
	  tSing = srcObj.deg.yDeg + refOBJ.deg.yDeg
	  If i = 2 Then
	   tSing = srcObj.deg.zDeg + refOBJ.deg.zDeg
	  EndIf
	 Next i
	       
	&& translate x,y,z
	 tmpObj.x = srcObj.xyz.x - refOBJ.xyz.x
	 tmpObj.y = srcObj.xyz.y - refOBJ.xyz.y
	 tmpObj.z = srcObj.xyz.z - refOBJ.xyz.z

	&& multpliy
	 tmpObj.w = tmpObj.x * _trig(3, 2) + tmpObj.y * _trig(3, 1)
	 tmpObj.y = tmpObj.y * _trig(3, 2) + tmpObj.x * _trig(7, 1)
	 tmpObj.x = tmpObj.w * _trig(2, 2) + (-tmpObj.z * _trig(2, 1))
	 tmpObj.z = -((-tmpObj.z * _trig(2, 2)) + (tmpObj.w * _trig(6, 1)))
	 tmpObj.w = tmpObj.y * _trig(1, 2) + (-tmpObj.z * _trig(1, 1))
	 tmpObj.z = -((-tmpObj.z * _trig(1, 2)) + (tmpObj.y * _trig(5, 1)))
	 If _trig(5, 1) <> 1 Then
	 a = 0
	 EndIf

	 return tmpObj
EndFunc



&& classes
DEFINE CLASS xyzPosStruct as Custom
	 x = 0.00 
	 y = 0.00
	 z = 0.00
ENDDEFINE

DEFINE CLASS orientStruct as Custom
	 xDeg = 0.00
	 yDeg = 0.00
	 zDeg = 0.00
ENDDEFINE
 
 DEFINE CLASS  dimsStruct as Custom
	 w = 0.00 && width
	 h = 0.00 && height
	 d = 0.00 && depth
ENDDEFINE
 
DEFINE CLASS objStruct as Custom
	 xyz = 0
	 deg =0
	 whd =0
ENDDEFINE

DEFINE CLASS   renderStruct as Custom
	 x = 0.00
	 y = 0.00
	 z = 0.00
	 w = 0.00
ENDDEFINE

DEFINE CLASS xyPair as Custom
	 x = 0.00
	 y = 0.00
ENDDEFINE
