��� �  ө � �	                    �0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KAXPA 889015180      /  F      ]                          �      �                       WINDOWS _1V00KAXPB 942183464�      �  �      �      }  �	                  �                           WINDOWS _1V00KAXPC 889015304  *  H  U  f  s      �  �                                               WINDOWS _1V00KAXPQ 889015304u      �  �  �  �                                                           WINDOWS _1V00KAXPR 889015304	        #  1  >                                                           WINDOWS _1V00KAXPS 889015304�      �  �  �  �                                                           WINDOWS _1V00KAXPT 889015304A      N  [  i  v                                                           WINDOWS _1V00KAXPU 889015304�      �      (                                                           WINDOWS _1V00KAXPV 889015304y      �  �  �  �                                                           WINDOWS _1V00KAXPW 889015304       5  J  Z  g      �  �                                               WINDOWS _1V00KAXPX 889015304�      �  �  �  �      5  �                                               WINDOWS _1V00KAXPY 889015304�      �  �  �  �      H  q                                               WINDOWS _1V00KAXPZ 889015304�      v  _  �                                                             WINDOWS _1V00KAXQ0 889015304�      �  �  �  �                                                           COMMENT RESERVED                                �                                                            w                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Height = 268
Width = 279
DoCreate = .T.
AutoCenter = .T.
Caption = "Animated GIF"
cfilename = 
oimage = 
Name = "Form1"
      �PROCEDURE Init

ThisForm.cFileName = HOME(4)+"gifs\morphfox.gif"
ENDPROC
PROCEDURE Load
DO (LOCFILE("System.app"))

loImgAnimator = _SCREEN.System.Drawing.ImageAnimator.New()
ADDPROPERTY(This, "IA", loImgAnimator)


ENDPROC
     ���                              �]   %   �       �      �           �  U  /  ��C�  � �  � � �� T�  � � ��  � �� U  THISFORM IA STOPANIMATE OIMAGE	 IMGCANVAS PICTURE	 CFILENAME Click,     ��1 bb2                       �       )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      Label4      label      label      Form1      cfilename
oimage
      	imgcanvas      ..\source\gdiplusx.vcx      image      	Imgcanvas      Form1      DHeight = 132
Left = 12
Top = 12
Width = 144
Name = "Imgcanvas"
     *PROCEDURE draw
LPARAMETERS toSource as xfcImage, toArgs

IF VARTYPE(m.toSource) = "O"
	This.Clear()
	** Update the GIF frame
	ThisForm.IA.UpdateFrames(m.toSource)
	** Draw the image on the canvas
	This.oGfx.DrawImage(m.toSource, 0,0)
	
	** Update our frame status
	This.Parent.txtCurrentFrame.Value = toArgs.CurrentFrame
	This.Parent.txtFrameCount.Value = toArgs.FrameCount
	This.Parent.txtCurrentDelay.Value = toArgs.FrameDelays[toArgs.CurrentFrame+1]
	This.Parent.txtCurrentLoop.Value = toArgs.CurrentLoop
ENDIF

DODEFAULT()
ENDPROC
      ����    �   �                         ez   %   l       �      {           �  U    ��C�  � �  � � �� U  THISFORM IA STOPANIMATE OIMAGE Click,     ��1 b2                       R       )   �                        ����    x  x                        |   %   �                      �  U  + ( T�  � �C��Q� gifs\morphfox.gif�� U  THISFORM	 CFILENAMEG  �C�
 System.app��� T�  �C�9� � � � �� ��C� � IA�  
�� U  LOIMGANIMATOR SYSTEM DRAWING IMAGEANIMATOR NEW THIS Init,     �� Loadp     ��1 �2 q�A3                       B         ]   �       )   x                        textbox      textbox      txtCurrentFrame      Form1      JHeight = 23
Left = 108
Top = 178
Width = 48
Name = "txtCurrentFrame"
      label      label      Label1      Form1      kAutoSize = .T.
Caption = "Current Frame"
Height = 17
Left = 12
Top = 180
Width = 82
Name = "Label1"
      textbox      textbox      txtFrameCount      Form1      HHeight = 23
Left = 108
Top = 154
Width = 48
Name = "txtFrameCount"
      label      label      Label2      Form1      iAutoSize = .T.
Caption = "Frame Count"
Height = 17
Left = 12
Top = 156
Width = 74
Name = "Label2"
      textbox      textbox      txtCurrentLoop      Form1      IHeight = 23
Left = 108
Top = 226
Width = 48
Name = "txtCurrentLoop"
      label      label      Label3      Form1      jAutoSize = .T.
Caption = "Current Loop"
Height = 17
Left = 12
Top = 229
Width = 74
Name = "Label3"
      commandbutton      commandbutton      Command1      Form1      WTop = 12
Left = 180
Height = 27
Width = 84
Caption = "Animate"
Name = "Command1"
     �PROCEDURE Click
LOCAL loImgAnimator AS xfcImageAnimator

WITH _SCREEN.System
	** Stop any existing animations
	ThisForm.IA.StopAnimate(ThisForm.oImage)

	** Load the image object
	ThisForm.oImage = .Drawing.Image.FromFile(ThisForm.cFileName)
	
	** Create an EventHandler using the Draw method
	loEventHandler = .EventHandler.New(ThisForm.imgCanvas, "Draw")

	** Animate the image
	ThisForm.IA.Animate(ThisForm.oImage, loEventHandler)
ENDWITH

ENDPROC
     ����    �  �                        TD   %   d      �  	   s          �  U  �  ��  Q� XFCIMAGEANIMATOR� ���9� ��� � ��C� � � � � �� T� � �C� �	 �� � � �� T�
 �C� � � Draw�� � �� ��C� �  �
 � � � �� �� U  LOIMGANIMATOR SYSTEM THISFORM IA STOPANIMATE OIMAGE DRAWING IMAGE FROMFILE	 CFILENAME LOEVENTHANDLER EVENTHANDLER NEW	 IMGCANVAS ANIMATE Click,     ��1 �� b���A 2                       �      )   �                        commandbutton      commandbutton      Command2      Form1      TTop = 48
Left = 180
Height = 27
Width = 84
Caption = "Stop"
Name = "Command2"
      ]PROCEDURE Click
** Stop the animation
ThisForm.IA.StopAnimate(ThisForm.oImage)

ENDPROC
      kAutoSize = .T.
Caption = "Current Delay"
Height = 17
Left = 12
Top = 204
Width = 77
Name = "Label4"
      JHeight = 23
Left = 108
Top = 202
Width = 48
Name = "txtCurrentDelay"
      txtCurrentDelay      textbox      commandbutton      commandbutton      Command3      Form1      tTop = 84
Left = 180
Height = 48
Width = 84
WordWrap = .T.
Caption = "Use Picture Property"
Name = "Command3"
      �PROCEDURE Click
** Stop any existing animations
ThisForm.IA.StopAnimate(ThisForm.oImage)

ThisForm.imgCanvas.Picture = ThisForm.cFileName

ENDPROC
      textbox     v���    ]  ]                        ��   %   �           �          �  U  �  ��  Q� XFCIMAGE� � %�C��  ��� O��� � ��C� � �� ��C ��  � � � �� ��C ��  � � � � � �� T� �	 �
 � �� � �� T� �	 � � �� � ��$ T� �	 � � �C� � �� � �� T� �	 � � �� � �� �	 ��C��� U  TOSOURCE TOARGS THIS CLEAR THISFORM IA UPDATEFRAMES OGFX	 DRAWIMAGE PARENT TXTCURRENTFRAME VALUE CURRENTFRAME TXTFRAMECOUNT
 FRAMECOUNT TXTCURRENTDELAY FRAMEDELAYS TXTCURRENTLOOP CURRENTLOOP draw,     ��1 qr� b���A�A � 1                             )   ]                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 909868519�      �  �      �                              Q                           WINDOWS _1TN1AHCZI 909868519�  �  �  �  �        k  �                                               WINDOWS _1TN1D26W0 888973551�      �  r  e        .  �	                                               COMMENT RESERVED                                                                                            j                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     TTop = -1
Left = 0
Height = 516
Width = 611
DoCreate = .T.
Caption = "Transformations"
WindowState = 2
earthangle = 1
_memberdata =      155<VFPData><memberdata name="earthangle" type="property" display="EarthAngle"/><memberdata name="moonangle" type="property" display="MoonAngle"/></VFPData>

moonangle = 1
Name = "Form1"
      Mearthangle
_memberdata XML Metadata for customizable properties
moonangle
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      bAnchor = 15
Height = 517
Left = -1
Top = -1
Width = 613
rendermode = 1
Name = "Imgcanvas1"
     ?PROCEDURE beforedraw
This.Clear(0xff000000)
WITH _SCREEN.SYSTEM.drawing
	oState = This.oGfx.Save()
	THIS.oGfx.TranslateTransform(THIS.WIDTH / 2, THIS.HEIGHT / 2)
	THIS.oGfx.FillEllipse(.Brushes.Yellow, - 100, - 100, 200, 200)
	THIS.oGfx.RotateTransform(THISFORM.earthangle)
	THIS.oGfx.TranslateTransform(300, 0)
	THIS.oGfx.FillEllipse(.Brushes.Blue, - 20, - 20, 40, 40)
	THIS.oGfx.RotateTransform(THISFORM.moonangle)
	THIS.oGfx.TranslateTransform(40, 0)
	THIS.oGfx.FillEllipse(.Brushes.LightGray, - 5, - 5, 10, 10)
	This.oGfx.Restore(oState)
ENDWITH

ENDPROC
     K���    2  2                        �   %   �       �      �           �  U  m - T�  � �C�  � �h� ��
 �  � �6��- T�  � �C�  � �h� ��
 �  � �6�� ��C�  � � �� U  THISFORM
 EARTHANGLE	 MOONANGLE
 IMGCANVAS1 DRAW Timer,     ��1 ��1                       �       )   2                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      �PROCEDURE Timer
Thisform.EarthAngle = IIF(Thisform.EarthAngle >=360, 1, Thisform.EarthAngle + 1)
Thisform.MoonAngle = IIF(Thisform.MoonAngle >=360, 1, Thisform.MoonAngle + 12)
Thisform.imgcanvas1.Draw()
ENDPROC
      OTop = 12
Left = 24
Height = 23
Width = 23
Interval = 250
Name = "Timer1"
      Form1      Timer1      timer      timer     ����    �  �                        �0   %   4      f     H          �  U  E ��C�
      ��A�  � �� ���9� � ��>� T� �C�  � � ��$ ��C�  � ��  �	 ��  � � ��% ��C�� � �����������  � �
 �� ��C� � �  � � �� ��C�,� �  � � ��% ��C�� � �������(�(�  � �
 �� ��C� � �  � � �� ��C�(� �  � � ��% ��C�� � �������
�
�  � �
 �� ��C � �  � � �� �� U  THIS CLEAR SYSTEM DRAWING OSTATE OGFX SAVE TRANSLATETRANSFORM WIDTH HEIGHT FILLELLIPSE BRUSHES YELLOW ROTATETRANSFORM THISFORM
 EARTHANGLE BLUE	 MOONANGLE	 LIGHTGRAY RESTORE
 beforedraw,     ��1 �!AAQaqQaaQAA 2                       4      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1XB0P5QQV 894721418      /  F      ]                          �      �                       WINDOWS _1XB0P5QQX 909132421�      �  �      �                              �                           WINDOWS _1XB0P5QQY 909132421A  R  p  }  �  �      �  (                                               WINDOWS _1YY0ZQADM 898796412�      �  �  �  �                                                           COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 0
Left = 37
Height = 444
Width = 432
DoCreate = .T.
Caption = "Customized Bezier"
nctrlx1 = 50
nctrly1 = 50
nctrlx2 = 400
nctrly2 = 400
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      gnctrlx1
nctrly1
nctrlx2
nctrly2
_memberdata XML Metadata for customizable properties
*nearpoint 
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      PAnchor = 15
Height = 444
Left = 0
Top = 0
Width = 432
Name = "Imgcanvas1"
     
,PROCEDURE beforedraw
LOCAL loPen AS xfcPen
LOCAL loPen2 AS xfcPen
LOCAL loGfx AS xfcGraphics

WITH _SCREEN.System.Drawing
loPen = .Pen.New(.Color.Blue, 6)
loPen2 = .Pen.New(.Color.Red, 3)
loPen2.EndCap = _screen.system.Drawing.Drawing2D.LineCap.RoundAnchor
loPen2.StartCap = _screen.system.Drawing.Drawing2D.LineCap.RoundAnchor 

loGfx = This.oGfx

This.Clear()
loGfx.DrawBezier(loPen, ;
		This.oPoint1, This.oCtrl1, ;
		This.oCtrl2, This.oPoint2)
		
loGFX.DrawLine(loPen2, This.oPoint1, This.oCtrl1)
loGFX.DrawLine(loPen2, This.oPoint2, This.oCtrl2)

ENDWITH	
ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

DO CASE
CASE nButton = 1

	DO CASE
	CASE BETWEEN(This.oPoint1.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oPoint1.Y, nYCoord-5, nYCoord+5)
		This.oSelectedPoint = This.oPoint1
	CASE BETWEEN(This.oPoint2.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oPoint2.Y, nYCoord-5, nYCoord+5)
		This.oSelectedPoint = This.oPoint2
	CASE BETWEEN(This.oCtrl1.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oCtrl1.Y, nYCoord-5, nYCoord+5)
		This.oSelectedPoint = This.oCtrl1
	CASE BETWEEN(This.oCtrl2.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oCtrl2.Y, nYCoord-5, nYCoord+5)
		This.oSelectedPoint = This.oCtrl2
	ENDCASE
	
ENDCASE

This.Draw()
ENDPROC
PROCEDURE setup
This.AddProperty("oPoint1", _SCREEN.System.Drawing.Point.New(50,200))
This.AddProperty("oPoint2", _SCREEN.System.Drawing.Point.New(200,50))
This.AddProperty("oCtrl1", _SCREEN.System.Drawing.Point.New(50,50))
This.AddProperty("oCtrl2", _SCREEN.System.Drawing.Point.New(200,200))
This.AddProperty("oSelectedPoint","")
ENDPROC
PROCEDURE MouseUp
LPARAMETERS nButton, nShift, nXCoord, nYCoord

DO CASE
CASE nButton = 1
	This.oSelectedPoint = NULL
ENDCASE
ENDPROC
PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

DO CASE

CASE nButton = 1
	IF VARTYPE(This.oSelectedPoint) = "O"
		This.oSelectedPoint.X = nXCoord
		This.oSelectedPoint.Y = nYCoord
		This.Draw()
		This.MousePointer = 5 && Size
	ENDIF

OTHERWISE 
	IF ;
		BETWEEN(This.oPoint1.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oPoint1.Y, nYCoord-5, nYCoord+5) OR ;
		BETWEEN(This.oPoint2.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oPoint2.Y, nYCoord-5, nYCoord+5) OR ;
		BETWEEN(This.oCtrl1.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oCtrl1.Y, nYCoord-5, nYCoord+5) OR ;
		BETWEEN(This.oCtrl2.X, nXCoord-5, nXCoord+5) AND BETWEEN(This.oCtrl2.Y, nYCoord-5, nYCoord+5) ;
		
		This.MousePointer = 2 && Cross


	ELSE 
		This.MousePointer = 0 && Default
	ENDIF
	
ENDCASE
ENDPROC
     	t���    [	  [	                        l�   %   �      �  =   X          �  U  E ��  Q� XFCPEN� �� Q� XFCPEN� �� Q� XFCGRAPHICS� ���9� � ��>� T�  �C�� � ��� � �� T� �C�� �	 ��� � �� T� �
 ��9� � � � � �� T� � ��9� � � � � �� T� �� � �� ��C� � ��) ��C �  � � � � � � � � � � �� ��C � � � � � � � �� ��C � � � � � � � �� �� U  LOPEN LOPEN2 LOGFX SYSTEM DRAWING PEN NEW COLOR BLUE RED ENDCAP	 DRAWING2D LINECAP ROUNDANCHOR STARTCAP THIS OGFX CLEAR
 DRAWBEZIER OPOINT1 OCTRL1 OCTRL2 OPOINT2 DRAWLINE� ��  � � � � H�  ��� ��  ����� H�> ���@ �C� � � � �� ��� C� � � � �� ��	��� � T� � �� � ��@ �C� �	 � � �� ��� C� �	 � � �� ��	��� � T� � �� �	 ��@ �C� �
 � � �� ��� C� �
 � � �� ��	��7� T� � �� �
 ��@ �C� � � � �� ��� C� � � � �� ��	���� T� � �� � �� � � ��C� � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS OPOINT1 X Y OSELECTEDPOINT OPOINT2 OCTRL1 OCTRL2 DRAW� , ��C� oPoint1C�2���9� � � � �  � ��, ��C� oPoint2C���2�9� � � � �  � ��+ ��C� oCtrl1C�2�2�9� � � � �  � ��+ ��C� oCtrl2C�����9� � � � �  � ��! ��C� oSelectedPoint�  �  � �� U  THIS ADDPROPERTY SYSTEM DRAWING POINT NEWF  ��  � � � � H�  �? � ��  ���? � T� � ���� � U  NBUTTON NSHIFT NXCOORD NYCOORD THIS OSELECTEDPOINT� ��  � � � � H�  ��� ��  ���� � %�C� � ��� O��� � T� � � �� �� T� � � �� �� ��C� � �� T� �	 ���� � 2���� %�C� �
 � � �� ��� C� �
 � � �� ��	�7 C� � � � �� ��� C� � � � �� ��	�7 C� � � � �� ��� C� � � � �� ��	�7 C� � � � �� ��� C� � � � �� ��	���� T� �	 ���� ��� T� �	 �� �� � � U  NBUTTON NSHIFT NXCOORD NYCOORD THIS OSELECTEDPOINT X Y DRAW MOUSEPOINTER OPOINT1 OPOINT2 OCTRL1 OCTRL2
 beforedraw,     ��	 MouseDown6    �� setupC    �� MouseUpI    ��	 MouseMove�    ��1 a"����� ���B 2 1� � 1111A B � 2 ����2 1� � A 2 1� �11� A � �� A B 1                       E        e           *  i  -   &   �  �  4   ,     !
  <    )   [	                        label      label      Label1      Form1      �AutoSize = .T.
FontSize = 12
BackStyle = 0
Caption = "Drag and drop the edges of the red lines to change the bezier"
Height = 21
Left = 3
Top = 1
Width = 425
Name = "Label1"
      !Arial, 0, 9, 5, 15, 12, 16, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 885897446�      �  �      �      F  }                                               WINDOWS _1TN1AHCZI 885897446=  N  l  y  �  �        �                                               WINDOWS _1TN1CDS3J 885719368�      �  �  �  T
      

  �                                               COMMENT RESERVED                                �	                                                            M                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      ITop = -1
Left = 0
DoCreate = .T.
Caption = "Brushes"
Name = "Form1"
      /PROCEDURE Show
LPARAMETERS nStyle

ENDPROC
      ����    �   �                         ��   %   B       V      P           �  U  
  ��  � U  NSTYLE Show,     ��1 q 2                       $       )   �                         	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      cAnchor = 15
Height = 252
Left = -1
Top = -1
Width = 377
usememory = .F.
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
#define HatchStyleDiagonalBrick 38
WITH _SCREEN.SYSTEM.drawing
	LOCAL ARRAY aPoint(3)
	aPoint(1) = .POINT.New(110, 160)
	aPoint(2) = .POINT.New(10, 310)
	aPoint(3) = .POINT.New(220, 310)

	LOCAL ARRAY aPoint2(3)
	aPoint2(1) = .POINT.New(360, 160)
	aPoint2(2) = .POINT.New(230, 310)
	aPoint2(3) = .POINT.New(430, 310)

	THIS.CLEAR()

	DO CASE
		CASE THISFORM.optiongroup1.VALUE = 1
			br = .SolidBrush.New(.COLOR.Blue)
		CASE THISFORM.optiongroup1.VALUE = 2
			br = .Drawing2d.HatchBrush.New(HatchStyleDiagonalBrick, .COLOR.Gray, .COLOR.Brown) && HatchStyle.DiagonalBrick
		CASE THISFORM.optiongroup1.VALUE = 3
			img = .IMAGE.FromFile(HOME(4) + "metafiles\business\3DLRSIGN.WMF")
			br = .TextureBrush.New(img)
	ENDCASE
	THIS.oGfx.FillRectangle(br, 10, 10, 200, 150)
	THIS.oGfx.FillEllipse(br, 220, 10, 200, 150)
	THIS.oGfx.FillPolygon(br, @aPoint)
	p = .PEN.New(br, 10)
	THIS.oGfx.DrawLines(p, @aPoint2)
	p.Dispose()
	br.Dispose()
ENDWITH

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
     5ButtonCount = 3
Value = 1
Height = 65
Left = 12
Top = 12
Width = 86
Name = "Optiongroup1"
Option1.Caption = "Example 1"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 76
Option1.Name = "Option1"
Option2.Caption = "Example 2"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 76
Option2.AutoSize = .F.
Option2.Name = "Option2"
Option3.Caption = "Example 3"
Option3.Height = 17
Option3.Left = 5
Option3.Top = 43
Option3.Width = 76
Option3.AutoSize = .F.
Option3.Name = "Option3"
      Form1      Optiongroup1      optiongroup      optiongroup     m���    T  T                        �-   %   �           �          �  U  � ���9�  � ��|� �� ���� T� ����C�n���� � �� T� ����C�
�6�� � �� T� ����C���6�� � �� �� ���� T� ����C�h���� � �� T� ����C���6�� � ��  T� ����C���6�� � �� ��C� � �� H� ��� �� �	 �
 ���0� T� �C�� � �� � �� �� �	 �
 ���m�& T� �C�&�� � �� � �� � � �� �� �	 �
 �����; T� �CC��Q� metafiles\business\3DLRSIGN.WMF�� � �� T� �C � �� � �� �  ��C � �
�
����� � � ��  ��C � ���
����� � � �� ��C � � � � � �� T� �C � �
�� � �� ��C � � � � � �� ��C� � �� ��C� � �� �� U  SYSTEM DRAWING APOINT POINT NEW APOINT2 THIS CLEAR THISFORM OPTIONGROUP1 VALUE BR
 SOLIDBRUSH COLOR BLUE	 DRAWING2D
 HATCHBRUSH GRAY BROWN IMG IMAGE FROMFILE TEXTUREBRUSH OGFX FILLRECTANGLE FILLELLIPSE FILLPOLYGON P PEN	 DRAWLINES DISPOSE
 beforedraw,     ��1 "� ���� ��� � q�qaq�aA ���� � A 2                       �      )   T                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _20Q0S5T6J 911370507      /  F      ]                          �      �                       WINDOWS _20Q0S5T6K 924916112�      �  �      �                                                           WINDOWS _20Q0S5T6L 924916112C  T  r    �  �      �  �                                               COMMENT RESERVED                                                                                            ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      FTop = 0
Left = 0
DoCreate = .T.
Caption = "Form1"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      EHeight = 228
Left = 12
Top = 12
Width = 348
Name = "Imgcanvas1"
     
�PROCEDURE beforedraw
WITH _Screen.System.Drawing

* To allow Intellisense for "This.oGfx"
  Local loGfx As xfcGraphics
  loGfx = This.oGfx


* Create a Linear Gradient Brush
  Local loGradBrsh As xfcLinearGraphicsBrush
  loGradBrsh = .Drawing2D.LinearGradientBrush.New(;
    This.Rectangle, .Color.LightBlue, .Color.DarkBlue, 1)

* Draw a rectangle using the whole rectangle from the canvas and the Gradient Brush
  loGfx.FillRectangle(loGradBrsh, This.Rectangle)


* Draw a Triangle
  Dimension laPoints(3)
  laPoints(1) = .Point.New(20, 100)
  laPoints(2) = .Point.New(90, 100)
  laPoints(3) = .Point.New(55, 40)
  loGfx.FillPolygon(.Brushes.Green, @laPoints)


* Draw a Rectangle
  loGfx.FillRectangle(.Brushes.Yellow, 20, 100, 70, 50)
  loGfx.FillRectangle(.Brushes.Gray, 90, 100, 100, 50)


* Draw a Trapeze
  Dimension laPoints(4)
  laPoints(1) = .Point.New(55, 40)
  laPoints(2) = .Point.New(90, 100)
  laPoints(3) = .Point.New(190, 100)
  laPoints(4) = .Point.New(155, 40)
  loGfx.FillPolygon(.SolidBrush.New(.Color.FromRGB(128,0,0)), @laPoints)


* Create a path containing two curves
  Local myPath As xfcGraphicsPath
  myPath = .Drawing2D.GraphicsPath.New()

  myPath.StartFigure()
  Dimension points(4)
  points(1) = .Point.New(45, 150)
  points(2) = .Point.New(65, 170)
  points(3) = .Point.New(45, 190)
  points(4) = .Point.New(65, 210)
  myPath.AddCurve(@points)
  myPath.AddLine(.Point.New(65,210), .Point.New(85, 210))
  points(1) = .Point.New(85, 210)
  points(2) = .Point.New(65, 190)
  points(3) = .Point.New(85, 170)
  points(4) = .Point.New(65, 150)
  myPath.AddCurve(@points)
  myPath.AddLine(.Point.New(65,150), .Point.New(45, 150))

* Draw the path
  loGfx.FillPath(.Brushes.Orange, myPath)
  loGfx.DrawPath(.Pen.New(.Color.Black, 1), myPath) && Black Border


* Draw the Sun
  Local loPath As xfcGraphicsPath
  loPath = .Drawing2D.GraphicsPath.New()
  loPath.AddEllipse(280, 20, 40, 40)

  Local loPathGradBrush As xfcPathGradientBrush
  loPathGradBrush = .Drawing2D.PathGradientBrush.New(loPath)
  loPathGradBrush.CenterColor = .Color.Red

  loPathGradBrush.SurroundColors[1] = .Color.Yellow
  loGfx.FillEllipse(loPathGradBrush, 280, 20, 40, 40)


* Draw a string
  loGfx.DrawString("GdiPlusX is cool !!!", ;
    .Font.New("Tahoma", 20), .Brushes.Red, 110, This.Height - 40)


* Save the Image to Disk
  LOCAL lcNewFile
  lcNewFile = FULLPATH("Samples\Outputs\" + "CanvasDrawing.png")
  This.oBmp.Save(lcNewFile, .Imaging.ImageFormat.Png)

* Print the Image
* Check the "AfterDraw Method"
  
ENDWITH
ENDPROC
PROCEDURE afterdraw
* Print the Image
  IF MESSAGEBOX("Do you want to print the Image from the Canvas ?",32+1,"Print Sample") = 1
    This.oBmp.ToPrinter()
  ENDIF

ENDPROC
     	!���    	  	                        �a   %         �  8   ?          �  U  k ���9�  � ��d� �� Q� XFCGRAPHICS� T� �� � ��! �� Q� XFCLINEARGRAPHICSBRUSH�, T� �C� �	 ��
 � ��
 � ��� � � �� ��C � � �	 � � �� � ���� T� ����C��d�� � �� T� ����C�Z�d�� � �� T� ����C�7�(�� � �� ��C�� � � � � ��  ��C�� � ��d�F�2� � ��  ��C�� � �Z�d�d�2� � �� � ���� T� ����C�7�(�� � �� T� ����C�Z�d�� � �� T� ����C���d�� � �� T� ����C���(�� � ��* ��CCC��� � ��
 � �� � � � � �� �� Q� XFCGRAPHICSPATH� T� �C�� � � �� ��C� � �� � ���� T� ����C�-���� � �� T� ����C�A���� � �� T� ����C�-���� � �� T� ����C�A���� � �� ��C� � � ��) ��CC�A���� � C�U���� � � � �� T� ����C�U���� � �� T� ����C�A���� � �� T� ����C�U���� � �� T� ����C�A���� � �� ��C� � � ��) ��CC�A���� � C�-���� � � � �� ��C�� �  � � � ��# ��CC��
 �! ���  �  � � � �� ��" Q� XFCGRAPHICSPATH� T�" �C�� � � �� ��C���(�(�" �# �� ��$ Q� XFCPATHGRADIENTBRUSH� T�$ �C �" �� �% � �� T�$ �& ���
 �' �� T�$ �( ������
 � �� ��C �$ ���(�(� �) ��L ��C� GdiPlusX is cool !!!C� Tahoma���+ � �� �' �n� �, �(� �* �� ��- �4 T�- �C� Samples\Outputs\� CanvasDrawing.png��� ��C �- ��0 �1 �2 � �. �/ �� �� U3  SYSTEM DRAWING LOGFX THIS OGFX
 LOGRADBRSH	 DRAWING2D LINEARGRADIENTBRUSH NEW	 RECTANGLE COLOR	 LIGHTBLUE DARKBLUE FILLRECTANGLE LAPOINTS POINT FILLPOLYGON BRUSHES GREEN YELLOW GRAY
 SOLIDBRUSH FROMRGB MYPATH GRAPHICSPATH STARTFIGURE POINTS ADDCURVE ADDLINE FILLPATH ORANGE DRAWPATH PEN BLACK LOPATH
 ADDELLIPSE LOPATHGRADBRUSH PATHGRADIENTBRUSH CENTERCOLOR RED SURROUNDCOLORS FILLELLIPSE
 DRAWSTRING FONT HEIGHT	 LCNEWFILE OBMP SAVE IMAGING IMAGEFORMAT PNGm V %�C�0 Do you want to print the Image from the Canvas ?�!� Print Sample�x���f � ��C�  � � �� � U  THIS OBMP	 TOPRINTER
 beforedraw,     ��	 afterdraw�    ��1 !c�s� ����� ������Q� � �����������1�Q���A���t A�E 2 bA 2                       7
     4   W
  �
  \    )   	                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 942183470�      �  �      �        H4                  Z
                           WINDOWS _1U40L3TVH 898893511�
      �
  �
  �
  �
                                                           WINDOWS _1TP0L3VWK 891051173�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 8988936475      J  _  o  |      ]                                                 WINDOWS _1VV0647SE 923482293e      z  �  �  �      d  1                                               WINDOWS _1VV0647SF 923482293�      �      "      �  �.                                               WINDOWS _1VV0647SG 923482293      /  D  T  a        �)                                               WINDOWS _1TP0L3VWK 923482293�"      �"  �"  �"  �"      #  �                                               WINDOWS _1VV0647SI 923482315�&      �&  x&  k&  �&      m'  _                                               WINDOWS _1VV06FYAD 923482293V&      A&  1&  u"  �,      g-                                                 WINDOWS _1VV13G8JF 923482293`"        �  �  ~!      �$  M                                               WINDOWS _1Z00237NU 898893647�      �  �  �  �                                                           COMMENT RESERVED                                
                                                            6^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     Top = 10
Left = 71
Height = 409
Width = 565
DoCreate = .T.
ShowTips = .T.
Caption = "Capture Screens and Forms"
MaxButton = .F.
_memberdata =       89<VFPData><memberdata name="launchimage" type="method" display="LaunchImage"/></VFPData>

Name = "Form1"
     4PROCEDURE launchimage
LPARAMETERS tcFileName

DECLARE INTEGER ShellExecute ;
          IN SHELL32.DLL ;
          INTEGER nWinHandle,;
          STRING cOperation,;   
          STRING cFileName,;
          STRING cParameters,;
          STRING cDirectory,;
          INTEGER nShowWindow

         

RETURN ShellExecute(0,"open",m.tcFileName,"","",1)

ENDPROC
PROCEDURE Init
DO (LOCFILE("System.app"))


LOCAL lcFile
lcFile = LOCFILE("vfpxlogosmall.png")
WITH Thisform
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
ENDWITH
ENDPROC
     ����    �  �                        Va   %   :      Y     I          �  U  �  ��  Q�	 XFCBITMAP� T�  �C � �9� � � � �� �� �& T� �C� Save As� captured1.png���" ��C � �9� � � �	 �
 �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 A�r a!2                       )      )   �                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      E_memberdata XML Metadata for customizable properties
*launchimage 
      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 12
TabIndex = 2
Top = 367
Width = 540
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 300
Left = 12
Top = 12
Width = 420
Name = "Image1"
      commandbutton      commandbutton      Command2      Form1      �Top = 324
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      �PROCEDURE Click
LOCAL lcFile
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

WITH Thisform
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
ENDWITH
ENDPROC
     K���    2  2                        �   %   �       �      �           �  U  a  ��  � T�  �C��� %�C�  ���' � B� � ��� ��Z � T�� � ��  �� T�� � ��  �� �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE Click,     ��1 q � � A A � A 1                       �       )   2                        commandbutton      commandbutton      Command1      Form1      �Top = 252
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Bottom Right"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
     �PROCEDURE Click
* Capture Bottom-Right
LOCAL lnTitleHeight, lnLeftBorder, lnTopBorder
lnTitleHeight = SYSMETRIC(9)
lnLeftBorder = SYSMETRIC(3)
lnTopBorder = SYSMETRIC(4)

lnTotalWidth = Thisform.Width + lnLeftBorder * 2
lnTotalHeight = Thisform.Height + lnTitleHeight + lnTopBorder * 2

LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd, ;
	lnTotalWidth/2, lnTotalHeight/2, lnTotalWidth /2, lnTotalHeight /2)
	
LOCAL lcNewFile
lcNewFile = PUTFILE("Save As","capturedBotRight.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

RETURN
ENDPROC
     ����    �  �                        3�   %   2      O     A          �  U  �  ��  Q�	 XFCBITMAP� T�  �C�9� � � � ��) T� �C� Save As� CapturedScrn.png���" ��C � �9� � � � �	 �  � �� ��C � �
 � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG THISFORM LAUNCHIMAGE Click,     ��1 B��!2                       K      )   �                        �FontBold = .T.
WordWrap = .T.
Caption = "Tip: Move this form to the right and bottom in a way that it doesn't fit completely in the screen and try capturing"
Height = 36
Left = 120
Top = 324
Width = 312
ForeColor = 255,0,0
Name = "Label1"
      Form1      commandbutton      commandbutton      Command3      Form1      �Top = 156
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Top Left"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command3"
     �PROCEDURE Click
* Capture Top-Left
LOCAL lnTitleHeight, lnLeftBorder, lnTopBorder
lnTitleHeight = SYSMETRIC(9)
lnLeftBorder = SYSMETRIC(3)
lnTopBorder = SYSMETRIC(4)

lnTotalWidth = Thisform.Width + lnLeftBorder * 2
lnTotalHeight = Thisform.Height + lnTitleHeight + lnTopBorder * 2

LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd, ;
	0, 0, lnTotalWIdth /2, lnTotalHeight /2)
	
LOCAL lcNewFile
lcNewFile = PUTFILE("Save As","capturedTopLeft.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

ENDPROC
     Y���    @  @                        �{   %   �      �     �          �  U  �  ��  � � � T�  �C�	�%�� T� �C��%�� T� �C��%�� �� Q�	 XFCBITMAP�6 T� �C� �	  � �  � � �
 � � �9� � � � ��. T� �C� Save As� capturedNoBorders.png���" ��C � �9� � � � � � � �� ��C � � � �� U  LNTITLEHEIGHT LNLEFTBORDER LNTOPBORDER LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM HWND WIDTH HEIGHT	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 � Cd�!3                       h      )   @                        Label1      label      label      Form1      Command8      commandbutton      commandbutton      commandbutton      Command4      Form1      �Top = 204
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Center"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command4"
     �PROCEDURE Click
* Capture Center
LOCAL lnTitleHeight, lnLeftBorder, lnTopBorder
lnTitleHeight = SYSMETRIC(9)
lnLeftBorder = SYSMETRIC(3)
lnTopBorder = SYSMETRIC(4)

lnTotalWidth = Thisform.Width + lnLeftBorder * 2
lnTotalHeight = Thisform.Height + lnTitleHeight + lnTopBorder * 2

LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd, ;
	lnTotalWidth/4, lnTotalHeight/4, lnTotalWidth /2, lnTotalHeight /2)
	
LOCAL lcNewFile
lcNewFile = PUTFILE("Save As","capturedCenter.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

RETURN
ENDPROC
     ����    �  �                        �U   %   ;      X     J          �  U  �  ��  Q�	 XFCBITMAP� T�  �C� � �9� � � � ��& T� �C� Save As� Captured1.png���" ��C � �9� � �	 �
 � �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM HWND	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 B�b!2                       c      )   �                        �Top = 300
Left = 456
Height = 48
Width = 96
Anchor = 6
WordWrap = .T.
Caption = "Using 'Thisform' as parameter"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
BackColor = 255,255,204
Name = "Command8"
      commandbutton      Form1      commandbutton      commandbutton      Command5      Form1      �Top = 12
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Entire Form"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command5"
     nPROCEDURE Click
*** You can also remove the Window borders and titles, if you want :
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd)

lcNewFile = PUTFILE("Save As","Captured1.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

ENDPROC
     4PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform)

LOCAL lcNewFile
lcNewFile = PUTFILE("Save As","captured1.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

ENDPROC
      Command7      commandbutton      commandbutton      Form1      Command6      commandbutton      commandbutton      �Top = 108
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Form NO borders"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command6"
     sPROCEDURE Click
*** You can also remove the Window borders and titles, if you want :
LOCAL lnTitleHeight, lnLeftBorder, lnTopBorder
lnTitleHeight = SYSMETRIC(9)
lnLeftBorder = SYSMETRIC(3)
lnTopBorder = SYSMETRIC(4)


LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd, ;
	lnLeftBorder, lnTitleHeight + lnTopBorder, ;
      Thisform.Width, ;
      Thisform.Height)

      
lcNewFile = PUTFILE("Save As","capturedNoBorders.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
     ����    �  �                        ��   %   0      ]     ?          �  U  . ��  � � � T�  �C�	�%�� T� �C��%�� T� �C��%�� T� �� � � ��� T� �� � �  � ��� �� Q�	 XFCBITMAP�; T� �C� � � �� �� �� ��9�	 �
 � � �� �� �+ T� �C� Save As� capturedCenter.png���" ��C � �9�	 �
 � � � � � �� ��C � � � �� B� U  LNTITLEHEIGHT LNLEFTBORDER LNTOPBORDER LNTOTALWIDTH THISFORM WIDTH LNTOTALHEIGHT HEIGHT LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN HWND	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 � ��B�r �!B 1                       �      )   �                        �Top = 60
Left = 456
Height = 36
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Entire Screen"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command7"
     VPROCEDURE Click
*** To capture the whole screen no parameter is needed
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen()

lcNewFile = PUTFILE("Save As","CapturedScrn.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)

ENDPROC
     ����    �  �                        "   %   %      P     4          �  U  # ��  � � � T�  �C�	�%�� T� �C��%�� T� �C��%�� T� �� � � ��� T� �� � �  � ��� �� Q�	 XFCBITMAP�3 T� �C� � � � � �� ��9�	 �
 � � �� �� �, T� �C� Save As� capturedTopLeft.png���" ��C � �9�	 �
 � � � � � �� ��C � � � �� U  LNTITLEHEIGHT LNLEFTBORDER LNTOPBORDER LNTOTALWIDTH THISFORM WIDTH LNTOTALHEIGHT HEIGHT LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN HWND	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 � ��B2r �!2                       v      )   �                       ����    �  �                        wJ   %   2      _     A          �  U  0 ��  � � � T�  �C�	�%�� T� �C��%�� T� �C��%�� T� �� � � ��� T� �� � �  � ��� �� Q�	 XFCBITMAP�; T� �C� � � �� �� �� ��9�	 �
 � � �� �� �- T� �C� Save As� capturedBotRight.png���" ��C � �9�	 �
 � � � � � �� ��C � � � �� B� U  LNTITLEHEIGHT LNLEFTBORDER LNTOPBORDER LNTOTALWIDTH THISFORM WIDTH LNTOTALHEIGHT HEIGHT LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN HWND	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 � ��B�r �!B 1                       �      )   �                       ���    �  �                        ��   %   _      �     �          �  U  [  ��  �. |�� ShellExecute� SHELL32.DLL�������# B�C� � open ��  �  �  �� �� U 
 TCFILENAME SHELLEXECUTE SHELL32 DLLu  �C�
 System.app��� ��  �! T�  �C� vfpxlogosmall.png��� ��� ��n � T�� � ��  �� T�� � ��  �� �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE launchimage,     �� Init�     ��1 q �43 qs � A 1                       n        �  )      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 942183757�      �  �      �      ,  �8                  �                           WINDOWS _1TP0L3VWK 930677956      #  0  >  K                                                           WINDOWS _1TP0L3VWK 930677905�      �  �  �  �      �  p3                                               WINDOWS _28H110G3V 930677905�      �  �  �  �                                                           WINDOWS _28H1145U3 942183757D      U  f  x  �                                                           WINDOWS _28H11KQLJ 930677905[      l  }  �  �                                                           WINDOWS _28H11KQLK 930677905        -  >  r      �  �5                                               WINDOWS _28H12MKD0 930677905O$      d$  y$  �$  �$      d%  �&                                               WINDOWS _28I0128VH 930677905a(      r(  �(  �(  �(                                                           WINDOWS _28I0128VI 930677687)      )  ")  0)  H)                                                           WINDOWS _28I0128VJ 930677687�)      �)  �)  �)  �)                                                           WINDOWS _28I0128VK 930677687F*      S*  `*  n*  �*                                                           WINDOWS _28I0128VL 930677687�*      �*  �*  +  %+                                                           WINDOWS _28I0128VM 930677687�+      �+  �+  �+  �+                                                           WINDOWS _28I0128VN 930677687$,      1,  >,  L,  d,                                                           WINDOWS _28I0128VO 930677687�,      �,  �,  �,  -                                                           WINDOWS _1TP0L3VWK 930677905�-      �-  �-  �-  �-      �.  U!                                               WINDOWS _28I0128VP 930677905R1      =1  -1   1  g1      ;2  �                                               WINDOWS _28I0128VQ 930677905:$      %$  $  �  45      �/  @                                               WINDOWS _28I0128VR 930677905 $      �#  �  �  #      R  t                                               COMMENT RESERVED                                                                                            >6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     )Top = 6
Left = 5
Height = 476
Width = 709
DoCreate = .T.
ShowTips = .T.
Caption = "Capture Screens, Forms and Controls !"
MaxButton = .F.
WindowState = 0
_memberdata =       89<VFPData><memberdata name="launchimage" type="method" display="LaunchImage"/></VFPData>

Name = "Form1"
     	@PROCEDURE launchimage
LPARAMETERS tcFileName

DECLARE INTEGER ShellExecute ;
          IN SHELL32.DLL ;
          INTEGER nWinHandle,;
          STRING cOperation,;   
          STRING cFileName,;
          STRING cParameters,;
          STRING cDirectory,;
          INTEGER nShowWindow

         

RETURN ShellExecute(0,"open",m.tcFileName,"","",1)

ENDPROC
PROCEDURE objtoclient
*!* This replaces OBJTOCLIENT that has bugs with pageframes
Parameters toControl, tnType && 1 = Top  2 = Left

*!* Pemstatus  Values
#Define CON_PEMSTAT_CHANGED						0
#Define CON_PEMSTAT_READONLY					1
#Define CON_PEMSTAT_PROTECTED					2
#Define CON_PEMSTAT_TYPE						3
#Define CON_PEMSTAT_USERDEFINED					4
#Define CON_PEMSTAT_DEFINED						5
#Define CON_PEMSTAT_INHERITED					6

*!* TabOrientation parameters
#Define CON_TABOR_TOP							0
#Define CON_TABOR_BOTTOM						1
#Define CON_TABOR_LEFT							2
#Define CON_TABOR_RIGHT							3

Local lnPosition As Integer
m.lnPosition = 0

Do Case

Case m.tnType = 1 && Top
	Do While Not Upper(m.toControl.BaseClass) == [FORM]
		If Pemstatus(m.toControl, [Top], CON_PEMSTAT_DEFINED) Then
			m.lnPosition = m.lnPosition + m.toControl.Top
		Endif
		If Upper(m.toControl.BaseClass) == [PAGE] Then
			If m.toControl.Parent.TabOrientation = CON_TABOR_TOP Then	&& Top
				m.lnPosition = m.lnPosition + ;
					m.toControl.Parent.Height - ;
					m.toControl.Parent.PageHeight - ;
					m.toControl.Parent.BorderWidth * 2
			Else
				m.lnPosition = m.lnPosition + 1
			Endif
		Endif
		m.toControl = m.toControl.Parent
	Enddo

Case m.tnType = 2 && Left
	Do While Not Upper(m.toControl.BaseClass) == [FORM]
		If Pemstatus(m.toControl, [Left], CON_PEMSTAT_DEFINED) Then
			m.lnPosition = m.lnPosition + m.toControl.Left
		Endif
		If Upper(m.toControl.BaseClass) == [PAGE]
			If m.toControl.Parent.TabOrientation = CON_TABOR_LEFT Then	&& Left
				m.lnPosition = m.lnPosition + ;
					m.toControl.Parent.Width - ;
					m.toControl.Parent.PageWidth - ;
					m.toControl.Parent.BorderWidth * 2
			Else
				m.lnPosition = m.lnPosition + 1
			Endif
		Endif
		m.toControl = m.toControl.Parent
	Enddo

Endcase

Return m.lnPosition
ENDPROC
PROCEDURE Init
DO (LOCFILE("System.app"))


LOCAL lcFile
lcFile = LOCFILE("vfpxlogosmall.png")
Thisform.Image1.Picture = lcFile
ENDPROC
     ����    �  �                        y�   %   E      b     T          �  U  �  ��  Q�	 XFCBITMAP� T�  �C� � �9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � �	 �
 � �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM
 CONTAINER2	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 A��!1                       +      )   �                       ����    �  �                        �<   %   A      ^     P          �  U  �  ��  Q�	 XFCBITMAP� T�  �C� � �9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � �	 �
 � �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM IMAGE1	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 A��!3                       1      )   �                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 1, 9, 6, 15, 12, 32, 3, 0
     6PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.Container2)
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
ENDPROC
      Form1      Command4      Form1      T_memberdata XML Metadata for customizable properties
*launchimage 
*objtoclient 
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 276
Left = 12
Top = 12
Width = 420
Name = "Image1"
      commandbutton      commandbutton      	Command10      Form1      �Top = 12
Left = 456
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture this button"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .T.
Name = "Command10"
     1PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(This)
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
     ����    �  �                        ��   %   3      P     B          �  U  �  ��  Q�	 XFCBITMAP� T�  �C�9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � � � �	 �  � �� ��C � �
 � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG THISFORM LAUNCHIMAGE Click,     ��1 A��!3                       "      )   �                        	container      	container      
Container1      Form1      FTop = 300
Left = 12
Width = 264
Height = 168
Name = "Container1"
      	pageframe      	pageframe      
Pageframe1      Form1.Container1      �ErasePage = .T.
PageCount = 2
Top = 12
Left = 12
Width = 241
Height = 149
Name = "Pageframe1"
Page1.Caption = "Page1"
Page1.Name = "Page1"
Page2.Caption = "Page2"
Page2.Name = "Page2"
      	container      	container      
Container2      !Form1.Container1.Pageframe1.Page1      CTop = 8
Left = 11
Width = 204
Height = 96
Name = "Container2"
      commandbutton      commandbutton      	Command10      ,Form1.Container1.Pageframe1.Page1.Container2     Top = 24
Left = 12
Height = 36
Width = 179
FontBold = .T.
Anchor = 6
WordWrap = .T.
Picture = image\exit.bmp
Caption = "Capture Me !"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
ForeColor = 255,255,255
BackColor = 0,0,128
Themes = .T.
Name = "Command10"
     �PROCEDURE Click
*** You can also remove the Window borders and titles, if you want :
LOCAL lnTitleHeight, lnLeftBorder, lnTopBorder
lnTitleHeight = SYSMETRIC(9)
lnLeftBorder = SYSMETRIC(3)
lnTopBorder = SYSMETRIC(4)

*!*	LOCAL loImg as Image 
*!*	loImg = Thisform.Image1 
*!*	loImg = This


*!*	LOCAL x, y, w, h
*!*	x = OBJTOCLIENT(loImg, 1)
*!*	y = OBJTOCLIENT(loImg, 2)
*!*	w = OBJTOCLIENT(loImg, 3)
*!*	h = OBJTOCLIENT(loImg, 4)


LOCAL x, y, w, h
y = Thisform.OBJTOCLIENT(This, 1)
x = Thisform.OBJTOCLIENT(This, 2)
w = This.Width
h = This.Height


LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.HWnd, ;
	lnLeftBorder + x , ;
	lnTitleHeight + lnTopBorder + y , ;
	W , ;
	H)

      
lcNewFile = PUTFILE("Save As","capturedNoBorders.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
     ����    �  �                        ��   %   7      T     F          �  U  �  ��  Q�	 XFCBITMAP� T�  �C � �9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � � �	 �
 �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THISFORM	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 A��!1                              )   �                        �Top = 108
Left = 588
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture the Graphics container"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .T.
Name = "Command4"
      commandbutton      commandbutton      Command3      commandbutton      commandbutton      commandbutton      commandbutton      	Command11      Form1      �Top = 12
Left = 588
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture this button"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .F.
Name = "Command11"
     1PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(This)
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
     ����    �  �                        �r   %   =      Z     L          �  U  �  ��  Q�	 XFCBITMAP� T�  �C � �9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � � �	 �
 �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THIS	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG THISFORM LAUNCHIMAGE Click,     ��1 A��!3                       &      )   �                        	container      	container      
Container2      Form1      ^Top = 180
Left = 456
Width = 240
Height = 200
BackColor = 0,128,192
Name = "Container2"
      shape      shape      Shape1      Form1.Container2      UTop = 24
Left = 12
Height = 132
Width = 36
BackColor = 255,0,0
Name = "Shape1"
      shape      shape      Shape2      Form1.Container2      YTop = 48
Left = 48
Height = 108
Width = 36
BackColor = 128,128,255
Name = "Shape2"
      shape      shape      Shape3      Form1.Container2      WTop = 72
Left = 84
Height = 84
Width = 36
BackColor = 64,128,128
Name = "Shape3"
      shape      shape      Shape4      Form1.Container2      WTop = 36
Left = 120
Height = 120
Width = 36
BackColor = 0,255,64
Name = "Shape4"
      shape      shape      Shape5      Form1.Container2      XTop = 84
Left = 156
Height = 72
Width = 36
BackColor = 255,128,64
Name = "Shape5"
      shape      shape      Shape6      Form1.Container2      WTop = 60
Left = 192
Height = 96
Width = 36
BackColor = 255,255,0
Name = "Shape6"
      label      label      Label1      Form1.Container2      �BackStyle = 0
Caption = "GRAPHICS SAMPLE"
Height = 17
Left = 12
Top = 168
Width = 216
ForeColor = 255,255,255
Name = "Label1"
      commandbutton      commandbutton      Command1      Form1      �Top = 60
Left = 456
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture this entire form"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .T.
Name = "Command1"
     +PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform)
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
ENDPROC
     <PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen(Thisform.Image1)
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
      Form1      Command2      commandbutton      commandbutton      �Top = 60
Left = 588
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture this entire _Screen"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .T.
Name = "Command2"
     -PROCEDURE Click
LOCAL loCaptureBmp as xfcBitmap
loCaptureBmp = _screen.system.Drawing.Bitmap.FromScreen()
      
lcNewFile = PUTFILE("Save As","CapturedImage.png")
loCaptureBmp.Save(lcNewFile, _screen.system.Drawing.Imaging.ImageFormat.Png)

ThisForm.LaunchImage(lcNewFile)
      

ENDPROC
     ����    �  �                        �r   %   =      Z     L          �  U  �  ��  Q�	 XFCBITMAP� T�  �C � �9� � � � ��* T� �C� Save As� CapturedImage.png���" ��C � �9� � � �	 �
 �  � �� ��C � � � �� U  LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN THIS	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG THISFORM LAUNCHIMAGE Click,     ��1 A��!3                       &      )   �                        �Top = 108
Left = 456
Height = 48
Width = 98
Anchor = 6
WordWrap = .T.
Caption = "Capture the image"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Themes = .T.
Name = "Command3"
     ����    �  �                        t�   %   W      �     f          �  U  S ��  � � � T�  �C�	�%�� T� �C��%�� T� �C��%�� �� � � � � T� �C �	 �� � �� T� �C �	 �� � �� T� ��	 �
 �� T� ��	 � �� �� Q�	 XFCBITMAP�9 T� �C� � � � �  � �  �  � �9� � � � ��. T� �C� Save As� capturedNoBorders.png���" ��C � �9� � � � � � � �� ��C � � � �� U  LNTITLEHEIGHT LNLEFTBORDER LNTOPBORDER X Y W H THISFORM OBJTOCLIENT THIS WIDTH HEIGHT LOCAPTUREBMP SYSTEM DRAWING BITMAP
 FROMSCREEN HWND	 LCNEWFILE SAVE IMAGING IMAGEFORMAT PNG LAUNCHIMAGE Click,     ��1 � >��C��!3                       �      )   �                       ?���    &  &                        6�   %   )      �  .   a          �  U  [  ��  �. |�� ShellExecute� SHELL32.DLL�������# B�C� � open ��  �  �  �� �� U 
 TCFILENAME SHELLEXECUTE SHELL32 DLLv 4�  � � �� Q� INTEGER� T�� �� �� H�9 �d� ��� ���N� +�C��  � f� FORM
��J� %�C��  � Top��h��� � T�� ��� ��  � �� � %�C��  � f� PAGE��2� %���  � � � ���9 T�� ��� ��  � � ��  � � ��  � �	 ��� �.� T�� ��� ��� � � T��  ���  � �� � ��� ���d� +�C��  � f� FORM
��`� %�C��  � Left��h���� T�� ��� ��  �
 �� � %�C��  � f� PAGE��H� %���  � � ���'�9 T�� ��� ��  � � ��  � � ��  � �	 ��� �D� T�� ��� ��� � � T��  ���  � �� � � B��� �� U 	 TOCONTROL TNTYPE
 LNPOSITION	 BASECLASS TOP PARENT TABORIENTATION HEIGHT
 PAGEHEIGHT BORDERWIDTH LEFT WIDTH	 PAGEWIDTHU  �C�
 System.app��� ��  �! T�  �C� vfpxlogosmall.png��� T� � � ��  �� U  LCFILE THISFORM IMAGE1 PICTURE launchimage,     �� objtoclient�     �� Init�    ��1 q �43 �  !� � 2���A ���� QA A AA 2���A ���� QA A AA B � 2 qs 11                       n        �  �     )   �  5	  R    )   &                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 885804635      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923482670�      �  �      �      �  �f                  _4                           WINDOWS _1TZ0QGKPH 923482670�4  �4  �4  5  5  *5      �5  �C                                               WINDOWS _1U200PXOO 911148071�N      S4  �N  �N  �N      �Q  3-                                               WINDOWS _1U200PXOP 886637327�R      �R  
S  S  4S                                                           WINDOWS _1U200PXOQ 910867332qS      �S  �S  �S  �S      T  U,                                               WINDOWS _1U200PXOR 8866373271U      ?U  MU  \U  wU                                                           WINDOWS _1U200PXOS 910867332�U      �U  �U  �U  �U      ZV  w+                                               WINDOWS _1U200PXOV 886637327yW      �W  �W  �W  �W                                                           WINDOWS _1U200PXOW 886637190�W      X  X  'X  BX                                                           WINDOWS _1U200VGYU 910867332�X      �X  �X  �X  �X      `Y  n*                                               WINDOWS _1U2010IWM 886638053�Z      �Z  �Z  [  )[                                                           WINDOWS _1U2010IWN 910867332Q[      `[  o[  |[  �[      �[  3)                                               WINDOWS _1TP0L3VWK 923482670�]      �]  �]  �Z  �]      �`  �'                                               WINDOWS _1TP0L3VWK 923482670�]      |]  l]  �Z  �c      |Z  �&                                               WINDOWS _1U3003IYR 923482670oZ      bZ  TZ  GZ  �\                                                           WINDOWS _1TP0L3VWK 9234826704Z      !Z  U  U  �a      �Y  �%                                               WINDOWS _1TP0L3VWK 923482670U      �T  �T  �T  �V      �T  �$                                               WINDOWS _20K001H6U 923482670xT      eT  VT  �R  �d      4  �#                                               WINDOWS _20L02SQR6 923482670�3      �3  �3  �3  �Q      x3  �"                                               WINDOWS _1TP0L3VWK 923482670k3      ^3  P3  C3  �2                                                           WINDOWS _20L03UFMQ 923482670�2      �2  �2  �2  2                                                           WINDOWS _1TP0L3VWK 9234826702      �1  �1  �1  b1      �0  �!                                               WINDOWS _1TP0L3VWL 923482670�0      �0  �0  �0  80                                                           WINDOWS _20N015SAI 923482670#0      0  �/  �/  /      �.  �                                                WINDOWS _20N015SAJ 923482670�.      �.  �.  �.  M.                                                           COMMENT RESERVED                                $.                                                            z]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = -6
Left = 43
Height = 502
Width = 579
ShowWindow = 2
DoCreate = .T.
Caption = "Pie Charts"
MinHeight = 300
MinWidth = 560
_memberdata =      219<VFPData><memberdata name="drawslice" type="method" display="DrawSlice"/><memberdata name="drawbar" type="method" display="DrawBar"/><memberdata name="preparebrushes" type="method" display="PrepareBrushes"/></VFPData>

Name = "Form1"
     PROCEDURE changecolor
LPARAMETERS tnRGB, tnLevel

IF tnLevel = 0
	RETURN tnRGB
ENDIF 

tnLevel = tnLevel / 100

LOCAL lnRed, lnGreen, lnBlue
lnRed   = BITAND(tnRGB, 0x000000FF)
lnGreen = BITRSHIFT(BITAND(tnRGB, 0x0000FF00), 8)
lnBlue  = BITRSHIFT(BITAND(tnRGB, 0x00FF0000), 16)

IF tnLevel > 0
	RETURN RGB( ;
		lnRed   + ((255 - lnRed)   * tnLevel) , ;
		lnGreen + ((255 - lnGreen) * tnLevel) , ;
		lnBlue  + ((255 - lnBlue)  * tnLevel) )
ELSE 
	RETURN RGB( ;
		lnRed   + (lnRed   * tnLevel) , ;
		lnGreen + (lnGreen * tnLevel) , ;
		lnBlue  + (lnBlue  * tnLevel) )
ENDIF 
ENDPROC
PROCEDURE drawslice
LPARAMETERS tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep

Thisform.PrepareBrushes(tnX, tnY, tnWidth, tnHeight)

LOCAL loPen as xfcPen
loPen   = Thisform.Imgcanvas1.oBorderPen

LOCAL loGfx as xfcGraphics
loGfx = Thisform.Imgcanvas1.oGfx

LOCAL loMainBrush as xfcBrush
loMainBrush = Thisform.Imgcanvas1.oMainBrush

LOCAL lo3dBrush as xfcBrush
lo3DBrush = Thisform.Imgcanvas1.o3DBrush

* Draw the 3D Slice using the Hatch Brush
IF Thisform.Optiongroup2.Value = 1 && 3D

	ln3DHeight = Thisform.Spn3D.Value
	tnY = tnY + ln3DHeight

	* Draw the contour of the 3D Slice
	loGfx.FillPie(loMainBrush, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep)
	loGfx.DrawPie(loPen, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep)

	
	FOR n = 1 TO ln3dHeight
		tnY = tnY - 1
		* Draw the Normal Slice using the Solid Brush
		loGfx.FillPie(lo3DBrush, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep) && draw the slice
		IF tnStart > 90
			loGfx.DrawArc(loPen, tnX, tnY, tnWidth, tnHeight, tnStart, 0.25)
		ENDIF 
		loGfx.DrawArc(loPen, tnX, tnY, tnWidth, tnHeight, tnStart + tnSweep - .25, 0.35)
	ENDFOR
	loGfx.FillPie(loMainBrush, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep) && draw the slice


	* Draw border line from center of pie
	LOCAL x, y
	x = (tnWidth / 2) + tnX
	y = (tnHeight / 2) + tnY
	loGfx.DrawLine(loPen, X, Y, X, Y + ln3DHeight)
	loGfx.DrawPie(loPen, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep)
ENDIF 

loGfx.FillPie(loMainBrush, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep)
loGfx.DrawPie(loPen, tnX, tnY, tnWidth, tnHeight, tnStart, tnSweep)

RETURN
ENDPROC
PROCEDURE drawbar
LPARAMETERS tnX, tnY, tnWidth, tnHeight

Thisform.PrepareBrushes(tnX, tnY, tnWidth, tnHeight)

LOCAL loPen as xfcPen
loPen   = Thisform.Imgcanvas1.oBorderPen

LOCAL loGfx as xfcGraphics
loGfx = Thisform.Imgcanvas1.oGfx

LOCAL loMainBrush as xfcBrush
loMainBrush = Thisform.Imgcanvas1.oMainBrush

LOCAL lo3dBrush as xfcBrush
lo3DBrush = Thisform.Imgcanvas1.o3DBrush


LOCAL loGfx as xfcGraphics
loGfx = Thisform.Imgcanvas1.oGfx


* Draw the 3D Bar using the 3DBrush
IF Thisform.Optiongroup2.Value = 1 && 3D

	IF THISFORM.Optiongroup1.VALUE = 3 && Monochrome - HatchBrush
		LOCAL lo3DBrush as xfcHatchBrush
		lo3DBrush = .Drawing2D.HatchBrush.New( ;
			RECNO()*2,   ; && HatchStyle
			.COLOR.Gray, ; && ForeColor
			.COLOR.LightGray ) && BackColor
	ELSE
		LOCAL lo3DBrush as xfcSolidBrush
		lo3DBrush = .SolidBrush.New(.Color.FromRGB(Thisform.ChangeColor(sales.nColor, - 20)))
	ENDIF

	ln3DHeight = Thisform.Spn3D.Value
*	tnY = tnY - ln3DHeight
*	tnX = tnX + ln3DHeight


	* Prepare Array of points to draw the 3D part of the Bar
	DIMENSION laPoints(4)
	laPoints(1) = .PointF.New(tnX + tnWidth, tnY)
	laPoints(2) = .PointF.New(tnX + tnWidth + ln3DHeight, tnY - ln3DHeight)
	laPoints(3) = .PointF.New(tnX + ln3DHeight, tnY - ln3DHeight)
	laPoints(4) = .PointF.New(tnX, tnY)
	loGfx.FillPolygon(lo3DBrush, @laPoints)
	loGfx.DrawPolygon(loPen, @laPoints)

	* Change only Points 3 and 4
	laPoints(3) = .PointF.New(tnX + tnWidth + ln3DHeight, tnY + tnHeight - ln3DHeight)
	laPoints(4) = .PointF.New(tnX + tnWidth, tnY + tnHeight)
	loGfx.FillPolygon(lo3DBrush, @laPoints)
	loGfx.DrawPolygon(loPen, @laPoints)

ENDIF 

loGfx.FillRectangle(loMainBrush, tnX, tnY, tnWidth, tnHeight)
loGfx.DrawRectangle(loPen, tnX, tnY, tnWidth, tnHeight)

RETURN
ENDPROC
PROCEDURE preparebrushes
LPARAMETERS tnX, tnY, tnWidth, tnHeight, tlRect

LOCAL loCanvas as Image
loCanvas = Thisform.Imgcanvas1 

DO CASE
CASE THISFORM.Optiongroup1.VALUE = 1 && Solid Brush
	loSolidBrush = .SolidBrush.New(.COLOR.FromRGB(sales.nColor))
	loCanvas.oMainBrush = loSolidBrush

CASE THISFORM.Optiongroup1.VALUE = 2 && Gradient Path Brush

	LOCAL loColor1 as xfcColor
	loColor1 = .Color.FromRGB(sales.nColor)
	
	LOCAL loColor2 as xfcColor
	loColor2 = .COLOR.FromRGB(THISFORM.ChangeColor(sales.nColor,THISFORM.Spinner1.VALUE * 10))

	IF Thisform.OptType.Value = 1 AND NOT tlRect && Pie Chart
		LOCAL loPath as xfcGraphicsPath
		loPath = .Drawing2D.GraphicsPath.New()
		loPath.AddEllipse(tnX, tnY, tnWidth, tnHeight)

		LOCAL loPathGradBrush as xfcPathGradientBrush
		loPathGradBrush = .Drawing2D.PathGradientBrush.New(loPath)
		loPathGradBrush.CenterColor = loColor2

		loPathGradBrush.SurroundColors[1] = loColor1
		loCanvas.oMainBrush = loPathGradBrush
	ELSE  && Bar Chart
		LOCAL loLinGradBrush as xfcLinearGradientBrush
		loLinGradBrush = .Drawing2D.LinearGradientBrush.New(;
			.Rectangle.New(tnX, tnY, tnWidth, tnHeight), ;
			loColor1, loColor2)
		
		loLinGradBrush.SetBlendTriangularShape(0.3, 1.0)
		
* Tipo 1
*	loLinGradBrush.SetBlendTriangularShape(0.5, 1.0)

* Tipo 2
*	loLinGradBrush.SetSigmaBellShape(0.5,1.0)

		loCanvas.oMainBrush = loLinGradBrush

	ENDIF
	

CASE THISFORM.Optiongroup1.VALUE = 3 && Monochrome - HatchBrush
	loCanvas.oMainBrush = .Drawing2D.HatchBrush.New( ;
		RECNO()*2, ; && HatchStyle
		.COLOR.Black, ; && ForeColor
		.COLOR.White ) && BackColor
ENDCASE


IF THISFORM.Optiongroup1.VALUE = 3 && Monochrome - HatchBrush
	loCanvas.o3DBrush = .Drawing2D.HatchBrush.New( ;
		RECNO()*2,   ; && HatchStyle
		.COLOR.Gray, ; && ForeColor
		.COLOR.LightGray ) && BackColor
ELSE
	loCanvas.o3DBrush = .SolidBrush.New(.Color.FromRGB(Thisform.ChangeColor(sales.nColor, - 20)))
ENDIF
ENDPROC
PROCEDURE Load
SET TALK OFF

CREATE CURSOR sales (nValue n(8,2), cLegend c(6), lDetach l, nColor i)
INSERT INTO sales VALUES (250, "JAN", .F., RGB(0,0,255)   )
INSERT INTO sales VALUES (128, "FEB", .T., RGB(0,255,255) )
INSERT INTO sales VALUES ( 90, "MAR", .F., RGB(255,0,255) )
INSERT INTO sales VALUES (330, "APR", .F., RGB(255,160,60))
INSERT INTO sales VALUES (250, "MAY", .T., RGB(255,255,0) )
INSERT INTO sales VALUES (150, "JUN", .F., RGB(0,255,64)  )
INSERT INTO sales VALUES (180, "JUL", .F., RGB(255,0,0)   )
INSERT INTO sales VALUES (100, "AUG", .T., RGB(128,128,128))
SELECT sales
GO TOP 

ENDPROC
     ���                              ]i   %   �       �      �           �  U  2  T�  � � �C�  � � ��� ��C� � � � �� U  THISFORM	 SHPBORDER	 BACKCOLOR THIS PARENT
 IMGCANVAS1 DRAW Click,     ��1 �11                       u       )                          ���                                sN   %   �       �      �           �  U  2  T�  � � �C�  � � ��� ��C� � � � �� U  THISFORM SHPBACK	 BACKCOLOR THIS PARENT
 IMGCANVAS1 DRAW Click,     ��1 �11                       q       )                            ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                         ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                         ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                         ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                         ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                        ����    n  n                        _L   %   �       %  
             �  U  z  %��  � ���6 � T� � � �a�� T� � � �a�� �` � T� � � �-�� T� � � �-�� � ��C�  � � � �� U	  THIS VALUE THISFORM LABEL1 VISIBLE SPINNER1 PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 A� A 21                       �       )   n                       3���                              ��   %   �       �      �           �  U  @  T�  �� � �� >� � ��C�  ���
 �� � � ��C� � � �� U  LNCOLOR SALES NCOLOR THIS REFRESH THISFORM
 IMGCANVAS1 DRAW DblClick,     ��1 1� 1                       �       )                          ���    �   �                         �   %   �       �      �           �  U  *  >�  � ���  � �� ��C� � � �� �� U  SALES LDETACH THISFORM
 IMGCANVAS1 DRAW Click,     ��1 1A 1                       a       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         ����    �   �                         ��   %   s       �      �           �  U  "  T�  � � �� sales.nColor�� U  THIS COLUMN5 DYNAMICBACKCOLOR Init,     ��1 �1                       >       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      jTop = 456
Left = 540
Height = 25
Width = 25
Anchor = 12
BackColor = 255,255,255
Name = "ShpBorder"
      Form1      	ShpBorder      shape      shape      �PROCEDURE Click
Thisform.ShpBorder.BackColor = GETCOLOR(Thisform.ShpBorder.BackColor)
This.Parent.imgcanvas1.Draw()
ENDPROC
      jTop = 456
Left = 444
Height = 27
Width = 84
Anchor = 12
Caption = "Border Color"
Name = "Command2"
      Form1      Command2      commandbutton      commandbutton      hTop = 456
Left = 384
Height = 25
Width = 25
Anchor = 12
BackColor = 255,255,221
Name = "ShpBack"
      Form1      ShpBack      shape      shape      |PROCEDURE Click
Thisform.ShpBack.BackColor = GETCOLOR(Thisform.ShpBack.BackColor)
This.Parent.imgcanvas1.Draw()
ENDPROC
      gTop = 456
Left = 288
Height = 27
Width = 84
Anchor = 12
Caption = "BackColor"
Name = "Command1"
      Form1      Command1      commandbutton      commandbutton      nAutoSize = .T.
Anchor = 12
Caption = "3D"
Height = 17
Left = 496
Top = 420
Width = 18
Name = "Label3"
      Form1      Label3      label      label      xAutoSize = .T.
Anchor = 12
Caption = "Between Bars"
Height = 17
Left = 288
Top = 372
Width = 79
Name = "Label2"
      Form1      Label2      label      label      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      Form1      SpnBetweenBars      spinner      spinner      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      grid      o_memberdata XML Metadata for customizable properties
*changecolor 
*drawslice 
*drawbar 
*preparebrushes 
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      PAnchor = 15
Height = 292
Left = 0
Top = 0
Width = 576
Name = "Imgcanvas1"
     PROCEDURE beforedraw
LOCAL loSolidBrush AS xfcSolidBrush
LOCAL loGBrush AS xfcLinearGradientBrush
LOCAL loHatchBrush as xfcHatchBrush

LOCAL loFont AS xfcFont

LOCAL lnX, lnY, x1, y1, lnWidth, lnHeight, lnMargin, lnTotal, lnLegendWidth, lnType

lnLegendWidth = 120
lnMargin      = 5
lnType = Thisform.OptType.Value

CALCULATE SUM(sales.nValue) TO lnTotal

Thisform.Cls()


WITH _SCREEN.SYSTEM.Drawing

This.Clear(.Color.FromRGB(Thisform.ShpBack.BackColor))
This.oBorderPen = .Pen.New(.Color.FromRGB(Thisform.ShpBorder.BackColor))

DO CASE 

CASE lnType = 1 && Pie Chart

	LOCAL lnDetachPixels, lnStart, lnSweep, lnAngle
	lnDetachPixels = 30

	lnWidth  = THIS.WIDTH - (lnDetachPixels * 2) - lnMargin - lnMargin - lnLegendWidth
	lnHeight = THIS.HEIGHT - (lnDetachPixels * 2) - lnMargin - lnMargin
	lnStart = 270

	lnX = 0 + lnDetachPixels + 5
	lnY = 0 + lnDetachPixels + 5

	* Draw the pie
	
	* Draw the RIGHT side of the pie
	SCAN FOR lnStart < 450
		x1 = lnX
		y1 = lnY

		* Calculate Start point and Sweep
		lnSweep = sales.nValue / lnTotal * 360

		IF sales.lDetach = .T.
			lnDetachAngle = 360 - (lnStart + (lnSweep / 2))
			x1 = lnX + (COS(DTOR(lnDetachAngle)) * lnDetachPixels)
			y1 = lnY - (SIN(DTOR(lnDetachAngle)) * lnDetachPixels)
		ELSE
			x1 = lnX
			y1 = lnY
		ENDIF

*		IF PieCursor.lSliceHidden = .F.
			Thisform.DrawSlice(x1, y1, lnWidth, lnHeight, lnStart, lnSweep)
*		ENDIF
		lnStart = lnStart + lnSweep
	ENDSCAN

	* Draw the LEFT side of the pie
	GO BOTTOM
	lnStart = 270
	DO WHILE lnStart > 90
		x1 = lnX
		y1 = lnY

		* Calculate Start point and Sweep
		lnSweep = sales.nValue / lnTotal * 360
		lnStart = lnStart - lnSweep

		IF Sales.lDetach = .T.
			lnDetachAngle = 360 - (lnStart + (lnSweep / 2))
			x1 = lnX + (COS(DTOR(lnDetachAngle)) * lnDetachPixels)
			y1 = lnY - (SIN(DTOR(lnDetachAngle)) * lnDetachPixels)
		ENDIF

*		IF Sales.lSliceHidden = .F.
			Thisform.DrawSlice(x1, y1, lnWidth, lnHeight, lnStart, lnSweep)
*		ENDIF
		SKIP -1
	ENDDO


CASE lnType = 2 && Bar Chart

	lnWidth  = THIS.WIDTH - lnMargin - lnMargin - lnLegendWidth ;
		+ IIF(Thisform.Optiongroup2.Value = 1, - Thisform.Spn3D.Value, 0)
	lnHeight = THIS.HEIGHT - lnMargin - lnMargin - Thisform.Spn3D.Value

	LOCAL lnBarWidth, lnRecs, lnBetween
	lnRecs = RECCOUNT()
	lnBetween = Thisform.SpnBetweenBars.Value
	lnBarWidth = (lnWidth - (lnRecs - 1) * lnBetween) / lnRecs

	LOCAL lnMaxValue
	CALCULATE MAX(sales.nValue) TO lnMaxValue

	SCAN
		lnBarHeight = sales.nValue / lnMaxValue * lnHeight

		x1 = lnMargin + ((lnBarWidth + lnBetween) * (RECNO() - 1))
		y1 = lnMargin + Thisform.Spn3D.Value + lnHeight - lnBarHeight
		Thisform.DrawBar(x1, y1, lnBarWidth, lnBarHeight)
	ENDSCAN

ENDCASE


*** Draw Legends

	x1 = This.Width - lnLegendWidth + 15
	y1 = 30
	lnWidth = 20
	lnHeight = 20

	loFont = .Font.New("Arial",10)
	loBlackBrush = .Brushes.Black

	SCAN
		Thisform.PrepareBrushes(X1, Y1, lnWidth, lnHeight, .T.)
		THIS.oGfx.FillRectangle(This.oMainBrush, x1, y1, lnWidth, lnHeight)
		THIS.oGfx.DrawRectangle(This.oBorderPen, x1, y1, lnWidth, lnHeight)
		THIS.oGfx.DrawString(sales.cLegend, loFont, loBlackBrush, x1 + 28, y1 + 3)
		y1 = y1 + 30
	ENDSCAN
	GO TOP

ENDWITH
RETURN
ENDPROC
PROCEDURE setup
This.Top = 0
This.Left = 0
*This.Width = Thisform.Width
*This.Height = Thisform.Height - Thisform.Grid1.Height - 10
This.ZOrder(1)

This.AddProperty("oBorderPen")
This.AddProperty("oMainBrush")
This.AddProperty("o3DBrush")

IF NOT DODEFAULT()
	RETURN .F.
ENDIF

ENDPROC
     ���    �
  �
                        �   %   �	      �
  `   �	          �  U  � ��  Q� XFCSOLIDBRUSH�! �� Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCHATCHBRUSH� �� Q� XFCFONT�+ �� � � � � �	 �
 � � � � T� ��x�� T�
 ���� T� �� � � �� }(� ��� � �� ��C� � �� ���9� � ��|� ��CC� � � �� � � � ��& T� � �CC� � � �� � �� � �� H�>�S� �� ����� ��  �! �" �# � T�  ����% T� �� �$ �  ��
 �
 � ��! T�	 �� �% �  ��
 �
 �� T�! ���� T� �� �  ��� T� �� �  ��� ~��! ������ T� �� �� T� �� �� T�" �� � � �h�� %�� �& a���� T�' ��h�! �" ��� T� �� CC�' ��C�  �� T� �� CC�' ��D�  �� ��� T� �� �� T� �� �� �% ��C �  �  �  �	  �!  �" � �( �� T�! ��! �" �� � #6� T�! ���� +��! �Z���� T� �� �� T� �� �� T�" �� � � �h�� T�! ��! �" �� %�� �& a���� T�' ��h�! �" ��� T� �� CC�' ��C�  �� T� �� CC�' ��D�  �� �% ��C �  �  �  �	  �!  �" � �( ��
 H������ � �� ���S�? T� �� �$ �
 �
 � C� �) � �� � �* � c� � 6��" T�	 �� �% �
 �
 � �* � �� ��+ �, �- � T�, �CN�� T�- �� �. � �� T�+ �� �, ��- �, �� ��/ � }(�/ ��� � �� ~�O� T�0 �� � �/ �	 �� T� ��
 �+ �- CO��� T� ��
 � �* � �	 �0 �� ��C �  �  �+  �0 � �1 �� � � T� �� �$ � ��� T� ���� T� ���� T�	 ���� T� �C� Arial�
��2 � �� T�3 ���4 �5 �� ~�s� ��C �  �  �  �	 a� �6 ��& ��C� �9  �  �  �  �	 � �7 �8 ��& ��C� �  �  �  �  �	 � �7 �: ��, ��C� �<  �  �3 � �� �� �7 �; �� T� �� ��� � #)� �� B� U=  LOSOLIDBRUSH LOGBRUSH LOHATCHBRUSH LOFONT LNX LNY X1 Y1 LNWIDTH LNHEIGHT LNMARGIN LNTOTAL LNLEGENDWIDTH LNTYPE THISFORM OPTTYPE VALUE SALES NVALUE CLS SYSTEM DRAWING THIS CLEAR COLOR FROMRGB SHPBACK	 BACKCOLOR
 OBORDERPEN PEN NEW	 SHPBORDER LNDETACHPIXELS LNSTART LNSWEEP LNANGLE WIDTH HEIGHT LDETACH LNDETACHANGLE	 DRAWSLICE OPTIONGROUP2 SPN3D
 LNBARWIDTH LNRECS	 LNBETWEEN SPNBETWEENBARS
 LNMAXVALUE LNBARHEIGHT DRAWBAR FONT LOBLACKBRUSH BRUSHES BLACK PREPAREBRUSHES OGFX FILLRECTANGLE
 OMAINBRUSH DRAWRECTANGLE
 DRAWSTRING CLEGEND�  T�  � �� �� T�  � �� �� ��C��  � �� ��C�
 oBorderPen�  � �� ��C�
 oMainBrush�  � �� ��C� o3DBrush�  � �� %�C�
��� � B�-�� � U  THIS TOP LEFT ZORDER ADDPROPERTY
 beforedraw,     �� setup	    ��1 ��"�� � 12� #�a� 2� R� RQ5� � �"���� � � A SA S � !� � �"���A S� A �!� � 1�r 1� ����A B �� � � �� �aa�A Q B A 2 ���� q A 2                       �     V       �    )   �
                        grid      Grid1      Form1     �ColumnCount = 4
Anchor = 6
AllowAddNew = .T.
Height = 180
Left = 0
Panel = 1
RecordSource = "sales"
TabIndex = 1
Top = 300
Width = 278
Name = "Grid1"
Column1.ControlSource = "sales.clegend"
Column1.Name = "Column1"
Column2.ControlSource = "sales.nvalue"
Column2.InputMask = "999,999.99"
Column2.Name = "Column2"
Column3.Alignment = 2
Column3.ColumnOrder = 4
Column3.ControlSource = "sales.ldetach"
Column3.CurrentControl = "Check1"
Column3.Width = 54
Column3.Sparse = .F.
Column3.Name = "Column4"
Column4.ColumnOrder = 3
Column4.ControlSource = "''"
Column4.Width = 31
Column4.Sparse = .F.
Column4.DynamicBackColor = '"sales.nColor"'
Column4.Name = "Column5"
      IPROCEDURE Init
This.Column5.DynamicBackColor = 'sales.nColor'
ENDPROC
      �Anchor = 12
Height = 25
KeyboardHighValue = 50
KeyboardLowValue = 0
Left = 288
SpinnerHighValue =  50.00
SpinnerLowValue =   0.00
TabIndex = 3
Top = 396
Visible = .T.
Width = 54
Value = 5
Name = "SpnBetweenBars"
      Form1      header      header      Header1      Form1.Grid1.Column1      5Alignment = 2
Caption = "Legend"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column1      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      OptType      optiongroup      optiongroup      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      Form1      Spn3D      spinner      spinner      Form1      Optiongroup2      header      header      Header1      Form1.Grid1.Column2      4Alignment = 2
Caption = "Value"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column2      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      �Anchor = 12
Height = 25
KeyboardHighValue = 50
KeyboardLowValue = 0
Left = 519
SpinnerHighValue =  50.00
SpinnerLowValue =   0.00
TabIndex = 3
Top = 420
Visible = .T.
Width = 48
Value = 20
Name = "Spn3D"
      header      header      Header1      Form1.Grid1.Column4      5Alignment = 2
Caption = "Detach"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column4      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      checkbox      checkbox      Check1      Form1.Grid1.Column4      lTop = 23
Left = 41
Height = 17
Width = 60
Alignment = 0
Centered = .T.
Caption = ""
Name = "Check1"
      lPROCEDURE Click
replace sales.lDetach WITH sales.lDetach
Thisform.Imgcanvas1.Draw()
NODEFAULT 
ENDPROC
      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      optiongroup      optiongroup      Form1      Label1      label      label      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      Form1      Form1      header      header      Header1      Form1.Grid1.Column5       Caption = ""
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column5      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      �PROCEDURE DblClick
lnColor = sales.nColor
replace sales.nColor WITH GETCOLOR(lnColor)
This.Refresh 
Thisform.Imgcanvas1.Draw()
ENDPROC
      �AutoSize = .T.
Anchor = 12
WordWrap = .T.
BackStyle = 0
Caption = "Gradient Level (-10  +10)"
Height = 17
Left = 384
Top = 374
Visible = .F.
Width = 135
TabIndex = 5
ForeColor = 255,0,0
Name = "Label1"
      Spinner1      spinner      spinner      Optiongroup1      optiongroup      optiongroup     �AutoSize = .T.
ButtonCount = 3
Anchor = 12
Value = 1
Height = 65
Left = 384
Top = 300
Width = 186
TabIndex = 2
Name = "Optiongroup1"
Option1.Caption = "Colored Solid Brush"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Style = 0
Option1.Top = 5
Option1.Width = 176
Option1.AutoSize = .F.
Option1.Name = "Option1"
Option2.Caption = "Colored Gradient Path Brush"
Option2.Height = 17
Option2.Left = 5
Option2.Style = 0
Option2.Top = 24
Option2.Width = 176
Option2.AutoSize = .F.
Option2.Name = "Option2"
Option3.Caption = "Monochrome (HatchBrush)"
Option3.Height = 17
Option3.Left = 5
Option3.Style = 0
Option3.Top = 43
Option3.Width = 176
Option3.AutoSize = .F.
Option3.Name = "Option3"
      �PROCEDURE InteractiveChange
IF This.Value = 2 && Gradient
	Thisform.Label1.Visible = .T.
	Thisform.Spinner1.Visible = .T.
ELSE
	Thisform.Label1.Visible = .F.
	Thisform.Spinner1.Visible = .F.
ENDIF

This.Parent.imgcanvas1.Draw()
ENDPROC
     �AutoSize = .F.
ButtonCount = 2
Anchor = 12
Value = 1
Height = 46
Left = 384
Top = 404
Width = 84
TabIndex = 2
Name = "Optiongroup2"
Option1.Caption = "3D"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Style = 0
Option1.Top = 5
Option1.Width = 176
Option1.AutoSize = .F.
Option1.Name = "Option1"
Option2.Caption = "Plain"
Option2.Height = 17
Option2.Left = 5
Option2.Style = 0
Option2.Top = 24
Option2.Width = 176
Option2.AutoSize = .F.
Option2.Name = "Option2"
      �Anchor = 12
Height = 25
KeyboardHighValue = 10
KeyboardLowValue = -10
Left = 519
SpinnerHighValue =  10.00
SpinnerLowValue = -10.00
TabIndex = 3
Top = 372
Visible = .F.
Width = 48
Value = 5
Name = "Spinner1"
     �AutoSize = .F.
ButtonCount = 2
Anchor = 12
Value = 1
Height = 48
Left = 288
Top = 300
Width = 84
TabIndex = 2
Name = "OptType"
Option1.Caption = "Pie Chart"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Style = 0
Option1.Top = 5
Option1.Width = 176
Option1.AutoSize = .F.
Option1.Name = "Option1"
Option2.Caption = "Bar Chart"
Option2.Height = 17
Option2.Left = 5
Option2.Style = 0
Option2.Top = 24
Option2.Width = 176
Option2.AutoSize = .F.
Option2.Name = "Option2"
     ����    �  �                        ߟ   %   �      
  �   �          �  U   ��  � � %�� � ��% �	 B��  �� � T� �� �d�� �� � � � T� �C�  �
���� T� �CC�  �
 �  ����� T� �CC�  �
  � ����� %�� � ��� �< B�C� ��� � � ��� � � ��� � �^�� ��- B�C� � � � � � � � � �^�� � U  TNRGB TNLEVEL LNRED LNGREEN LNBLUEA ��  � � � � � � ��C �   �  �  � � � �� �� Q� XFCPEN� T� �� �	 �
 �� �� Q� XFCGRAPHICS� T� �� �	 � �� �� Q� XFCBRUSH� T� �� �	 � �� �� Q� XFCBRUSH� T� �� �	 � �� %�� � � ����� T� �� � � �� T� �� � ��) ��C �  �   �  �  �  �  � � � ��) ��C �  �   �  �  �  �  � � � �� �� ���(�� ��3� T� �� ���) ��C �  �   �  �  �  �  � � � �� %�� �Z����0 ��C �  �   �  �  �  � �      �?� � �� �? ��C �  �   �  �  � � � �      �?�ffffff�?� � �� ��) ��C �  �   �  �  �  �  � � � �� �� � � T� �� ��  �� T� �� �� ��$ ��C �  �  �  � � � � � ��) ��C �  �   �  �  �  �  � � � �� �) ��C �  �   �  �  �  �  � � � ��) ��C �  �   �  �  �  �  � � � �� B� U  TNX TNY TNWIDTH TNHEIGHT TNSTART TNSWEEP THISFORM PREPAREBRUSHES LOPEN
 IMGCANVAS1
 OBORDERPEN LOGFX OGFX LOMAINBRUSH
 OMAINBRUSH	 LO3DBRUSH O3DBRUSH OPTIONGROUP2 VALUE
 LN3DHEIGHT SPN3D FILLPIE DRAWPIE N DRAWARC X Y DRAWLINEX ��  � � � � ��C �   �  �  � � � �� �� Q� XFCPEN� T� �� � � �� ��	 Q� XFCGRAPHICS� T�	 �� � �
 �� �� Q� XFCBRUSH� T� �� � � �� �� Q� XFCBRUSH� T� �� � � �� ��	 Q� XFCGRAPHICS� T�	 �� � �
 �� %�� � � ���� %�� � � ���a� �� Q� XFCHATCHBRUSH�) T� �CCO��� � �� � �� � � �� ��� �� Q� XFCSOLIDBRUSH�+ T� �CCC� � ���� � �� � �� � �� � T� �� � � �� � ����# T� ����C�  �  � ��  � ��* T� ����C�  � � � � ��  � ��& T� ����C�  � � � ��  � ��  T� ����C �   � ��  � �� ��C � � �	 �! �� ��C � � �	 �" ��. T� ����C�  � � � � � ��  � ��& T� ����C�  � � � ��  � �� ��C � � �	 �! �� ��C � � �	 �" �� �! ��C �  �   �  �  � �	 �# ��! ��C �  �   �  �  � �	 �$ �� B� U%  TNX TNY TNWIDTH TNHEIGHT THISFORM PREPAREBRUSHES LOPEN
 IMGCANVAS1
 OBORDERPEN LOGFX OGFX LOMAINBRUSH
 OMAINBRUSH	 LO3DBRUSH O3DBRUSH OPTIONGROUP2 VALUE OPTIONGROUP1	 DRAWING2D
 HATCHBRUSH NEW COLOR GRAY	 LIGHTGRAY
 SOLIDBRUSH FROMRGB CHANGECOLOR SALES NCOLOR
 LN3DHEIGHT SPN3D LAPOINTS POINTF FILLPOLYGON DRAWPOLYGON FILLRECTANGLE DRAWRECTANGLEA ��  � � � � � �� Q� IMAGE� T� �� � �� H�D ��� �� � �	 ���� �  T�
 �CC� � �� � �� � �� T� � ��
 �� �� � �	 ���z� �� Q� XFCCOLOR� T� �C� � �� � �� �� Q� XFCCOLOR�, T� �CC� � � � �	 �
� � �� � �� %�� � �	 �� � 
	���� �� Q� XFCGRAPHICSPATH� T� �C�� � � �� ��C �   �  �  � � � �� �� Q� XFCPATHGRADIENTBRUSH� T� �C � �� � � �� T� � �� �� T� � ����� �� T� � �� �� �v�! �� Q� XFCLINEARGRADIENTBRUSH�5 T� �CC �   �  �  � ��! �  �  � �� �  � ��# ��C�333333�?�      �?� �" �� T� � �� �� � �� � �	 �����, T� � �CCO��� �$ �� �% �� �# � �� � %�� � �	 ����, T� �& �CCO��� �' �� �( �� �# � �� �:�. T� �& �CCC� � ���� � �� � �� � �� � U)  TNX TNY TNWIDTH TNHEIGHT TLRECT LOCANVAS THISFORM
 IMGCANVAS1 OPTIONGROUP1 VALUE LOSOLIDBRUSH
 SOLIDBRUSH NEW COLOR FROMRGB SALES NCOLOR
 OMAINBRUSH LOCOLOR1 LOCOLOR2 CHANGECOLOR SPINNER1 OPTTYPE LOPATH	 DRAWING2D GRAPHICSPATH
 ADDELLIPSE LOPATHGRADBRUSH PATHGRADIENTBRUSH CENTERCOLOR SURROUNDCOLORS LOLINGRADBRUSH LINEARGRADIENTBRUSH	 RECTANGLE SETBLENDTRIANGULARSHAPE
 HATCHBRUSH BLACK WHITE O3DBRUSH GRAY	 LIGHTGRAY� G2�B h�� sales� � N������� � C���� � L� � I�1 r�� sales������� JAN��-��C� � ���^��1 r�� sales������� FEB��a��C� �����^��1 r�� sales���Z��� MAR��-��C��� ���^��2 r�� sales���J��� APR��-��C�����<�^��1 r�� sales������� MAY��a��C����� �^��1 r�� sales������� JUN��-��C� ���@�^��1 r�� sales������� JUL��-��C��� � �^��1 r�� sales���d��� AUG��a��C�������^�� F�  � #)� U  SALES NVALUE CLEGEND LDETACH NCOLOR changecolor,     ��	 drawsliceu    �� drawbar�    �� preparebrushes�
    �� Load�    ��1 � � A � 1���� �A 2 ��1b12121s2��s�A �A �� aaA�A ��B 2 1�1b12121c1tr��� ��A 2� 1�aQQ�aQQB B 2 q� qr2�2���Q���b� S2B s�A s�� �A 2 a "!q Q 2                       T        t  �     2   �  �  P   W   �  �  �   {   �  
  �    )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN196D45 885696660      /  F      ]                          �      �                       WINDOWS _1TN196D46 885721876�      �  �      �                                                           WINDOWS _1TN196D47 885697496d  u  �  �  �  �        �                                               COMMENT RESERVED                                t	                                                            	�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      gTop = 0
Left = 0
Height = 326
Width = 325
DoCreate = .T.
Caption = "Chess Board"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 328
Left = -1
Top = -1
Width = 327
Name = "Imgcanvas1"
     kPROCEDURE beforedraw
WITH _SCREEN.SYSTEM
	smallSquareSize = .Drawing.SizeF.New(0.125 * THIS.WIDTH, 0.125 * THIS.HEIGHT)
	sb = .Drawing.SolidBrush.New(.Drawing.COLOR.White)
	toggle = .F.
	FOR Y = 0 TO 7
		FOR x = 0 TO 7
			IF toggle
				sb.COLOR = .Drawing.COLOR.Black
			ELSE
				sb.COLOR = .Drawing.COLOR.White
			ENDIF
			rc = .Drawing.RectangleF.New(x * smallSquareSize.WIDTH,;
				Y * smallSquareSize.HEIGHT,;
				smallSquareSize.WIDTH,;
				smallSquareSize.HEIGHT)
			THIS.oGfx.FillRectangle(sb, rc)
			toggle = !toggle
		ENDFOR
		toggle = !toggle
	ENDFOR
	sb.Dispose()
ENDWITH


ENDPROC
     ����    �  �                        �[   %   @      ~     T          �  U  l ���9�  ��e�9 T� �C�      �?� � �      �?� � �� � � �� T� �C�� �
 � �� �	 � �� T� �-�� �� �� �(����T� �� �� �(����B� %�� ��� � T� �
 ��� �
 � �� �� � T� �
 ��� �
 � �� �5 T� �C� � � � � � � � � � �� � � �� ��C �  � � � � �� T� �� 
�� �� T� �� 
�� �� ��C� � �� �� U  SYSTEM SMALLSQUARESIZE DRAWING SIZEF NEW THIS WIDTH HEIGHT SB
 SOLIDBRUSH COLOR WHITE TOGGLE Y X BLACK RC
 RECTANGLEF OGFX FILLRECTANGLE DISPOSE
 beforedraw,     ��1 � ��� qq� q� qA T�� A � A � A 3                       `      )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 942183476�      �  �      �      �  �                  �                           WINDOWS _1U40L3TVH 890812748�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 890812748�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 890832544G      \  q  �  �      o  �                                               WINDOWS _1TP0L3VWK 890812748�      �  �  �  ?                                                           WINDOWS _1VQ1DO1S3 8908127482      %    
  �                                                           WINDOWS _1VQ1DO1S4 890812748}      p  b  U  C                                                           WINDOWS _1VQ1DO1S5 890812748H      ;  -     �                                                           WINDOWS _1TP0L3VWK 890812748�      �  �  �                                                             WINDOWS _1TP0L3VWK 890812748      �  �  �  m                                                           WINDOWS _1VQ1DO1S6 890812748`      S  E  8  �                                                           WINDOWS _1VQ1DO1S7 890812748�      �  �  �                                                             WINDOWS _1VQ1DO1S8 890812748
      �  �  �  n                                                           COMMENT RESERVED                                $                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 7
Left = 7
Height = 402
Width = 724
DoCreate = .T.
ShowTips = .T.
BorderStyle = 0
Caption = "Intensities of the CMYK color channels"
MaxButton = .F.
obmp = 0
oclrmatrix = 0
Name = "Form1"
     �PROCEDURE getcolorchannels

WITH _SCREEN.System.Drawing

* Create a bitmap from a file.
LOCAL loBmp as xfcBitmap
loBmp = .Bitmap.New(Thisform.TxtFile.Value)

* Create a 2nd Bitmap that will receive the transformed images
LOCAL loDestBmp as xfcBitmap
loDestBmp = .Bitmap.New(loBmp, loBmp.Width, loBmp.Height)

* Create an ImageAttributes object.
LOCAL loImgAttributes as xfcImageAttributes
loImgAttributes = .Imaging.ImageAttributes.New()

* Initialize the graphics object to be able to draw in the _screen
LOCAL loMyGraphics AS xfcGraphics
loMyGraphics = .Graphics.FromImage(loDestBmp)

* Create a Rectangle that will be used to draw the 4 images (all objects are the same size)
LOCAL loRect AS xfcRectangle
loRect = loDestBmp.GetBounds()

* Draw the image, showing the intensity of the CYAN channel.
loImgAttributes.SetOutputChannel(.Imaging.ColorChannelFlag.ColorChannelC, .Imaging.ColorAdjustType.Bitmap)
loMyGraphics.DrawImage(loBmp, loRect, loRect, .GraphicsUnit.Pixel, loImgAttributes)
loDestBmp.Save(Thisform.Image2, .imaging.ImageFormat.Bmp)

* Draw the image, showing the intensity of the MAGENTA channel.
loImgAttributes.SetOutputChannel(.Imaging.ColorChannelFlag.ColorChannelM, .Imaging.ColorAdjustType.Bitmap)
loMyGraphics.DrawImage(loBmp, loRect, loRect, .GraphicsUnit.Pixel, loImgAttributes)
loDestBmp.Save(Thisform.Image3, .imaging.ImageFormat.Bmp)

* Draw the image, showing the intensity of the YELLOW channel.
loImgAttributes.SetOutputChannel(.Imaging.ColorChannelFlag.ColorChannelY, .Imaging.ColorAdjustType.Bitmap)
loMyGraphics.DrawImage(loBmp, loRect, loRect, .GraphicsUnit.Pixel, loImgAttributes)
loDestBmp.Save(Thisform.Image4, .imaging.ImageFormat.Bmp)

* Draw the image, showing the intensity of the BLACK channel.
loImgAttributes.SetOutputChannel(.Imaging.ColorChannelFlag.ColorChannelK, .Imaging.ColorAdjustType.Bitmap)
loMyGraphics.DrawImage(loBmp, loRect, loRect, .GraphicsUnit.Pixel, loImgAttributes)
loDestBmp.Save(Thisform.Image5, .imaging.ImageFormat.Bmp)

ENDWITH
RETURN
ENDPROC
PROCEDURE Init
DO (LOCFILE("System.app"))

LOCAL lcFile
lcFile = LOCFILE("Runner.jpg")
Thisform.TxtFile.Value = lcFile
Thisform.Image1.Picture = lcFile

Thisform.GetColorChannels()
ENDPROC
     p���    W  W                        ��   %   �            �           �  U  r  ��  � T�  �C� JPG��� %�C�  ���- � B� � ��� ��k � T�� � ��  �� T�� � ��  �� ��C�� �� �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE GETCOLORCHANNELS Click,     ��1 q 1� A A � � A 1                       �       )   W                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      lAutoSize = .T.
Caption = "BLACK Channel"
Height = 17
Left = 540
Top = 192
Width = 91
Name = "Label5"
      Form1      Label5      label      label      nAutoSize = .T.
Caption = "YELLOW Channel"
Height = 17
Left = 348
Top = 192
Width = 101
Name = "Label4"
      Form1      Label4      label      label      nAutoSize = .T.
Caption = "MAGENTA Channel"
Height = 17
Left = 540
Top = 12
Width = 108
Name = "Label3"
      Form1      Label3      label      label      jAutoSize = .T.
Caption = "CYAN Channel"
Height = 17
Left = 348
Top = 12
Width = 84
Name = "Label2"
      Form1      Label2      label      label      kAutoSize = .T.
Caption = "ORIGINAL IMAGE"
Height = 17
Left = 12
Top = 12
Width = 97
Name = "Label1"
      Form1      Label1      label      label      \Anchor = 3
Stretch = 2
Height = 132
Left = 540
Top = 216
Width = 168
Name = "Image5"
      Form1      Image5      image      image      Form1      Image4      image      image      &obmp
oclrmatrix
*getcolorchannels 
      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 360
Width = 588
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 228
Left = 12
Top = 36
Width = 312
Name = "Image1"
      commandbutton      commandbutton      Command2      Form1      �Top = 360
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      �PROCEDURE Click
LOCAL lcFile
lcFile = GETPICT("JPG")
IF EMPTY(lcFile)
	RETURN
ENDIF

WITH Thisform
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
	.GetColorChannels()    
ENDWITH
ENDPROC
      \Anchor = 3
Stretch = 2
Height = 132
Left = 348
Top = 216
Width = 168
Name = "Image4"
      [Anchor = 3
Stretch = 2
Height = 132
Left = 540
Top = 36
Width = 168
Name = "Image3"
      Form1      Image3      image      image      [Anchor = 3
Stretch = 2
Height = 132
Left = 348
Top = 36
Width = 168
Name = "Image2"
      Form1      Image2      image      image     ����    �  �                        �X   %   �      f  "   "          �  U  � ���9�  � ���� �� Q�	 XFCBITMAP� T� �C� � � �� � �� �� Q�	 XFCBITMAP�" T� �C � � �	 � �
 �� � �� �� Q� XFCIMAGEATTRIBUTES� T� �C�� � � �� �� Q� XFCGRAPHICS� T� �C � �� � �� �� Q� XFCRECTANGLE� T� �C� � ��! ��C�� � � �� � � � � ��$ ��C �  �  � �� �  � � � �� ��C� � �� � � � � ��! ��C�� � � �� � � � � ��$ ��C �  �  � �� �  � � � �� ��C� � �� � � � � ��! ��C�� � �  �� � � � � ��$ ��C �  �  � �� �  � � � �� ��C� �! �� � � � � ��! ��C�� � �" �� � � � � ��$ ��C �  �  � �� �  � � � �� ��C� �# �� � � � � �� �� B� U$  SYSTEM DRAWING LOBMP BITMAP NEW THISFORM TXTFILE VALUE	 LODESTBMP WIDTH HEIGHT LOIMGATTRIBUTES IMAGING IMAGEATTRIBUTES LOMYGRAPHICS GRAPHICS	 FROMIMAGE LORECT	 GETBOUNDS SETOUTPUTCHANNEL COLORCHANNELFLAG COLORCHANNELC COLORADJUSTTYPE	 DRAWIMAGE GRAPHICSUNIT PIXEL SAVE IMAGE2 IMAGEFORMAT BMP COLORCHANNELM IMAGE3 COLORCHANNELY IMAGE4 COLORCHANNELK IMAGE5n  �C�
 System.app��� ��  � T�  �C�
 Runner.jpg��� T� � � ��  �� T� � � ��  �� ��C� � �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE GETCOLORCHANNELS getcolorchannels,     �� InitC    ��1 "C�C!�QcasA�A�A�A�B A 2 qr �11� 1                                 �  0    )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 924915336�      �  �      �      l  e9                  �                           WINDOWS _1TZ0QGKPH 924915267-  >  \  i  {  �        P!                                               WINDOWS _1U40L3TVH 890049860�      �  �                                                                WINDOWS _1U40LO0FY 889916481�      �  �  �        e  �1                                               WINDOWS _1U40NTQI6 898872026r&      �&  �&  �&  �&                                                           WINDOWS _1V81F5AU2 924915336-'      B'  W'  g'  '      �'  r                                                WINDOWS _1TP0L3VWK 889783210)      +)  8)  F)  ^)                                                           WINDOWS _1VA0OJPIR 890049860�)      �)  �)  �)  �)      O*  �                                               WINDOWS _1TP0L3VWL 8900498609+      F+  S+  a+  y+                                                           WINDOWS _1TP0L3VWK 889783210�+      �+  ,  ,  ),      q,  +                                               WINDOWS _1TP0L3VWK 890049860{-      �-  �-  �-  �-      '.  I                                               WINDOWS _1VB011PW4 889783210F/      S/  `/  n/  �/      �/  v                                               WINDOWS _1VB011PW5 889783210�0      �0  1  c-  1      W1  �                                               WINDOWS _1VB011PW6 890049860T-      E-  5-  -  0      �,  l                                               WINDOWS _1VB028DUC 890049860�,      �,  )  !+  �*      ~*  �                                               WINDOWS _1TP0L3VWK 898872026�(      �(  �(  �(  e.      R(  {                                               WINDOWS _1V91FF99H 898872073=(      ]&  �  �  �7      �%                                                 COMMENT RESERVED                                Y                                                            >                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     iTop = 25
Left = 34
Height = 348
Width = 516
DoCreate = .T.
ShowTips = .T.
Caption = "Remapping Colors using SetColorKey"
MinHeight = 320
MinWidth = 430
obmp = 0
wbmp = 0
hbmp = 0
_memberdata =      381<VFPData><memberdata name="changecolors" type="method" display="ChangeColors" favorites="False"/><memberdata name="calculateminmax" type="method" display="CalculateMinMax" favorites="False"/><memberdata name="calculaterangeofcolors" type="method" display="CalculateRangeofColors" favorites="False"/><memberdata name="processimage" type="method" display="ProcessImage"/></VFPData>

Name = "Form1"
     �PROCEDURE changecolors
LPARAMETERS tnRGB, tnLevel

IF tnLevel = 0
	RETURN tnRGB
ENDIF 

tnLevel = tnLevel / 100

LOCAL lnRed, lnGreen, lnBlue
lnRed   = BITAND(tnRGB, 0x000000FF)
lnGreen = BITRSHIFT(BITAND(tnRGB, 0x0000FF00), 8)
lnBlue  = BITRSHIFT(BITAND(tnRGB, 0x00FF0000), 16)

IF tnLevel > 0
	RETURN RGB( ;
		lnRed   + ((255 - lnRed)   * tnLevel) , ;
		lnGreen + ((255 - lnGreen) * tnLevel) , ;
		lnBlue  + ((255 - lnBlue)  * tnLevel) )
ELSE 
	RETURN RGB( ;
		lnRed   + (lnRed   * tnLevel) , ;
		lnGreen + (lnGreen * tnLevel) , ;
		lnBlue  + (lnBlue  * tnLevel) )
ENDIF 
ENDPROC
PROCEDURE calculaterangeofcolors
WITH Thisform.Container1
	lnRGBClr = .Text1.BackColor
	.ShpMin.BackColor = Thisform.ChangeColors(lnRGBClr, - .Spinner1.Value)
	.ShpMax.BackColor = Thisform.ChangeColors(lnRGBClr, .Spinner1.Value)
ENDWITH
ENDPROC
PROCEDURE processimage
LPARAMETERS tcFile
tcFile = LOCFILE(tcFile)
WITH Thisform
	.txtFile.Value = tcFile
	.Image1.Picture = tcFile
	.obmp = _Screen.System.Drawing.Bitmap.FromFile(tcFile)
ENDWITH

Thisform.IMGCANVAS1.Draw()
ENDPROC
PROCEDURE Init
Thisform.Processimage("Cebolinha.png")
ENDPROC
     o���    V  V                        �   %   �       �      �           �  U    T�Y��  � �� U  THIS NORIGINALTOOLTIPTIMEE ' ��C� nOriginalToolTipTime� �  � �� T�  � ��Y�� T�Y�� �� U  THIS ADDPROPERTY NORIGINALTOOLTIPTIME Destroy,     �� Init^     ��1 � 2 q� � 1                       >         Y   �       )   V                       ���    �   �                         �f   %   �       �      �           �  U  8  T�  �C��� %�C�  ���  � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A 1                       d       )   �                         ����    �   �                         d�   %   c       x      r           �  U    ��C�  � � � �� U  THIS PARENT SHAPE2 CLICK Click,     ��1 11                       +       )   �                         ����    �   �                            %   b       �      }           �  U    ��C�  � �� U  THISFORM CALCULATERANGEOFCOLORS InteractiveChange,     ��1 � 2                       @       )   �                         BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      �obmp
wbmp
hbmp
_memberdata XML Metadata for customizable properties
*changecolors 
*calculaterangeofcolors 
*processimage 
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      �Anchor = 105
Stretch = 0
Height = 180
Left = 264
Top = 12
Width = 240
smoothingmode = 3
interpolationmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

LOCAL loAttr AS xfcImageAttributes
LOCAL loColorMap as xfcColorMap
LOCAL loOldColor as xfcColor
LOCAL loNewColor as xfcColor

WITH _SCREEN.System.Drawing
	loOldColorMin = .Color.FromRgb(Thisform.Container1.ShpMin.BackColor)
	loOldColorMax = .Color.FromRgb(Thisform.Container1.ShpMax.BackColor)

	loNewColor = .Color.FromRgb(Thisform.Container1.Shape2.BackColor)
	This.Clear(loNewColor)

	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorKey(loOldColorMin, loOldColorMax)
	
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle, Thisform.oBmp.GetBounds(), .GraphicsUnit.Pixel, loAttr) 
ENDWITH

RETURN
ENDPROC
PROCEDURE afterdraw
Thisform.oBmp = This.oBmp.Clone()
Thisform.wBmp = Thisform.oBmp.Width
Thisform.hBmp = Thisform.oBmp.Height
Thisform.Image1.PictureVal = This.PictureVal

ENDPROC
      ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         ����    �   �                         d�   %   c       x      r           �  U    ��C�  � � � �� U  THIS PARENT SHAPE2 CLICK Click,     ��1 11                       +       )   �                         ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         ����    �   �                         7   %   :       N      H           �  U  
  B�-�� U   When,     ��1 q 2                              )   �                         Form1      Command1      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 14
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      \Anchor = 195
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
     PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmp) <> "O"
	RETURN
ENDIF 

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmp / This.Width
YRatio = Thisform.hBmp / This.Height

WITH _SCREEN.System.Drawing
	LOCAL loBitmap as xfcBitmap
	loBitmap = Thisform.oBmp

	LOCAL loColor as xfcColor
	loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
	lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

	Thisform.Container1.Text1.BackColor = lnRGBClr
ENDWITH

ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmp) <> "O"
	RETURN
ENDIF 

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmp / This.Width
YRatio = Thisform.hBmp / This.Height

LOCAL loBitmap as xfcBitmap
loBitmap = Thisform.oBmp

LOCAL loColor as xfcColor
loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

WITH Thisform.Container1
	.Text1.BackColor = lnRGBClr
	.Shape1.BackColor = lnRGBClr

	Thisform.CalculateRangeofColors()
ENDWITH
ENDPROC
PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
Thisform.Container1.Text1.BackColor = Thisform.Container1.Shape1.BackColor 
ENDPROC
      ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Click,     ��1 1                       +       )   �                        -���                              ��   %   d      �     �          �  U  Y %�C�  � � ��� � B� � �� Q� XFCIMAGEATTRIBUTES� �� Q� XFCCOLORMAP� �� Q� XFCCOLOR� �� Q� XFCCOLOR� ���9� � ��N� T�	 �C�  � � � ��
 � �� T� �C�  � � � ��
 � �� T� �C�  � � � ��
 � �� ��C � � � �� T� �C�� � � �� ��C �	  � � � ��1 ��C�  � � � C�  � � �� �  � � � � �� �� B� U  THISFORM TXTFILE VALUE LOATTR
 LOCOLORMAP
 LOOLDCOLOR
 LONEWCOLOR SYSTEM DRAWING LOOLDCOLORMIN COLOR FROMRGB
 CONTAINER1 SHPMIN	 BACKCOLOR LOOLDCOLORMAX SHPMAX SHAPE2 THIS CLEAR IMAGING IMAGEATTRIBUTES NEW SETCOLORKEY OGFX	 DRAWIMAGE OBMP	 RECTANGLE	 GETBOUNDS GRAPHICSUNIT PIXEL\  T�  � �C� � � �� T�  � ��  � � �� T�  � ��  � � �� T�  � �	 �� �	 �� U
  THISFORM OBMP THIS CLONE WBMP WIDTH HBMP HEIGHT IMAGE1
 PICTUREVAL
 beforedraw,     ��	 afterdraw�    ��1 QA A �a11"���RQA B 2 qaaa2                       �        �  u      )                           �PROCEDURE Destroy
_TOOLTIPTIMEOUT = This.nOriginalToolTipTime
ENDPROC
PROCEDURE Init
This.AddProperty("nOriginalToolTipTime",0)
This.nOriginalToolTipTime = _TOOLTIPTIMEOUT
_TOOLTIPTIMEOUT = 0
ENDPROC
      commandbutton      	container      	container      
Container1      Form1      rAnchor = 6
Top = 240
Left = 12
Width = 408
Height = 96
SpecialEffect = 0
TabIndex = 3
Name = "Container1"
      commandbutton      commandbutton      Command7      Form1.Container1      xTop = 60
Left = 300
Height = 25
Width = 98
Anchor = 12
Caption = "Change Colors"
TabIndex = 2
Name = "Command7"
      6PROCEDURE Click
Thisform.ImgCanvas1.Draw()
ENDPROC
      commandbutton      oPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile)
ENDPROC
      Form1      Command2      commandbutton      commandbutton      Label3      shape      shape      Shape1      Form1.Container1      ?Top = 24
Left = 12
Height = 60
Width = 60
Name = "Shape1"
      textbox      textbox      Text1      Form1.Container1      _Height = 37
Left = 24
SpecialEffect = 1
TabIndex = 3
Top = 36
Width = 36
Name = "Text1"
      'PROCEDURE When
RETURN .F.

ENDPROC
      6PROCEDURE Click
This.Parent.Shape2.Click()
ENDPROC
      ]Caption = "%"
Height = 17
Left = 173
Top = 24
Width = 12
TabIndex = 6
Name = "Label3"
      Form1.Container1      label      label      Label1      Form1.Container1      hCaption = "Original Color"
Height = 17
Left = 12
Top = 4
Width = 84
TabIndex = 4
Name = "Label1"
      shape      shape      Shape2      Form1.Container1      @Top = 24
Left = 216
Height = 60
Width = 60
Name = "Shape2"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
      label      label      KPROCEDURE InteractiveChange
Thisform.CalculateRangeofColors()

ENDPROC
      Form1.Container1      Spinner1      spinner      spinner      Form1.Container1      label      label      Label2      Form1.Container1      dCaption = "New Color"
Height = 17
Left = 216
Top = 4
Width = 84
TabIndex = 5
Name = "Label2"
      6PROCEDURE Click
This.Parent.Shape2.Click()
ENDPROC
      �Top = 204
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      shape      shape      shpMin      Form1.Container1      ?Top = 24
Left = 84
Height = 24
Width = 24
Name = "shpMin"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
      �Height = 24
Increment =   1.00
KeyboardHighValue = 100
KeyboardLowValue = 0
Left = 120
SpinnerHighValue = 100.00
SpinnerLowValue =   0.00
TabIndex = 1
Top = 24
Width = 50
Value = 10
Name = "Spinner1"
      shape      shape      shpMax      ?Top = 60
Left = 84
Height = 24
Width = 24
Name = "shpMax"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
     ����    �  �                        �   %   �      v  (   &          �  U  - ��  � � � � %�C� � ��� O��/ � B� � T� �� � � �� T�	 �� � �
 �� T� �� � � � �� T� �� � � � �� ���9� � ��&� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � �	 � � � �� T� �C� � � � � � �^�� T� � � � �� �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMP X1 THIS LEFT Y1 TOP XRATIO WBMP WIDTH YRATIO HBMP HEIGHT SYSTEM DRAWING LOBITMAP LOCOLOR GETPIXEL LNRGBCLR R G B
 CONTAINER1 TEXT1	 BACKCOLORD ��  � � � � %�C� � ��� O��/ � B� � T� �� � � �� T�	 �� � �
 �� T� �� � � � �� T� �� � � � �� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � �	 � � � �� T� �C� � � � � � �^�� ��� � ��=� T�� � �� �� T�� � �� �� ��C� � �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMP X1 THIS LEFT Y1 TOP XRATIO WBMP WIDTH YRATIO HBMP HEIGHT LOBITMAP LOCOLOR GETPIXEL LNRGBCLR R G B
 CONTAINER1 TEXT1	 BACKCOLOR SHAPE1 CALCULATERANGEOFCOLORS5  ��  � � � � T� � � � �� � � � �� U	  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM
 CONTAINER1 TEXT1	 BACKCOLOR SHAPE1	 MouseMove,     ��	 MouseDown3    ��
 MouseLeave`    ��1 1�A A BArq"A2��bA 3 1�A A BArqB2��� A 2 1�1                               6  _     %   �  �  5    )   �                       �Top = 299
Left = 480
Height = 25
Width = 26
Anchor = 12
Picture = (home() + "/samples/solution/bts.bmp")
Caption = ""
TabIndex = 4
ToolTipText = 'Select an image; Go with your mouse over the left picture, and click in any color; Click "NewColor", select the color that will substitute the original; The spinner determines the color range to apply transformation; Click "Change Colors"'
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
     ����    �  �                        ��   %   l        !   �          �  U   ��  � � %�� � ��% �	 B��  �� � T� �� �d�� �� � � � T� �C�  �
���� T� �CC�  �
 �  ����� T� �CC�  �
  � ����� %�� � ��� �< B�C� ��� � � ��� � � ��� � �^�� ��- B�C� � � � � � � � � �^�� � U  TNRGB TNLEVEL LNRED LNGREEN LNBLUEi  ���  � ��b � T� ��� � ��! T�� � �C � �� � c�  � ��  T��	 � �C � �� � �  � �� �� U
  THISFORM
 CONTAINER1 LNRGBCLR TEXT1	 BACKCOLOR SHPMIN CHANGECOLORS SPINNER1 VALUE SHPMAX{  ��  � T�  �C�  ��� ��� ��d � T�� � ��  �� T�� � ��  �� T�� �C �  �9� � �	 �
 �� �� ��C� � � �� U  TCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP FROMFILE
 IMGCANVAS1 DRAW   ��C� Cebolinha.png�  � �� U  THISFORM PROCESSIMAGE changecolors,     �� calculaterangeofcolorsu    �� processimageC    �� Init0    ��1 � � A � 1���� �A 2 A 2 q � �A 2 �1                       U        �  Q        t  D  "      _  �  -    )   �                  0	(   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923478953�      �  �      �      �  �                  ,"                           WINDOWS _1TZ0QGKPH 898871144k"  |"  �"  �"  �"  �"      #  ��                                               WINDOWS _1U40L3TVH 898871144�&      �&  �&  �&  '                                                           WINDOWS _1U40LO0FY 898871144�'      �'  �'  (  (                                                           WINDOWS _1U40NTQI6 898871144d(      u(  �(  �(  �(                                                           WINDOWS _1V902LNXR 890050034.)      ;)  H)  V)  n)                                                           WINDOWS _1V902LNXS 890050034�)       *  *  *  3*                                                           WINDOWS _1V902LNXT 890050034�*      �*  �*  �*  �*                                                           WINDOWS _1V902LNXU 890050034n+      {+  �+  �+  �+                                                           WINDOWS _1V902LNXV 890050034',      4,  A,  O,  g,                                                           WINDOWS _1V902LNXW 890050034�,      �,  -  -  /-                                                           WINDOWS _1V902LNXX 890050034�-      �-  �-  �-  �-                                                           WINDOWS _1V902LNXY 890050034m.      z.  �.  �.  �.                                                           WINDOWS _1V902LNXZ 8900500345/      B/  O/  ]/  u/                                                           WINDOWS _1V902LNY0 890050034�/      0   0  -0  E0      �0  C>  �2  �<                                       WINDOWS _1V902LNY1 890050034�<      �<  =  =  (=      ~=  _1  �?  �I                                       WINDOWS _1V902LNY2 890050034�I      �I  �I  �I  
J      ]J  �$  \L  dV                                       WINDOWS _1V902LNY3 890050034�V      �V  �V  �V  �V                                                           WINDOWS _1V902LNY4 890050034gW      tW  �W  �W  �W                                                           WINDOWS _1V902LNY5 8900500347X      DX  QX  _X  wX                                                           WINDOWS _1V902LNY6 890050034Y      Y  Y  2Y  JY                                                           WINDOWS _1V902LNY7 890050034�Y      �Y  �Y  �Y  
Z                                                           WINDOWS _1TP0L3VWK 890050034�Z      �Z  �Z  �Z  �Z                                                           WINDOWS _1V902LNY9 890050034I[      [[  m[  ~[  �[      �[     ^  	h                                       WINDOWS _1V902LNYA 890050034?h      Qh  ch  vh  �h      �h  �  �j  �t                                       WINDOWS _1V902LNYB 890050034.u      @u  Ru  eu  }u      �u  �  �w  �                                       WINDOWS _1TP0L3VWK 890050034�      )�  ;�  H�  `�      ��  A  ��                                         WINDOWS _1TP0L3VWL 890050034��      �  �  !�  9�                                                           WINDOWS _1TZ0QGKPH 890050034      Ϗ  ܏  �  �                                                           WINDOWS _1V903R0QH 890050034x�      ��  ��  ��  ��      �     ��  _�                                       WINDOWS _1V903R0QJ 890050034R�      E�  7�  �  ��                                                           WINDOWS _1V903R0QK 890050034��      �j  z�  �j  cw                                                           WINDOWS _1V903R0QL 890050034�j      �j  �]  �j  9j      �v  �  �  �]                                       WINDOWS _1V903R0QM 890050034�]      �]  �]  DL  �i                                                           WINDOWS _1V903R0QN 8900500347L      �&  "  L  �K                                                           WINDOWS _1TP0L3VWK 898871144"      �!  �!  �!  �\      "K  �                                               WINDOWS _1V9047CJU 898871144�!      �!  �!  �!  �%      ��  �                                               COMMENT RESERVED                                E!                                                            �V                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Height = 433
Width = 781
ShowWindow = 2
DoCreate = .T.
AutoCenter = .T.
BorderStyle = 1
Caption = "Advanced Image transformations using Multiple Color Matrices"
MaxButton = .F.
MinButton = .F.
obmp = 0
oclrmatrix = 0
Name = "Form1"
     �PROCEDURE createcolormatrix
LOCAL loCMBright AS xfcColorMatrix
LOCAL loCMContrast AS xfcColorMatrix
LOCAL loCMSaturation AS xfcColorMatrix
LOCAL loCMColors AS xfcColorMatrix
LOCAL loCMHue1 AS xfcColorMatrix
LOCAL loCMHue2 AS xfcColorMatrix
LOCAL loCMHue3 AS xfcColorMatrix
LOCAL loNewMatrix AS xfcColorMatrix

WITH Thisform.Container1

*!*	Brightness
LOCAL B
B = .oBrightness.OBJECT.Value / 100
loCMBright = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 1, 0, 0, 0, 0, ;
	 0, 1, 0, 0, 0, ;
	 0, 0, 1, 0, 0, ;
     0, 0, 0, 1, 0, ; 
	 B, B, B, 0, 1)

*!*	Contrast
LOCAL C
C = .oContrast.OBJECT.Value / 100
loCMContrast = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 C, 0, 0, 0, 0, ;
	 0, C, 0, 0, 0, ;
	 0, 0, C, 0, 0, ;
     0, 0, 0, 1, 0, ; 
	 0.01, 0.01, 0.01, 0, 1)

*!*	Saturation
LOCAL S, SCompl, SR, SG, SB
S = .oSaturation.OBJECT.Value / 100
SCompl = 1 - S
SR = 0.3086 * SCompl
SG = 0.6094 * SCompl
SB = 0.0820 * SCompl
loCMSaturation = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 (SR+S), SR    , SR    , 0, 0, ;
	 SG    , (SG+S), SG    , 0, 0, ;
	 SB    , SB    , (SB+S), 0, 0, ;
     0     , 0     , 0     , 1, 0, ; 
	 0     , 0     , 0     , 0, 1)

*!*	Colors
LOCAL lnRed, lnGreen, lnBlue
lnRed   = .oRed.OBJECT.Value / 50
lnGreen = .oGreen.OBJECT.Value / 50
lnBlue  = .oBlue.OBJECT.Value / 50
loCMColors =  _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 lnRed, 0      , 0     , 0, 0, ;
	 0    , lnGreen, 0     , 0, 0, ;
	 0    , 0      , lnBlue, 0, 0, ;
     0    , 0      , 0     , 1, 0, ; 
	 0    , 0      , 0     , 0, 1)
	 
LOCAL lnPI, H1, H2, H3
lnPI = ATAN(1) * 4

*!* Hue1
H1 = .oHue1.OBJECT.Value * (lnPI / 180)
loCMHue1 = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	Cos(H1) , Sin(H1), 0, 0, 0, ;
	-Sin(H1), Cos(H1), 0, 0, 0, ;
	 0      , 0      , 1, 0, 0, ;
     0      , 0      , 0, 1, 0, ;
	 0      , 0      , 0, 0, 1)

*!* Hue2
H2 = .oHue2.OBJECT.Value * (lnPI / 180)	 
loCMHue2 = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 1     , 0     , 0     , 0, 0, ;
	 0     , Cos(H2), Sin(H2), 0, 0, ;
	 0     ,-Sin(H2), Cos(H2), 0, 0, ;
     0     , 0     , 0     , 1, 0, ; 
	 0     , 0     , 0     , 0, 1)

*!* Hue3
H3 = .oHue3.OBJECT.Value * (lnPI / 180)	 
loCMHue3 = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	Cos(H3) , 0     , -Sin(H3), 0, 0, ;
	 0     , 1     , 0      , 0, 0, ; 
	Sin(H3) , 0     , Cos(H3) , 0, 0, ;
     0     , 0     , 0      , 1, 0, ; 
	 0     , 0     , 0      , 0, 1)
	 

*!*	We need to create a new ColorMatrix containing all informations from all matrices
*!*	So we multiply them
loNewMatrix = loCMBright.Multiply(loCMBright, loCMContrast)
loNewMatrix = loNewMatrix.Multiply(loNewMatrix, loCMSaturation)
loNewMatrix = loNewMatrix.Multiply(loNewMatrix, loCMColors)
loNewMatrix = loNewMatrix.Multiply(loNewMatrix, loCMHue1)
loNewMatrix = loNewMatrix.Multiply(loNewMatrix, loCMHue2)
loNewMatrix = loNewMatrix.Multiply(loNewMatrix, loCMHue3)
Thisform.oClrMatrix = loNewMatrix

*!* Update Captions of slidebars
.lblBrightness.Caption = TRANSFORM(B,"99.99")
.lblContrast.Caption = TRANSFORM(C,"99.99")
.lblSaturation.Caption = TRANSFORM(S,"99.99")
.lblRed.Caption = TRANSFORM(.oRed.OBJECT.Value)
.lblGreen.Caption = TRANSFORM(.oGreen.OBJECT.Value)
.lblBlue.Caption = TRANSFORM(.oBlue.OBJECT.Value)
.lblHue1.Caption = TRANSFORM(.oHue1.OBJECT.Value)
.lblHue2.Caption = TRANSFORM(.oHue2.OBJECT.Value)
.lblHue3.Caption = TRANSFORM(.oHue3.OBJECT.Value)

ENDWITH
ENDPROC
PROCEDURE processimage
LPARAMETERS tcFile
tcFile = LOCFILE(tcFile)

WITH Thisform

	.Container1.Visible = .T.
	.Container1.oGreen.SetFocus()
	.Container1.oBlue.SetFocus()
	.Container1.oSaturation.SetFocus()
	.Container1.oBrightness.SetFocus()
	.Container1.oContrast.SetFocus()
	.Container1.oHue1.SetFocus()
	.Container1.oHue2.SetFocus()
	.Container1.oHue3.SetFocus()
	.Container1.oRed.SetFocus()

	.TxtFile.Visible = .T.
	.TxtFile.Value = tcFile
	.CmdReset.Visible = .T.
	.Image1.Picture = tcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage("Desert.jpg")
ENDPROC
     ����    �  �                        ~R   %         P               �  U  � ���  � ��r� T�� � � ��d�� T�� � � ��d�� T�� � � �� �� T�� � � ��2�� T�� � � ��2�� T��	 � � ��2�� T��
 � � �� �� T�� � � �� �� T�� � � �� �� T�� � �� 1.00�� T�� � �� 1.00�� T�� � �� 0.00�� T�� � �� 50�� T�� � �� 50�� T�� � �� 50�� T�� � �� 0�� T�� � �� 0�� T�� � �� 0�� �� ���  ���� T�� �C�9� � � � � �� ��C�� � �� �� U  THISFORM
 CONTAINER1	 OCONTRAST OBJECT VALUE OSATURATION OBRIGHTNESS ORED OGREEN OBLUE OHUE1 OHUE2 OHUE3 LBLCONTRAST CAPTION LBLSATURATION LBLBRIGHTNESS LBLRED LBLGREEN LBLBLUE LBLHUE1 LBLHUE2 LBLHUE3
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 BAABAABAARQQ211"!!A � �� A 1                       �      )   �                       ���    �   �                         ��   %   �       �      �           �  U  ?  ��  � T�  �C��� %�C�  ���' � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 q � � A A 1                       t       )   �                        9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                            BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      Form1      cmdReset      commandbutton      commandbutton      Form1      Command2      commandbutton      commandbutton      lblHue3      7obmp
oclrmatrix
*createcolormatrix 
*processimage 
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      FHeight = 280
Left = 396
Top = 10
Width = 375
Name = "Imgcanvas1"
     {PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

This.Clear

LOCAL loAttr AS xfcImageAttributes
WITH _SCREEN.System.Drawing
	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorMatrix(Thisform.oClrMatrix)
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle, Thisform.oBmp.GetBounds(), .GraphicsUnit.Pixel , loAttr)
ENDWITH

RETURN
ENDPROC
     9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                            �Top = 298
Left = 120
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "Graphics\Bitmaps\Outline\Nomask\waste.bmp")
Caption = "Restart"
TabIndex = 2
Visible = .F.
PicturePosition = 1
PictureSpacing = 1
Name = "cmdReset"
      label      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 228
TabIndex = 3
Top = 298
Visible = .F.
Width = 540
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      NStretch = 2
Height = 280
Left = 12
Top = 10
Width = 375
Name = "Image1"
      	container      	container      
Container1      Form1      �Anchor = 6
Top = 331
Left = 12
Width = 756
Height = 92
SpecialEffect = 0
Visible = .F.
TabIndex = 4
Name = "Container1"
      label      label      Label4      Form1.Container1      }AutoSize = .T.
BackStyle = 0
Caption = "Red"
Height = 17
Left = 19
Top = 9
Width = 25
TabIndex = 10
Name = "Label4"
      label      label      lblRed      Form1.Container1      lBackStyle = 0
Caption = "0"
Height = 17
Left = 218
Top = 8
Width = 26
TabIndex = 11
Name = "lblRed"
      label      label      Label5      Form1.Container1      AutoSize = .T.
BackStyle = 0
Caption = "Green"
Height = 17
Left = 8
Top = 34
Width = 36
TabIndex = 12
Name = "Label5"
      label      label      lblGreen      Form1.Container1      oBackStyle = 0
Caption = "0"
Height = 17
Left = 218
Top = 33
Width = 26
TabIndex = 13
Name = "lblGreen"
      label      label      Label7      Form1.Container1      AutoSize = .T.
BackStyle = 0
Caption = "Blue"
Height = 17
Left = 17
Top = 61
Width = 27
TabIndex = 14
Name = "Label7"
      label      label      lblBlue      Form1.Container1      nBackStyle = 0
Caption = "0"
Height = 17
Left = 218
Top = 59
Width = 26
TabIndex = 15
Name = "lblBlue"
      label      label      Label6      Form1.Container1      �BackStyle = 1
Caption = ""
Height = 17
Left = 47
Top = 60
Width = 18
TabIndex = 16
BackColor = 0,0,255
Name = "Label6"
      label      label      Label8      Form1.Container1      �BackStyle = 1
Caption = ""
Height = 17
Left = 47
Top = 33
Width = 18
TabIndex = 17
BackColor = 0,255,0
Name = "Label8"
      label      label      Label9      Form1.Container1      BackStyle = 1
Caption = ""
Height = 17
Left = 47
Top = 8
Width = 18
TabIndex = 18
BackColor = 255,0,0
Name = "Label9"
      
olecontrol      
olecontrol      oBlue      Form1.Container1      MTop = 59
Left = 72
Height = 19
Width = 145
TabIndex = 3
Name = "oBlue"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
     9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   d   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   d      SelectRange    L       TickFrequency 	   I
   
      Value 	   I
    c 2           
   2   �ͫ   ��  1     ��� �3Pw��       2                                                                                                                                    .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      
olecontrol      
olecontrol      oGreen      Form1.Container1      NTop = 34
Left = 72
Height = 19
Width = 145
TabIndex = 2
Name = "oGreen"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
     9���                                �   %   �       �      �           �  U   
 ��  � � U  THIS CHANGE 
 ��  � � ��C�  � � �� U  THISFORM CREATECOLORMATRIX
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 � 2                       >         [   �       )                           
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   d   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   d      SelectRange    L       TickFrequency 	   I
   
      Value 	   I
    c             
   2   �ͫ   ��  1     ��� �3Pw��       2                                                                                                                                    .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      
olecontrol      
olecontrol      oRed      Form1.Container1      KTop = 9
Left = 72
Height = 19
Width = 145
TabIndex = 1
Name = "oRed"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      PROCEDURE Click
LOCAL lcFile
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

Thisform.ProcessImage(lcFile)
ENDPROC
      nBackStyle = 0
Caption = "0"
Height = 17
Left = 708
Top = 60
Width = 26
TabIndex = 30
Name = "lblHue3"
      Form1.Container1      label      Form1.Container1     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   d   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   d      SelectRange    L       TickFrequency 	   I
   
      Value 	   I
    c 2           
   2   �ͫ   ��  1     ��� �3Pw��       2                                                                                                                                    .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      label      label      Label18      Form1.Container1      �AutoSize = .T.
BackStyle = 0
Caption = "Contrast"
Height = 17
Left = 276
Top = 9
Width = 49
TabIndex = 22
Name = "Label18"
      label      label      Label19      Form1.Container1      �AutoSize = .T.
BackStyle = 0
Caption = "Saturation"
Height = 17
Left = 267
Top = 35
Width = 58
TabIndex = 23
Name = "Label19"
      label      label      Label3      Form1.Container1      �AutoSize = .T.
BackStyle = 0
Caption = "Brightness"
Height = 17
Left = 263
Top = 60
Width = 62
TabIndex = 24
Name = "Label3"
      label      label      lblContrast      Form1.Container1      qBackStyle = 0
Caption = "0"
Height = 17
Left = 475
Top = 8
Width = 26
TabIndex = 25
Name = "lblContrast"
      label      label      lblSaturation      Form1.Container1      tBackStyle = 0
Caption = "0"
Height = 17
Left = 475
Top = 34
Width = 26
TabIndex = 19
Name = "lblSaturation"
      label      label      lblBrightness      Form1.Container1      tBackStyle = 0
Caption = "0"
Height = 17
Left = 475
Top = 59
Width = 26
TabIndex = 27
Name = "lblBrightness"
      
olecontrol      
olecontrol      	oContrast      Form1.Container1      QTop = 9
Left = 329
Height = 19
Width = 145
TabIndex = 4
Name = "oContrast"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      �Top = 298
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      Label12      label      label      .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      oHue3     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   �  O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   �     Min 	   I
          SelectRange    L       TickFrequency 	   I
   2  c             2   d   �ͫ   x�  1     ��� �3Pw��            Value 	   I
   d                                                                                                               .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      
olecontrol      
olecontrol      oSaturation      Form1.Container1      TTop = 35
Left = 329
Height = 19
Width = 145
TabIndex = 5
Name = "oSaturation"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      �AutoSize = .T.
BackStyle = 0
Caption = "Hue 3"
Height = 17
Left = 528
Top = 60
Width = 35
TabIndex = 28
Name = "Label12"
      NTop = 60
Left = 561
Height = 19
Width = 145
TabIndex = 9
Name = "oHue3"
      Form1.Container1      
olecontrol      
olecontrol      Form1.Container1      label     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   �  O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   �     Min 	   I
          SelectRange    L       TickFrequency 	   I
   2  c d           2   d   �ͫ   (�  1     ��� �3Pw��            Value 	   I
   d                                                                                                               .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      
olecontrol      
olecontrol      oBrightness      Form1.Container1      TTop = 61
Left = 329
Height = 19
Width = 145
TabIndex = 6
Name = "oBrightness"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      nBackStyle = 0
Caption = "0"
Height = 17
Left = 708
Top = 34
Width = 26
TabIndex = 21
Name = "lblHue2"
     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��               ����d   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   d      Min 	   I
   ����   SelectRange    L       TickFrequency 	   I
     c                    �ͫ   О  1     ��� �3Pw��            Value 	   I
                                                                                                                   .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      
olecontrol      
olecontrol      oHue1      Form1.Container1      MTop = 9
Left = 561
Height = 19
Width = 145
TabIndex = 7
Name = "oHue1"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
      lblHue2      label      �AutoSize = .T.
BackStyle = 0
Caption = "Hue 2"
Height = 17
Left = 528
Top = 34
Width = 35
TabIndex = 20
Name = "Label2"
      Form1.Container1      Label2      label      label      .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      Form1.Container1      oHue2     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��               M����   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   �      Min 	   I
   M���   SelectRange    L       TickFrequency 	   I
   <  c             <       �ͫ   h�  1     ��� �3Pw��                                                                                                                                            .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      label      label      Label10      Form1.Container1      �AutoSize = .T.
BackStyle = 0
Caption = "Hue 1"
Height = 17
Left = 528
Top = 9
Width = 35
TabIndex = 29
Name = "Label10"
      label      label      lblHue1      Form1.Container1      mBackStyle = 0
Caption = "0"
Height = 17
Left = 708
Top = 9
Width = 26
TabIndex = 26
Name = "lblHue1"
      
olecontrol      
olecontrol      NTop = 34
Left = 561
Height = 19
Width = 145
TabIndex = 8
Name = "oHue2"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.CreateColorMatrix
Thisform.ImgCanvas1.Draw()

ENDPROC
     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��               M����   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   �      Min 	   I
   M���   SelectRange    L       TickFrequency 	   I
   <  c             <       �ͫ    �  1     ��� �3Pw��                                                                                                                                           7���                              _   %   �      �     �          �  U  �  %�C�  � � ��� � B� �
 �� � � �� Q� XFCIMAGEATTRIBUTES� ���9� � ��� � T� �C�� �	 �
 �� ��C�  � � � ��1 ��C�  � � � C�  � � �� �  � � � � �� �� B� U  THISFORM TXTFILE VALUE THIS CLEAR LOATTR SYSTEM DRAWING IMAGING IMAGEATTRIBUTES NEW SETCOLORMATRIX
 OCLRMATRIX OGFX	 DRAWIMAGE OBMP	 RECTANGLE	 GETBOUNDS GRAPHICSUNIT PIXEL
 beforedraw,     ��1 QA A � �!Q1A B 1                       p      )                          PROCEDURE Click
WITH Thisform.Container1

	.oContrast.OBJECT.Value   = 100
	.oSaturation.OBJECT.Value = 100
	.oBrightness.OBJECT.Value = 0

	.oRed.OBJECT.Value        = 50
	.oGreen.OBJECT.Value      = 50
	.oBlue.OBJECT.Value       = 50

	.oHue1.OBJECT.Value       = 0
	.oHue2.OBJECT.Value       = 0
	.oHue3.OBJECT.Value       = 0

	.lblContrast.Caption   = "1.00"
	.lblSaturation.Caption = "1.00"
	.lblBrightness.Caption = "0.00"

	.lblRed.Caption        = "50"
	.lblGreen.Caption      = "50"
	.lblBlue.Caption       = "50"

	.lblHue1.Caption      = "0"
	.lblHue2.Caption      = "0"
	.lblHue3.Caption      = "0"
ENDWITH 

WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               P@���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��               M����   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   �      Min 	   I
   M���   SelectRange    L       TickFrequency 	   I
   <  c             <       �ͫ   (�  1     ��� �3Pw��                                                                                                                                           ?���    &  &                        =   %   �      �  O             �  U  > ��  Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� �� Q� XFCCOLORMATRIX� ��� �	 ��7� ��
 � T�
 ��� � � �d��j T�  �C�� � � � � �� � � � � �� � � � � ��  �
  �
  �
 � ��9� � � � � �� �� � T� ��� � � �d��� T� �C � � � � � �  � � � � � �  � � � � � � �� �{�G�z�?�{�G�z�?�{�G�z�?� ��9� � � � � �� �� � � � � � T� ��� � � �d�� T� ��� �� T� ����6��?� �� T� ��9��m4��?� �� T� ��ˡE����?� ��| T� �C� �  �  � � �  � � �  � � �  �  � � � � � � � � �� � � � � ��9� � � � � �� �� � � � T� ��� � � �2�� T� ��� � � �2�� T� ���  � � �2��j T� �C � � � � � �  � � � � � �  � � � � � � �� � � � � ��9� � � � � �� ��! �" �# �$ � T�! �C��H��� T�" ���% � � �! ����t T� �CC�" �CC�" �D� � � C�" �DcC�" �C� � � � � �� � � � � �� � � � � ��9� � � � � �� T�# ���& � � �! ����t T� �C�� � � � � C�# �CC�# �D� � � C�# �DcC�# �C� � � � � �� � � � � ��9� � � � � �� T�$ ���' � � �! ����t T� �CC�$ �C� C�$ �Dc� � � �� � � C�$ �D� C�$ �C� � � � � �� � � � � ��9� � � � � �� T� �C �   � �  �( �� T� �C �  � � �( �� T� �C �  � � �( �� T� �C �  � � �( �� T� �C �  � � �( �� T� �C �  � � �( �� T� �) �� �� T��* �+ �C�
 � 99.99_�� T��, �+ �C� � 99.99_�� T��- �+ �C� � 99.99_�� T��. �+ �C�� � � _�� T��/ �+ �C�� � � _�� T��0 �+ �C��  � � _�� T��1 �+ �C��% � � _�� T��2 �+ �C��& � � _�� T��3 �+ �C��' � � _�� �� U4 
 LOCMBRIGHT LOCMCONTRAST LOCMSATURATION
 LOCMCOLORS LOCMHUE1 LOCMHUE2 LOCMHUE3 LONEWMATRIX THISFORM
 CONTAINER1 B OBRIGHTNESS OBJECT VALUE SYSTEM DRAWING IMAGING COLORMATRIX NEW C	 OCONTRAST S SCOMPL SR SG SB OSATURATION LNRED LNGREEN LNBLUE ORED OGREEN OBLUE LNPI H1 H2 H3 OHUE1 OHUE2 OHUE3 MULTIPLY
 OCLRMATRIX LBLBRIGHTNESS CAPTION LBLCONTRAST LBLSATURATION LBLRED LBLGREEN LBLBLUE LBLHUE1 LBLHUE2 LBLHUE3a ��  � T�  �C�  ��� ��� ��Z� T�� � �a�� ��C�� � � �� ��C�� � � �� ��C�� � � �� ��C�� � � �� ��C�� �	 � �� ��C�� �
 � �� ��C�� � � �� ��C�� � � �� ��C�� � � �� T�� � �a�� T�� � ��  �� T�� � �a�� T�� � ��  ��# T�� �C� � � �9� � � � �� T�� �C�9� � � � � �� ��C�� � �� �� U  TCFILE THISFORM
 CONTAINER1 VISIBLE OGREEN SETFOCUS OBLUE OSATURATION OBRIGHTNESS	 OCONTRAST OHUE1 OHUE2 OHUE3 ORED TXTFILE VALUE CMDRESET IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW
 OCLRMATRIX IMAGING COLORMATRIX
 IMGCANVAS1 DRAW& 	 ��C��� ��C�
 Desert.jpg�  � �� U  THISFORM PROCESSIMAGE createcolormatrix,     �� processimage6	    �� Init�    ��1 ��������s ��s �&s������ ����2A�F�F�F���������������B 2 q � � � � 1�� A 2 � �1                       �     6   	  �  q   L   �  �  �    )   &                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923478960�      �  �      �      �  �!                  �                           WINDOWS _1TZ0QGKPH 898870789�  �    "  4  A      �  �(                                               WINDOWS _1U40L3TVH 890049802�      �  �  �  �                                                           WINDOWS _1U40LO0FY 889491650�      �  �  �  �                                                           WINDOWS _1U40NTQI6 8988709926      G  X  j  w                                                           WINDOWS _1TP0L3VWK 890049802      &  ;  K  c      �  F$                                               WINDOWS _1V81F5ATY 890049802�      �  �  �  �      f  w                                               WINDOWS _1TP0L3VWK 890049802a      v  �  �  �      (  t                                               WINDOWS _1V81F5ATZ 890049802�      �  �  �        |                                                  WINDOWS _1V81F5AU0 890049802L      7  �            �                                               WINDOWS _1V81F5AU1 890049802q      \  �    R       �   6                                               WINDOWS _1V81F5AU2 890049802j      U  E  �  �#      �  �                                               WINDOWS _1TP0L3VWK 898852177�      �  �  t  �&      �'  F	                                               COMMENT RESERVED                                *                                                            +8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 7
Left = 7
Height = 337
Width = 516
DoCreate = .T.
Caption = "Image transformations using Color Matrices"
obmp = 0
oclrmatrix = 0
Name = "Form1"
     7PROCEDURE Init
DODEFAULT()

WITH Thisform
	lcFile = LOCFILE("VFPXLogoSmall.png")
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
     @���    '  '                        4f   %   �       �      �           �  U  ?  ���  ��8 � T�� �C�9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � �� A 1                       }       )   '                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      Form1      Command2      commandbutton      commandbutton      Form1.Container1      obmp
oclrmatrix
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      SAnchor = 15
Height = 180
Left = 264
Top = 12
Width = 240
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

This.Clear

LOCAL loAttr AS xfcImageAttributes
LOCAL loClrMatrix AS xfcColorMatrix

WITH _SCREEN.System.Drawing
	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorMatrix(Thisform.oClrMatrix)
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle, Thisform.oBmp.GetBounds(), .GraphicsUnit.Pixel, loAttr) 
ENDWITH

RETURN
ENDPROC
     ����    �  �                        m   %   j      �     y          �  U  �  ��  � T�  �C��� %�C�  ���' � B� � ��� ��� � T�� � ��  �� T�� � ��  ��# T�� �C� � � �9� � �	 �
 �� T�� �C�9� � � � �
 �� ��C�� � �� �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW
 OCLRMATRIX IMAGING COLORMATRIX
 IMGCANVAS1 DRAW Click,     ��1 q � � A A � 1�� A 1                       <      )   �                        Command7      commandbutton      commandbutton      Form1.Container1      Command6      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
      	container      	container      
Container1      Form1      �Anchor = 6
Top = 240
Left = 18
Width = 481
Height = 84
BackStyle = 1
BorderWidth = 1
SpecialEffect = 0
TabIndex = 3
Name = "Container1"
      commandbutton      commandbutton      Command1      Form1.Container1      uTop = 12
Left = 10
Height = 25
Width = 98
Anchor = 12
Caption = "GreyScale 1"
TabIndex = 1
Name = "Command1"
     NPROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ;
        0.0 , 0.0 , 0.0 , 1.0, 0.0, ; 
        0.0 , 0.0 , 0.0 , 0.0, 1.0)
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    u  u                        �   %         ,                �  U  �  ���  ��� �k T�� �C���� � � � � ���� � � � � ���� � � � � �� ���� ��9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � �� A 1                       �       )   u                        �PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
      commandbutton      commandbutton      Command5      commandbutton      commandbutton      Command2      Form1.Container1      vTop = 12
Left = 130
Height = 25
Width = 98
Anchor = 12
Caption = "GreyScale 2"
TabIndex = 2
Name = "Command2"
     PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 .299, .299, .299, 0, 0, ;
	 .587, .587, .587, 0, 0, ;
	 .114, .114, .114, 0, 0, ;
     0   ,    0,    0, 1, 0, ; 
	 0   ,    0,    0, 0, 1)
	 .imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    r  r                        �   %         )               �  U  �  ���  ��� �h T�� �C� � � � � � �� � � � � � � � � � � �� � � � � ��9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � �� A 1                       �       )   r                        Form1.Container1      commandbutton      commandbutton      commandbutton      commandbutton      Command3      Form1.Container1      mTop = 48
Left = 10
Height = 25
Width = 98
Anchor = 12
Caption = "Red"
TabIndex = 5
Name = "Command3"
      �PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 1, 0, 0, 0, 0, ;
	 0, 0, 0, 0, 0, ;
	 0, 0, 0, 0, 0, ;
     0, 0, 0, 1, 0, ; 
	 0, 0, 0, 0, 1)
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    r  r                        �   %         )               �  U  �  ���  ��� �h T�� �C� � � � � � � � � � � � �� � � � � �� � � � � ��9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � �� A 1                       �       )   r                        commandbutton      commandbutton      Command4      Form1.Container1      oTop = 48
Left = 250
Height = 25
Width = 98
Anchor = 12
Caption = "Blue"
TabIndex = 7
Name = "Command4"
      �PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 0, 0, 0, 0, 0, ;
	 0, 0, 0, 0, 0, ;
	 0, 0, 1, 0, 0, ;
     0, 0, 0, 1, 0, ; 
	 0, 0, 0, 0, 1)
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    r  r                        �   %         )               �  U  �  ���  ��� �h T�� �C�� � � � � � � � � � � � � � � � � �� � � � � ��9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � �� A 1                       �       )   r                        pTop = 48
Left = 130
Height = 25
Width = 98
Anchor = 12
Caption = "Green"
TabIndex = 6
Name = "Command5"
      �PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 0, 0, 0, 0, 0, ;
	 0, 1, 0, 0, 0, ;
	 0, 0, 0, 0, 0, ;
     0, 0, 0, 1, 0, ; 
	 0, 0, 0, 0, 1)
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    �  �                        ��   %   V      q     e          �  U  �  ���  ��� �� T�� �C��A`��"�?��A`��"�?��A`��"�?� � �bX9���?�bX9���?�bX9���?� � ��v��/�?��v��/�?��v��/�?� � � � � �� � � � � ��9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � � A 1                             )   �                        sTop = 12
Left = 250
Height = 25
Width = 98
Anchor = 12
Caption = "Negative"
TabIndex = 3
Name = "Command6"
      PROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
	 -1,  0,  0, 0, 0, ;
	 0 , -1,  0, 0, 0, ;
	 0 ,  0, -1, 0, 0, ;
     0 ,  0,  0, 1, 0, ; 
	 1 ,  1,  1, 0, 1) 
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ����    �  �                        ��   %   i      �     w          �  U  � 	 ��C��� ���  ��� �! T� �C� VFPXLogoSmall.png��� T�� � �� �� T�� � �� ��# T�� �C�  � � �9� � �	 �
 �� T�� �C�9� � � � �
 �� ��C�� � �� �� U  THISFORM LCFILE TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW
 OCLRMATRIX IMAGING COLORMATRIX
 IMGCANVAS1 DRAW Init,     ��1 � � 1�� A 1                       ,      )   �                        rTop = 12
Left = 370
Height = 25
Width = 98
Anchor = 12
Caption = "Restore"
TabIndex = 4
Name = "Command7"
     S���    :  :                        �   %   �      �     �          �  U  R ���  ��K�0T�� �C���Q��?���Q��?���Q��?�        �        ���Q��?���Q��?���Q��?�        �        ���Q��?���Q��?���Q��?�        �        �        �        �        �      �?�        �        �        �        �        �      �?�9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � � A 1                       C      )   :                        �Top = 204
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
     GPROCEDURE Click
LOCAL lcFile
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

WITH Thisform
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
     _���    F  F                        �   %   �      �     �          �  U  �  %�C�  � � ��� � B� �
 �� � � �� Q� XFCIMAGEATTRIBUTES� �� Q� XFCCOLORMATRIX� ���9� � ��� � T� �C��	 �
 � �� ��C�  � � � ��1 ��C�  � � � C�  � � �� �  � � � � �� �� B� U  THISFORM TXTFILE VALUE THIS CLEAR LOATTR LOCLRMATRIX SYSTEM DRAWING IMAGING IMAGEATTRIBUTES NEW SETCOLORMATRIX
 OCLRMATRIX OGFX	 DRAWIMAGE OBMP	 RECTANGLE	 GETBOUNDS GRAPHICSUNIT PIXEL
 beforedraw,     ��1 QA A � ��"Q1A B 1                       �      )   F                  0	
   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923480885�      �  �      �      �  S                  �                           WINDOWS _1TZ0QGKPH 890049283�  �  �  �          |  �                                               WINDOWS _1U40L3TVG 890061480�      �  q  d  �      �  �                                               WINDOWS _1U40L3TVH 890061550�      �  �  ~  �                                                           WINDOWS _1TP0L3VWK 886904499�      �  �  �  '                                                           WINDOWS _1U51FF4QU 890049867      	  �  �                                                              WINDOWS _1U600T0UZ 890061550        �  �  �                                                           COMMENT RESERVED                                <                                                            &x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 10
Left = 87
Height = 411
Width = 516
DoCreate = .T.
Caption = "Retrieve GIF properties and ColorPalettes"
mode = 0
Name = "Form1"
      �PROCEDURE Init

LOCAL lcPicture
lcPicture = LOCFILE("GotData.gif")
Thisform.txtFile.Value = lcPicture
Thisform.Image1.Picture = lcPicture
Thisform.Imgcanvas1.Draw()

ENDPROC
     Q���    8  8                        8�   %   �       �      �           �  U  [  ��  � T�  �C� GotData.gif��� T� � � ��  �� T� � � ��  �� ��C� � � �� U 	 LCPICTURE THISFORM TXTFILE VALUE IMAGE1 PICTURE
 IMGCANVAS1 DRAW Init,     ��1 r �112                       �       )   8                        mode
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 180
Left = 264
Top = 12
Width = 240
smoothingmode = 0
Name = "Imgcanvas1"
     LPROCEDURE beforedraw
This.Clear
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

LOCAL loBmpData AS xfcBitmapData
LOCAL loImg AS xfcImage
LOCAL loPalette AS xfcColorPalette
LOCAL loColor AS xfcColor
LOCAL loSBrush AS xfcSolidBrush

LOCAL x1, y1, n
WITH _SCREEN.System.Drawing
	loImg = .Image.FromFile(Thisform.txtFile.Value)
	IF ISNULL(loImg)
		MESSAGEBOX("Could not load image file")
		RETURN 
	ENDIF
	loPalette = loImg.Palette
	x1 = 0
	y1 = 0
	FOR n = 1 TO ALEN(loPalette.Entries)
		loColor	= loPalette.Entries(n)
		loSBrush = .SolidBrush.New(loColor)
		This.oGfx.FillRectangle(loSBrush, x1, y1, 15, 15)
		x1 = x1 + 15
		IF x1 > This.Width
			x1 = 0
			y1 = y1 + 15
		ENDIF
	ENDFOR 


* Get PixelFormat name
LOCAL lnPix, lcPixFormat
lnPix = loImg.PixelFormat 
DO CASE 
CASE lnPix = .Imaging.PixelFormat.Format1bppIndexed 
	lcPixFormat = "1bppIndexed"
CASE lnPix = .Imaging.PixelFormat.Format4bppIndexed 
	lcPixFormat = "4bppIndexed"
CASE lnPix = .Imaging.PixelFormat.Format8bppIndexed 
	lcPixFormat = "8bppIndexed"
CASE lnPix = .Imaging.PixelFormat.Format16bppGrayScale
	lcPixFormat = "16bppGrayScale"
CASE lnPix = .Imaging.PixelFormat.Format16bppRGB555
	lcPixFormat = "16bppRGB555"
CASE lnPix = .Imaging.PixelFormat.Format16bppRGB565
	lcPixFormat = "16bppRGB565"
CASE lnPix = .Imaging.PixelFormat.Format16bppARGB1555
	lcPixFormat = "16bppARGB1555"
CASE lnPix = .Imaging.PixelFormat.Format24bppRGB
	lcPixFormat = "24bppRGB"
CASE lnPix = .Imaging.PixelFormat.Format32bppRGB
	lcPixFormat = "32bppRGB"
CASE lnPix = .Imaging.PixelFormat.Format32bppARGB
	lcPixFormat = "32bppARGB"
CASE lnPix = .Imaging.PixelFormat.Format32bppPARGB
	lcPixFormat = "32bppPARGB"
CASE lnPix = .Imaging.PixelFormat.Format48bppRGB
	lcPixFormat = "48bppRGB"
CASE lnPix = .Imaging.PixelFormat.Format64bppPARGB
	lcPixFormat = "64bppPARGB"
OTHERWISE 
	lcPixFormat = "Unidentified"
ENDCASE 

ENDWITH


* Retrieve Metadata Tags from Image
LOCAL lcProperties, lnProp, lcPropName, llAnimatedGIF
LOCAL loProp AS xfcPropertyItem
llAnimatedGIF = .F.
lcProperties = "" + CHR(13)
FOR EACH lnProp IN loImg.PropertyIdList
	loProp = loImg.GetPropertyItem(lnProp)
	DO CASE 
	CASE loProp.Id = 0x5100
		lcProperties = lcProperties + "PropertyTagFrameDelay : " + loProp.ToString() + CHR(13)
		IF ALLTRIM(loProp.ToString()) <> "0"
			llAnimatedGIF = .T.
		ENDIF 
	CASE loProp.Id = 0x5101
		lcProperties = lcProperties + "PropertyTagLoopCount : " + loProp.ToString() + CHR(13)
	ENDCASE 
ENDFOR

Thisform.Edit1.Value = ;
	"Width : " + TRANSFORM(loImg.Width) + SPACE(25) +;
	"Height : " + TRANSFORM(loImg.Height) + CHR(13) +;
	"Resolution - Vertical : " + TRANSFORM(loImg.VerticalResolution) + SPACE(6) +;
	"Horizontal : " + TRANSFORM(loImg.HorizontalResolution) + CHR(13) +;
	"PixelFormat : " + lcPixFormat + CHR(13) + ;
	"Number of colors : " + TRANSFORM(ALEN(loPalette.Entries)) + CHR(13) +;
	"Transparency enabled : " + IIF(loPalette.Flags = 2,"YES", "NO") + SPACE(10) +;
	"Flags : " + TRANSFORM(loPalette.Flags) + CHR(13)+;
	"Animated GIF : " + IIF(llAnimatedGIF,"YES", "NO") + lcProperties
	
Thisform.Edit1.Visible = .T.

IF loImg.Width <= Thisform.Image2.Width AND loImg.Height <= Thisform.Image2.Height
	Thisform.Image2.Picture = Thisform.TxtFile.Value
	Thisform.Image2.Visible = .T. 
ELSE
	Thisform.Image2.Visible = .F. 	
ENDIF
ENDPROC
     d���    K  K                        6C   %   �         
   �           �  U  j  ��  � T�  �C� gif��� %�C�  ���- � B� � T� � � ��  �� T� � � ��  �� ��C� � � �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE
 IMGCANVAS1 DRAW Click,     ��1 q 1� A A 112                       �       )   K                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      ]Anchor = 2
Height = 156
Left = 12
Top = 240
Visible = .F.
Width = 236
Name = "Image2"
      Form1      Image2      image      image      �Anchor = 15
Enabled = .F.
Height = 160
Left = 257
ScrollBars = 0
TabIndex = 3
Top = 240
Visible = .F.
Width = 248
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "Edit1"
      Form1      Edit1      editbox      editbox      ZAnchor = 3
Stretch = 1
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
      Form1      Image1      image      image      �FontSize = 8
Anchor = 131
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      Form1      txtFile      textbox      textbox      �PROCEDURE Click
LOCAL lcFile
lcFile = GETPICT("gif")
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.txtFile.Value = lcFile
Thisform.Image1.Picture = lcFile
Thisform.Imgcanvas1.Draw()

ENDPROC
      �Top = 204
Left = 12
Height = 25
Width = 96
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
      Form1      Command3      commandbutton      commandbutton     ����    �  �                        M�   %   �
      c  X   �
          �  U  �
 ��  � � %�C� � � ���# � B� � �� Q� XFCBITMAPDATA� �� Q� XFCIMAGE� �� Q� XFCCOLORPALETTE� �� Q� XFCCOLOR� ��	 Q� XFCSOLIDBRUSH� ��
 � � � ���9� � ���� T� �C� � � �� � �� %�C� ����% ��C� Could not load image file�x�� B� � T� �� � �� T�
 �� �� T� �� �� �� ���(�C� � ����� T� �C � � � �� T�	 �C � �� � ��" ��C �	  �
  � ���  � � �� T�
 ��
 ��� %��
 �  � ���� T�
 �� �� T� �� ��� � �� �� � � T� �� � �� H���� �� �� � � ��E� T� �� 1bppIndexed�� �� �� � � ��u� T� �� 4bppIndexed�� �� �� � � ���� T� �� 8bppIndexed�� �� �� � � ���� T� �� 16bppGrayScale�� �� �� � �  ��� T� �� 16bppRGB555�� �� �� � �! ��8� T� �� 16bppRGB565�� �� �� � �" ��j� T� �� 16bppARGB1555�� �� �� � �# ���� T� �� 24bppRGB�� �� �� � �$ ���� T� �� 32bppRGB�� �� �� � �% ���� T� ��	 32bppARGB�� �� �� � �& ��!� T� ��
 32bppPARGB�� �� �� � �' ��N� T� �� 48bppRGB�� �� �� � �( ��}� T� ��
 64bppPARGB�� 2��� T� �� Unidentified�� � �� ��) �* �+ �, � ��- Q� XFCPROPERTYITEM� T�, �-�� T�) ��  C� �� ��* � �. ��� T�- �C �* � �/ �� H�%��� ��- �0 � Q����7 T�) ��) � PropertyTagFrameDelay : C�- �1 C� �� %�CC�- �1 �� 0���� T�, �a�� � ��- �0 �Q����6 T�) ��) � PropertyTagLoopCount : C�- �1 C� �� � ��]T� �2 � �� Width : C� � _C�X�	 Height : C� �3 _C� � Resolution - Vertical : C� �4 _C�X� Horizontal : C� �5 _C� � PixelFormat : � C� � Number of colors : CC� � �_C� � Transparency enabled : C� �6 ��	 � YES� � NO6C�
X� Flags : C� �6 _C� � Animated GIF : C�, �	 � YES� � NO6�) �� T� �2 �7 �a��. %�� � � �8 � � � �3 � �8 �3 	���� T� �8 �9 �� � � �� T� �8 �7 �a�� ��� T� �8 �7 �-�� � U:  THIS CLEAR THISFORM TXTFILE VALUE	 LOBMPDATA LOIMG	 LOPALETTE LOCOLOR LOSBRUSH X1 Y1 N SYSTEM DRAWING IMAGE FROMFILE PALETTE ENTRIES
 SOLIDBRUSH NEW OGFX FILLRECTANGLE WIDTH LNPIX LCPIXFORMAT PIXELFORMAT IMAGING FORMAT1BPPINDEXED FORMAT4BPPINDEXED FORMAT8BPPINDEXED FORMAT16BPPGRAYSCALE FORMAT16BPPRGB555 FORMAT16BPPRGB565 FORMAT16BPPARGB1555 FORMAT24BPPRGB FORMAT32BPPRGB FORMAT32BPPARGB FORMAT32BPPPARGB FORMAT48BPPRGB FORMAT64BPPPARGB LCPROPERTIES LNPROP
 LCPROPNAME LLANIMATEDGIF LOPROP PROPERTYIDLIST GETPROPERTYITEM ID TOSTRING EDIT1 HEIGHT VERTICALRESOLUTION HORIZONTALRESOLUTION FLAGS VISIBLE IMAGE2 PICTURE
 beforedraw,     ��1 � QA A �1�1�� !�� QA A � � �Qa!A� A A � � ���������������Q�Q�a�q�Q�q� �A B 4�� 1!Q� Qq�� A QaA A ���� A 1                       A      )   �                      %           �   
   �   l7(8�  ��  7�  � �� � T� �CCC�]������ G)(�� �� G)(�� � image\�� G)(�� �
 ..\source\�� �C�
 System.app��� � samples� 9�� U  GOGDIPLUSXSAMPLES LCPATH SAMPLESq r R� q�r� R 4                 0	
   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 909785954�      �  �      �                              �                           WINDOWS _1TZ0QGKPH 898893100�  �  �  �  �        o  �                                               WINDOWS _1TP0L3VWK 898893075�
      �
  �
  �
  �
      �  V                                               WINDOWS _1U40L3TVH 898893100!      0  ?  N  [                                                           WINDOWS _1Z0012BUH 898892981T      i  ~  �  �      z  �                                               WINDOWS _1TP0L3VWK 898892981�      �  �  �        �  �                                               WINDOWS _1Z00184XJ 898893075`      u  �  �  �      �	  �                                               COMMENT RESERVED                                c	                                                            Y                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 10
Left = 0
Height = 432
Width = 707
DoCreate = .T.
Caption = "Extract icons from executables"
WindowState = 0
mode = 0
Name = "Form1"
      mode
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      eAnchor = 15
Height = 336
Left = 12
Top = 84
Width = 684
smoothingmode = 0
Name = "Imgcanvas1"
     ePROCEDURE beforedraw
LOCAL lcFile
lcFile = Thisform.txtFile.Value
IF EMPTY(lcFile)
	RETURN
ENDIF

This.Clear

* The following code example demonstrates how to extract icons from an EXE file

LOCAL lnIndex, x, y
LOCAL loIcon as xfcIcon

STORE 0 TO lnIndex, x, y

WITH _SCREEN.System.Drawing
	DO WHILE .T.
		loIcon = .Icon.ExtractAssociatedIcon(lcFile, lnIndex)
		IF ISNULL(loIcon)
			EXIT
		ENDIF

* To save all icons as independent images, just uncomment these lines
*		lcNewFile = "C:\" + JUSTFNAME(lcFile) + TRANSFORM(lnIndex) + ".png"
*		loBmp = loIcon.ToBitmap()
*		loBmp.Save(lcNewFile, .Imaging.ImageFormat.Png)

		IF (x + loIcon.Width) > This.Width
			x = 0
			y = y + loIcon.Height + 5
		ENDIF
				
		This.oGfx.DrawIcon(loIcon, x, y)
		x = x + loIcon.Width  + 5
		lnIndex = lnIndex + 1
	ENDDO

ENDWITH 

RETURN
ENDPROC
     ���    f  f                        ��   %   �         
   	          �  U  �  ��  �2 T�  �C�
 systemroot5� \system32\SHELL32.dll�� %�C�  �� C�  0
��l � R,�� Invalid file�� B� � T� � � ��  �� ��C� � � �� U  LCFILE THISFORM TXTFILE VALUE
 IMGCANVAS1 DRAW Click,     ��1 q !�aA A 11                       �       )   f                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      �PROCEDURE Click
LOCAL lcFile
lcFile = GETENV("systemroot") + "\system32\SHELL32.dll"
IF EMPTY(lcFile) OR NOT FILE(lcFile)
	WAIT WINDOW "Invalid file"
	RETURN
ENDIF
Thisform.txtFile.Value = lcFile
Thisform.Imgcanvas1.Draw()
ENDPROC
      commandbutton      commandbutton      Command3      Form1      �Top = 12
Left = 408
Height = 25
Width = 108
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Select File"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
      �PROCEDURE Click
LOCAL lcFile
lcFile = GETFILE("exe;ico;dll")
IF EMPTY(lcFile) OR NOT FILE(lcFile)
	WAIT WINDOW "Invalid file"
	RETURN
ENDIF
Thisform.txtFile.Value = lcFile
Thisform.Imgcanvas1.Draw()

ENDPROC
     h���    O  O                        j   %   �         
   �           �  U  s  ��  � T�  ��C� �� %�C�  �� C�  0
��I � R,�� Invalid file�� B� � T� � � ��  �� ��C� � � �� U  LCFILE
 SERVERNAME THISFORM TXTFILE VALUE
 IMGCANVAS1 DRAW Click,     ��1 q � �aA A 12                       �       )   O                        textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 131
Value = ( GETENV("systemroot") + "\system32\SHELL32.dll")
Enabled = .F.
Height = 25
Left = 12
TabIndex = 2
Top = 48
Width = 684
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      commandbutton      commandbutton      Command1      Form1      �Top = 12
Left = 144
Height = 25
Width = 108
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "VFP Icons"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command1"
      �PROCEDURE Click
LOCAL lcFile
lcFile = _vfp.ServerName
IF EMPTY(lcFile) OR NOT FILE(lcFile)
	WAIT WINDOW "Invalid file"
	RETURN
ENDIF
Thisform.txtFile.Value = lcFile
Thisform.Imgcanvas1.Draw()

ENDPROC
     g���    N  N                        �   %   �         
   �           �  U  ~  ��  � T�  �C� exe;ico;dll��� %�C�  �� C�  0
��T � R,�� Invalid file�� B� � T� � � ��  �� ��C� � � �� U  LCFILE THISFORM TXTFILE VALUE
 IMGCANVAS1 DRAW Click,     ��1 q ��aA A 12                       �       )   N                        commandbutton      commandbutton      Command2      Form1      �Top = 12
Left = 276
Height = 25
Width = 108
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Explorer Icons"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command2"
      �PROCEDURE Click
LOCAL lcFile
lcFile = getenv("systemroot") + "\EXPLORER.EXE"
IF EMPTY(lcFile) OR NOT FILE(lcFile)
	WAIT WINDOW "Invalid file"
	RETURN
ENDIF
Thisform.txtFile.Value = lcFile
Thisform.Imgcanvas1.Draw()
ENDPROC
     w���    ^  ^                        �7   %   �         
             �  U  �  ��  �* T�  �C�
 systemroot5� \EXPLORER.EXE�� %�C�  �� C�  0
��d � R,�� Invalid file�� B� � T� � � ��  �� ��C� � � �� U  LCFILE THISFORM TXTFILE VALUE
 IMGCANVAS1 DRAW Click,     ��1 q ��aA A 11                       �       )   ^                        commandbutton      commandbutton      Command4      Form1      �Top = 12
Left = 12
Height = 25
Width = 108
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Shell32 Icons"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command4"
     ����    �  �                        �0   %         f     0          �  U  Y ��  � T�  �� � � �� %�C�  ���- � B� �
 �� � � �� � � � ��	 Q� XFCICON� J�� �(� � � � ���9�
 � ��N� +�a��J� T�	 �C �   � �� � �� %�C�	 ���� � !� � %�� �	 � � � ��� T� �� �� T� �� �	 � ��� � ��C �	  �  � � � � �� T� �� �	 � ��� T� �� ��� � �� B� U  LCFILE THISFORM TXTFILE VALUE THIS CLEAR LNINDEX X Y LOICON SYSTEM DRAWING ICON EXTRACTASSOCIATEDICON WIDTH HEIGHT OGFX DRAWICON
 beforedraw,     ��1 q 1� A A � � !R"� �� A A �� �A ��A B B 1                       Z      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00MENI7 889017192      /  F      ]                          �      �                       WINDOWS _1V00MENI8 942183689�      �  �      �      c  �                                               WINDOWS _1V00MENI9 942183689j  {  �  �  �  �        .	                                               COMMENT RESERVED                                2                      [                                    �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      fHeight = 373
Width = 541
DoCreate = .T.
AutoCenter = .T.
Caption = "Fill Shapes"
Name = "Form1"
      7PROCEDURE Init
DO (LOCFILE("System.app"))

ENDPROC
      ����    �   �                         �L   %   J       ^      X           �  U    �C�
 System.app��� U   Init,     ��1 q2                       ,       )   �                         	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      EHeight = 348
Left = 12
Top = 12
Width = 516
Name = "Imgcanvas1"
     PROCEDURE beforedraw
#include ..\source\GDIPlusConstants.h

LOCAL loGfx AS xfcGraphics
LOCAL loGBrush AS xfcLinearGradientBrush
LOCAL loHBrush AS xfcHatchBrush
LOCAL loSBrush AS xfcSolidBrush

WITH _SCREEN.System.Drawing

	This.Clear()

	loGfx = This.oGfx
	
	loSBrush = .SolidBrush.New(.Color.Green)	&& Green

	loHBrush = .Drawing2D.HatchBrush.New( ;
			HatchStyleDiagonalCross, ;
			.Color.Blue, .Color.White )

	loGBrush = .Drawing2D.LinearGradientBrush.New( ;
			.Rectangle.New(0,0,400,400), ;
			.Color.Blue, .Color.Red, ;
			LinearGradientModeForwardDiagonal) 
	
	ThisForm.Cls()

	loGfx.FillEllipse(loSBrush, 110, 10, 300, 300)
	loGfx.FillEllipse(loHBrush,  60, 10, 300, 300)
	loGfx.FillEllipse(loGBrush,  10, 10, 300, 300)

	loGBrush.LinearColors[1] = .Color.FromARGB(0x80, .Color.Yellow)
	loGBrush.LinearColors[2] = .Color.FromARGB(0x80, .Color.Blue)

	loGfx.FillRectangle(loGBrush, 10,10,500,40)

ENDWITH

loClr = NULL
loSBrush = NULL
loHBrush = NULL
loGBrush = NULL
loGfx = NULL


ENDPROC
     ����    �  �                        _7   %   T      �     h          �  U  ! ��  Q� XFCGRAPHICS�! �� Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCHATCHBRUSH� �� Q� XFCSOLIDBRUSH� ���9� � ���� ��C� � �� T�  �� � �� T� �C�� � ��	 �
 ��& T� �C��� � �� � �� � �
 ��< T� �CC� � ������ �
 �� � �� � ��� � �
 �� ��C� � �� ��C � �n�
�,�,�  � �� ��C � �<�
�,�,�  � �� ��C � �
�
�,�,�  � ��% T� � ����C���� � �� � ��% T� � ����C���� � �� � �� ��C � �
�
���(�  � �� �� T� ���� T� ���� T� ���� T� ���� T�  ���� U  LOGFX LOGBRUSH LOHBRUSH LOSBRUSH SYSTEM DRAWING THIS CLEAR OGFX
 SOLIDBRUSH NEW COLOR GREEN	 DRAWING2D
 HATCHBRUSH BLUE WHITE LINEARGRADIENTBRUSH	 RECTANGLE RED THISFORM CLS FILLELLIPSE LINEARCOLORS FROMARGB YELLOW FILLRECTANGLE LOCLR
 beforedraw,     ��1 c��"� �d�� ���RQ�B � � � � � 3                       	      )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      &  ..\source\gdiplusconstants.h.h5$80	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1W21F3UFO 891666006      /  F      ]                          �      �                       WINDOWS _1W21F3UFP 898894689�      �  �      �      �  Y                  �                           WINDOWS _1W41EHQ0N 898894689�      �  �  �  �      5  a
                                               COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 0
Left = 0
Height = 250
Width = 385
DoCreate = .T.
Caption = "Listbox with all available FontFamilies"
obmp = 0
ogfx = 0
oldindex = 1
Name = "Form1"
      �PROCEDURE Destroy
Thisform.oGfx = NULL
Thisform.oBmp = NULL

* Delete Temporary Image Files
lcCommand = "Erase " + ADDBS(SYS(2023)) + "_Font_*.bmp"
&lcCommand
ENDPROC
     )���                              "g   %   �       �      �           �  U  Y  T�  � ���� T�  � ����, T� �� Erase CC��]��� _Font_*.bmp�� &lcCommand
 U  THISFORM OGFX OBMP	 LCCOMMAND Destroy,     ��1 � � �� 1                       �       )                           obmp
ogfx
oldindex
      listbox      listbox      List1      Form1      MAnchor = 15
Height = 228
Left = 12
Top = 12
Width = 360
Name = "List1"
     $PROCEDURE Init
lcTempFile = ADDBS(SYS(2023)) + "_Font_"

WITH _SCREEN.System.Drawing

Thisform.oBmp = .Bitmap.New(100,25)
Thisform.oGfx = .Graphics.FromImage(Thisform.oBmp)

* Get an array of the available font families.
laFamilies = .FontFamily.GetFamilies(Thisform.oGfx)

* Draw text using each of the font families.
LOCAL loFamiliesFont as xfcFont
LOCAL loFamilyString As xfcString
LOCAL loFamily as xfcFontFamily

n = 1
FOR EACH loFamily IN laFamilies

	IF (loFamily.IsStyleAvailable(.FontStyle.Regular))

		loFamiliesFont = .Font.New(loFamily, 12)
		lcFamilyString = loFamily.Name
		Thisform.oGfx.Clear(.Color.FromRGB(Thisform.List1.ItemBackColor))
		Thisform.oGfx.DrawString(lcFamilyString, loFamiliesFont, ;
			.SolidBrush.New(.Color.FromRGB(Thisform.List1.ItemForeColor)),;
			.Point.New(0, 0))
		lcFontFile = lcTempFile + lcFamilyString + ".bmp"
		Thisform.oBmp.Save(lcFontFile, .Imaging.ImageFormat.bmp)

		This.AddItem(lcFamilyString)
		This.Picture[n] = lcFontFile

		n = n + 1
	ENDIF 
NEXT 

ENDWITH
ENDPROC
     R���    9  9                        W   %   �      �     �          �  U  � T�  �CC��]��� _Font_�� ���9� � ���� T� � �C�d��� � �� T� � �C� � �� �	 �� T�
 �C� � �� � �� �� Q� XFCFONT� �� Q�	 XFCSTRING� �� Q� XFCFONTFAMILY� T� ���� �� �
 ��� %�C�� � � � ���� T� �C � ��� � �� T� �� � ��! ��CC� � � �� � � � � ��? ��C �  � CC� � � �� � �� � C� � �� � � � � �� T�  ��  � � .bmp�� ��C �  ��" �# �$ � � �! �� ��C � �% �& �� T�% �' �� ���  �� T� �� ��� � �� �� U( 
 LCTEMPFILE SYSTEM DRAWING THISFORM OBMP BITMAP NEW OGFX GRAPHICS	 FROMIMAGE
 LAFAMILIES
 FONTFAMILY GETFAMILIES LOFAMILIESFONT LOFAMILYSTRING LOFAMILY N ISSTYLEAVAILABLE	 FONTSTYLE REGULAR FONT LCFAMILYSTRING NAME CLEAR COLOR FROMRGB LIST1 ITEMBACKCOLOR
 DRAWSTRING
 SOLIDBRUSH ITEMFORECOLOR POINT
 LCFONTFILE SAVE IMAGING IMAGEFORMAT BMP THIS ADDITEM PICTURE Init,     ��1 �"���#A�� � �����aA A B 1                             )   9                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V40VE1OD 889353430      /  F      ]                          �      �                       WINDOWS _1V40VE1OS 898851990�      �  �      �                                                           WINDOWS _1V40VE1OT 898851990i  z  �  �  �  �        �                                               COMMENT RESERVED                                �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      lHeight = 453
Width = 467
DoCreate = .T.
AutoCenter = .T.
Caption = "Fox Head Line Cap"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 432
Left = 12
Top = 12
Width = 444
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
LOCAL oPath AS xfcGraphicsPath
LOCAL oGfx AS xfcGraphics
LOCAL oCap AS xfcCustomLineCap
LOCAL oPen2 AS xfcPen
LOCAL otrans AS xfcMatrix

oPath = _screen.system.Drawing.Drawing2D.GraphicsPath.New()
oGfx = This.oGfx
This.Clear()

oPn = _screen.system.Drawing.Pens.Black

CLEAR 

** Forehead
oPath.StartFigure()
oPath.AddBezier(101,65, 90,70, 90,70, 82,96)
** Left Cheek
oPath.StartFigure()
oPath.AddBezier(124,129, 130,140, 132,151, 132,151)
oPath.AddBezier(132,151, 100,160, 100,155, 77,161)
** Head and ears
oPath.StartFigure()
oPath.AddBezier(102,212, 170,160, 170,120, 166,89)
oPath.AddBezier(166,89, 180,60, 192,50, 191,2)
oPath.AddBezier(191,2, 150,20, 140,30, 120,51)
oPath.AddBezier(120,51, 100,45, 75,44, 69,46)
oPath.AddBezier(69,46, 50,14, 25,30, 6,2)
oPath.AddBezier(6,2, 0,30, 0,40, 14,81)
** Right cheek
oPath.StartFigure()
oPath.AddBezier(29,102, 16,118, 16,126, 28,146)
** Nose
oPath.StartFigure()
oPath.AddBezier(45,150, 38,160, 38,160, 23,169)
oPath.StartFigure()
oPath.AddBezier(38,190, 60,190, 70,175, 82,177)
oPath.StartFigure()
oPath.AddBezier(16,173, 22,171, 25,171, 30,173)
oPath.AddBezier(30,173, 32,182, 32,182, 23,189)
oPath.AddBezier(23,189, 14,183, 14,183, 16,173)
** Right eye
oPath.StartFigure()
oPath.AddBezier(36,114, 45,120, 50,120, 50,141)
oPath.AddBezier(47,135, 38,130, 38,130, 40,121)
oPath.CloseFigure()
** Left eye
oPath.StartFigure()
oPath.AddBezier(103,120, 90,125, 70,140, 65,148)
oPath.AddBezier(75,141, 85,140, 89,140, 92,130)
oPath.CloseFigure()

oGfx.SmoothingMode = _screen.system.drawing.Drawing2D.SmoothingMode.AntiAlias
oGfx.DrawPath(oPn, oPath)

oTrans = _screen.system.Drawing.Drawing2D.matrix.New()
oTrans.Translate(-8,17)
oTrans.Scale(.1,.1)
oTrans.Rotate(-90)
oPath.Transform(oTrans)

oCap = _screen.System.Drawing.Drawing2D.CustomLineCap.New(NULL,oPath)


oPen2 = _screen.system.Drawing.Pen.New(_screen.system.Drawing.Color.blue,1)
oPen2.CustomStartCap = oCap

oGfx.DrawLine(oPen2,100,200,800,200)

oPen2.Width = 2
oGfx.DrawLine(oPen2,100,250,800,250)

oPen2.Width = 3
oGfx.DrawLine(oPen2,100,300,800,300)

oPen2.Width = 4
oGfx.DrawLine(oPen2,100,400,800,400)

ENDPROC
     	���    �  �                        "�   %         �  ;   1          �  U  � ��  Q� XFCGRAPHICSPATH� �� Q� XFCGRAPHICS� �� Q� XFCCUSTOMLINECAP� �� Q� XFCPEN� �� Q�	 XFCMATRIX� T�  �C�9� � � � �	 �� T� ��
 � �� ��C�
 � �� T� ��9� � � � �� � ��C�  � ��% ��C�e�A�Z�F�Z�F�R�`�  � �� ��C�  � ��% ��C�|���������������  � ��% ��C�����d���d���M���  � �� ��C�  � ��% ��C�f���������x���Y�  � ��% ��C���Y���<���2����  � ��% ��C����������x�3�  � ��% ��C�x�3�d�-�K�,�E�.�  � ��% ��C�E�.�2������  � ��% ��C��� �� �(��Q�  � �� ��C�  � ��% ��C��f��v��~����  � �� ��C�  � ��% ��C�-���&���&������  � �� ��C�  � ��% ��C�&���<���F���R���  � �� ��C�  � ��% ��C�������������  � ��% ��C���� ��� ������  � ��% ��C�������������  � �� ��C�  � ��% ��C�$�r�-�x�2�x�2���  � ��% ��C�/���&���&���(�y�  � �� ��C�  � �� ��C�  � ��% ��C�g�x�Z�}�F���A���  � ��% ��C�K���U���Y���\���  � �� ��C�  � �� T� � ��9� � � � � �� ��C �  �  � � �� T� �C�9� � � � �	 �� ��C����� � ��# ��C��������?��������?� � �� ��C���� � �� ��C � �  � ��! T� �C� �  �9� � � � �	 ��* T� �C�9� � � � ��9� � � �	 �� T� � �� �� ��C � �d��� ��� � �� T� �  ���� ��C � �d��� ��� � �� T� �  ����  ��C � �d�,� �,� � �� T� �  ����  ��C � �d��� ��� � �� U!  OPATH OGFX OCAP OPEN2 OTRANS SYSTEM DRAWING	 DRAWING2D GRAPHICSPATH NEW THIS CLEAR OPN PENS BLACK STARTFIGURE	 ADDBEZIER CLOSEFIGURE SMOOTHINGMODE	 ANTIALIAS DRAWPATH MATRIX	 TRANSLATE SCALE ROTATE	 TRANSFORM CUSTOMLINECAP PEN COLOR BLUE CUSTOMSTARTCAP DRAWLINE WIDTH
 beforedraw,     ��1 �a�A�� �B � Q� QQ� QQQQQQ� Q� Q� Q� QQQ� QQ� � QQ� �Q�A1���2                       �      )   �                        !Arial, 0, 9, 5, 15, 12, 16, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 930685173�      �  �      �                              '                           WINDOWS _1TP0L3VWK 909075227k      z  �  �  �      	  �2                                               WINDOWS _1TP0L3VWK 930685173�
      �
  �
  �
  �
      =  �0                                               WINDOWS _1YI1FCYP0 909075227�          0  =      �  �                                               WINDOWS _1YI1FCYP1 908722448�      �  �           s  �                                               WINDOWS _1TP0L3VWK 909071878�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 915435682�  �  �  �  �  �      H  �                                               WINDOWS _1TP0L3VWK 909071722,+      ?+  R+  t
  x+      �.  `                                               WINDOWS _1ZS0MZBAC 909071892/      e+  �  g
  "/      �  }	                                               COMMENT RESERVED                                J                                                            3�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     $Top = 28
Left = 1
Height = 407
Width = 662
DoCreate = .T.
Caption = "Full Justified Text"
mode = 0
_memberdata =      653<?xml version="1.0" standalone="yes"?>
<VFPData>
	<memberdata name="foomethod" type="method" display="fooMethod" favorites="True"/>
	<memberdata name="Form1" type="property" display="Form1" favorites="True"/>
	<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>
	<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>
	<memberdata name="error" type="method" display="eRRor" favorites="True"/>
	<memberdata name="drawfulljustifiedstring" type="method" display="DrawFullJustifiedString" favorites="True"/><memberdata name="declaredll" type="method" display="DeclareDll"/></VFPData>

Name = "Form1"
      <mode
_memberdata XML Metadata for customizable properties
      textbox      textbox      TxtFontName      Form1      dValue = Verdana
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      `PROCEDURE Valid
This.Value = PROPER(ALLTRIM(This.Value))
Thisform.Imgcanvas1.Draw()
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         Form1      Form1      commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     PROCEDURE Click
lcFont = GETFONT()
IF EMPTY(lcFont)
	RETURN
ENDIF

Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 1, 9, 6, 15, 12, 32, 3, 0
      BPROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
ENDPROC
      OptionBorder      Form1      textbox      textbox      TxtFontSize      Form1      mAlignment = 3
Value = 9
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         textbox      textbox      TxtFontStyle      Form1      ^Value = 
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         label      label      Label2      Form1      �AutoSize = .T.
FontSize = 11
Caption = "Resize this window and see how fast the full text justifying works !"
Height = 19
Left = 204
Top = 12
Width = 428
TabIndex = 5
Name = "Label2"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      fAnchor = 15
Height = 360
Left = 204
Top = 36
Width = 444
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
LOCAL lcText as Character 
TEXT TO lcText NOSHOW 
GDIPlusX is a set of VFP 9.0 class libraries that wrap the 603 GDI+ Flat API functions of GDIPlus.dll. 
The library currently consist of 83 VFP classes and 1,146 methods. The project is still under development so not all classes have been completed and several of the classes/methods are still being tested. The Readme.htm file, included with the download, shows the current coding status of each class. As of August 31, 2006, the overall status of the library is about 97% coded and 60% tested.
The object model of these classes closely emulates the classes contained in the System.Drawing namespace of Visual Studio .NET. This not only makes the library easier to use, but also allows VFP developers to tap into thousands of GDI+ code samples, written in .NET, that can be easily translated to VFP code.
The Help folder contained in the GDIPlusX download has several sample programs that were converted from the System.Drawing documentation in .NET.

Get the latest release:
http://www.codeplex.com/VFPX/Wiki/View.aspx?title=GDIPlusX

If you would like to be involved in the project, please send an email to gdiplusx@moxiedata.com
To report any issues with the library, please use the Issue Tracker in CodePlex.
ENDTEXT 

WITH _Screen.System.Drawing

	*!* Fill Image with Background color
	This.oGfx.Clear(.Color.White)

	LOCAL loTextBrush AS xfcSolidBrush
	loTextBrush = .SolidBrush.New(.Color.Black)


	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value

*	LOCAL loStyle as xfcFontStyle
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	* Create Font Object
	LOCAL loFont AS xfcFont
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)


	LOCAL lnOption
	lnOption = Thisform.OptionAlign.Value
	
	LOCAL loStringFormat as xfcStringFormat
	loStringFormat = _Screen.System.Drawing.StringFormat.New()
	
	DO CASE 
	CASE lnOption = 1 && Left Align
		loStringFormat.Alignment = _Screen.System.Drawing.StringAlignment.Near
		This.oGfx.DrawString(lcText, loFont, loTextBrush, ;
			This.Rectangle, loStringFormat)
	CASE lnOption = 2 && Centered
		loStringFormat.Alignment = _Screen.System.Drawing.StringAlignment.Center
		This.oGfx.DrawString(lcText, loFont, loTextBrush, ;
			This.Rectangle, loStringFormat)

	CASE lnOption = 3 && Right Align
		loStringFormat.Alignment = _Screen.System.Drawing.StringAlignment.Far
		This.oGfx.DrawString(lcText, loFont, loTextBrush, ;
			This.Rectangle, loStringFormat)

	CASE lnOption = 4 && Full Justify
		* Draw the Full-Justified text
		LOCAL lnSecs
		lnSecs = SECONDS()
		This.oGfx.DrawStringJustified(lcText, loFont, loTextBrush, This.Rectangle)
		WAIT WINDOW ("Elapsed " + TRANSFORM(SECONDS() - lnSecs) + " Seconds.") NOWAIT 
	ENDCASE

	* Draw Border if required
	IF Thisform.OptionBorder.Value = 2 && Red Border
		This.oGfx.DrawRectangle(.Pen.New(.Color.Red,1), 0, 0, This.Width - 1, This.Height - 1)
	ENDIF
	
ENDWITH
ENDPROC
     A���    (  (                        ��   %   Y
      �
  9   m
          �  U  u ��  Q�	 CHARACTER�	 M(�  ��m �g GDIPlusX is a set of VFP 9.0 class libraries that wrap the 603 GDI+ Flat API functions of GDIPlus.dll. ����The library currently consist of 83 VFP classes and 1,146 methods. The project is still under development so not all classes have been completed and several of the classes/methods are still being tested. The Readme.htm file, included with the download, shows the current coding status of each class. As of August 31, 2006, the overall status of the library is about 97% coded and 60% tested.�;�5The object model of these classes closely emulates the classes contained in the System.Drawing namespace of Visual Studio .NET. This not only makes the library easier to use, but also allows VFP developers to tap into thousands of GDI+ code samples, written in .NET, that can be easily translated to VFP code.�� �� The Help folder contained in the GDIPlusX download has several sample programs that were converted from the System.Drawing documentation in .NET.� �  � � Get the latest release:�@ �: http://www.codeplex.com/VFPX/Wiki/View.aspx?title=GDIPlusX� �  �e �_ If you would like to be involved in the project, please send an email to gdiplusx@moxiedata.com�V �P To report any issues with the library, please use the Issue Tracker in CodePlex.� � ���9� � ��n� ��C�� � � � � �� �� Q� XFCSOLIDBRUSH� T� �C�� � ��	 �
 �� �� � T� �� � � �� H���� �� � B���� T� ��� � �� �� � I���� T� ��� � �� �� � BI���� T� ��� � �� 2�� T� ��� � �� � �� Q� XFCFONT�( T� �C� � � � � �  � �� �
 �� �� � T� �� � � �� �� Q� XFCSTRINGFORMAT� T� �C�9� � � �
 �� H���� �� ����� T� � ��9� � � �  ��& ��C �   �  � � �"  � � � �! �� �� ���Q� T� � ��9� � � �# ��& ��C �   �  � � �"  � � � �! �� �� ����� T� � ��9� � � �$ ��& ��C �   �  � � �"  � � � �! �� �� ���� ��% � T�% �C���" ��C �   �  � � �" � � �& ��* R,:�� Elapsed CC��% _�	  Seconds.�� � %�� �' � ���j�< ��CC�� �* ���) �
 � � � �+ �� �, �� � �( �� � �� U-  LCTEXT SYSTEM DRAWING THIS OGFX CLEAR COLOR WHITE LOTEXTBRUSH
 SOLIDBRUSH NEW BLACK LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR LOFONT FONT TXTFONTNAME TXTFONTSIZE LNOPTION OPTIONALIGN LOSTRINGFORMAT STRINGFORMAT	 ALIGNMENT STRINGALIGNMENT NEAR
 DRAWSTRING	 RECTANGLE CENTER FAR LNSECS DRAWSTRINGJUSTIFIED OPTIONBORDER DRAWRECTANGLE PEN RED WIDTH HEIGHT
 beforedraw,     ��1 A� ���q	a �a QaA "s��s 1� !!1� A #�s 1��� �b�b�br � !�A s�A B 1                       �      )   (                        optiongroup      optiongroup      OptionAlign      optiongroup     EButtonCount = 4
Value = 4
Height = 84
Left = 12
Top = 144
Width = 132
Name = "OptionAlign"
Option1.Caption = "Left Aligned"
Option1.Value = 0
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 82
Option1.AutoSize = .T.
Option1.Name = "Option1"
Option2.Caption = "Centered"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 69
Option2.AutoSize = .T.
Option2.Name = "Option2"
Option3.Caption = "Right Aligned"
Option3.Height = 17
Option3.Left = 5
Option3.Top = 43
Option3.Width = 91
Option3.AutoSize = .T.
Option3.Name = "Option3"
Option4.FontBold = .T.
Option4.Caption = "Full Justified Text"
Option4.Value = 1
Option4.Height = 17
Option4.Left = 5
Option4.Top = 62
Option4.Width = 117
Option4.AutoSize = .T.
Option4.ForeColor = 0,0,255
Option4.Name = "Option4"
      BPROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
ENDPROC
      optiongroup     �ButtonCount = 2
Value = 2
Height = 48
Left = 12
Top = 264
Width = 132
Name = "OptionBorder"
Option1.Caption = "No Border"
Option1.Value = 0
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 74
Option1.AutoSize = .T.
Option1.Name = "Option1"
Option2.Caption = "Red Border"
Option2.Value = 1
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 81
Option2.AutoSize = .T.
Option2.Name = "Option2"
     ����                              �v   %         6  
   "          �  U  �  T�  �C�'�� %�C�  ���  � B� � T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� U  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW Click,     ��1 � � A A ���2                             )                           ����    �   �                         �   %   �       �      �           �  U  *  T�  � �CC�  � ���� ��C� � � �� U  THIS VALUE THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 q1                       U       )   �                   0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923478971�      �  �      �      �  �<                  �                           WINDOWS _1TZ0QGKPH 890049491�  �  �  �  �  �      Z	  ]9                                               WINDOWS _1U40L3TVH 890049875I      X  g  v  �                                                           WINDOWS _1U40LO0FY 889491650A      N  [  i  v                                                           WINDOWS _1U40NTQI6 898853593�      �  �                                                               WINDOWS _1TP0L3VWK 890049875�      �  �  �  �      o  7                                               WINDOWS _1V81F5AU2 890049875"      7  L  \  t      �                                                 WINDOWS _1V91CW4PL 890049875&      8  J  X  p      �  �  0  8'                                       WINDOWS _1V91CW4PM 890049875n'      {'  �'  �'  �'                                                           WINDOWS _1V91CW4PN 8900498758(      E(  R(  b(  z(                                                           WINDOWS _1V91CW4PO 890049875�(      )  )  ()  @)      �)    �,  �6                                       WINDOWS _1V91CW4PP 890049875�6      �6  �,  �6  �+                                                           WINDOWS _1V91CW4PQ 890049875�+        �+    \+                                                           WINDOWS _1V91EF42Y 898853643      9  �  �  �*      �  �                                               WINDOWS _1TP0L3VWK 898853678�      $      �      ?  �                                               WINDOWS _1V91FF99H 898871300�      l  \  O  �                                                           COMMENT RESERVED                                                                                            ?s                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 7
Left = 7
Height = 352
Width = 516
DoCreate = .T.
ShowTips = .T.
Caption = "Image transformations using Gamma and Threshold"
obmp = 0
oclrmatrix = 0
Name = "Form1"
     �PROCEDURE processimage
LPARAMETERS tcFile
tcFile = LOCFILE(tcFile)

WITH Thisform
	.Container1.oGamma.SetFocus()
	.Container1.oThreshold.SetFocus()
	
	.txtFile.Value = tcFile
	.Image1.Picture = tcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage("Cebolinha.png")
Thisform.Container1.Command1.Click()
ENDPROC
     ���    �   �                         ��   %   �       �      �           �  U  ?  ��  � T�  �C��� %�C�  ���' � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 q � � A A 1                       r       )   �                        2���                              �   %   �       �      �           �  U  /  T�  � � � � ��  � �� ��C� � � �� U	  THIS PARENT
 OTHRESHOLD OBJECT ENABLED VALUE THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 �2                       m       )                           BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      Form1      Command1      commandbutton      "obmp
oclrmatrix
*processimage 
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      SAnchor = 15
Height = 180
Left = 264
Top = 12
Width = 240
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

This.Clear

LOCAL loAttr AS xfcImageAttributes
LOCAL loClrMatrix AS xfcColorMatrix

LOCAL lnGamma, lnThreshold

lnGamma = Thisform.Container1.oGamma.OBJECT.Value
lnThreshold = Thisform.Container1.oThreshold.OBJECT.Value

WITH _SCREEN.System.Drawing
	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetGamma(lnGamma / 100)
	
	IF Thisform.Container1.chkThreshold.Value
		loAttr.SetThreshold(lnThreshold / 100)
	ENDIF 
	loAttr.SetColorMatrix(Thisform.oClrMatrix)
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle, Thisform.oBmp.GetBounds(), 2, loAttr) 
ENDWITH

RETURN
ENDPROC
     ����    �  �                        ��   %         E  
   1          �  U   
 ��  � � U  THIS CHANGE=  ���  � ��& � T�� � �C�  � _�� �� ��C� � � �� U  THIS PARENT LBLTHRESHOLD CAPTION VALUE THISFORM
 IMGCANVAS1 DRAW  T�  � � �-�� U  THIS OBJECT ENABLED Scroll,     �� ChangeK     �� Init�     ��1 � 3 aA 3 1                       >         [   �         �         )   �                       Top = 324
Left = 12
Height = 25
Width = 26
Anchor = 6
Picture = (home() + "/samples/solution/bts.bmp")
Caption = ""
TabIndex = 4
ToolTipText = "To convert to monochrome, select GreyScale and Activate Threshold"
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
      commandbutton      Form1      Command2      commandbutton      checkbox      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
      	container      	container      
Container1      Form1      �Anchor = 6
Top = 240
Left = 12
Width = 492
Height = 84
SpecialEffect = 0
Visible = .T.
TabIndex = 3
Name = "Container1"
      commandbutton      commandbutton      Command1      Form1.Container1      sTop = 12
Left = 12
Height = 25
Width = 98
Anchor = 12
Caption = "GreyScale"
TabIndex = 1
Name = "Command1"
     NPROCEDURE Click
WITH Thisform
	.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New( ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ; 
        0.33, 0.33, 0.33, 0.0, 0.0, ;
        0.0 , 0.0 , 0.0 , 1.0, 0.0, ; 
        0.0 , 0.0 , 0.0 , 0.0, 1.0)
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     r���    Y  Y                        IM   %   �             �           �  U   
 ��  � � U  THIS CHANGE=  ���  � ��& � T�� � �C�  � _�� �� ��C� � � �� U  THIS PARENT LBLGAMMA CAPTION VALUE THISFORM
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 3 aA 2                       >         [   �       )   Y                        }PROCEDURE Click
LOCAL lcFile
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile)
ENDPROC
      commandbutton      Form1.Container1      chkThreshold      checkbox      label      commandbutton      commandbutton      Command7      Form1.Container1      qTop = 48
Left = 12
Height = 25
Width = 98
Anchor = 12
Caption = "Restore"
TabIndex = 2
Name = "Command7"
     (PROCEDURE Click
WITH This.Parent
	.oGamma.Value = 100
	.lblGamma.Caption = "100"
	
	.oThreshold.Value = 50
	.lblThreshold.Caption = "50"

	.chkThreshold.Value = .F.
ENDWITH

Thisform.oClrMatrix = _Screen.System.Drawing.Imaging.ColorMatrix.New()
Thisform.ImgCanvas1.Draw()

ENDPROC
     ���    �  �                        �   %   z      �     �          �  U  �  ���  � ��h � T�� � ��d�� T�� � �� 100�� T�� � ��2�� T�� � �� 50�� T�� � �-�� �� T�	 �
 �C�9� � � � � �� ��C�	 � � �� U  THIS PARENT OGAMMA VALUE LBLGAMMA CAPTION
 OTHRESHOLD LBLTHRESHOLD CHKTHRESHOLD THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 A1� A �2                             )   �                        
olecontrol      
olecontrol      oGamma      Form1.Container1      OTop = 12
Left = 186
Height = 19
Width = 145
TabIndex = 3
Name = "oGamma"
      �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
WITH This.Parent
	.lblGamma.Caption = TRANSFORM(This.Value)
ENDWITH
Thisform.ImgCanvas1.Draw()

ENDPROC
      �Top = 204
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      xPROCEDURE InteractiveChange
This.Parent.oThreshold.OBJECT.Enabled = This.Value
Thisform.Imgcanvas1.Draw()

ENDPROC
      Form1.Container1     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               �͏+���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��            
      �  O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
   
      Max 	   I
   �     Min 	   I
         SelectRange    L       TickFrequency 	   I
   2  c d           2   d   �ͫ    �  1     ��� �3Pw��            Value 	   I
   d                                                                                                               .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      label      label      Label10      Form1.Container1      �AutoSize = .T.
BackStyle = 0
Caption = "Gamma"
Height = 17
Left = 138
Top = 12
Width = 47
TabIndex = 6
Name = "Label10"
      label      label      lblGamma      Form1.Container1      pBackStyle = 0
Caption = "100"
Height = 17
Left = 333
Top = 12
Width = 26
TabIndex = 7
Name = "lblGamma"
      
olecontrol      
olecontrol      
oThreshold      Form1.Container1      STop = 48
Left = 186
Height = 19
Width = 145
TabIndex = 4
Name = "oThreshold"
      PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change

ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
WITH This.Parent
	.lblThreshold.Caption = TRANSFORM(This.Value)
ENDWITH
Thisform.ImgCanvas1.Draw()

ENDPROC
PROCEDURE Init
This.OBJECT.Enabled = .F.
ENDPROC
      �Top = 48
Left = 363
Height = 17
Width = 120
Alignment = 0
Caption = "Activate Threshold"
Value = .T.
TabIndex = 5
Name = "chkThreshold"
      sBackStyle = 0
Caption = "50"
Height = 17
Left = 333
Top = 48
Width = 26
TabIndex = 8
Name = "lblThreshold"
      lblThreshold      label      �AutoSize = .T.
BackStyle = 0
Caption = "Threshold"
Height = 17
Left = 126
Top = 47
Width = 58
TabIndex = 9
Name = "Label2"
      Label2     
 ��ࡱ�                >  ��	                               ����        ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               �͏+���   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       �             ����      ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   �  �  �~��                   d   O                             8                        qhj ZtuQha;jdfn[iaetr                                                    �   SmallChange 	   I
         Max 	   I
   d      Min 	   I
          SelectRange    L       TickFrequency 	   I
   
  c 2           
   2   �ͫ   ��  1     ��� �3Pw��            Value 	   I
   2                                                                                                               .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      label      label      Form1.Container1     S���    :  :                        �   %   �      �     �          �  U  R ���  ��K�0T�� �C���Q��?���Q��?���Q��?�        �        ���Q��?���Q��?���Q��?�        �        ���Q��?���Q��?���Q��?�        �        �        �        �        �      �?�        �        �        �        �        �      �?�9� � � � � �� ��C�� � �� �� U	  THISFORM
 OCLRMATRIX SYSTEM DRAWING IMAGING COLORMATRIX NEW
 IMGCANVAS1 DRAW Click,     ��1 � � A 1                       C      )   :                       7���                              2r   %   �      �     �          �  U  N %�C�  � � ��� � B� �
 �� � � �� Q� XFCIMAGEATTRIBUTES� �� Q� XFCCOLORMATRIX� �� � � T� ��  �	 �
 � � �� T� ��  �	 � � � �� ���9� � ��C� T� �C�� � � �� ��C� �d� � �� %��  �	 � � ��� � ��C� �d� � �� � ��C�  � � � ��- ��C�  � � � C�  � � � � � � � �� �� B� U  THISFORM TXTFILE VALUE THIS CLEAR LOATTR LOCLRMATRIX LNGAMMA LNTHRESHOLD
 CONTAINER1 OGAMMA OBJECT
 OTHRESHOLD SYSTEM DRAWING IMAGING IMAGEATTRIBUTES NEW SETGAMMA CHKTHRESHOLD SETTHRESHOLD SETCOLORMATRIX
 OCLRMATRIX OGFX	 DRAWIMAGE OBMP	 RECTANGLE	 GETBOUNDS
 beforedraw,     ��1 QA A � ��� ��"QAbAA 1�A B 1                       �      )                          ����    �  �                        �   %         ]     ;          �  U  �  ��  � T�  �C�  ��� ��� ��� � ��C�� � � �� ��C�� � � �� T�� � ��  �� T�� �	 ��  ��# T��
 �C� � � �9� � � � �� T�� �C�9� � � � � �� ��C�� � �� �� U  TCFILE THISFORM
 CONTAINER1 OGAMMA SETFOCUS
 OTHRESHOLD TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW
 OCLRMATRIX IMAGING COLORMATRIX
 IMGCANVAS1 DRAW< 	 ��C��� ��C� Cebolinha.png�  � �� ��C�  � � � �� U  THISFORM PROCESSIMAGE
 CONTAINER1 COMMAND1 CLICK processimage,     �� Init�    ��1 q � 1�� A 2 � �11                       t        �  �      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 885804635      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 895307319�      �  �      �                                                           WINDOWS _1TZ0QGKPH 895307288s  �  �  �  �  �      &  E                                               WINDOWS _1TZ05Z6DL 886445546�      �  �  �  �                                                           WINDOWS _1TP0MMFWF 886445423�      �  �  �  �                                                           WINDOWS _1TZ053EID 886465252�	      �	  �	  �	  �	      4
  o                                               WINDOWS _1TZ053EIE 886465252      +  @  P  ]      �  �
                                               WINDOWS _1TZ053EIF 895307306�      �  �  �  �      �  �                                               WINDOWS _1TP0L3VWK 886445499�      �  �  �  �                                                           WINDOWS _1TZ053EIG 886445499{      �  �  {  �                                                           WINDOWS _1TP0L3VWK 886465296n      a  S  F  �                                                           COMMENT RESERVED                                �                                                            L                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      vTop = 20
Left = 14
Height = 280
Width = 400
DoCreate = .T.
Caption = "Gradient BackGround Test"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      PAnchor = 15
Height = 280
Left = 0
Top = 0
Width = 400
Name = "Imgcanvas1"
     uPROCEDURE beforedraw
LOCAL loBrush AS xfcLinearGradientBrush
WITH _Screen.System.Drawing
  loBrush = .Drawing2D.LinearGradientBrush.New(This.Rectangle,;
     .Color.FromRGB(Thisform.Text1.DisabledBackColor), ;
     .Color.FromRGB(Thisform.Text2.DisabledBackColor),;
     Thisform.Spinner1.Value)
  This.oGfx.FillRectangle(loBrush, This.Rectangle)
ENDWITH
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      �AutoSize = .T.
Anchor = 12
BackStyle = 0
Caption = "Gradient Mode"
Height = 17
Left = 252
Top = 228
Width = 82
Name = "Label2"
      Form1      Label2      label      label      Form1      Text2      textbox      label      label      Label3      Form1      �AutoSize = .T.
Anchor = 12
BackStyle = 0
Caption = "Gradient Mode"
Height = 17
Left = 253
Top = 229
Width = 82
ForeColor = 255,255,255
Name = "Label3"
      label      label      Label1      Form1      �FontBold = .T.
FontSize = 22
Anchor = 240
Alignment = 2
BackStyle = 0
Caption = "GDI+ is cool !"
Height = 36
Left = 105
Top = 72
Width = 190
ForeColor = 255,255,255
Name = "Label1"
      commandbutton      commandbutton      Command2      Form1      eTop = 156
Left = 252
Height = 25
Width = 85
Anchor = 12
Caption = "Color 1"
Name = "Command2"
      �PROCEDURE Click
WITH Thisform
	lnColor = GETCOLOR(.Text1.DisabledBackColor)
	.Text1.DisabledBackColor = lnColor
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     5���                              Ƶ   %   �       �      �           �  U  G  ���  ��@ � T� �C�� � ��� T�� � �� �� ��C�� � �� �� U  THISFORM LNCOLOR TEXT2 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � A� A 2                       �       )                           commandbutton      commandbutton      Command3      Form1      eTop = 192
Left = 252
Height = 25
Width = 85
Anchor = 12
Caption = "Color 2"
Name = "Command3"
      �PROCEDURE Click
WITH Thisform
	lnColor = GETCOLOR(.Text2.DisabledBackColor)
	.Text2.DisabledBackColor = lnColor
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     5���                              Ƶ   %   �       �      �           �  U  G  ���  ��@ � T� �C�� � ��� T�� � �� �� ��C�� � �� �� U  THISFORM LNCOLOR TEXT1 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � A� A 2                       �       )                           spinner      spinner      Spinner1      Form1      �Anchor = 12
Height = 25
KeyboardHighValue = 3
KeyboardLowValue = 0
Left = 340
SpinnerHighValue =   3.00
SpinnerLowValue =   0.00
Top = 228
Width = 36
Value = 0
Name = "Spinner1"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      }Anchor = 12
Enabled = .F.
Height = 25
Left = 350
Top = 192
Width = 25
DisabledBackColor = 255,255,255
Name = "Text2"
      textbox      Form1      Text1      textbox      textbox      {Anchor = 12
Enabled = .F.
Height = 25
Left = 350
Top = 156
Width = 25
DisabledBackColor = 0,128,255
Name = "Text1"
     ����    �  �                        N�   %   {      �     �          �  U  � ! ��  Q� XFCLINEARGRADIENTBRUSH� ���9� � ��� �F T�  �C� � C�
 � � �� �	 C�
 � � �� �	 �
 � � �� � � �� ��C �  � � � � � �� �� U  LOBRUSH SYSTEM DRAWING	 DRAWING2D LINEARGRADIENTBRUSH NEW THIS	 RECTANGLE COLOR FROMRGB THISFORM TEXT1 DISABLEDBACKCOLOR TEXT2 SPINNER1 VALUE OGFX FILLRECTANGLE
 beforedraw,     ��1 !d�A 1                       j      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 885804635      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898870635�      �  �      �                                                           WINDOWS _1TZ0QGKPH 898740055�  �  �  �  �  �      F  �/                                               WINDOWS _1U00XBZIA 898870635P      ]  j  x  �                                                           WINDOWS _1TP0L3VWK 898870635�      �      %                                                           WINDOWS _1U002S8C6 890049917�      �  �  �  �      n  �.                                               WINDOWS _1U002S8C7 890049917q      �  �  �  �                                                           WINDOWS _1U002S8C9 890049917;      J  Y  h  z      �                                                 WINDOWS _1TP0MMFWF 890049917�      �      '                                                           WINDOWS _1TZ053EID 898870636�        (  9  F      �  �                                               WINDOWS _1TP0L3VWK 898870636x      �  �  �  �      <  S                                               WINDOWS _1TP0L3VWK 898870636�            *                                                           WINDOWS _1TP0L3VWL 898870636�      �  �  �  �                                                           WINDOWS _1TZ17Q0AA 898870636�      �  �  �  �                                                       WINDOWS _1TZ17Q0AB 8988706363      B  Q  `  m      �   �                                               WINDOWS _1TZ17Q0AE 898870636�!      �!  �!  "  "      �"  �%                                               WINDOWS _1TP0L3VWK 898870636�(      �(  �(  �(  �(                                                           WINDOWS _1TZ17Q0AF 898870636g)      t)  �)  �)  �)                                                           WINDOWS _1U002S8CB 8988706366*      E*  T*  d*  q*      D+  �
                                               WINDOWS _1U002S8CC 898870636,      ,  �!  �!  !,                                                           WINDOWS _1U002S8CD 898870636�!      �!  �!  &  �,                                                           WINDOWS _1U002S8CE 890049917      �  �  �  �+      �   �	                                               WINDOWS _1U002S8CF 890049917b      S  F  4  L                                                           WINDOWS _1U002S8CH 890049917%          >  S-      �  �                                               COMMENT RESERVED                                �                                                            4P                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 20
Left = 14
Height = 375
Width = 425
DoCreate = .T.
Caption = "Gradient BackGround Test"
MinHeight = 150
MinWidth = 300
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      OAnchor = 15
Height = 84
Left = 0
Top = 0
Width = 108
Name = "Imgcanvas1"
     �PROCEDURE draw
DODEFAULT()
Thisform.Image1.PictureVal = This.PictureVal 
ENDPROC
PROCEDURE beforedraw
LOCAL loBrush AS xfcLinearGradientBrush
LOCAL loBlend AS xfcBlend

WITH _Screen.System.Drawing
  loBrush = .Drawing2D.LinearGradientBrush.New(This.Rectangle,;
     .Color.FromRGB(Thisform.Text1.DisabledBackColor), ;
     .Color.FromRGB(Thisform.Text2.DisabledBackColor),;
     Thisform.Spinner1.Value)

	loColorBlend = .Drawing2D.ColorBlend.New(Thisform.spnColors.Value)
	loColorBlend.Colors = .Color.NewArray( ;
		.Color.FromRGB(Thisform.Text1.DisabledBackColor), ;
		.Color.FromRGB(Thisform.Text2.DisabledBackColor), ;
		.Color.FromRGB(Thisform.Cnt3.Text3.DisabledBackColor), ;
		.Color.FromRGB(Thisform.Cnt4.Text4.DisabledBackColor))

	loColorBlend.Positions = _SCREEN.System.Single.NewArray( ; 
			Thisform.spnPos1.Value, ;
			Thisform.spnPos2.Value, ;
			Thisform.Cnt3.spnPos3.Value, ;
			Thisform.Cnt4.spnPos4.Value)

	loBrush.InterpolationColors = loColorBlend

  This.oGfx.FillRectangle(loBrush, This.Rectangle)
ENDWITH

RETURN
ENDPROC
PROCEDURE setup
This.Width = Thisform.Width
This.Height = Thisform.Height
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                        )���                              "g   %   �       �      �           �  U  @  ���  ��9 � T�� � � �C�� � � ��� ��C�� � �� �� U  THISFORM CNT3 TEXT3 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � �� A 2                       �       )                           ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      
Form1.cnt3      image      image      Image1      Form1      ]Anchor = 12
Stretch = 2
Height = 144
Left = 101
Top = 220
Width = 313
Name = "Image1"
      	container      	container      Cnt4      Form1      {Anchor = 12
Top = 330
Left = 221
Width = 184
Height = 25
BackStyle = 0
BorderWidth = 0
TabIndex = 6
Name = "Cnt4"
      commandbutton      commandbutton      	cmdColor4      
Form1.Cnt4      qTop = 0
Left = 13
Height = 25
Width = 85
Anchor = 12
Caption = "Color 4"
TabIndex = 1
Name = "cmdColor4"
      �PROCEDURE Click
WITH Thisform
	lnColor = GETCOLOR(.cnt4.Text4.DisabledBackColor)
	.cnt4.Text4.DisabledBackColor = lnColor
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         spnPos3      spinner      spinner      
Form1.cnt3      Text3      textbox      textbox      textbox      textbox      Text4      
Form1.Cnt4      �Anchor = 12
Enabled = .F.
Height = 25
Left = 106
TabIndex = 2
Top = 0
Width = 25
DisabledBackColor = 0,0,255
Name = "Text4"
      spinner      spinner      spnPos4      
Form1.Cnt4     <Anchor = 12
Enabled = .F.
Height = 25
Increment =   0.10
InputMask = "9.9"
KeyboardHighValue = 1
KeyboardLowValue = 0
Left = 139
SpinnerHighValue =   1.00
SpinnerLowValue =   0.00
TabIndex = 3
Top = 0
Width = 45
DisabledBackColor = 245,245,245
DisabledForeColor = 0,0,0
Value = 1.0
Name = "spnPos4"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         label      label      Label1      Form1      �FontBold = .T.
FontSize = 22
Anchor = 240
Alignment = 2
BackStyle = 0
Caption = "GDI+ is cool !"
Height = 36
Left = 105
Top = 72
Width = 190
TabIndex = 9
ForeColor = 255,255,255
Name = "Label1"
      commandbutton      commandbutton      	cmdColor1      Form1      tTop = 246
Left = 234
Height = 25
Width = 85
Anchor = 12
Caption = "Color 1"
TabIndex = 1
Name = "cmdColor1"
      �PROCEDURE Click
WITH Thisform
	.Text1.DisabledBackColor = GETCOLOR(.Text1.DisabledBackColor)
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���                              /    %   �       �      �           �  U  :  ���  ��3 � T�� � �C�� � ��� ��C�� � �� �� U  THISFORM TEXT2 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � �� A 2                       ~       )                           commandbutton      commandbutton      	cmdColor2      Form1      tTop = 274
Left = 234
Height = 25
Width = 85
Anchor = 12
Caption = "Color 2"
TabIndex = 3
Name = "cmdColor2"
      �PROCEDURE Click
WITH Thisform
	.Text2.DisabledBackColor = GETCOLOR(.Text2.DisabledBackColor)
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���                              /    %   �       �      �           �  U  :  ���  ��3 � T�� � �C�� � ��� ��C�� � �� �� U  THISFORM TEXT1 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � �� A 2                       ~       )                           textbox      textbox      Text1      Form1      �Anchor = 12
Enabled = .F.
Height = 25
Left = 327
TabIndex = 10
Top = 246
Width = 25
DisabledBackColor = 255,0,0
Name = "Text1"
      textbox      textbox      Text2      Form1      �Anchor = 12
Enabled = .F.
Height = 25
Left = 327
TabIndex = 11
Top = 274
Width = 25
DisabledBackColor = 255,255,0
Name = "Text2"
      spinner      spinner      spnPos1      Form1     <Anchor = 12
Enabled = .F.
Height = 25
Increment =   0.10
InputMask = "9.9"
KeyboardHighValue = 1
KeyboardLowValue = 0
Left = 360
SpinnerHighValue =   1.00
SpinnerLowValue =   0.00
TabIndex = 2
Top = 246
Width = 45
DisabledBackColor = 245,245,245
DisabledForeColor = 0,0,0
Value = 0
Name = "spnPos1"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      �Anchor = 12
Enabled = .F.
Height = 25
Left = 106
TabIndex = 2
Top = 0
Width = 25
DisabledBackColor = 0,255,0
Name = "Text3"
      
Form1.cnt3      	cmdColor3      commandbutton      commandbutton      Form1      spinner      spinner      spnPos2      Form1     /Anchor = 12
Height = 25
Increment =   0.10
InputMask = "9.9"
KeyboardHighValue = 1
KeyboardLowValue = 0
Left = 360
SpinnerHighValue =   1.00
SpinnerLowValue =   0.00
TabIndex = 4
Top = 274
Width = 45
DisabledBackColor = 245,245,245
DisabledForeColor = 0,0,0
Value = 0.3
Name = "spnPos2"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      �PROCEDURE Click
WITH Thisform
	.Cnt3.Text3.DisabledBackColor = GETCOLOR(.cnt3.Text3.DisabledBackColor)
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      cnt3      	container      	container      Form1      Label2      spinner      spinner      	spnColors      Form1      �Anchor = 12
Height = 25
KeyboardHighValue = 4
KeyboardLowValue = 2
Left = 185
SpinnerHighValue =   4.00
SpinnerLowValue =   2.00
TabIndex = 7
Top = 246
Width = 36
Value = 4
Name = "spnColors"
     �PROCEDURE InteractiveChange
DO CASE 
	CASE This.Value = 4
		Thisform.SpnPos2.Value = .33
		Thisform.SpnPos2.Enabled = .T.
		
		Thisform.Cnt3.SpnPos3.Value = .67
		Thisform.Cnt3.Visible = .T.
		Thisform.Cnt3.SpnPos3.Enabled = .T.
		
		Thisform.Cnt4.Visible = .T. 

	
	CASE This.Value = 3
		Thisform.SpnPos2.Value = .5
		Thisform.SpnPos2.Enabled = .T.

		Thisform.Cnt3.Visible = .T.
		Thisform.Cnt3.SpnPos3.Value = 1		
		Thisform.Cnt3.SpnPos3.Enabled = .F.

		Thisform.Cnt4.Visible = .F. 

	CASE This.Value = 2
		Thisform.SpnPos2.Value = 1
		Thisform.SpnPos2.Enabled = .F.

		Thisform.Cnt3.Visible = .F.

		Thisform.Cnt4.Visible = .F. 

		
ENDCASE 	
Thisform.imgcanvas1.Draw()
ENDPROC
     ����    �  �                        �W   %   '      r     B          �  U  � H� ��� ��  � ���� � T� � � ����Q��?�� T� � � �a�� T� � � � ��q=
ףp�?�� T� � � �a�� T� � � � �a�� T� � � �a�� ��  � ���-� T� � � ��      �?�� T� � � �a�� T� � � �a�� T� � � � ���� T� � � � �-�� T� � � �-�� ��  � ����� T� � � ���� T� � � �-�� T� � � �-�� T� � � �-�� � ��C� �	 �
 �� U  THIS VALUE THISFORM SPNPOS2 ENABLED CNT3 SPNPOS3 VISIBLE CNT4
 IMGCANVAS1 DRAW InteractiveChange,     ��1 � A��AC�aAB1C 1                       �      )   �                        label      label      Label4      Form1      �AutoSize = .T.
Anchor = 12
BackStyle = 0
Caption = "Colors (2-4)"
Height = 17
Left = 113
Top = 246
Width = 68
TabIndex = 12
Name = "Label4"
      label      label      Label5      Form1      �AutoSize = .T.
Anchor = 12
BackStyle = 0
Caption = "Position"
Height = 17
Left = 360
Top = 226
Width = 47
TabIndex = 13
Name = "Label5"
      spinner      spinner      Spinner1      Form1      �Anchor = 12
Height = 25
KeyboardHighValue = 3
KeyboardLowValue = 0
Left = 185
SpinnerHighValue =   3.00
SpinnerLowValue =   0.00
TabIndex = 8
Top = 302
Width = 36
Value = 0
Name = "Spinner1"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      qTop = 0
Left = 13
Height = 25
Width = 85
Anchor = 12
Caption = "Color 3"
TabIndex = 1
Name = "cmdColor3"
      label      label      �AutoSize = .F.
Anchor = 12
WordWrap = .T.
BackStyle = 0
Caption = "Gradient Mode"
Height = 36
Left = 132
Top = 302
Width = 53
TabIndex = 14
Name = "Label2"
      {Anchor = 12
Top = 302
Left = 221
Width = 184
Height = 25
BackStyle = 0
BorderWidth = 0
TabIndex = 5
Name = "cnt3"
     -Anchor = 12
Height = 25
Increment =   0.10
InputMask = "9.9"
KeyboardHighValue = 1
KeyboardLowValue = 0
Left = 139
SpinnerHighValue =   1.00
SpinnerLowValue =   0.00
TabIndex = 3
Top = 0
Width = 45
DisabledBackColor = 245,245,245
DisabledForeColor = 0,0,0
Value = 0.7
Name = "spnPos3"
     A���    (  (                        i�   %   �       �      �           �  U  M  ���  ��F � T� �C�� � � ��� T�� � � �� �� ��C�� � �� �� U  THISFORM LNCOLOR CNT4 TEXT4 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � qA� A 2                       �       )   (                       w���    ^  ^                        T�   %   �      �     �          �  U  " 	 ��C��� T�  � � �� � �� U  THISFORM IMAGE1
 PICTUREVAL THIS�! ��  Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCBLEND� ���9� � ��v�F T�  �C� � C� � � ��	 �
 C� � � ��	 �
 � � � �� � � �� T� �C� � � �� � � ��_ T� � �CC� � � ��	 �
 C� � � ��	 �
 C� � � � ��	 �
 C� � � � ��	 �
 ��	 � ��C T� � �C� � � � � � � � � � � � � � �9� � � �� T�  �  �� �� ��C �  � � � �! �" �� �� B� U#  LOBRUSH LOBLEND SYSTEM DRAWING	 DRAWING2D LINEARGRADIENTBRUSH NEW THIS	 RECTANGLE COLOR FROMRGB THISFORM TEXT1 DISABLEDBACKCOLOR TEXT2 SPINNER1 VALUE LOCOLORBLEND
 COLORBLEND	 SPNCOLORS COLORS NEWARRAY CNT3 TEXT3 CNT4 TEXT4	 POSITIONS SINGLE SPNPOS1 SPNPOS2 SPNPOS3 SPNPOS4 INTERPOLATIONCOLORS OGFX FILLRECTANGLE)  T�  � �� � �� T�  � �� � �� U  THIS WIDTH THISFORM HEIGHT draw,     ��
 beforedrawv     �� setupR    ��1 � a2 1"d��6�A B 2 111                       J         k   -        I  �  #    )   ^                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 885804635      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898739983�      �  �      �      �  ;                                               WINDOWS _1U01DXNFP 890049934�      �  �                                                               WINDOWS _1TZ0QGKPH 898739983�  �      #  0      �  p)                                               WINDOWS _1TP0L3VWK 890049934�      �  �  �  �                                                           WINDOWS _1TZ053EID 890049934�      �  �  �        ~                                                 WINDOWS _1TP0L3VWK 8900499344      I  ^  o  |      �  �                                               WINDOWS _1TP0L3VWK 890049934�      �  �  �  �                                                           WINDOWS _1TP0L3VWL 890049934s      �  �  �  �                                                           WINDOWS _1U002S8CB 8987399838      G  V  f  s      F  �                                               WINDOWS _1TP0L3VWK 890049934n      {  �  a  �                                                           WINDOWS _1U01DE1U6 890049934D      V  �  �  	          h  �                                       WINDOWS _1U01DVAOW 890049934�      |  n  a  �                                                           COMMENT RESERVED                                8                                                            -b                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 20
Left = 14
Height = 375
Width = 455
DoCreate = .T.
Caption = "Gradient BackGround Color Intensity Sample"
Name = "Form1"
     �PROCEDURE Resize
IF Thisform.Spinner1.Value = 2  && sldVertical 
	Thisform.oleSlide.Left = 0
	Thisform.oleSlide.Top = 0
	Thisform.oleSlide.Height = Thisform.Height
	Thisform.oleSlide.Width = 46	
ELSE  && sldHorizontal 
	Thisform.oleSlide.Left = 0
	Thisform.oleSlide.Top = Thisform.Height - 46
	Thisform.oleSlide.Width = Thisform.Width
	Thisform.oleSlide.Height = 46
ENDIF
ENDPROC
     ���                              �]   %   ~       �      �           �  U   
 ��  � � U  THIS CHANGE  ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Scroll,     �� ChangeK     ��1 � 2 1                       <         Y   �       )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      Label3      label      label      .OLEObject = C:\WINDOWS\system32\comctl32.ocx
      Form1      label      label      Label4      Form1      �AutoSize = .F.
Anchor = 12
WordWrap = .T.
BackStyle = 0
Caption = "Gradient Mode"
Height = 36
Left = 228
Top = 249
Width = 53
TabIndex = 8
ForeColor = 255,255,255
Name = "Label4"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      OAnchor = 15
Height = 84
Left = 0
Top = 0
Width = 108
Name = "Imgcanvas1"
     'PROCEDURE setup
This.Top = 0
This.Left = 0
This.Width = Thisform.Width
This.Height = Thisform.Height
This.ZOrder(1)
ENDPROC
PROCEDURE beforedraw
LOCAL loBrush AS xfcLinearGradientBrush
LOCAL loBlend AS xfcBlend
LOCAL lnFactor

WITH _Screen.System.Drawing
	loBrush = .Drawing2D.LinearGradientBrush.New(This.Rectangle,;
		.Color.FromRGB(Thisform.Text1.DisabledBackColor), ;
		.Color.FromRGB(Thisform.Text2.DisabledBackColor),;
		Thisform.Spinner1.Value)

	loBlend = .Drawing2D.Blend.New(2)
	lnFactor = Thisform.oleSlide.Object.Value / 100
	loBlend.Factors =   _SCREEN.System.Single.NewArray(0.0, 0.5, 1.0)
	loBlend.Positions = _SCREEN.System.Single.NewArray(0.0, lnFactor, 1.0)
	loBrush.Blend = m.loBlend

	This.oGfx.FillRectangle(loBrush, This.Rectangle)
ENDWITH

RETURN
ENDPROC
     %���                                  %   �      �     �          �  U  �  %��  � ���v � T� � � ���� T� � � �� �� T� � � �� �� T� � � �� � �� T� � � ��.�� �� � T� � � �� �� T� � � �� �� T� � � �� � �.�� T� � � �� � �� T� � � ��.�� � ��C� �	 �
 �� U  THIS VALUE THISFORM OLESLIDE ORIENTATION LEFT TOP HEIGHT WIDTH
 IMGCANVAS1 DRAW InteractiveChange,     ��1 A111a1� 11�a1A 1                       �      )                          ���                              /    %   �       �      �           �  U  :  ���  ��3 � T�� � �C�� � ��� ��C�� � �� �� U  THISFORM TEXT2 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � �� A 2                       ~       )                           �PROCEDURE Scroll
*** ActiveX Control Event ***
This.Change
ENDPROC
PROCEDURE Change
*** ActiveX Control Event ***
Thisform.imgcanvas1.Draw()
ENDPROC
      label      label      Label1      Form1      �FontBold = .T.
FontSize = 22
Anchor = 240
Alignment = 2
BackStyle = 0
Caption = "GDI+ is cool !"
Height = 36
Left = 132
Top = 105
Width = 190
TabIndex = 9
ForeColor = 255,255,255
Name = "Label1"
      commandbutton      commandbutton      	cmdColor1      Form1      tTop = 247
Left = 327
Height = 25
Width = 85
Anchor = 12
Caption = "Color 1"
TabIndex = 1
Name = "cmdColor1"
      �PROCEDURE Click
WITH Thisform
	.Text1.DisabledBackColor = GETCOLOR(.Text1.DisabledBackColor)
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���                              /    %   �       �      �           �  U  :  ���  ��3 � T�� � �C�� � ��� ��C�� � �� �� U  THISFORM TEXT1 DISABLEDBACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 � �� A 2                       ~       )                           commandbutton      commandbutton      	cmdColor2      Form1      tTop = 275
Left = 327
Height = 25
Width = 85
Anchor = 12
Caption = "Color 2"
TabIndex = 3
Name = "cmdColor2"
      �PROCEDURE Click
WITH Thisform
	.Text2.DisabledBackColor = GETCOLOR(.Text2.DisabledBackColor)
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     AutoSize = .T.
FontBold = .F.
FontSize = 12
Anchor = 12
Alignment = 0
BackStyle = 0
Caption = "Move the slidebar to change the half intensity color point"
Height = 21
Left = 60
Top = 307
Width = 386
TabIndex = 10
ForeColor = 255,255,255
Name = "Label3"
      oleSlide      textbox      textbox      Text1      Form1      �Anchor = 12
Enabled = .F.
Height = 25
Left = 420
TabIndex = 2
Top = 247
Width = 25
DisabledBackColor = 255,0,0
Name = "Text1"
      textbox      textbox      Text2      Form1      �Anchor = 12
Enabled = .F.
Height = 25
Left = 420
TabIndex = 4
Top = 275
Width = 25
DisabledBackColor = 0,0,0
Name = "Text2"
      spinner      spinner      Spinner1      Form1      �Anchor = 12
Height = 25
KeyboardHighValue = 3
KeyboardLowValue = 0
Left = 279
SpinnerHighValue =   3.00
SpinnerLowValue =   0.00
TabIndex = 5
Top = 247
Width = 36
Value = 0
Name = "Spinner1"
     �PROCEDURE InteractiveChange
IF This.Value = 1
	Thisform.oleSlide.Orientation = 1  && sldVertical 
	Thisform.oleSlide.Left = 0
	Thisform.oleSlide.Top = 0
	Thisform.oleSlide.Height = Thisform.Height
	Thisform.oleSlide.Width = 46	
ELSE
	Thisform.oleSlide.Orientation = 0  && sldHorizontal 
	Thisform.oleSlide.Left = 0
	Thisform.oleSlide.Top = Thisform.Height - 46
	Thisform.oleSlide.Width = Thisform.Width
	Thisform.oleSlide.Height = 46
ENDIF

Thisform.imgcanvas1.Draw()
ENDPROC
     ����    �  �                        �   %   :      d     J          �  U  �  %��  � � ���f � T�  � � �� �� T�  � � �� �� T�  � � ��  � �� T�  � � ��.�� �� � T�  � � �� �� T�  � � ��  � �.�� T�  � � ��  � �� T�  � � ��.�� � U  THISFORM SPINNER1 VALUE OLESLIDE LEFT TOP HEIGHT WIDTH Resize,     ��1 q11a1� 1�a1A 1                       ~      )   �                        PTop = 336
Left = 0
Height = 45
Width = 455
TabIndex = 7
Name = "oleSlide"
      Form1      label      label      Label2      �AutoSize = .F.
Anchor = 12
WordWrap = .T.
BackStyle = 0
Caption = "Gradient Mode"
Height = 36
Left = 226
Top = 247
Width = 53
TabIndex = 6
Name = "Label2"
      
olecontrol      
olecontrol      ��ࡱ�                >  ��	                               ����        ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������   ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               ��JP"�   �       O l e O b j e c t D a t a                                            ����                                        �        A c c e s s O b j S i t e D a t a                             &  ������������                                       O        C h a n g e d P r o p s                                         ������������                                       B            ����            	   ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������?7����  +/OZ!C4   /  �  �~��         
          d   O                             8                        qhj ZtuQha;jdfn[iaetr                                              �   LargeChange 	   I
   
      SmallChange 	   I
         Max 	   I
   d      Min 	   I
          SelectRange    L   	   SelStart 	   I
   2   
   SelLength 	   I
       
   TickStyle 	   I
         TickFrequency 	   I
   
      Value 	   I
   2      MousePointer 	   I
          OLEDropMode 	   I
     ��  2          
   2   �ͫ   �/        ��� �3Pw��                                                                                                              @| Y� m � �  � � �       �� `� ����      �dv          �� %                       �      `   `     "!�      !    @      %                              al     X l    8 8     � (�                                                                              �                                                             ����    �  �                        �k   %   +      x     N          �  U  Y  T�  � �� �� T�  � �� �� T�  � �� � �� T�  � �� � �� ��C��  � �� U  THIS TOP LEFT WIDTH THISFORM HEIGHT ZORDERi! ��  Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCBLEND� �� � ���9� � ��^�F T�  �C� �	 C� � � ��
 � C� � � ��
 � � � � �� � � �� T� �C��� � � �� T� �� � � � �d��: T� � �C�        �      �?�      �?�9� � � ��3 T� � �C�         � �      �?�9� � � �� T�  � ��� �� ��C �  � �	 � � � �� �� B� U  LOBRUSH LOBLEND LNFACTOR SYSTEM DRAWING	 DRAWING2D LINEARGRADIENTBRUSH NEW THIS	 RECTANGLE COLOR FROMRGB THISFORM TEXT1 DISABLEDBACKCOLOR TEXT2 SPINNER1 VALUE BLEND OLESLIDE OBJECT FACTORS SINGLE NEWARRAY	 POSITIONS OGFX FILLRECTANGLE setup,     ��
 beforedraw�     ��1 112 1q "d���1!�A B 1                       x         �         )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 885894747�      �  �      �                                                           WINDOWS _1TO03RZRT 885894747H  Y  w  �  �  �        �                                               WINDOWS _1TO033EQ8 885721939�      �  �  |  �      <  )                                               COMMENT RESERVED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      KTop = -1
Left = 0
DoCreate = .T.
Caption = "Gradients"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      cAnchor = 15
Height = 252
Left = -1
Top = -1
Width = 377
usememory = .F.
Name = "Imgcanvas1"
     PROCEDURE beforedraw
WITH _SCREEN.SYSTEM.drawing
	DO CASE
		CASE THISFORM.optiongroup1.VALUE = 1
			br = .drawing2d.LinearGradientBrush.New(This.Rectangle,.COLOR.White,.COLOR.FromRGB(RGB(0,0,0)),45.0,.T.)
			THIS.oGfx.FillRectangle(br, This.Rectangle)
			br.RotateTransform(108, 1) && 1 = MatrixOrder.Append
			p= .PEN.New(br,15)
			THIS.oGfx.DrawLine(p,0,0,THIS.WIDTH,THIS.HEIGHT)
			p.Dispose()
			br.Dispose()

		CASE THISFORM.optiongroup1.VALUE = 2
			br = .drawing2d.LinearGradientBrush.New(This.Rectangle, .COLOR.White, .COLOR.Blue, 0, .F.)
			br.SetBlendTriangularShape(0.5, 1.0)
			This.oGfx.FillRectangle(br, This.Rectangle)
			br.Dispose()

		CASE THISFORM.optiongroup1.VALUE = 3
			br = .drawing2d.LinearGradientBrush.New(This.Rectangle,.COLOR.Yellow,.COLOR.Blue,0,.F.)
			br.SetSigmaBellShape(0.5,1.0)
			This.oGfx.FillRectangle(br,This.Rectangle)
			br.Dispose()

		CASE THISFORM.optiongroup1.VALUE = 4
			br = .drawing2d.LinearGradientBrush.New(This.Rectangle,.COLOR.Black,.COLOR.White,0,.F.)
			bl=.Drawing2d.Blend.New()
			bl.Factors = _Screen.System.Single.NewArray(0,0.1,0.5,0.7,1.0,0,1.0,0.5,0.3,0.2,0)
			bl.Positions = _Screen.System.Single.NewArray(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0)
			br.Blend=bl
			This.oGfx.FillRectangle(br,This.Rectangle)
			br.Dispose()

		CASE THISFORM.optiongroup1.VALUE = 5
			br = .drawing2d.LinearGradientBrush.New(This.Rectangle,.COLOR.Black,.COLOR.Black,0,.F.)
			cb = .Drawing2d.ColorBlend.New(7)
			FOR F = 1 TO  7
				cb.Positions[F] = (F - 1)/6
				cb.Colors = .Color.NewArray(.Color.Red, .Color.Orange, .Color.Yellow, ;
						.Color.Green, .Color.Blue, .Color.Indigo, .Color.Violet)
				br.InterpolationColors = cb
				This.oGfx.FillRectangle(br,This.Rectangle)
			ENDFOR
	ENDCASE
ENDWITH

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
     �ButtonCount = 5
Value = 1
Height = 103
Left = 28
Top = 28
Width = 86
Themes = .T.
Name = "Optiongroup1"
Option1.Caption = "Example 1"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 76
Option1.Themes = .T.
Option1.Name = "Option1"
Option2.Caption = "Example 2"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 76
Option2.AutoSize = .F.
Option2.Themes = .T.
Option2.Name = "Option2"
Option3.Caption = "Example 3"
Option3.Height = 17
Option3.Left = 5
Option3.Top = 43
Option3.Width = 76
Option3.AutoSize = .F.
Option3.Themes = .T.
Option3.Name = "Option3"
Option4.Caption = "Example 4"
Option4.Height = 17
Option4.Left = 5
Option4.Top = 62
Option4.Width = 76
Option4.AutoSize = .F.
Option4.Themes = .T.
Option4.Name = "Option4"
Option5.Caption = "Example 5"
Option5.Height = 17
Option5.Left = 5
Option5.Top = 81
Option5.Width = 76
Option5.AutoSize = .F.
Option5.Themes = .T.
Option5.Name = "Option5"
      Form1      Optiongroup1      optiongroup      optiongroup     N���    5  5                        Y   %   �      �  )   �          �  U  � ���9�  � ���� H� ��� �� � � ���� �B T� �C�	 �
 �� � CC� � � �^�� � �     �F@a�� � � �� ��C � �	 �
 �	 � � �� ��C�l�� � �� T� �C � ��� � ��& ��C � � � �	 � �	 � �	 � � �� ��C� � �� ��C� � �� �� � � �����- T� �C�	 �
 �� � �� � � -�� � � ��# ��C�      �?�      �?� � �� ��C � �	 �
 �	 � � �� ��C� � �� �� � � ����- T� �C�	 �
 �� � �� � � -�� � � ��# ��C�      �?�      �?� � �� ��C � �	 �
 �	 � � �� ��C� � �� �� � � �����- T� �C�	 �
 �� � �� � � -�� � � �� T� �C�� � � ��z T� � �C� ��������?�      �?�ffffff�?�      �?� �      �?�      �?�333333�?��������?� �9�  � �  ��� T� �! �C� ��������?��������?�333333�?��������?�      �?�333333�?�ffffff�?��������?��������?�      �?�9�  � �  �� T� � �� �� ��C � �	 �
 �	 � � �� ��C� � �� �� � � �����- T� �C�	 �
 �� � �� � � -�� � � �� T�" �C��� �# � �� ��$ ���(������ T�" �! ��$ ���$ ����F T�" �% �C�� �& �� �' �� � �� �( �� � �� �) �� �* �� �  �� T� �+ ��" �� ��C � �	 �
 �	 � � �� �� � �� U,  SYSTEM DRAWING THISFORM OPTIONGROUP1 VALUE BR	 DRAWING2D LINEARGRADIENTBRUSH NEW THIS	 RECTANGLE COLOR WHITE FROMRGB OGFX FILLRECTANGLE ROTATETRANSFORM P PEN DRAWLINE WIDTH HEIGHT DISPOSE BLUE SETBLENDTRIANGULARSHAPE YELLOW SETSIGMABELLSHAPE BLACK BL BLEND FACTORS SINGLE NEWARRAY	 POSITIONS CB
 COLORBLEND F COLORS RED ORANGE GREEN INDIGO VIOLET INTERPOLATIONCOLORS
 beforedraw,     ��1 !� q!�1�a� � r�1�� r�1�� r�Q���� r��q�b�A A A 2                             )   5                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KHV1F 889015351      /  F      ]                          �      �                       WINDOWS _1V00KHV1G 942183482�      �  �      �      f  �                                               WINDOWS _1V00KHV1H 889015398q      �  �  �  �                                                           WINDOWS _1V00KHV1I 898739913        ,  ?  L      �  `                                               WINDOWS _1V00KHV1J 898739913�      �  �  �  �      8  �                                               COMMENT RESERVED                                                                                            ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      iHeight = 308
Width = 449
DoCreate = .T.
AutoCenter = .T.
Caption = "ImageCodecInfo"
Name = "Form1"
      ;PROCEDURE Init
DO (LOCFILE("System.app"))



ENDPROC
      ����    �   �                         �L   %   J       ^      X           �  U    �C�
 System.app��� U   Init,     ��1 q4                       0       )   �                         editbox      editbox      txtData      Form1      OAnchor = 15
Height = 240
Left = 12
Top = 48
Width = 420
Name = "txtData"
      commandbutton      commandbutton      cmdGetCodec      Form1      ^Top = 12
Left = 12
Height = 27
Width = 84
Caption = "Get Encoders"
Name = "cmdGetCodec"
     !PROCEDURE Click
#DEFINE CRLF CHR(13)+CHR(10)

LOCAL loEncoder AS xfcImageCodecInfo
LOCAL loEncoders AS Collection

loEncoders = _SCREEN.System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders()

WITH This.Parent.txtData

	.Value = "IMAGE ENCODERS ------------------------"+CRLF+CRLF
	
	FOR EACH loEncoder IN loEncoders FOXOBJECT
		.Value = .Value + " CODEC: "+loEncoder.CodecName+CRLF
		.Value = .Value + "     Mime Type: "+loEncoder.MimeType+CRLF
		.Value = .Value + "     Format: "+loEncoder.FormatDescription+CRLF
		.Value = .Value + "     Extensions: "+loEncoder.FilenameExtension+CRLF
		.Value = .Value + "     Clsid: "+loEncoder.Clsid.ToString()+CRLF
		.Value = .Value + "     FormatID: "+loEncoder.FormatID.ToString()+CRLF
		.Value = .Value + CRLF
	ENDFOR
ENDWITH
ENDPROC
     ����    �  �                        ��   %         H     &          �  U    ��  Q� XFCIMAGECODECINFO� �� Q�
 COLLECTION� T� �C�9� � � � � �� ��� � �	 ���M T��
 ��' IMAGE DECODERS ------------------------C� C�
 C� C�
 �� ��  � ���. T��
 ���
 �  CODEC: �  � C� C�
 ��6 T��
 ���
 �      Mime Type: �  � C� C�
 ��3 T��
 ���
 �      Format: �  � C� C�
 ��7 T��
 ���
 �      Extensions: �  � C� C�
 ��6 T��
 ���
 �      Clsid: C�  � � C� C�
 ��9 T��
 ���
 �      FormatID: C�  � � C� C�
 �� T��
 ���
 C� C�
 �� �� �� U 	 LOENCODER
 LOENCODERS SYSTEM DRAWING IMAGING IMAGECODECINFO GETIMAGEDECODERS THIS PARENT TXTDATA VALUE	 CODECNAME MIMETYPE FORMATDESCRIPTION FILENAMEEXTENSION CLSID TOSTRING FORMATID Click,     ��1 �Q�2��a1qa��A A 1                             )   �                        commandbutton      commandbutton      Command1      Form1      \Top = 12
Left = 108
Height = 27
Width = 84
Caption = "Get Decoders"
Name = "Command1"
      PROCEDURE Click
#DEFINE CRLF CHR(13)+CHR(10)

LOCAL loEncoder AS xfcImageCodecInfo
LOCAL loEncoders AS Collection

loEncoders = _SCREEN.System.Drawing.Imaging.ImageCodecInfo.GetImageDecoders()

WITH This.Parent.txtData

	.Value = "IMAGE DECODERS ------------------------"+CRLF+CRLF

	FOR EACH loEncoder IN loEncoders FOXOBJECT
		.Value = .Value + " CODEC: "+loEncoder.CodecName+CRLF
		.Value = .Value + "     Mime Type: "+loEncoder.MimeType+CRLF
		.Value = .Value + "     Format: "+loEncoder.FormatDescription+CRLF
		.Value = .Value + "     Extensions: "+loEncoder.FilenameExtension+CRLF
		.Value = .Value + "     Clsid: "+loEncoder.Clsid.ToString()+CRLF
		.Value = .Value + "     FormatID: "+loEncoder.FormatID.ToString()+CRLF
		.Value = .Value + CRLF
	ENDFOR
ENDWITH
ENDPROC
     ����    �  �                        ��   %         H     &          �  U    ��  Q� XFCIMAGECODECINFO� �� Q�
 COLLECTION� T� �C�9� � � � � �� ��� � �	 ���M T��
 ��' IMAGE ENCODERS ------------------------C� C�
 C� C�
 �� ��  � ���. T��
 ���
 �  CODEC: �  � C� C�
 ��6 T��
 ���
 �      Mime Type: �  � C� C�
 ��3 T��
 ���
 �      Format: �  � C� C�
 ��7 T��
 ���
 �      Extensions: �  � C� C�
 ��6 T��
 ���
 �      Clsid: C�  � � C� C�
 ��9 T��
 ���
 �      FormatID: C�  � � C� C�
 �� T��
 ���
 C� C�
 �� �� �� U 	 LOENCODER
 LOENCODERS SYSTEM DRAWING IMAGING IMAGECODECINFO GETIMAGEENCODERS THIS PARENT TXTDATA VALUE	 CODECNAME MIMETYPE FORMATDESCRIPTION FILENAMEEXTENSION CLSID TOSTRING FORMATID Click,     ��1 �Q�2��a1qa��A A 1                             )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KS387 889015606      /  F      ]                          �      �                       WINDOWS _1V00KS388 942183484�      �  �      �      h  :W                  %W                           WINDOWS _1V00KS389 890049940W      W  �V  �V  �V                                                           WINDOWS _1V00KS38A 890049940rV      ]V  NV  AV  �U       U  6R                                               WINDOWS _1V00KS38B 923480980U      U  �T  �T  VT                                                           WINDOWS _1V00KS38C 890049940IT      <T  .T  !T  �S                                                           COMMENT RESERVED                                sS                                                            ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      kHeight = 258
Width = 375
DoCreate = .T.
AutoCenter = .T.
Caption = "Image Properties"
Name = "Form1"
     N�PROCEDURE loadprops
DO (LOCFILE("System.app"))


LOCAL loImg AS xfcImage
LOCAL loProp AS xfcPropertyItem
LOCAL lnProp, lcPropName

This.lstProp.Clear()

WAIT WINDOW NOWAIT NOCLEAR "Loading Image..."

loImg = _SCREEN.System.Drawing.Image.FromFile(This.txtFile.Value)

** Initialize the array...
xxx = loImg.PropertyIdList[1]

IF VARTYPE(xxx) == "N" && a NULL is returned when no properties are found

	FOR EACH lnProp IN loImg.PropertyIdList
		loProp = loImg.GetPropertyItem(lnProp)
		IF SEEK(loProp.Id, "crsProps", "idvalue")
			lcPropName = crsProps.propname
		ELSE
			lcPropname = TRANSFORM(loProp.Id,"@0")
		ENDIF
	
		This.lstProp.AddItem(lcPropName)
		This.lstProp.List[This.lstProp.NewIndex, 2] = loProp.ToString()
	ENDFOR
ELSE
	This.lstProp.AddItem("No properties available for this image !")
ENDIF 

WAIT CLEAR

loProp = NULL
loImg = NULL
		
ENDPROC
PROCEDURE Init


		CREATE CURSOR crsProps (PropName v(50), IDValue I)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsVer", 0x0000)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsLatitudeRef", 0x0001)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsLatitude", 0x0002)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsLongitudeRef", 0x0003)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsLongitude", 0x0004)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsAltitudeRef", 0x0005)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsAltitude", 0x0006)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsGpsTime", 0x0007)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsGpsSatellites", 0x0008)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsGpsStatus", 0x0009)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsGpsMeasureMode", 0x000A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsGpsDop", 0x000B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsSpeedRef", 0x000C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsSpeed", 0x000D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsTrackRef", 0x000E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsTrack", 0x000F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsImgDirRef", 0x0010)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsImgDir", 0x0011)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsMapDatum", 0x0012)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestLatRef", 0x0013)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestLat", 0x0014)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestLongRef", 0x0015)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestLong", 0x0016)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestBearRef", 0x0017)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestBear", 0x0018)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestDistRef", 0x0019)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsDestDist", 0x001A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagNewSubfileType", 0x00FE)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSubfileType", 0x00FF)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagImageWidth", 0x0100)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagImageHeight", 0x0101)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagBitsPerSample", 0x0102)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagCompression", 0x0103)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPhotometricInterp", 0x0106)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThreshHolding", 0x0107)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagCellWidth", 0x0108)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagCellHeight", 0x0109)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagFillOrder", 0x010A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagDocumentName", 0x010D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagImageDescription", 0x010E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagEquipMake", 0x010F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagEquipModel", 0x0110)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagStripOffsets", 0x0111)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagOrientation", 0x0112)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSamplesPerPixel", 0x0115)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagRowsPerStrip", 0x0116)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagStripBytesCount", 0x0117)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagMinSampleValue", 0x0118)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagMaxSampleValue", 0x0119)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagXResolution", 0x011A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagYResolution", 0x011B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPlanarConfig", 0x011C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPageName", 0x011D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagXPosition", 0x011E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagYPosition", 0x011F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagFreeOffset", 0x0120)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagFreeByteCounts", 0x0121)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGrayResponseUnit", 0x0122)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGrayResponseCurve", 0x0123)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagT4Option", 0x0124)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagT6Option", 0x0125)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagResolutionUnit", 0x0128)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPageNumber", 0x0129)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTransferFunction", 0x012D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSoftwareUsed", 0x0131)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagDateTime", 0x0132)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagArtist", 0x013B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHostComputer", 0x013C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPredictor", 0x013D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagWhitePoint", 0x013E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrimaryChromaticities", 0x013F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagColorMap", 0x0140)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneHints", 0x0141)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTileWidth", 0x0142)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTileLength", 0x0143)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTileOffset", 0x0144)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTileByteCounts", 0x0145)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagInkSet", 0x014C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagInkNames", 0x014D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagNumberOfInks", 0x014E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagDotRange", 0x0150)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTargetPrinter", 0x0151)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExtraSamples", 0x0152)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSampleFormat", 0x0153)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSMinSampleValue", 0x0154)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSMaxSampleValue", 0x0155)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagTransferRange", 0x0156)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGProc", 0x0200)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGInterFormat", 0x0201)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGInterLength", 0x0202)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGRestartInterval", 0x0203)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGLosslessPredictors", 0x0205)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGPointTransforms", 0x0206)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGQTables", 0x0207)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGDCTables", 0x0208)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGACTables", 0x0209)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagYCbCrCoefficients", 0x0211)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagYCbCrSubsampling", 0x0212)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagYCbCrPositioning", 0x0213)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagREFBlackWhite", 0x0214)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGamma", 0x0301)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagICCProfileDescriptor", 0x0302)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagSRGBRenderingIntent", 0x0303)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagImageTitle", 0x0320)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagResolutionXUnit", 0x5001)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagResolutionYUnit", 0x5002)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagResolutionXLengthUnit", 0x5003)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagResolutionYLengthUnit", 0x5004)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrintFlags", 0x5005)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrintFlagsVersion", 0x5006)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrintFlagsCrop", 0x5007)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrintFlagsBleedWidth", 0x5008)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPrintFlagsBleedWidthScale", 0x5009)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneLPI", 0x500A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneLPIUnit", 0x500B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneDegree", 0x500C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneShape", 0x500D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneMisc", 0x500E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagHalftoneScreen", 0x500F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagJPEGQuality", 0x5010)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGridSize", 0x5011)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailFormat", 0x5012)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailWidth", 0x5013)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailHeight", 0x5014)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailColorDepth", 0x5015)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailPlanes", 0x5016)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailRawBytes", 0x5017)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailSize", 0x5018)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailCompressedSize", 0x5019)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagColorTransferFunction", 0x501A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailData", 0x501B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailImageWidth", 0x5020)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailImageHeight", 0x5021)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailBitsPerSample", 0x5022)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailCompression", 0x5023)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailPhotometricInterp", 0x5024)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailImageDescription", 0x5025)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailEquipMake", 0x5026)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailEquipModel", 0x5027)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailStripOffsets", 0x5028)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailOrientation", 0x5029)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailSamplesPerPixel", 0x502A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailRowsPerStrip", 0x502B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailStripBytesCount", 0x502C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailResolutionX", 0x502D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailResolutionY", 0x502E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailPlanarConfig", 0x502F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailResolutionUnit", 0x5030)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailTransferFunction", 0x5031)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailSoftwareUsed", 0x5032)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailDateTime", 0x5033)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailArtist", 0x5034)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailWhitePoint", 0x5035)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailPrimaryChromaticities", 0x5036)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailYCbCrCoefficients", 0x5037)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailYCbCrSubsampling", 0x5038)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailYCbCrPositioning", 0x5039)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailRefBlackWhite", 0x503A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagThumbnailCopyRight", 0x503B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagLuminanceTable", 0x5090)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagChrominanceTable", 0x5091)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagFrameDelay", 0x5100)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagLoopCount", 0x5101)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGlobalPalette", 0x5102)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagIndexBackground", 0x5103)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagIndexTransparent", 0x5104)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPixelUnit", 0x5110)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPixelPerUnitX", 0x5111)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPixelPerUnitY", 0x5112)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagPaletteHistogram", 0x5113)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagCopyright", 0x8298)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifExposureTime", 0x829A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFNumber", 0x829D)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifIFD", 0x8769)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagICCProfile", 0x8773)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifExposureProg", 0x8822)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSpectralSense", 0x8824)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagGpsIFD", 0x8825)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifISOSpeed", 0x8827)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifOECF", 0x8828)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifVer", 0x9000)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifDTOrig", 0x9003)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifDTDigitized", 0x9004)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifCompConfig", 0x9101)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifCompBPP", 0x9102)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifShutterSpeed", 0x9201)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifAperture", 0x9202)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifBrightness", 0x9203)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifExposureBias", 0x9204)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifMaxAperture", 0x9205)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSubjectDist", 0x9206)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifMeteringMode", 0x9207)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifLightSource", 0x9208)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFlash", 0x9209)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFocalLength", 0x920A)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifMakerNote", 0x927C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifUserComment", 0x9286)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifDTSubsec", 0x9290)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifDTOrigSS", 0x9291)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifDTDigSS", 0x9292)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFPXVer", 0xA000)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifColorSpace", 0xA001)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifPixXDim", 0xA002)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifPixYDim", 0xA003)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifRelatedWav", 0xA004)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifInterop", 0xA005)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFlashEnergy", 0xA20B)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSpatialFR", 0xA20C)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFocalXRes", 0xA20E)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFocalYRes", 0xA20F)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFocalResUnit", 0xA210)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSubjectLoc", 0xA214)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifExposureIndex", 0xA215)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSensingMethod", 0xA217)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifFileSource", 0xA300)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifSceneType", 0xA301)
		INSERT INTO crsProps (PropName, IDValue) VALUES("PropertyTagExifCfaPattern", 0xA302)
		INDEX ON IDValue TAG IDValue
		
ENDPROC
PROCEDURE Destroy
USE IN SELECT("crsProps")
ENDPROC
     5���                              Ƶ   %   �       �      �           �  U  S  ��  � T�  �C��� %�C�  �
��L � T� � � � �C�  @�� ��C� � � �� � U  LCFILE THIS PARENT TXTFILE VALUE	 LOADPROPS Click,     ��1 r � �A 1                       �       )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      }AutoSize = .T.
Caption = "Image Properties:"
Height = 17
Left = 12
Top = 41
Width = 100
TabIndex = 4
Name = "Label1"
      Form1      Label1      label      label      �Anchor = 15
ColumnCount = 2
ColumnWidths = "220,500"
Height = 177
Left = 12
TabIndex = 3
Top = 60
Width = 349
Name = "lstProp"
      Form1      lstProp      listbox      listbox      �PROCEDURE Click

LOCAL lcFile

lcFile = GETPICT()

IF NOT EMPTY(lcFile)
	This.Parent.txtFile.Value = LOWER(lcFile)
	This.Parent.LoadProps()
ENDIF
ENDPROC
      lTop = 10
Left = 324
Height = 27
Width = 36
Anchor = 8
Caption = "..."
TabIndex = 2
Name = "cmdFile"
      Form1      cmdFile      commandbutton      commandbutton      \Anchor = 10
Height = 23
Left = 12
TabIndex = 1
Top = 12
Width = 300
Name = "txtFile"
      Form1      txtFile      textbox      textbox      *loadprops 
     =]���    D=  D=                        �]   %   �:      �<  �   �:          �  U  � �C�
 System.app��� ��  Q� XFCIMAGE� �� Q� XFCPROPERTYITEM� �� � � ��C� � � �� R,�:�� Loading Image...��" T�  �C� � � �9� � �	 �
 �� T� �C��  � �� %�C� ��� N���� �� �  � ��� T� �C � �  � ��' %�C� � � crsProps� idvalue���$� T� �� � �� �C� T� �C� � � @0_�� � ��C � � � � ��) T� � � �� � � �����C� � �� �� ���; ��C�( No properties available for this image !� � � �� � R� T� ���� T�  ���� U  LOIMG LOPROP LNPROP
 LCPROPNAME THIS LSTPROP CLEAR SYSTEM DRAWING IMAGE FROMFILE TXTFILE VALUE XXX PROPERTYIDLIST GETPROPERTYITEM ID CRSPROPS PROPNAME ADDITEM LIST NEWINDEX TOSTRING�7( h�� crsProps� � V��2�� � I�8 r�� crsProps� � ��� PropertyTagGpsVer��� ��@ r�� crsProps� � ��� PropertyTagGpsLatitudeRef�����= r�� crsProps� � ��� PropertyTagGpsLatitude�����A r�� crsProps� � ��� PropertyTagGpsLongitudeRef�����> r�� crsProps� � ��� PropertyTagGpsLongitude�����@ r�� crsProps� � ��� PropertyTagGpsAltitudeRef�����= r�� crsProps� � ��� PropertyTagGpsAltitude�����< r�� crsProps� � ��� PropertyTagGpsGpsTime�����B r�� crsProps� � ��� PropertyTagGpsGpsSatellites�����> r�� crsProps� � ��� PropertyTagGpsGpsStatus���	��C r�� crsProps� � ��� PropertyTagGpsGpsMeasureMode���
��; r�� crsProps� � ��� PropertyTagGpsGpsDop�����= r�� crsProps� � ��� PropertyTagGpsSpeedRef�����: r�� crsProps� � ��� PropertyTagGpsSpeed�����= r�� crsProps� � ��� PropertyTagGpsTrackRef�����: r�� crsProps� � ��� PropertyTagGpsTrack�����> r�� crsProps� � ��� PropertyTagGpsImgDirRef�����; r�� crsProps� � ��� PropertyTagGpsImgDir�����= r�� crsProps� � ��� PropertyTagGpsMapDatum�����? r�� crsProps� � ��� PropertyTagGpsDestLatRef�����< r�� crsProps� � ��� PropertyTagGpsDestLat�����@ r�� crsProps� � ��� PropertyTagGpsDestLongRef�����= r�� crsProps� � ��� PropertyTagGpsDestLong�����@ r�� crsProps� � ��� PropertyTagGpsDestBearRef�����= r�� crsProps� � ��� PropertyTagGpsDestBear�����@ r�� crsProps� � ��� PropertyTagGpsDestDistRef�����= r�� crsProps� � ��� PropertyTagGpsDestDist�����@ r�� crsProps� � ��� PropertyTagNewSubfileType������= r�� crsProps� � ��� PropertyTagSubfileType������= r�� crsProps� � ��� PropertyTagImageWidth��� ��> r�� crsProps� � ��� PropertyTagImageHeight�����@ r�� crsProps� � ��� PropertyTagBitsPerSample�����> r�� crsProps� � ��� PropertyTagCompression�����D r�� crsProps� � ��� PropertyTagPhotometricInterp�����@ r�� crsProps� � ��� PropertyTagThreshHolding�����< r�� crsProps� � ��� PropertyTagCellWidth�����= r�� crsProps� � ��� PropertyTagCellHeight���	��< r�� crsProps� � ��� PropertyTagFillOrder���
��? r�� crsProps� � ��� PropertyTagDocumentName�����C r�� crsProps� � ��� PropertyTagImageDescription�����< r�� crsProps� � ��� PropertyTagEquipMake�����= r�� crsProps� � ��� PropertyTagEquipModel�����? r�� crsProps� � ��� PropertyTagStripOffsets�����> r�� crsProps� � ��� PropertyTagOrientation�����B r�� crsProps� � ��� PropertyTagSamplesPerPixel�����? r�� crsProps� � ��� PropertyTagRowsPerStrip�����B r�� crsProps� � ��� PropertyTagStripBytesCount�����A r�� crsProps� � ��� PropertyTagMinSampleValue�����A r�� crsProps� � ��� PropertyTagMaxSampleValue�����> r�� crsProps� � ��� PropertyTagXResolution�����> r�� crsProps� � ��� PropertyTagYResolution�����? r�� crsProps� � ��� PropertyTagPlanarConfig�����; r�� crsProps� � ��� PropertyTagPageName�����< r�� crsProps� � ��� PropertyTagXPosition�����< r�� crsProps� � ��� PropertyTagYPosition�����= r�� crsProps� � ��� PropertyTagFreeOffset��� ��A r�� crsProps� � ��� PropertyTagFreeByteCounts���!��C r�� crsProps� � ��� PropertyTagGrayResponseUnit���"��D r�� crsProps� � ��� PropertyTagGrayResponseCurve���#��; r�� crsProps� � ��� PropertyTagT4Option���$��; r�� crsProps� � ��� PropertyTagT6Option���%��A r�� crsProps� � ��� PropertyTagResolutionUnit���(��= r�� crsProps� � ��� PropertyTagPageNumber���)��C r�� crsProps� � ��� PropertyTagTransferFunction���-��? r�� crsProps� � ��� PropertyTagSoftwareUsed���1��; r�� crsProps� � ��� PropertyTagDateTime���2��9 r�� crsProps� � ��� PropertyTagArtist���;��? r�� crsProps� � ��� PropertyTagHostComputer���<��< r�� crsProps� � ��� PropertyTagPredictor���=��= r�� crsProps� � ��� PropertyTagWhitePoint���>��H r�� crsProps� � ���  PropertyTagPrimaryChromaticities���?��; r�� crsProps� � ��� PropertyTagColorMap���@��@ r�� crsProps� � ��� PropertyTagHalftoneHints���A��< r�� crsProps� � ��� PropertyTagTileWidth���B��= r�� crsProps� � ��� PropertyTagTileLength���C��= r�� crsProps� � ��� PropertyTagTileOffset���D��A r�� crsProps� � ��� PropertyTagTileByteCounts���E��9 r�� crsProps� � ��� PropertyTagInkSet���L��; r�� crsProps� � ��� PropertyTagInkNames���M��? r�� crsProps� � ��� PropertyTagNumberOfInks���N��; r�� crsProps� � ��� PropertyTagDotRange���P��@ r�� crsProps� � ��� PropertyTagTargetPrinter���Q��? r�� crsProps� � ��� PropertyTagExtraSamples���R��? r�� crsProps� � ��� PropertyTagSampleFormat���S��B r�� crsProps� � ��� PropertyTagSMinSampleValue���T��B r�� crsProps� � ��� PropertyTagSMaxSampleValue���U��@ r�� crsProps� � ��� PropertyTagTransferRange���V��; r�� crsProps� � ��� PropertyTagJPEGProc��� ��B r�� crsProps� � ��� PropertyTagJPEGInterFormat�����B r�� crsProps� � ��� PropertyTagJPEGInterLength�����F r�� crsProps� � ��� PropertyTagJPEGRestartInterval�����I r�� crsProps� � ���! PropertyTagJPEGLosslessPredictors�����F r�� crsProps� � ��� PropertyTagJPEGPointTransforms�����> r�� crsProps� � ��� PropertyTagJPEGQTables�����? r�� crsProps� � ��� PropertyTagJPEGDCTables�����? r�� crsProps� � ��� PropertyTagJPEGACTables���	��D r�� crsProps� � ��� PropertyTagYCbCrCoefficients�����C r�� crsProps� � ��� PropertyTagYCbCrSubsampling�����C r�� crsProps� � ��� PropertyTagYCbCrPositioning�����@ r�� crsProps� � ��� PropertyTagREFBlackWhite�����8 r�� crsProps� � ��� PropertyTagGamma�����G r�� crsProps� � ��� PropertyTagICCProfileDescriptor�����F r�� crsProps� � ��� PropertyTagSRGBRenderingIntent�����= r�� crsProps� � ��� PropertyTagImageTitle��� ��B r�� crsProps� � ��� PropertyTagResolutionXUnit���P��B r�� crsProps� � ��� PropertyTagResolutionYUnit���P��H r�� crsProps� � ���  PropertyTagResolutionXLengthUnit���P��H r�� crsProps� � ���  PropertyTagResolutionYLengthUnit���P��= r�� crsProps� � ��� PropertyTagPrintFlags���P��D r�� crsProps� � ��� PropertyTagPrintFlagsVersion���P��A r�� crsProps� � ��� PropertyTagPrintFlagsCrop���P��G r�� crsProps� � ��� PropertyTagPrintFlagsBleedWidth���P��L r�� crsProps� � ���$ PropertyTagPrintFlagsBleedWidthScale���	P��> r�� crsProps� � ��� PropertyTagHalftoneLPI���
P��B r�� crsProps� � ��� PropertyTagHalftoneLPIUnit���P��A r�� crsProps� � ��� PropertyTagHalftoneDegree���P��@ r�� crsProps� � ��� PropertyTagHalftoneShape���P��? r�� crsProps� � ��� PropertyTagHalftoneMisc���P��A r�� crsProps� � ��� PropertyTagHalftoneScreen���P��> r�� crsProps� � ��� PropertyTagJPEGQuality���P��; r�� crsProps� � ��� PropertyTagGridSize���P��B r�� crsProps� � ��� PropertyTagThumbnailFormat���P��A r�� crsProps� � ��� PropertyTagThumbnailWidth���P��B r�� crsProps� � ��� PropertyTagThumbnailHeight���P��F r�� crsProps� � ��� PropertyTagThumbnailColorDepth���P��B r�� crsProps� � ��� PropertyTagThumbnailPlanes���P��D r�� crsProps� � ��� PropertyTagThumbnailRawBytes���P��@ r�� crsProps� � ��� PropertyTagThumbnailSize���P��J r�� crsProps� � ���" PropertyTagThumbnailCompressedSize���P��H r�� crsProps� � ���  PropertyTagColorTransferFunction���P��@ r�� crsProps� � ��� PropertyTagThumbnailData���P��F r�� crsProps� � ��� PropertyTagThumbnailImageWidth��� P��G r�� crsProps� � ��� PropertyTagThumbnailImageHeight���!P��I r�� crsProps� � ���! PropertyTagThumbnailBitsPerSample���"P��G r�� crsProps� � ��� PropertyTagThumbnailCompression���#P��M r�� crsProps� � ���% PropertyTagThumbnailPhotometricInterp���$P��L r�� crsProps� � ���$ PropertyTagThumbnailImageDescription���%P��E r�� crsProps� � ��� PropertyTagThumbnailEquipMake���&P��F r�� crsProps� � ��� PropertyTagThumbnailEquipModel���'P��H r�� crsProps� � ���  PropertyTagThumbnailStripOffsets���(P��G r�� crsProps� � ��� PropertyTagThumbnailOrientation���)P��K r�� crsProps� � ���# PropertyTagThumbnailSamplesPerPixel���*P��H r�� crsProps� � ���  PropertyTagThumbnailRowsPerStrip���+P��K r�� crsProps� � ���# PropertyTagThumbnailStripBytesCount���,P��G r�� crsProps� � ��� PropertyTagThumbnailResolutionX���-P��G r�� crsProps� � ��� PropertyTagThumbnailResolutionY���.P��H r�� crsProps� � ���  PropertyTagThumbnailPlanarConfig���/P��J r�� crsProps� � ���" PropertyTagThumbnailResolutionUnit���0P��L r�� crsProps� � ���$ PropertyTagThumbnailTransferFunction���1P��H r�� crsProps� � ���  PropertyTagThumbnailSoftwareUsed���2P��D r�� crsProps� � ��� PropertyTagThumbnailDateTime���3P��B r�� crsProps� � ��� PropertyTagThumbnailArtist���4P��F r�� crsProps� � ��� PropertyTagThumbnailWhitePoint���5P��Q r�� crsProps� � ���) PropertyTagThumbnailPrimaryChromaticities���6P��M r�� crsProps� � ���% PropertyTagThumbnailYCbCrCoefficients���7P��L r�� crsProps� � ���$ PropertyTagThumbnailYCbCrSubsampling���8P��L r�� crsProps� � ���$ PropertyTagThumbnailYCbCrPositioning���9P��I r�� crsProps� � ���! PropertyTagThumbnailRefBlackWhite���:P��E r�� crsProps� � ��� PropertyTagThumbnailCopyRight���;P��A r�� crsProps� � ��� PropertyTagLuminanceTable����P��C r�� crsProps� � ��� PropertyTagChrominanceTable����P��= r�� crsProps� � ��� PropertyTagFrameDelay��� Q��< r�� crsProps� � ��� PropertyTagLoopCount���Q��@ r�� crsProps� � ��� PropertyTagGlobalPalette���Q��B r�� crsProps� � ��� PropertyTagIndexBackground���Q��C r�� crsProps� � ��� PropertyTagIndexTransparent���Q��< r�� crsProps� � ��� PropertyTagPixelUnit���Q��@ r�� crsProps� � ��� PropertyTagPixelPerUnitX���Q��@ r�� crsProps� � ��� PropertyTagPixelPerUnitY���Q��C r�� crsProps� � ��� PropertyTagPaletteHistogram���Q��> r�� crsProps� � ��� PropertyTagCopyright�����  ��E r�� crsProps� � ��� PropertyTagExifExposureTime�����  ��@ r�� crsProps� � ��� PropertyTagExifFNumber�����  ��< r�� crsProps� � ��� PropertyTagExifIFD���i�  ��? r�� crsProps� � ��� PropertyTagICCProfile���s�  ��E r�� crsProps� � ��� PropertyTagExifExposureProg���"�  ��F r�� crsProps� � ��� PropertyTagExifSpectralSense���$�  ��; r�� crsProps� � ��� PropertyTagGpsIFD���%�  ��A r�� crsProps� � ��� PropertyTagExifISOSpeed���'�  ��= r�� crsProps� � ��� PropertyTagExifOECF���(�  ��< r�� crsProps� � ��� PropertyTagExifVer��� �  ��? r�� crsProps� � ��� PropertyTagExifDTOrig����  ��D r�� crsProps� � ��� PropertyTagExifDTDigitized����  ��C r�� crsProps� � ��� PropertyTagExifCompConfig����  ��@ r�� crsProps� � ��� PropertyTagExifCompBPP����  ��E r�� crsProps� � ��� PropertyTagExifShutterSpeed����  ��A r�� crsProps� � ��� PropertyTagExifAperture����  ��C r�� crsProps� � ��� PropertyTagExifBrightness����  ��E r�� crsProps� � ��� PropertyTagExifExposureBias����  ��D r�� crsProps� � ��� PropertyTagExifMaxAperture����  ��D r�� crsProps� � ��� PropertyTagExifSubjectDist����  ��E r�� crsProps� � ��� PropertyTagExifMeteringMode����  ��D r�� crsProps� � ��� PropertyTagExifLightSource����  ��> r�� crsProps� � ��� PropertyTagExifFlash���	�  ��D r�� crsProps� � ��� PropertyTagExifFocalLength���
�  ��B r�� crsProps� � ��� PropertyTagExifMakerNote���|�  ��D r�� crsProps� � ��� PropertyTagExifUserComment�����  ��A r�� crsProps� � ��� PropertyTagExifDTSubsec�����  ��A r�� crsProps� � ��� PropertyTagExifDTOrigSS�����  ��@ r�� crsProps� � ��� PropertyTagExifDTDigSS�����  ��? r�� crsProps� � ��� PropertyTagExifFPXVer��� �  ��C r�� crsProps� � ��� PropertyTagExifColorSpace����  ��@ r�� crsProps� � ��� PropertyTagExifPixXDim����  ��@ r�� crsProps� � ��� PropertyTagExifPixYDim����  ��C r�� crsProps� � ��� PropertyTagExifRelatedWav����  ��@ r�� crsProps� � ��� PropertyTagExifInterop����  ��D r�� crsProps� � ��� PropertyTagExifFlashEnergy����  ��B r�� crsProps� � ��� PropertyTagExifSpatialFR����  ��B r�� crsProps� � ��� PropertyTagExifFocalXRes����  ��B r�� crsProps� � ��� PropertyTagExifFocalYRes����  ��E r�� crsProps� � ��� PropertyTagExifFocalResUnit����  ��C r�� crsProps� � ��� PropertyTagExifSubjectLoc����  ��F r�� crsProps� � ��� PropertyTagExifExposureIndex����  ��F r�� crsProps� � ��� PropertyTagExifSensingMethod����  ��C r�� crsProps� � ��� PropertyTagExifFileSource��� �  ��B r�� crsProps� � ��� PropertyTagExifSceneType����  ��C r�� crsProps� � ��� PropertyTagExifCfaPattern����  �� & �� ��� � U  CRSPROPS PROPNAME IDVALUE  Q�C� crsPropsW�� U  	 loadprops,     �� Init�    �� Destroy�:    ��1 q3�� �"CR"Qq� qA B�A � �A R � � 3 ������!�1�����������������A����1����!�!�������1A���1�����������������!!�!!a�a���A11�qa�!!���Aq��!���!!a!A��aq�q��Qa�q���qq����A!a����Q1��!1�1�Q��Qa����A1Q1QAAQA�A!A�11A!!!Q1aa1!1� 3 A1                       v        �  �N  )   �   �N  �N  	   )   D=                  0		   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923478977�      �  �      �      �  �                  k
                           WINDOWS _1U40L3TVG 910322422�
      �
  �
  �
         �  �                                               WINDOWS _1U40L3TVH 910322455l      {  �  �  �                                                           WINDOWS _1U40LO0FY 910322422      &  3  _  	                                                           WINDOWS _1VE04ASWR 910322455�  �  �  �  �  g      A  �                                               WINDOWS _20A0S0TKZ 910322455X      \
  O
  B
  �	      #  �                                               COMMENT RESERVED                                �	                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 14
Left = 18
Height = 242
Width = 700
DoCreate = .T.
Caption = "Rotate and Flip Images"
MaxButton = .F.
MinButton = .F.
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      �PROCEDURE processimage
LPARAMETERS tcFile
Thisform.txtFile.Value = LOCFILE(tcFile)
Thisform.Image1.Picture = tcFile
Thisform.Imgcanvas1.Draw()
ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage("gotdata.gif")

RETURN
ENDPROC
     ���    �   �                         �f   %   �       �      �           �  U  8  T�  �C��� %�C�  ���  � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A 1                       e       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      AHeight = 180
Left = 264
Top = 48
Width = 168
Name = "List1"
      Form1      List1      listbox      F_memberdata XML Metadata for customizable properties
*processimage 
      commandbutton      commandbutton      Command3      Form1      �Top = 12
Left = 12
Height = 25
Width = 96
Anchor = 12
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
      pPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile) 
ENDPROC
      listbox      FHeight = 180
Left = 444
Top = 48
Width = 240
Name = "Imgcanvas1"
      Form1      
Imgcanvas1      image      ..\gdiplusx.vcx      	imgcanvas      NStretch = 2
Height = 180
Left = 12
Top = 48
Width = 240
Name = "Image1"
      Form1      textbox      textbox      txtFile      Form1      kFontSize = 9
Anchor = 12
Height = 24
Left = 120
TabIndex = 2
Top = 12
Width = 564
Name = "txtFile"
      image      image      Image1     WPROCEDURE beforedraw
LOCAL loBitmap as xfcBitmap
loBitmap = _Screen.System.Drawing.Bitmap.New(Thisform.TxtFile.Value)

lcRotateType = "_Screen.System.Drawing.RotateFlipType." + Thisform.List1.Value
lnEnumRotateFlip = EVALUATE(lcRotateType)

loBitmap.RotateFlip(lnEnumRotateFlip)
This.oGfx.DrawImage(loBitmap, This.Rectangle)
ENDPROC
     {���    b  b                        a~   %   �      	     �          �  U  *  %�C�  � �
��# � ��C� � � �� � U  THIS VALUE THISFORM
 IMGCANVAS1 DRAW" ��C� RotateNoneFlipNone�  � ��  ��C� Rotate90FlipNone�  � ��! ��C� Rotate180FlipNone�  � ��! ��C� Rotate270FlipNone�  � �� ��C� RotateNoneFlipX�  � �� ��C� Rotate90FlipX�  � �� ��C� Rotate180FlipX�  � �� ��C� Rotate270FlipX�  � �� ��C� Rotate180FlipXY�  � �� ��C� Rotate270FlipXY�  � ��  ��C� RotateNoneFlipXY�  � �� ��C� Rotate90FlipXY�  � �� ��C� Rotate180FlipY�  � �� ��C� Rotate270FlipY�  � �� ��C� RotateNoneFlipY�  � �� ��C� Rotate90FlipY�  � ��" T�  � �� RotateNoneFlipNone�� U  THIS ADDITEM VALUE InteractiveChange,     �� Init�     ��1 1A 3 !�����������"2                       [         v   �      )   b                       �PROCEDURE InteractiveChange
IF NOT EMPTY(This.Value)
	Thisform.Imgcanvas1.Draw()
ENDIF

ENDPROC
PROCEDURE Init
This.AddItem("RotateNoneFlipNone")
This.AddItem("Rotate90FlipNone")
This.AddItem("Rotate180FlipNone")
This.AddItem("Rotate270FlipNone")
This.AddItem("RotateNoneFlipX")
This.AddItem("Rotate90FlipX")
This.AddItem("Rotate180FlipX")
This.AddItem("Rotate270FlipX")

This.AddItem("Rotate180FlipXY")
This.AddItem("Rotate270FlipXY")
This.AddItem("RotateNoneFlipXY")
This.AddItem("Rotate90FlipXY")
This.AddItem("Rotate180FlipY")
This.AddItem("Rotate270FlipY")
This.AddItem("RotateNoneFlipY")
This.AddItem("Rotate90FlipY")

This.Value = "RotateNoneFlipNone"

ENDPROC
     ����    �  �                        `�   %   w      �     �          �  U  �  ��  Q�	 XFCBITMAP�" T�  �C� � � �9� � � � ��= T� ��& _Screen.System.Drawing.RotateFlipType.� �	 � �� T�
 �C� ��� ��C �
 �  � �� ��C �  � � � � � �� U  LOBITMAP SYSTEM DRAWING BITMAP NEW THISFORM TXTFILE VALUE LCROTATETYPE LIST1 LNENUMROTATEFLIP
 ROTATEFLIP THIS OGFX	 DRAWIMAGE	 RECTANGLE
 beforedraw,     ��1 A!�� �1                       L      )   �                       ����    �  �                        �=   %   �       7  
   #          �  U  C  ��  � T� � � �C�  ��� T� � � ��  �� ��C� � � �� U  TCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE
 IMGCANVAS1 DRAW+ 	 ��C��� ��C� gotdata.gif�  � �� B� U  THISFORM PROCESSIMAGE processimage,     �� Init�     ��1 q a12 � �B 1                       �         �   �       )   �                  0	   �
�                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               OBJTYPE    N                  OBJCODE    N                  NAME       M"                  EXPR       M&                  VPOS       N*   	              HPOS       N3   	              HEIGHT     N<   	              WIDTH      NE   	              STYLE      MN                  PICTURE    MR                  ORDER      MV                 UNIQUE     LZ                  COMMENT    M[                  ENVIRON    L_                  BOXCHAR    C`                  FILLCHAR   Ca                  TAG        Mb                  TAG2       Mf                 PENRED     Nj                  PENGREEN   No                  PENBLUE    Nt                  FILLRED    Ny                  FILLGREEN  N~                  FILLBLUE   N�                  PENSIZE    N�                  PENPAT     N�                  FILLPAT    N�                  FONTFACE   M�                  FONTSTYLE  N�                  FONTSIZE   N�                  MODE       N�                  RULER      N�                  RULERLINES N�                  GRID       L�                  GRIDV      N�                  GRIDH      N�                  FLOAT      L�                  STRETCH    L�                  STRETCHTOP L�                  TOP        L�                  BOTTOM     L�                  SUPTYPE    N�                  SUPREST    N�                  NOREPEAT   L�                  RESETRPT   N�                  PAGEBREAK  L�                  COLBREAK   L�                  RESETPAGE  L�                  GENERAL    N�                  SPACING    N�                  DOUBLE     L�                  SWAPHEADER L�                  SWAPFOOTER L�                  EJECTBEFOR L�                  EJECTAFTER L�                  PLAIN      L�                  SUMMARY    L�                  ADDALIAS   L�                  OFFSET     N�                  TOPMARGIN  N�                  BOTMARGIN  N�                  TOTALTYPE  N�                  RESETTOTAL N�                  RESOID     N�                  CURPOS     L�                  SUPALWAYS  L�                  SUPOVFLOW  L�                  SUPRPCOL   N�                  SUPGROUP   N�                  SUPVALCHNG L�                  SUPEXPR    M�                  USER       M�                                                                                                                                                                                                                                                                                          WINDOWS _2040RYD0C 909862993 1 53           1.000    0.000    0.000   -1.000                 F                                                            0 10   10T1212   FF              T    F T               1F               WINDOWS _2040RYD0D           9  1                           1770.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _2040RYD0E           9  4                          11771.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _2040RYD0F           9  7                           1770.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _2040RZ2PZ 909863012 5  0           0.00019062.500 1666.667 6666.667                               -1   -1   -1   -1   -1   -1                    1 10  1       TFFFF  F          0T                      1FTF3 0F         WINDOWS _2040RZ2QY 909863012 8  0        4375.00019166.667 1875.00026354.167                   V           -1   -1   -1   -1   -1   -1                    0 10  1       TTFFF  F          0T         0       0 1  1FTF3 0F         WINDOWS _2040RZ2RL 909863012 5  0           0.00046979.167 1666.667 5833.333                               -1   -1   -1   -1   -1   -1                    1 10  1       TFFFF  F          0T                      1FTF3 0F         WINDOWS _2040RZ2S1 909863012 8  0        4375.00045937.500 1875.000 9895.833                  N           -1   -1   -1   -1   -1   -1                    0 10  1 0     TTFFF  F          0T         1       0 1  1TTF3 0F         WINDOWS _2040RZ2SI 909863012 5  0           0.00059166.667 1666.667 6666.667                               -1   -1   -1   -1   -1   -1                    1 10  1       TFFFF  F          0T                      1FTF3 0F         WINDOWS _2040RZ2T0 909863012 8  0        4375.00059270.833 1875.000 9375.000                   D           -1   -1   -1   -1   -1   -1                    0 10  1       TTFFF  F          0T         0       0 1  1FTF3 0F         WINDOWS _2040RZ2TG 909863012 5  0           0.00068854.167 1666.667 6666.667                               -1   -1   -1   -1   -1   -1                    1 10  1       TFFFF  F          0T                      1FTF3 0F         WINDOWS _2040RZ2TX 909863012 8  0        4375.00068854.167 1875.000 9895.833                   C           -1   -1   -1   -1   -1   -1                    0 10  1       TTFFF  F          0T         0       0 1  1FTF3 0F         WINDOWS _2040RZ2V0 909863012 8  0        17708.333    0.000 1875.000 6770.833                   D           -1   -1   -1   -1   -1   -1               !     1 10  1       FFFTF  F          0T         0       0 1  1FTF3 0F         WINDOWS _2040RZ2VI 909863012 5  0    "   17708.33371562.500 1666.667 4166.667                               -1   -1   -1   -1   -1   -1               #     1 10  1       FFFTF  F          0T                      1FTF3 0F         WINDOWS _2040RZ2W1 909863012 8  0    $   17708.33375729.167 1875.000 5104.167                   N           -1   -1   -1   -1   -1   -1               %     1 10  1       FFFTF  F          0T         1       0 1  1FTF3 0F         WINDOWS _2040RZTG5 90986304717  0&        4062.500  937.50011354.16717604.167                                                                                     1       FFFTF  F       2   F         2             FTF3 0F         WINDOWS                     23              16.000    8.000   12.000    9.000                                4    0                                        0 10                                                     F               WINDOWS                     23              16.000    8.000   12.000   10.000                                4    0                                        1 10                                                     F               WINDOWS                     25      	                                                        F                                                                                                                      F                 '   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
r
OUTPUT=CPW2:
OR      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
                                     dataenvironment                                               Courier New                                                   Courier New                                                   Courier New                                                   
"Filename"                                                    Courier New                                                   filename                                                      Courier New                                                   	"Filesiz"                                                     Courier New                                                   filesize                                                      "99,999,999"                                                  Courier New                                                   
"Filedate"                                                    Courier New                                                   filedate                                                      Courier New                                                   
"Filetime"                                                    Courier New                                                   filetime                                                      Courier New                                                   DATE()                                                        Courier New                                                   "Page "                                                       Courier New                                                   _PAGENO                                                       Courier New                                                   oForm.GetImage()                                        0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _2040JO4UM 909855060      /  F      ]                          �      �                       WINDOWS _2040JO4UO 923482555�      �  �      �      h  K0                  a
                           WINDOWS _2040JO4V5 923482555�
      �
  �
  �
  �
                                                           WINDOWS _2040JO4V6 910128071      -  ;  J  e                                                           WINDOWS _2040K5AV3 910074037�  �  �  �  �  �        ]                                               WINDOWS _2040JO4V8 910128071�          )  D                                                           WINDOWS _2040JO4V9 909855060u      �  �  �  �                                                           WINDOWS _2040JO4VA 910128071      *  8  G  b                                                           WINDOWS _2040JO4VB 909855060�      �  �  �  �                                                           WINDOWS _2040JO4VC 9101280715      C  Q  `  {                                                           WINDOWS _2040JO4VD 909855060�      �  �  �  �                                                           WINDOWS _2040JO4VE 910128071N      \  j  y  �                                                           WINDOWS _2040JO4VF 909855060�      �  �  �                                                             WINDOWS _2040JO4UM 909855060g      |  �  �  �        k                                               WINDOWS _2040SAFS1 910073013v      �  �  T
  �         �                                               WINDOWS _20715QPA5 910128071a      L  =  G
  �      �  �                                               WINDOWS _2080V34HP 9101284942
      
  
   
  �	      Q   t(                                               COMMENT RESERVED                                _	                                                            3�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      eHeight = 475
Width = 554
DoCreate = .T.
AutoCenter = .T.
Caption = "Image View"
Name = "Form1"
     TPROCEDURE getimage
** Used by the report to render the image
This.grid1.column1.image1.Draw()
RETURN This.grid1.column1.image1
ENDPROC
PROCEDURE loadimages
** Select a directory of images to load into the image cursor

LOCAL lcPath, lcSafety

lcSafety = SET("Safety")
lcPath = GETDIR()

IF EMPTY(lcPath)
	RETURN
ENDIF

IF ADIR(laImages, ADDBS(lcPath)+"*.*") > 0
	SELECT curImages
	SET SAFETY OFF
	ZAP
	SET SAFETY &lcSafety
	SET DELETED ON 
	APPEND FROM ARRAY laImages
	DELETE FOR NOT INLIST(UPPER(JUSTEXT(filename)), "JPG","GIF","BMP","EMF","TIF","PNG")
	REPLACE ALL filepath WITH lcPath
	GO TOP
ENDIF

This.Refresh()
ENDPROC
PROCEDURE Load
CREATE CURSOR curImages ;
( filename v(250), ;
  filesize i, ;
  filedate d, ;
  filetime c(12), ;
  filepath v(250))
ENDPROC
PROCEDURE Init
This.LoadImages()

ENDPROC
      ����    �   �                         Q   %   V       k      e           �  U    ��C�  � �� U  THISFORM
 LOADIMAGES Click,     ��1 � 1                       &       )   �                         ����    �   �                         �   %   S       h      b           �  U    ��C�  � �� U  THISFORM RELEASE Click,     ��1 � 1                       #       )   �                         ����    �   �                         �   %   q       �      �           �  U  '  5�  � T�  �� �� ?� imgView�� U  OFORM THISFORM IMGVIEW Click,     ��1 q � 1                       d       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      pTop = 428
Left = 225
Height = 27
Width = 115
Anchor = 12
Caption = "Web Thumbnails..."
Name = "Command3"
      Form1      Command3      commandbutton      commandbutton      Form1      Form1      )*imageupdate 
*getimage 
*loadimages 
      grid      grid      Grid1      Form1     SColumnCount = 5
Anchor = 15
DeleteMark = .F.
Height = 409
Left = 12
Panel = 1
RecordMark = .F.
RecordSource = "curImages"
RowHeight = 74
SplitBar = .F.
Top = 12
Width = 529
HighlightStyle = 2
Name = "Grid1"
Column1.ControlSource = "filename"
Column1.Width = 109
Column1.Sparse = .F.
Column1.Name = "Column1"
Column2.ControlSource = "filename"
Column2.Width = 168
Column2.Name = "Column2"
Column3.ControlSource = "filesize"
Column3.Name = "Column3"
Column4.ControlSource = "filedate"
Column4.Name = "Column4"
Column5.ControlSource = "filetime"
Column5.Name = "Column5"
      header      header      Header1      Form1.Grid1.Column1      )Caption = "Thumbnail"
Name = "Header1"
      	imgcanvas      ..\gdiplusx.vcx      image      Image1      Form1.Grid1.Column1      Stretch = 2
Name = "Image1"
     ;PROCEDURE setup
** Intialize the drawing objects we will need for the canvas
WITH _SCREEN.System.Drawing
	This.Controls.Add(.Font.New("Arial",10,1), "Font")
	This.Controls.Add(.SolidBrush.New(.Color.New(0x80000000)), "Brush1")
	This.Controls.Add(.SolidBrush.New(.Color.New(0x90ffffff)), "Brush2")
ENDWITH

ENDPROC
PROCEDURE beforedraw
** Update the canvas for each call to Draw()

LOCAL loGFX AS xfcGraphics
LOCAL loImg AS xfcImage
LOCAL lnWidth, lnHeight

IF NOT FILE(filepath+filename)
	RETURN 
ENDIF

lnWidth = This.Width
lnHeight = This.Height

WITH _SCREEN.System.Drawing

	loGFX = This.oGfx
	loImg = .Image.FromFile(filepath+filename)

	#DEFINE PropertyTagDateTime 0x0132
	LOCAL loProp AS xfcPropertyItem
	lcDate = ""

	** Calculate the image date
*!*		IF NOT ISNULL(loImg.PropertyIdList[1])
*!*			FOR EACH lnProp IN loImg.PropertyIdList
*!*				loProp = loImg.GetPropertyItem(lnProp)
*!*				IF loProp.Id = PropertyTagDateTime
*!*					lcDate = ""+loProp.Value
*!*					EXIT
*!*				ENDIF
*!*			ENDFOR
*!*		ENDIF

	** Specify the watermark text
	TEXT TO lcString NOSHOW TEXTMERGE
<<filename>>
<<loImg.Width>> x <<loImg.Height>>
<<lcDate>>
	ENDTEXT

	** Get a thumbnail for the image and draw it to the canvas
	loImg = loImg.GetThumbnailImage(lnWidth,lnHeight)
	loGFX.DrawImage(loImg,0,0,lnWidth,lnHeight)

	** Draw the watermark text
	loGFX.DrawString(lcString, This.Controls("Font"), This.Controls("Brush1"), 1, 1)
	loGFX.DrawString(lcString, This.Controls("Font"), This.Controls("Brush2"), 0, 0)

ENDWITH

loImg = NULL

ENDPROC
     ����    �  �                        "�   %   �      '      �          �  U  �  ���9�  � ��� �- ��CC� Arial�
��� � � Font� � � ��4 ��CCC�
       �A�� � �� � � Brush1� � � ��4 ��CCC�
   ����A�� � �� � � Brush2� � � �� �� U	  SYSTEM DRAWING THIS CONTROLS ADD FONT NEW
 SOLIDBRUSH COLOR� ��  Q� XFCGRAPHICS� �� Q� XFCIMAGE� �� � � %�C� � 0
��L � B� � T� �� � �� T� �� � �� ���9�	 �
 ���� T�  �� � �� T� �C� � �� � �� �� Q� XFCPROPERTYITEM� T� ��  ��
 M(� `�� � <<filename>>�( �" <<loImg.Width>> x <<loImg.Height>>� �
 <<lcDate>>� � T� �C �  � � � �� ��C � � �  �  � �  � ��5 ��C � C� Font� � C� Brush1� � ���  � ��5 ��C � C� Font� � C� Brush2� � � � �  � �� �� T� ���� U  LOGFX LOIMG LNWIDTH LNHEIGHT FILEPATH FILENAME THIS WIDTH HEIGHT SYSTEM DRAWING OGFX IMAGE FROMFILE LOPROP LCDATE LCSTRING GETTHUMBNAILIMAGE	 DRAWIMAGE
 DRAWSTRING CONTROLS setup,     ��
 beforedraw"    ��1 "�AAA 3 c1� BA A "��� � !�A ��SQB � 2                       8        Y  0  
    )   �                        header      header      Header1      Form1.Grid1.Column2      )Caption = "File Name"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column2      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.Column3      $Caption = "Size"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column3      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.Column4      $Caption = "Date"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column4      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      header      header      Header1      Form1.Grid1.Column5      $Caption = "Time"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column5      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      commandbutton      commandbutton      Command1      Form1      cTop = 428
Left = 356
Height = 27
Width = 84
Anchor = 12
Caption = "Print"
Name = "Command1"
      oPROCEDURE Click
PRIVATE oForm  && needed by report
oForm = ThisForm

REPORT FORM imgView PREVIEW
ENDPROC
      1PROCEDURE Click
ThisForm.LoadImages()
ENDPROC
      lTop = 428
Left = 110
Height = 27
Width = 101
Anchor = 12
Caption = "Choose Path..."
Name = "cmdPath"
      cmdPath      commandbutton      commandbutton      commandbutton      commandbutton      Command2      cTop = 428
Left = 452
Height = 27
Width = 84
Anchor = 12
Caption = "Close"
Name = "Command2"
      .PROCEDURE Click
ThisForm.Release()
ENDPROC
     PROCEDURE Click
#DEFINE CRLF CHR(13)+CHR(10)
#DEFINE PropertyTagDateTime 0x0132

LOCAL lcPath, lnFile, laFiles[1], lcHTML, lcThumbHTML
LOCAL lnWidth, lnHeight
LOCAL loImg AS xfcImage
LOCAL loThumb AS xfcImage
LOCAL loBmp AS xfcBitmap
LOCAL loGfx AS xfcGraphics
LOCAL loColor AS xfcColor
LOCAL loBrushLight AS xfcSolidBrush
LOCAL loBrushDark AS xfcSolidBrush
LOCAL loProp AS xfcPropertyItem

SELECT curImages
GO TOP 
lcPath = ADDBS(filepath)
lcThumbPath = lcPath+"Thumbs\"

IF NOT DIRECTORY(lcThumbPath)
	MD (lcThumbPath)
ENDIF

WITH _SCREEN.System.Drawing

loFont = .Font.New("Arial",10,1)
loColor = .Color.New(0x80000000)
loBrushDark = .SolidBrush.New(loColor)
loColor = .Color.New(0xa0ffffff)
loBrushLight = .SolidBrush.New(loColor)

loImg = NULL

lnWidth = 160
lnHeight = 120

lcThumbHTML = ""


SELECT curImages
SCAN
	lcFile = filename
	loImg = .Image.FromFile(lcPath+lcFile)
	loBmp = .Bitmap.New(160,120)
	loGfx = .Graphics.FromImage(loBmp)
	
	lcDate = ""
	** Get picture taken date
	IF NOT ISNULL(loImg.PropertyIdList[1])
		FOR EACH lnProp IN loImg.PropertyIdList
			loProp = loImg.GetPropertyItem(lnProp)
			IF loProp.Id = PropertyTagDateTime
				lcDate = ""+loProp.Value
				EXIT
			ENDIF
		ENDFOR
	ENDIF
	lcString = lcFile + CRLF + ;
				TRANSFORM(loImg.Width) + " x " + TRANSFORM(loImg.Height) + CRLF + ;
				lcDate	
	
	loGfx.Clear(.Color.White)
	loGFX.DrawImage(loImg,0,0,lnWidth,lnHeight)
	loGFX.DrawString(lcString, loFont, loBrushDark, 1, 1)
	loGFX.DrawString(lcString, loFont, loBrushLight, 0, 0)
	
	loBmp.Save(FORCEEXT(lcThumbPath+"thumb"+lcFile,"jpg"), .Imaging.ImageFormat.Jpeg)
	lcThumbHTML = lcThumbHTML + ;
				[   <a href="../]+lcFile+[" target="large">]+;
				[<img src="thumb]+FORCEEXT(lcFile,"jpg")+[" border="0" alt="]+lcString+["></a>]+CRLF

ENDSCAN

TEXT TO lcHTML NOSHOW TEXTMERGE
<html>
<body>
<<lcThumbHTML>>
</body>
</html>
ENDTEXT

ENDWITH

STRTOFILE(lcHTML, lcThumbPath+"default.htm")

MESSAGEBOX("File Created: "+lcThumbPath+"default.htm")


ENDPROC
     ����    �  �                        7   %   �      m  ?   �          �  U  � ��  � � ���� � � �� � � �� Q� XFCIMAGE� �� Q� XFCIMAGE� ��	 Q�	 XFCBITMAP� ��
 Q� XFCGRAPHICS� �� Q� XFCCOLOR� �� Q� XFCSOLIDBRUSH� �� Q� XFCSOLIDBRUSH� �� Q� XFCPROPERTYITEM� F� � #)� T�  �C� ���� T� ��  � Thumbs\�� %�C� ��
��$�
 ��� �� � ���9� � ����  T� �C� Arial�
��� � �� T� �C�
       �A�� � �� T� �C � �� � �� T� �C�
   ����A�� � �� T� �C � �� � �� T� ���� T� ����� T� ��x�� T� ��  �� F� � ~�E� T� �� �� T� �C�  � �� � �� T�	 �C���x�� � �� T�
 �C �	 �� � �� T�  ��  �� %�CC�� �! �
���� ��" � �! ��� T� �C �" � �# �� %�� �$ �2���� T�  ��  � �% �� !� � �� �B T�& �� C� C�
 C� �' _�  x C� �( _C� C�
 �  �� ��C�� �* �
 �) �� ��C � � �  �  � �
 �+ �� ��C �&  �  � ���
 �, �� ��C �&  �  � � � �
 �, ��0 ��CC� � thumb� � jpg����. �/ �0 �	 �- ��� T� �� �    <a href="../� � " target="large">� <img src="thumbC� � jpg��� " border="0" alt="�& � "></a>C� C�
 �� �
 M(� `�� � <html>� � <body>� � <<lcThumbHTML>>� � </body>� � </html>� � �� ��C� � � default.htm����- ��C� File Created: � � default.htm�x�� U1  LCPATH LNFILE LAFILES LCHTML LCTHUMBHTML LNWIDTH LNHEIGHT LOIMG LOTHUMB LOBMP LOGFX LOCOLOR LOBRUSHLIGHT LOBRUSHDARK LOPROP	 CURIMAGES FILEPATH LCTHUMBPATH SYSTEM DRAWING LOFONT FONT NEW COLOR
 SOLIDBRUSH LCFILE FILENAME IMAGE FROMFILE BITMAP GRAPHICS	 FROMIMAGE LCDATE PROPERTYIDLIST LNPROP GETPROPERTYITEM ID VALUE LCSTRING WIDTH HEIGHT CLEAR WHITE	 DRAWIMAGE
 DRAWSTRING SAVE IMAGING IMAGEFORMAT JPEG Click,     ��1 �� 11Aa1���r Q �� A "�a�a� � � � s � � ��a� r!QQAA A A A #B����B � � � Q� � A B ��3                             )   �                       ����    }  }                        m�   %   �           �          �  U  +  ��C�  � � � � �� B��  � � � �� U  THIS GRID1 COLUMN1 IMAGE1 DRAW�  ��  � � T� �C� Safetyv�� T�  �C�3�� %�C�  ���@ � B� �# %�C�� C�  ��� *.*�� ��� � F� � G.� S� SET SAFETY &lcSafety
 G �	 � �6 �CCC� ��f� JPG� GIF� BMP� EMF� TIF� PNG�
�� >� ���  �� #)� � ��C� �	 �� U
  LCPATH LCSAFETY LAIMAGES	 CURIMAGES FOR FILENAME ALL FILEPATH THIS REFRESHR O h��	 curImages� � V����� � I� � D� � C���� � V����� U 	 CURIMAGES FILENAME FILESIZE FILEDATE FILETIME FILEPATH  ��C�  � �� U  THIS
 LOADIMAGES getimage,     ��
 loadimages     �� Load�    �� Initf    ��1 b!2 � R� � A A 2q a A �a � a� Q A � 2 �2 � 2                       �         �   �        �           6  I  (    )   }                      %           V  :   �  5$8�  � ��  � �� � � ���� � � �� � � �� Q� XFCIMAGE� ��	 Q� XFCIMAGE� ��
 Q�	 XFCBITMAP� �� Q� XFCGRAPHICS� �� Q� XFCCOLOR� �� Q� XFCSOLIDBRUSH� �� Q� XFCSOLIDBRUSH� T� �C�  C�3�� T� �C� ���� T� �� � Thumbs\�� %�C� ��
���
 ��� �� � T� ����� T� ��x�� �� Q� XFCPROPERTYITEM�' T� �C� Arial�
��9� � � � ��$ T� �C�
       �A�9� � � � �� T� �C � �9� � � � ��$ T� �C�
   ����A�9� � � � �� T� �C � �9� � � � �� T� ���� T� ��  ��( �� ���(�C�� � � *.jpg����� T� �C � �� ��  T� �C� � �9� � � � �� T�
 �C���x�9� � � � �� T� �C �
 �9� � � � �� T� ��  �� %�CC�� � �
��*� ��  � � �&� T� �C �  � �! �� %�� �" �2��"� T� ��  � �# �� !� � �� �B T�$ �� C� C�
 C� �% _�  x C� �& _C� C�
 � �� ��C�9� � � �( � �' �� ��C � � �  �  � � �) �� ��C �$  �  � ��� �* �� ��C �$  �  � � � � �* ��. ��C� � thumb� �9� � �, �- �. �
 �+ ��� T� �� �    <a href="../� � " target="large">� <img src="thumb� � " border="0" alt="�$ � "></a>C� C�
 �� ��
 M(� `�� � <html>� � <body>� � <<lcThumbHTML>>� � </body>� � </html>� � ��C� � � default.htm���� U/  TCPATH LCPATH LNFILE LAFILES LCHTML LCTHUMBHTML LNWIDTH LNHEIGHT LOIMG LOTHUMB LOBMP LOGFX LOCOLOR LOBRUSHLIGHT LOBRUSHDARK LCTHUMBPATH LOPROP LOFONT SYSTEM DRAWING FONT NEW COLOR
 SOLIDBRUSH LCFILE IMAGE FROMFILE BITMAP GRAPHICS	 FROMIMAGE LCDATE PROPERTYIDLIST LNPROP GETPROPERTYITEM ID VALUE LCSTRING WIDTH HEIGHT CLEAR WHITE	 DRAWIMAGE
 DRAWSTRING SAVE IMAGING IMAGEFORMAT JPEGq �� 11Aa1��2�� A � � �sB�B�� � �Q��� r!QQAA A A A #�����B � � � Q� � A �1                 0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00MAIPF 889017090      /  F      ]                          �      �                       WINDOWS _1V00MAIPG 923481466�      �  �      �                                                           WINDOWS _1V00MAIPH 923481466s  �  �  �  �  �      .  X                                               COMMENT RESERVED                                �
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      LINES      vTop = 0
Left = 0
Height = 307
Width = 457
DoCreate = .T.
Caption = "Lines - Resize this form !"
Name = "LINES"
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      LINES      _Anchor = 15
Stretch = 0
Height = 276
Left = 12
Top = 12
Width = 432
Name = "Imgcanvas1"
     "PROCEDURE beforedraw
LOCAL loGfx AS xfcGraphics, lnHeight, lnWidth, lnWidth2

loGfx = This.oGfx

This.Clear(0xffffff)

**loGfx.SmoothingMode = 4

m.lnHeight = This.Height
m.lnWidth = This.Width
m.lnWidth2 = m.lnWidth/30


m.i=0
FOR m.x = 1 TO m.lnWidth STEP m.lnWidth2
	m.y = (m.lnHeight/30)*i
	m.loGfx.DrawLine(This.Pen2,0,m.y,m.x,m.lnHeight) 
	m.loGfx.DrawLine(This.Pen1,0,m.lnHeight-m.y,m.x,0) 
	m.i = m.i + 1
ENDFOR

*!*	TRY 
*!*		ThisForm.text1.Value = ThisForm.text1.Value + 1 
*!*	CATCH
*!*	ENDTRY

ENDPROC
PROCEDURE setup

WITH _SCREEN.System.Drawing AS xfcDrawing

	This.AddProperty("Font1", .Font.New("Arial",40,1))
	This.AddProperty("Brush1", .Brushes.Blue)
	This.AddProperty("Pen1", .Pens.Red)
	This.AddProperty("Pen2", .Pens.Blue)

ENDWITH

ENDPROC
     ����    k  k                        N�   %   �           �          �  U  <" ��  Q� XFCGRAPHICS� � � � T�  �� � �� ��C���� � � �� T�� �� � �� T�� �� � �� T�� ��� ��� T��	 �� ��# ���
 ���(��� ����� ��5� T�� ��� ��	 ��* ��C� � �  ��  ��
  �� ��  � ��, ��C� � � �� ��  ��
 � ��  � �� T��	 ���	 ��� �� U  LOGFX LNHEIGHT LNWIDTH LNWIDTH2 THIS OGFX CLEAR HEIGHT WIDTH I X Y DRAWLINE PEN2 PEN1�   ���9�  � �Q�
 XFCDRAWING�� �+ ��C� Font1C� Arial�(��� � � � �� ��C� Brush1�� � � � �� ��C� Pen1�� �	 � � �� ��C� Pen2�� � � � �� �� U
  SYSTEM DRAWING THIS ADDPROPERTY FONT NEW BRUSHES BLUE PENS RED
 beforedraw,     �� setup�    ��1 !2$!Q� 1���QA 8 ����B 2                               /        )   k                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923479001�      �  �      �      �  �@                  �                           WINDOWS _1U40L3TVG 898851297�          ,  9        �                                               WINDOWS _1U40L3TVH 890049958�	      �	  �	  �	  �	                                                           WINDOWS _1U40LO0FY 886788371W
      d
  q
  
  �
                                                           WINDOWS _1U40NTQI6 890049958�
      �
    �	                                                             WINDOWS _1U40NTQI7 890049958�      �  �  �  �      y  �                                               WINDOWS _1TP0L3VWK 890049958�      	    .  F      �  L                                               WINDOWS _1TP0L3VWL 8900499589      N  c  s  �        	                                               WINDOWS _1TZ0QGKPH 890049958�      �  �  �  �      M  �                                               WINDOWS _1TP0L3VWK 890049958�      �  �          �  {                                               WINDOWS _1U40VDSFQ 890049958      '  <  L  d      �  0                                               WINDOWS _1TP0L3VWK 890049958U      j    �  �        �                                               WINDOWS _1VF0267WW 890049958�      �  �  �  �                                                           WINDOWS _1VF03FNGA 890049958�      �  �  �  �      e  �                                               WINDOWS _1VF03FNGB 890049958�      �        3       �   �                                               WINDOWS _1VE04ASWR 898851448!  �  �  �  �  C      (!  �2                                               COMMENT RESERVED                                �                                                            B�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 14
Left = 18
Height = 375
Width = 516
DoCreate = .T.
BorderStyle = 1
Caption = "Change Color Intensities using LockBits"
MaxButton = .F.
MinButton = .F.
mode = 0
Name = "Form1"
     #PROCEDURE processimage
LPARAMETERS tcFile
Thisform.Container1.Visible = .T.
Thisform.txtFile.Value = LOCFILE(tcFile)
Thisform.Image1.Picture = tcFile
Thisform.Mode = 0
Thisform.Imgcanvas1.Draw()

ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage("gotdata.gif")

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       Z       )   �                         BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      FHeight = 180
Left = 264
Top = 12
Width = 240
Name = "Imgcanvas1"
      Form1      
Imgcanvas1      image      ..\gdiplusx.vcx      mode
*processimage 
      commandbutton      commandbutton      Command3      Form1      �Top = 204
Left = 12
Height = 25
Width = 96
Anchor = 12
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
      qPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile)

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ��	�� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       Z       )   �                         Form1      textbox      textbox      txtFile      Form1      lFontSize = 8
Anchor = 12
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
Name = "txtFile"
      image      image      Image1      Form1      NStretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
      	container      	container      
Container1      �Anchor = 12
Top = 252
Left = 4
Width = 500
Height = 116
BackStyle = 0
BorderWidth = 0
Visible = .F.
TabIndex = 3
Name = "Container1"
      commandbutton      commandbutton      Command1      Form1.Container1      rTop = 12
Left = 8
Height = 25
Width = 84
Anchor = 12
Caption = "GreyScale"
TabIndex = 1
Name = "Command1"
      jPROCEDURE Click
WITH Thisform
	Thisform.Mode = 1 && GreyScale
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       Z       )   �                         commandbutton      commandbutton      Command2      Form1.Container1      lTop = 48
Left = 8
Height = 25
Width = 84
Anchor = 12
Caption = "Red"
TabIndex = 4
Name = "Command2"
      nPROCEDURE Click
WITH Thisform
	Thisform.Mode = 2 && Stay only Red
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       \       )   �                         commandbutton      commandbutton      Command5      Form1.Container1      pTop = 48
Left = 104
Height = 25
Width = 84
Anchor = 12
Caption = "Green"
TabIndex = 5
Name = "Command5"
      pPROCEDURE Click
WITH Thisform
	Thisform.Mode = 3 && Stay only Green
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       ^       )   �                         commandbutton      commandbutton      Command6      Form1.Container1      oTop = 48
Left = 200
Height = 25
Width = 84
Anchor = 12
Caption = "Blue"
TabIndex = 6
Name = "Command6"
      oPROCEDURE Click
WITH Thisform
	Thisform.Mode = 4 && Stay only Blue
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       d       )   �                         commandbutton      commandbutton      Command7      Form1.Container1      qTop = 84
Left = 8
Height = 25
Width = 84
Anchor = 12
Caption = "Negative"
TabIndex = 7
Name = "Command7"
      iPROCEDURE Click
WITH Thisform
	Thisform.Mode = 5 && Negative
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       e       )   �                         commandbutton      commandbutton      Command3      Form1.Container1      qTop = 84
Left = 104
Height = 25
Width = 84
Anchor = 12
Caption = "Bright"
TabIndex = 8
Name = "Command3"
      gPROCEDURE Click
WITH Thisform
	Thisform.Mode = 6 && Bright
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       c       )   �                         commandbutton      commandbutton      Command4      Form1.Container1      oTop = 84
Left = 200
Height = 25
Width = 84
Anchor = 12
Caption = "Dark"
TabIndex = 9
Name = "Command4"
      ePROCEDURE Click
WITH Thisform
	Thisform.Mode = 7 && Dark
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  2  ���  ��+ � T�  � ���� ��C�� � �� �� U  THISFORM MODE
 IMGCANVAS1 DRAW Click,     ��1 � � A 2                       _       )   �                         optiongroup      optiongroup      Optiongroup1      Form1.Container1     �ButtonCount = 2
Value = 2
Height = 46
Left = 356
Top = 12
Width = 132
TabIndex = 10
Name = "Optiongroup1"
Option1.Caption = "Original Size"
Option1.Value = 0
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 127
Option1.Name = "Option1"
Option2.Caption = "ImgCanvas Size"
Option2.Value = 1
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 139
Option2.Name = "Option2"
      commandbutton      commandbutton      Command8      Form1.Container1      oTop = 12
Left = 200
Height = 25
Width = 84
Anchor = 12
Caption = "Hue2"
TabIndex = 3
Name = "Command8"
      ePROCEDURE Click
WITH Thisform
	Thisform.Mode = 9 && Hue2
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     ���    �   �                         �f   %   �       �      �           �  U  8  T�  �C��� %�C�  ���  � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A 2                       f       )   �                         commandbutton      commandbutton      Command9      Form1.Container1      oTop = 12
Left = 104
Height = 25
Width = 84
Anchor = 12
Caption = "Hue1"
TabIndex = 2
Name = "Command9"
      ePROCEDURE Click
WITH Thisform
	Thisform.Mode = 8 && Hue1
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      	imgcanvas     �PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

LOCAL loBmp AS xfcBitmap
LOCAL lotmpBmp AS xfcBitmap
LOCAL lotmpGfx AS xfcGraphics
LOCAL loRect AS xfcRectangle
LOCAL loBmpData AS xfcBitmapData

LOCAL lnWidth, lnHeight, nBytes, b, g, r, lnPos0

WITH _SCREEN.System.Drawing

	WAIT WINDOW "Converting Image, Please Wait..." NOWAIT 
	This.Clear

	loBmp = .Bitmap.New(Thisform.txtFile.Value)
	
	IF Thisform.Container1.Optiongroup1.Value = 1 && Original size (slow)
		lnWidth = loBmp.Width
		lnHeight = loBmp.Height
	ELSE && 2 ImageCanvas size (fast)
		lnWidth = This.Width
		lnHeight = This.Height
	ENDIF 

	lotmpBmp = .Bitmap.New(lnWidth, lnHeight)
	lotmpGfx = _screen.System.Drawing.Graphics.FromImage(lotmpBmp)
	lotmpGfx.DrawImage(loBmp,0,0,lnWidth,lnHeight)
	
	loRect = .Rectangle.New(0, 0, lnWidth, lnHeight)
	loBmpData = lotmpBmp.LockBits(loRect, .Imaging.ImageLockMode.ReadWrite, ;
		_screen.System.Drawing.Imaging.PixelFormat.Format24bppRGB)
	nBytes = loBmpData.Width * loBmpData.Height * 3

	LOCAL lnSecs
	lnSecs = SECONDS()

	DO CASE
	
	CASE Thisform.Mode = 1 && GreyScale
		LOCAL lcGrey
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = ASC(SYS(2600, lnPos0, 1))
				g = ASC(SYS(2600, lnPos0 + 1, 1))
				r = ASC(SYS(2600, lnPos0 + 2, 1))
				lcGrey = CHR(INT((r + g + b) / 3))
				SYS(2600, lnPos0, 3, REPLICATE(lcGrey,3))
			NEXT
		NEXT

	CASE Thisform.Mode = 2 && Keep Red / Clear Green and Blue
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 0, 1, CHR(0))
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 1, 1, CHR(0))
			NEXT
		NEXT

	CASE Thisform.Mode = 3 && Keep Green / Clear Red and Blue
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 0, 1, CHR(0))
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 2, 1, CHR(0))
			NEXT
		NEXT

	CASE Thisform.Mode = 4 && Keep Blue / Clear Red and Green
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 1, 1, CHR(0))
			   SYS(2600, loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x) + 2, 1, CHR(0))
			NEXT
		NEXT

	CASE Thisform.Mode = 5 && Negative
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = ASC(SYS(2600, lnPos0, 1))
				g = ASC(SYS(2600, lnPos0 + 1, 1))
				r = ASC(SYS(2600, lnPos0 + 2, 1))
				SYS(2600, lnPos0, 3, CHR(255 - b ) + CHR(255 - g ) + CHR(255 - r))
			NEXT
		NEXT

	CASE Thisform.Mode = 6 && Bright
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = ASC(SYS(2600, lnPos0, 1))
				g = ASC(SYS(2600, lnPos0 + 1, 1))
				r = ASC(SYS(2600, lnPos0 + 2, 1))
				SYS(2600, lnPos0, 3, CHR(MIN( b + 50, 255)) + CHR(MIN( g + 50, 255)) + CHR(MIN( r + 50, 255)))
			NEXT
		NEXT

	CASE Thisform.Mode = 7 && Dark
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = ASC(SYS(2600, lnPos0, 1))
				g = ASC(SYS(2600, lnPos0 + 1, 1))
				r = ASC(SYS(2600, lnPos0 + 2, 1))
				SYS(2600, lnPos0, 3, CHR(MAX( b - 50, 0)) + CHR(MAX( g - 50, 0)) + CHR(MAX( r - 50, 0)))
			NEXT
		NEXT

	CASE Thisform.Mode = 8 && Hue1
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = SYS(2600, lnPos0, 1)
				g = SYS(2600, lnPos0 + 1, 1)
				r = SYS(2600, lnPos0 + 2, 1)
				SYS(2600, lnPos0, 3, g + r + b)
			NEXT
		NEXT

	CASE Thisform.Mode = 9 && Hue2
		FOR y = 0 TO loBmpData.Height - 1
			FOR x = 0 TO loBmpData.Width - 1
				lnPos0 = loBmpData.Scan0 + (loBmpData.Stride * y) + (3 * x)
				b = SYS(2600, lnPos0, 1)
				g = SYS(2600, lnPos0 + 1, 1)
				r = SYS(2600, lnPos0 + 2, 1)
				SYS(2600, lnPos0, 3, r + b + g)
			NEXT
		NEXT


	ENDCASE 
	
	lotmpBmp.UnlockBits(loBmpData)
	This.oGfx.DrawImage(lotmpBmp,This.Rectangle)

	WAIT CLEAR 
	WAIT WINDOW "Elapsed " + TRANSFORM(SECONDS() - lnSecs) + " seconds." NOWAIT 

ENDWITH
ENDPROC
     ����    �  �                        s   %   �      �  x   �          �  U  �
 %�C�  � � ��� � B� � �� Q�	 XFCBITMAP� �� Q�	 XFCBITMAP� �� Q� XFCGRAPHICS� �� Q� XFCRECTANGLE� �� Q� XFCBITMAPDATA� �� �	 �
 � � � � � ���9� � ���
�+ R,:��  Converting Image, Please Wait...��
 �� � � T� �C�  � � �� � �� %��  � � � ���E� T� �� � �� T�	 �� � �� �m� T� �� � �� T�	 �� � �� � T� �C �  �	 �� � �� T� �C � �9� � � � �� ��C � � �  �  �	 � � ��  T� �C� �  �  �	 �� � ��0 T� �C � �� � �  �9� � � �! �" � � �� T�
 �� � � � ��� ��# � T�# �C��� H�R�r
� ��  �$ ���^� ��% � ��& �� �(�� � ���Z� ��' �� �(�� � ���V�% T� �� �( � �) �& ��' �� T� �CC�(
� �]�� T� �CC�(
� ��]�� T� �CC�(
� ��]�� T�% �CC� � � �8 �� ��C�(
� �C�% �Q]�� �� �� ��  �$ ���� ��& �� �(�� � ���� ��' �� �(�� � ����3 ��C�(
� �( � �) �& ��' � �C�  ]��3 ��C�(
� �( � �) �& ��' ��C�  ]�� �� �� ��  �$ ����� ��& �� �(�� � ����� ��' �� �(�� � �����3 ��C�(
� �( � �) �& ��' � �C�  ]��3 ��C�(
� �( � �) �& ��' ��C�  ]�� �� �� ��  �$ ����� ��& �� �(�� � ����� ��' �� �(�� � �����3 ��C�(
� �( � �) �& ��' ��C�  ]��3 ��C�(
� �( � �) �& ��' ��C�  ]�� �� �� ��  �$ ����� ��& �� �(�� � ����� ��' �� �(�� � �����% T� �� �( � �) �& ��' �� T� �CC�(
� �]�� T� �CC�(
� ��]�� T� �CC�(
� ��]��/ ��C�(
� �C���  C���  C���  ]�� �� �� ��  �$ ����� ��& �� �(�� � ����� ��' �� �(�� � �����% T� �� �( � �) �& ��' �� T� �CC�(
� �]�� T� �CC�(
� ��]�� T� �CC�(
� ��]��> ��C�(
� �CC� �2��F CC� �2��F CC� �2��F ]�� �� �� ��  �$ ����� ��& �� �(�� � ����� ��' �� �(�� � �����% T� �� �( � �) �& ��' �� T� �CC�(
� �]�� T� �CC�(
� ��]�� T� �CC�(
� ��]��> ��C�(
� �CC� �2� D CC� �2� D CC� �2� D ]�� �� �� ��  �$ ����	� ��& �� �(�� � ����	� ��' �� �(�� � ����	�% T� �� �( � �) �& ��' �� T� �C�(
� �]�� T� �C�(
� ��]�� T� �C�(
� ��]�� ��C�(
� �� � � ]�� �� �� ��  �$ �	��r
� ��& �� �(�� � ���n
� ��' �� �(�� � ���j
�% T� �� �( � �) �& ��' �� T� �C�(
� �]�� T� �C�(
� ��]�� T� �C�(
� ��]�� ��C�(
� �� � � ]�� �� �� � ��C � � �* �� ��C � � � � �+ � �� R�) R,:�� Elapsed CC��# _�	  seconds.�� �� U,  THISFORM TXTFILE VALUE LOBMP LOTMPBMP LOTMPGFX LORECT	 LOBMPDATA LNWIDTH LNHEIGHT NBYTES B G R LNPOS0 SYSTEM DRAWING THIS CLEAR BITMAP NEW
 CONTAINER1 OPTIONGROUP1 WIDTH HEIGHT GRAPHICS	 FROMIMAGE	 DRAWIMAGE	 RECTANGLE LOCKBITS IMAGING IMAGELOCKMODE	 READWRITE PIXELFORMAT FORMAT24BPPRGB LNSECS MODE LCGREY Y X SCAN0 STRIDE
 UNLOCKBITS OGFX
 beforedraw,     ��1 QA A BAaq��"�� ��� A ����r � � Bq ��Q�����A A B��11A A B��11A A B��11A A B��Q����A A B��Q����A A B��Q����A A B��Qa���A A B��Qa���A A C �R �B 1                       �      )   �                       ����    �  �                        
   %   7      q     [          �  U  d  ��  � T� � � �a�� T� � � �C�  ��� T� � � ��  �� T� � �� �� ��C� �	 �
 �� U  TCFILE THISFORM
 CONTAINER1 VISIBLE TXTFILE VALUE IMAGE1 PICTURE MODE
 IMGCANVAS1 DRAW' 	 ��C��� ��C� gotdata.gif�  � �� U  THISFORM PROCESSIMAGE processimage,     �� Init�     ��1 q a13 � �2                       �         �     
    )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 898870615�      �  �      �                                                           WINDOWS _1TN1AHCZI 898870607^  o  �  �  �  �        P                                               WINDOWS _1TN1CD85P 898870615=      *    	  �      s  `
                                               COMMENT RESERVED                                J                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      aTop = -1
Left = 0
Height = 445
Width = 597
DoCreate = .T.
Caption = "Pens"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 447
Left = -1
Top = -1
Width = 599
Name = "Imgcanvas1"
     EPROCEDURE beforedraw
LOCAL aNames[1], p, y, nLineCap

WITH _SCREEN.System.Drawing
	THIS.CLEAR()
	DO CASE
	** LineCap *************************************
	CASE ThisForm.OptionGroup1.Value = 1
		m.p = .Pen.New(.Color.Black, 20)
		m.y = 20
		** Get an array of all the LineCap enumeration names
		aNames = _SCREEN.System.Enum.GetNames(.Drawing2D.LineCap)
		FOR i = 1 TO ALEN(aNames)
			nLineCap = _SCREEN.System.Enum.Parse(.Drawing2D.LineCap, aNames(i))
			p.StartCap = nLineCap
			p.EndCap = nLineCap
			This.oGfx.DrawLine(p, 30, Y, 230, Y)
			This.oGfx.DrawString(aNames(i), .Font.New("Arial",10), .Brushes.Black, 260, m.y-10, .StringFormat.GenericTypographic)
			m.y = m.y + 40
		NEXT
		
	** DashStyle ***********************************
	CASE ThisForm.OptionGroup1.Value = 2
		m.p = .Pen.New(.Color.Black, 10)
		m.y = 20
		** Get an array of all the DashStyle enumeration names
		aNames = _SCREEN.System.Enum.GetNames(.Drawing2D.DashStyle)
		FOR i = 1 TO ALEN(aNames)
			p.DashStyle = _SCREEN.System.Enum.Parse(.Drawing2D.DashStyle, aNames(i))
			This.oGfx.DrawLine(m.p, 20, m.y, 420, m.y)
			This.oGfx.DrawString(aNames(i), .Font.New("Arial",10), .Brushes.Black, 440, m.y-10, .StringFormat.GenericTypographic)
			m.y = m.y + 40
		ENDFOR
		
	** Compound lines ******************************
	CASE ThisForm.OptionGroup1.Value = 3
		p = .Pen.New(.Color.Black, 20)
		p.CompoundArray = _SCREEN.System.Single.NewArray(0, 0.2, 0.3, 0.6, 0.7, 1)
		This.oGfx.DrawRectangle(p, 20, 20, 200, 150)
		This.oGfx.DrawEllipse(p, 20, 200, 200, 150)
	ENDCASE
ENDWITH

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
     DButtonCount = 3
Anchor = 12
Value = 1
Height = 65
Left = 491
Top = 361
Width = 86
Name = "Optiongroup1"
Option1.Caption = "Example 1"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 76
Option1.Name = "Option1"
Option2.Caption = "Example 2"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 76
Option2.AutoSize = .F.
Option2.Name = "Option2"
Option3.Caption = "Example 3"
Option3.Height = 17
Option3.Left = 5
Option3.Top = 43
Option3.Width = 76
Option3.AutoSize = .F.
Option3.Name = "Option3"
      Form1      Optiongroup1      optiongroup      optiongroup     ����    �  �                        #   %   �      F  #              �  U  z ��  ���� � � � ���9� � ��s� ��C� � �� H�E �o� �� �	 �
 ����� T�� �C�� � ��� � �� T�� ���� T�  �C�� � �9� � � �� �� ���(�C��  �����% T� �C�� � C � �  �9� � � �� T� � �� �� T� � �� ��" ��C � � � �� � � � � ��F ��CC � �  C� Arial�
�� � �� � ��� �
�� � � � � �� T�� ��� �(�� �� �� �	 �
 ����� T�� �C�� � �
�� � �� T�� ���� T�  �C�� � �9� � � �� �� ���(�C��  �����( T� � �C�� � C � �  �9� � � ��) ��C �� � �� �� �� � � � ��F ��CC � �  C� Arial�
�� � �� � ���� �
�� � � � � �� T�� ��� �(�� �� �� �	 �
 ���o� T� �C�� � ��� � ��K T� � �C� ��������?�333333�?�333333�?�ffffff�?��9� �  �! ��  ��C � ������� � �" ��  ��C � �������� � �# �� � �� U$  ANAMES P Y NLINECAP SYSTEM DRAWING THIS CLEAR THISFORM OPTIONGROUP1 VALUE PEN NEW COLOR BLACK ENUM GETNAMES	 DRAWING2D LINECAP I PARSE STARTCAP ENDCAP OGFX DRAWLINE
 DRAWSTRING FONT BRUSHES STRINGFORMAT GENERICTYPOGRAPHIC	 DASHSTYLE COMPOUNDARRAY SINGLE NEWARRAY DRAWRECTANGLE DRAWELLIPSE
 beforedraw,     ��1 �"� � r�� ��Q!aQA s�� ����aQA s��A A 2                       :      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 885804635      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 910930381�      �  �      �      �  �                  �                           WINDOWS _1TZ0QGKPH 910930381�  �  �      &      ~  d4                                               WINDOWS _1U200PXOO 890049972y'      �'  �'  �'  �'      c*  �                                               WINDOWS _1U200PXOP 886637327�+      �+  �+  �+  �+                                                           WINDOWS _1U200PXOQ 910397924 ,      /,  >,  K,  f,      �,  �                                               WINDOWS _1U200PXOR 886637327�-      �-  �-  .  (.                                                           WINDOWS _1U200PXOS 910397924d.      s.  �.  �.  �.      /                                                 WINDOWS _1U200PXOV 88663732710      ?0  M0  \0  w0                                                           WINDOWS _1U200PXOW 886637190�0      �0  �0  �0  �0                                                           WINDOWS _1U200VGYU 910398235[1      k1  �-  �-  �/      I/                                                 WINDOWS _1U2010IWM 886638053�-      �-  �-  �+  f-                                                           WINDOWS _1U2010IWN 910398004s+      d+  l'  I+  -      �*  �
                                               WINDOWS _1TP0L3VWK 890049972Y'      F'  2'  %'  {1      &&  Q	                                               WINDOWS _1U3003IYQ 890049972�      �  �  y  A%      �$  `                                               WINDOWS _1U3003IYR 890049972l      _  Q  D  $                                                           COMMENT RESERVED                                                                                            ?�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = -6
Left = 43
Height = 453
Width = 512
DoCreate = .T.
Caption = "Pie Charts"
MinHeight = 230
MinWidth = 380
Name = "Form1"
     �PROCEDURE changecolor
LPARAMETERS tnRGB, tnLevel

IF tnLevel = 0
	RETURN tnRGB
ENDIF 

tnLevel = tnLevel / 100

LOCAL lnRed, lnGreen, lnBlue
lnRed   = BITAND(tnRGB, 0x000000FF)
lnGreen = BITRSHIFT(BITAND(tnRGB, 0x0000FF00), 8)
lnBlue  = BITRSHIFT(BITAND(tnRGB, 0x00FF0000), 16)

IF tnLevel > 0
	RETURN RGB( ;
		lnRed   + ((255 - lnRed)   * tnLevel) , ;
		lnGreen + ((255 - lnGreen) * tnLevel) , ;
		lnBlue  + ((255 - lnBlue)  * tnLevel) )
ELSE 
	RETURN RGB( ;
		lnRed   + (lnRed   * tnLevel) , ;
		lnGreen + (lnGreen * tnLevel) , ;
		lnBlue  + (lnBlue  * tnLevel) )
ENDIF 
ENDPROC
PROCEDURE Load
SET TALK OFF

CREATE CURSOR sales (nValue n(8,2), cLegend c(6), lDetach l, nColor i)
INSERT INTO sales VALUES (250, "JAN", .F., RGB(0,0,255)   )
INSERT INTO sales VALUES (128, "FEB", .T., RGB(0,255,255) )
INSERT INTO sales VALUES ( 90, "MAR", .F., RGB(255,0,255) )
INSERT INTO sales VALUES (330, "APR", .F., RGB(255,160,60))
INSERT INTO sales VALUES (250, "MAY", .T., RGB(255,255,0) )
INSERT INTO sales VALUES (150, "JUN", .F., RGB(0,255,64)  )
INSERT INTO sales VALUES (180, "JUL", .F., RGB(255,0,0)   )
INSERT INTO sales VALUES (100, "AUG", .T., RGB(128,128,128))
SELECT sales
GO TOP 

ENDPROC
      ����    �   �                         ��   %   f       �      �           �  U    ��C�  � � � �� U  THIS PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 11                       :       )   �                        ����    n  n                        _L   %   �       %  
             �  U  z  %��  � ���6 � T� � � �a�� T� � � �a�� �` � T� � � �-�� T� � � �-�� � ��C�  � � � �� U	  THIS VALUE THISFORM LABEL1 VISIBLE SPINNER1 PARENT
 IMGCANVAS1 DRAW InteractiveChange,     ��1 A� A 21                       �       )   n                       3���                              ��   %   �       �      �           �  U  @  T�  �� � �� >� � ��C�  ���
 �� � � ��C� � � �� U  LNCOLOR SALES NCOLOR THIS REFRESH THISFORM
 IMGCANVAS1 DRAW DblClick,     ��1 1� 1                       �       )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      Label1      label      label      Form1      Spinner1      spinner      spinner      *changecolor 
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      PAnchor = 15
Height = 180
Left = 0
Top = 0
Width = 180
Name = "Imgcanvas1"
     �PROCEDURE setup
This.Top = 0
This.Left = 0
This.Width = Thisform.Width
This.Height = Thisform.Height - Thisform.Grid1.Height - 5
This.ZOrder(1)
IF NOT DODEFAULT()
	RETURN .F.
ENDIF

ENDPROC
PROCEDURE beforedraw
LOCAL loSolidBrush AS xfcSolidBrush
LOCAL loGBrush AS xfcLinearGradientBrush
LOCAL loHatchBrush as xfcHatchBrush

LOCAL loPen AS xfcPen
LOCAL loFont AS xfcFont

LOCAL lnX, lnY, x1, y1, lnWidth, lnHeight, lnAngle, wImg, hImg
LOCAL lnDetachPixels, lnLegendWidth 
LOCAL lnTotal, lnStart, lnSweep

WITH _SCREEN.SYSTEM.Drawing

	CALCULATE SUM(sales.nValue) TO lnTotal

	lnDetachPixels = 30
	lnLegendWidth = 120

	lnX = 0 + lnDetachPixels + 5
	lnY = 0 + lnDetachPixels + 5

	wImg = THIS.WIDTH - (lnDetachPixels * 2) - 10 - lnLegendWidth
	hImg = THIS.HEIGHT - (lnDetachPixels * 2) - 10

* Draw the pie
	lnStart = 270
	lnWidth = wImg
	lnHeight = hImg

	THIS.CLEAR()
	THISFORM.CLS()

	SCAN
		lnSweep = sales.nValue / lnTotal * 360

		IF sales.lDetach = .T.
			lnDetachAngle = 360 - (lnStart + (lnSweep / 2))
			x1 = lnX + (COS(DTOR(lnDetachAngle)) * lnDetachPixels)
			y1 = lnY - (SIN(DTOR(lnDetachAngle)) * lnDetachPixels)
		ELSE
			x1 = lnX
			y1 = lnY
		ENDIF

		DO CASE
			CASE THISFORM.Optiongroup1.VALUE = 1 && Solid Brush
				loSolidBrush = .SolidBrush.New(.COLOR.FromRGB(sales.nColor))
				loMainBrush = loSolidBrush

			CASE THISFORM.Optiongroup1.VALUE = 2 && Gradient Path Brush

				loPath = .Drawing2D.GraphicsPath.New()
				loPath.AddEllipse(x1, y1, lnWidth, lnHeight)

				loPathGradBrush = .Drawing2D.PathGradientBrush.New(loPath)
				loPathGradBrush.CenterColor = .COLOR.FromRGB(THISFORM.ChangeColor(sales.nColor,THISFORM.Spinner1.VALUE * 10))

				loPathGradBrush.SurroundColors[1] = .Color.FromRGB(sales.nColor)

				loMainBrush = loPathGradBrush

			CASE THISFORM.Optiongroup1.VALUE = 3 && Monochrome - HatchBrush
				loHatchBrush = .Drawing2D.HatchBrush.New( ;
					RECNO()*2, ; && HatchStyle
				.COLOR.Black, ; && ForeColor
				.COLOR.White ) && BackColor
				loMainBrush = loHatchBrush
		ENDCASE

		loPen   = .PEN.New(.COLOR.Black)

		THIS.oGfx.FillPie(loMainBrush, x1, y1, lnWidth, lnHeight, lnStart, lnSweep)
		THIS.oGfx.DrawPie(loPen, x1, y1, lnWidth, lnHeight, lnStart, lnSweep)
		lnStart = lnStart + lnSweep
	ENDSCAN


*** Draw Legends

	x1 = This.Width - lnLegendWidth + 15
	y1 = 30
	lnWidth = 20
	lnHeight = 20

	loFont = .Font.New("Arial",10)
	loBlackBrush = .Brushes.Black

	SCAN

		DO CASE
			CASE THISFORM.Optiongroup1.VALUE = 1 && Solid Brush
				loSolidBrush = .SolidBrush.New(.COLOR.FromRGB(sales.nColor))
				loMainBrush = loSolidBrush

			CASE THISFORM.Optiongroup1.VALUE = 2 && Gradient Path Brush

				loPath = .Drawing2D.GraphicsPath.New()
				loPath.AddRectangle(x1, y1, lnWidth, lnHeight)

				loPathGradBrush = .Drawing2D.PathGradientBrush.New(loPath)
				loPathGradBrush.CenterColor = .COLOR.FromRGB(THISFORM.ChangeColor(sales.nColor,THISFORM.Spinner1.VALUE * 10))

				loPathGradBrush.SurroundColors[1] = .Color.FromRGB(sales.nColor)

				loMainBrush = loPathGradBrush

			CASE THISFORM.Optiongroup1.VALUE = 3 && Monochrome - HatchBrush
				loHatchBrush = .Drawing2D.HatchBrush.New( ;
					RECNO()*2, ; && HatchStyle
				.COLOR.Black, ; && ForeColor
				.COLOR.White ) && BackColor
				loMainBrush = loHatchBrush
		ENDCASE

		loPen   = .PEN.New(.COLOR.Black)

		THIS.oGfx.FillRectangle(loMainBrush, x1, y1, lnWidth, lnHeight)
		THIS.oGfx.DrawRectangle(loPen, x1, y1, lnWidth, lnHeight)

		THIS.oGfx.DrawString(sales.cLegend, loFont, loBlackBrush, x1 + 28, y1 + 3)

		y1 = y1 + 30

	ENDSCAN
	GO TOP

ENDWITH
RETURN

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  *  >�  � ���  � �� ��C� � � �� �� U  SALES LDETACH THISFORM
 IMGCANVAS1 DRAW Click,     ��1 1A 1                       a       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 1                       +       )   �                         ����    �   �                         ��   %   s       �      �           �  U  "  T�  � � �� sales.nColor�� U  THIS COLUMN5 DYNAMICBACKCOLOR Init,     ��1 �1                       >       )   �                        Q���    8  8                        �   %   �      �     �          �  U   ��  � � %�� � ��% �	 B��  �� � T� �� �d�� �� � � � T� �C�  �
���� T� �CC�  �
 �  ����� T� �CC�  �
  � ����� %�� � ��� �< B�C� ��� � � ��� � � ��� � �^�� ��- B�C� � � � � � � � � �^�� � U  TNRGB TNLEVEL LNRED LNGREEN LNBLUE� G2�B h�� sales� � N������� � C���� � L� � I�1 r�� sales������� JAN��-��C� � ���^��1 r�� sales������� FEB��a��C� �����^��1 r�� sales���Z��� MAR��-��C��� ���^��2 r�� sales���J��� APR��-��C�����<�^��1 r�� sales������� MAY��a��C����� �^��1 r�� sales������� JUN��-��C� ���@�^��1 r�� sales������� JUL��-��C��� � �^��1 r�� sales���d��� AUG��a��C�������^�� F�  � #)� U  SALES NVALUE CLEGEND LDETACH NCOLOR changecolor,     �� Loadu    ��1 � � A � 1���� �A 2 a "!q Q 2                       T        o  �      )   8                        �FontBold = .T.
Anchor = 12
WordWrap = .T.
BackStyle = 0
Caption = "GradientLevel (-10  +10)"
Height = 33
Left = 321
Top = 375
Visible = .F.
Width = 85
TabIndex = 5
ForeColor = 255,0,0
Name = "Label1"
      EPROCEDURE InteractiveChange
This.Parent.imgcanvas1.Draw()
ENDPROC
      �Anchor = 12
Height = 25
KeyboardHighValue = 10
KeyboardLowValue = -10
Left = 405
SpinnerHighValue =  10.00
SpinnerLowValue = -10.00
TabIndex = 3
Top = 375
Visible = .F.
Width = 54
Value = 5
Name = "Spinner1"
      �PROCEDURE InteractiveChange
IF This.Value = 2 && Gradient
	Thisform.Label1.Visible = .T.
	Thisform.Spinner1.Visible = .T.
ELSE
	Thisform.Label1.Visible = .F.
	Thisform.Spinner1.Visible = .F.
ENDIF

This.Parent.imgcanvas1.Draw()
ENDPROC
      Form1      Optiongroup1      optiongroup      optiongroup      Text1      grid      grid      Grid1      Form1     �ColumnCount = 4
Anchor = 6
AllowAddNew = .T.
Height = 148
Left = 0
Panel = 1
RecordSource = "sales"
TabIndex = 1
Top = 300
Width = 278
Name = "Grid1"
Column1.ControlSource = "sales.clegend"
Column1.Name = "Column1"
Column2.ControlSource = "sales.nvalue"
Column2.InputMask = "999,999.99"
Column2.Name = "Column2"
Column3.Alignment = 2
Column3.ColumnOrder = 4
Column3.ControlSource = "sales.ldetach"
Column3.CurrentControl = "Check1"
Column3.Width = 54
Column3.Sparse = .F.
Column3.Name = "Column4"
Column4.ColumnOrder = 3
Column4.ControlSource = "''"
Column4.Width = 31
Column4.Sparse = .F.
Column4.DynamicBackColor = '"sales.nColor"'
Column4.Name = "Column5"
      IPROCEDURE Init
This.Column5.DynamicBackColor = 'sales.nColor'
ENDPROC
      �PROCEDURE DblClick
lnColor = sales.nColor
replace sales.nColor WITH GETCOLOR(lnColor)
This.Refresh 
Thisform.Imgcanvas1.Draw()
ENDPROC
      Form1.Grid1.Column5      textbox      textbox      Form1.Grid1.Column5      header      header      Header1      Form1.Grid1.Column1      5Alignment = 2
Caption = "Legend"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column1      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
       Caption = ""
Name = "Header1"
      Header1      header      header      Form1.Grid1.Column4      Check1      header      header      Header1      Form1.Grid1.Column2      4Alignment = 2
Caption = "Value"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column2      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      6PROCEDURE Valid
Thisform.Imgcanvas1.Draw()
ENDPROC
      lPROCEDURE Click
replace sales.lDetach WITH sales.lDetach
Thisform.Imgcanvas1.Draw()
NODEFAULT 
ENDPROC
      lTop = 23
Left = 41
Height = 17
Width = 60
Alignment = 0
Centered = .T.
Caption = ""
Name = "Check1"
      header      header      Header1      Form1.Grid1.Column4      5Alignment = 2
Caption = "Detach"
Name = "Header1"
      textbox      textbox      Text1      Form1.Grid1.Column4      YBorderStyle = 0
Margin = 0
ForeColor = 0,0,0
BackColor = 255,255,255
Name = "Text1"
      checkbox      checkbox     �AutoSize = .T.
ButtonCount = 3
Anchor = 12
Value = 1
Height = 65
Left = 314
Top = 303
Width = 186
TabIndex = 2
Name = "Optiongroup1"
Option1.Caption = "Colored Solid Brush"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Style = 0
Option1.Top = 5
Option1.Width = 176
Option1.AutoSize = .F.
Option1.Name = "Option1"
Option2.Caption = "Colored Gradient Path Brush"
Option2.Height = 17
Option2.Left = 5
Option2.Style = 0
Option2.Top = 24
Option2.Width = 176
Option2.AutoSize = .F.
Option2.Name = "Option2"
Option3.Caption = "Monochrome (HatchBrush)"
Option3.Height = 17
Option3.Left = 5
Option3.Style = 0
Option3.Top = 43
Option3.Width = 176
Option3.AutoSize = .F.
Option3.Name = "Option3"
     e���    L  L                        j   %   
      �
  ]   9
          �  U  �  T�  � �� �� T�  � �� �� T�  � �� � ��! T�  � �� � � � � ��� ��C��  � �� %�C�
��y � B�-�� � U  THIS TOP LEFT WIDTH THISFORM HEIGHT GRID1 ZORDER� ��  Q� XFCSOLIDBRUSH�! �� Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCHATCHBRUSH� �� Q� XFCPEN� �� Q� XFCFONT�' �� � � � �	 �
 � � � � �� � � �� � � � ���9� � ���� }(� ��� � �� T� ���� T� ��x�� T� �� � ��� T� �� � ���! T� �� � � ��
� �� T� �� � � ��
�� T� ���� T�	 �� �� T�
 �� �� ��C� � �� ��C� � �� ~�,� T� �� � � �h�� %�� � a��#� T� ��h� � ��� T� �� CC� ��C� �� T� �� CC� ��D� �� �E� T� �� �� T� �� �� � H�V��� �� � �  �����  T�  �CC� �% ��# �$ ��! �" �� T�& ��  �� �� � �  ���Y� T�' �C��( �) �" �� ��C �  �  �	  �
 �' �* �� T�+ �C �' ��( �, �" ��/ T�+ �- �CC� �% � �/ �  �
� �. ��# �$ ��! T�+ �0 ����C� �% ��# �$ �� T�& ��+ �� �� � �  �����) T� �CCO���# �2 ��# �3 ��( �1 �" �� T�& �� �� � T� �C��# �2 ��4 �" ��, ��C �&  �  �  �	  �
  �  � � �5 �6 ��, ��C �  �  �  �	  �
  �  � � �5 �7 �� T� �� � �� � T� �� � � ��� T� ���� T�	 ���� T�
 ���� T� �C� Arial�
��8 �" �� T�9 ���: �2 �� ~��� H���� �� � �  �����  T�  �CC� �% ��# �$ ��! �" �� T�& ��  �� �� � �  ����� T�' �C��( �) �" �� ��C �  �  �	  �
 �' �; �� T�+ �C �' ��( �, �" ��/ T�+ �- �CC� �% � �/ �  �
� �. ��# �$ ��! T�+ �0 ����C� �% ��# �$ �� T�& ��+ �� �� � �  ����) T� �CCO���# �2 ��# �3 ��( �1 �" �� T�& �� �� � T� �C��# �2 ��4 �" ��$ ��C �&  �  �  �	  �
 � �5 �< ��$ ��C �  �  �  �	  �
 � �5 �= ��, ��C� �?  �  �9 � �� �� �5 �> �� T� �� ��� � #)� �� B� U@  LOSOLIDBRUSH LOGBRUSH LOHATCHBRUSH LOPEN LOFONT LNX LNY X1 Y1 LNWIDTH LNHEIGHT LNANGLE WIMG HIMG LNDETACHPIXELS LNLEGENDWIDTH LNTOTAL LNSTART LNSWEEP SYSTEM DRAWING SALES NVALUE THIS WIDTH HEIGHT CLEAR THISFORM CLS LDETACH LNDETACHANGLE OPTIONGROUP1 VALUE
 SOLIDBRUSH NEW COLOR FROMRGB NCOLOR LOMAINBRUSH LOPATH	 DRAWING2D GRAPHICSPATH
 ADDELLIPSE LOPATHGRADBRUSH PATHGRADIENTBRUSH CENTERCOLOR CHANGECOLOR SPINNER1 SURROUNDCOLORS
 HATCHBRUSH BLACK WHITE PEN OGFX FILLPIE DRAWPIE FONT LOBLACKBRUSH BRUSHES ADDRECTANGLE FILLRECTANGLE DRAWRECTANGLE
 DRAWSTRING CLEGEND setup,     ��
 beforedraw�     ��1 1� q A 3 ��!r� � "2� � RQ�� � � � � � �"���� � � A � q� rR���� r�� A ���A �� � � �� � q� rR���� r�� A �BA�B Q B A 2                       �      
   �   w      )   L                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 924910598�      �  �      �      N  &H                  �                           WINDOWS _1TZ0QGKPH 889819180P  a    �  �  �      =  �A                                               WINDOWS _1TP0L3VWK 890049991�'      �'  �'  �'  �'                                                           WINDOWS _1TP0L3VWK 889819180�(      �(  �(  �(  �(      L)  y.                                               WINDOWS _1U40NTQI6 890049991�4      �4  �4  �4  �4                                                           WINDOWS _1V81F5AU2 890049991\5      q5  �5  �5  �5      )6  �"                                               WINDOWS _1TP0L3VWK 889819210�8      �8  �8  �8  �8                                                           WINDOWS _1VA0OJPIR 890049991]9      l9  {9  �9  �9      :  4"                                               WINDOWS _1TP0L3VWL 890049991�:      �:  ;  ;  (;                                                           WINDOWS _1VB011PW4 924910598�;      �;  �;  �;  �;      8<  a!                                               WINDOWS _1VB011PW5 924910598K=      X=  e=  s=  �=      �=  A                                               WINDOWS _1VB011PW6 890049991*>      <=  ,=  �:  9>      �<  T                                               WINDOWS _1VB028DUC 890049991�:      �:  �8  �:  w<      `:  r                                               WINDOWS _1TP0L3VWL 898871503K:      6:  �8  �'  �@      %8  `                                               WINDOWS _1V91FF99H 8988718608      �7  �'  �'  ?      #7  �                                               WINDOWS _1VB0YDZYY 889819180�'      y'  k'  ^'  �&                                                           WINDOWS _1VB0YDZYZ 890049991�&      �&  �&  �&  �%                                                           WINDOWS _1VB0YDZZ0 898871503�%      {  k  ^  �$      $  �                                               COMMENT RESERVED                                                                                            N�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     KTop = -3
Left = 23
Height = 509
Width = 712
ShowWindow = 2
DoCreate = .T.
ShowTips = .T.
Caption = "Playing with logos using ImageAttributes"
MinHeight = 500
MinWidth = 500
obmp = 0
wbmp = 0
hbmp = 0
_memberdata =      541<VFPData><memberdata name="changecolors" type="method" display="ChangeColors" favorites="False"/><memberdata name="calculateminmax" type="method" display="CalculateMinMax" favorites="False"/><memberdata name="calculaterangeofcolors" type="method" display="CalculateRangeofColors" favorites="False"/><memberdata name="loadlogo" type="method" display="LoadLogo" favorites="False"/><memberdata name="loadmain" type="method" display="LoadMain" favorites="False"/><memberdata name="processimage" type="method" display="ProcessImage"/></VFPData>

obmplogo = 0
hbmplogo = 0
wbmplogo = .F.
Name = "Form1"
     �PROCEDURE changecolors
LPARAMETERS tnRGB, tnLevel

IF tnLevel = 0
	RETURN tnRGB
ENDIF 

tnLevel = tnLevel / 100

LOCAL lnRed, lnGreen, lnBlue
lnRed   = BITAND(tnRGB, 0x000000FF)
lnGreen = BITRSHIFT(BITAND(tnRGB, 0x0000FF00), 8)
lnBlue  = BITRSHIFT(BITAND(tnRGB, 0x00FF0000), 16)

IF tnLevel > 0
	RETURN RGB( ;
		lnRed   + ((255 - lnRed)   * tnLevel) , ;
		lnGreen + ((255 - lnGreen) * tnLevel) , ;
		lnBlue  + ((255 - lnBlue)  * tnLevel) )
ELSE 
	RETURN RGB( ;
		lnRed   + (lnRed   * tnLevel) , ;
		lnGreen + (lnGreen * tnLevel) , ;
		lnBlue  + (lnBlue  * tnLevel) )
ENDIF 
ENDPROC
PROCEDURE calculaterangeofcolors
WITH Thisform.Container1
	lnRGBClr = .Text1.BackColor
	.ShpMin.BackColor = Thisform.ChangeColors(lnRGBClr, - .Spinner1.Value)
	.ShpMax.BackColor = Thisform.ChangeColors(lnRGBClr, .Spinner1.Value)
ENDWITH
ENDPROC
PROCEDURE loadlogo
WITH Thisform
	.obmpLogo = _Screen.System.Drawing.Bitmap.New(Thisform.txtLogoFile.Value)
	.wBmpLogo = .oBmpLogo.Width
	.hBmpLogo = .oBmpLogo.Height
ENDWITH
ENDPROC
PROCEDURE loadmain
WITH Thisform
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.wBmp = .oBmp.Width
	.hBmp = .oBmp.Height
ENDWITH
ENDPROC
PROCEDURE processimage
LPARAMETERS tcBackGround, tcLogo

IF NOT EMPTY(tcBackGround)
	Thisform.txtFile.Value = tcBackGround
	Thisform.Image1.Picture = tcBackGround
	Thisform.LoadMain()
ENDIF

IF NOT EMPTY(tcLogo)
	Thisform.txtLogoFile.Value = tcLogo
	Thisform.Image2.Picture = tcLogo
	Thisform.LoadLogo()
ENDIF


ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage(LOCFILE("desert.jpg"), LOCFILE("foxprologo2.gif"))
ENDPROC
     
���    �   �                         ��   %   �       �      �           �  U  ;  T�  �C��� %�C�  ���  � B� � ��C�   �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A A1                       g       )   �                        o���    V  V                        �   %   �       �      �           �  U  E ' ��C� nOriginalToolTipTime� �  � �� T�  � ��Y�� T�Y�� �� U  THIS ADDPROPERTY NORIGINALTOOLTIPTIME  T�Y��  � �� U  THIS NORIGINALTOOLTIPTIME Init,     �� Destroy�     ��1 q� � 2 � 1                       |         �   �       )   V                       
���    �   �                         ��   %   �       �      �           �  U  ;  T�  �C��� %�C�  ���  � B� � ��C �  �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A A1                       g       )   �                         ����    �   �                         d�   %   c       x      r           �  U    ��C�  � � � �� U  THIS PARENT SHAPE2 CLICK Click,     ��1 11                       +       )   �                         ����    �   �                            %   b       �      }           �  U    ��C�  � �� U  THISFORM CALCULATERANGEOFCOLORS InteractiveChange,     ��1 � 1                       >       )   �                         ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      Form1      Command3      commandbutton      �obmp
wbmp
hbmp
_memberdata XML Metadata for customizable properties
obmplogo
hbmplogo
wbmplogo
*changecolors 
*calculaterangeofcolors 
*loadlogo 
*loadmain 
*processimage 
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      �Anchor = 15
Stretch = 1
Height = 396
Left = 168
Top = 84
Width = 540
smoothingmode = 3
interpolationmode = 0
Name = "Imgcanvas1"
     
PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

LOCAL loAttr AS xfcImageAttributes
LOCAL loOldColor as xfcColor
LOCAL loNewColor as xfcColor

This.Clear()

WITH _SCREEN.System.Drawing

	*!*	Draw the main image
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle) 
	
	
	
	*!* Example 1 
	*!* Original Image 
	*!* Position : Top Left 
	*!* Draw Logo without any transformation
	This.oGfx.DrawImage(Thisform.oBmpLogo, 0, 0) 


	*!* Example 2 
	*!* Logo Image with 50% transparency 
	*!* Position : Top Right 
	*!* The position (4,4) of the matrix is responsible for the opacity 

	LOCAL loClrMatrix AS xfcColorMatrix
	loClrMatrix = .Imaging.ColorMatrix.New( ; 
        1, 0, 0, 0  , 0, ; 
        0, 1, 0, 0  , 0, ; 
        0, 0, 1, 0  , 0, ;
        0, 0, 0, 0.5, 0, ; 
        0, 0, 0, 0  , 0)

	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorMatrix(loClrMatrix)
	LOCAL loRect as xfcRectangle
	loRect = _Screen.System.Drawing.Rectangle.New(Thisform.oBmpLogo.Width, Thisform.oBmpLogo.Height)
	loRect.X = This.Width - Thisform.wbmplogo 
	loRect.Y = 0
	loRect.Width  = Thisform.wbmplogo 
	loRect.Height = Thisform.hbmplogo 
	
	This.oGfx.DrawImage(Thisform.oBmpLogo, loRect, Thisform.oBmpLogo.GetBounds(), 2, loAttr) 
	loAttr = NULL
	

	*!* Example 3 
	*!* Logo Image with NO transparency 
	*!* Convert selected color with ALPHA 255 (Opaque) to TRANSPARENT ALPHA (0) 
	*!* Position : Bottom Left 
	loOldColorMin = .Color.FromRgb(Thisform.Container1.ShpMin.BackColor)
	loOldColorMax = .Color.FromRgb(Thisform.Container1.ShpMax.BackColor)

	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorKey(loOldColorMin, loOldColorMax)
	loRect.X = 0 
	loRect.Y = This.Height - Thisform.hBmplogo 
	loRect.Width  = Thisform.wbmplogo 
	loRect.Height = Thisform.hbmplogo 

	This.oGfx.DrawImage(Thisform.oBmpLogo, loRect, Thisform.oBmpLogo.GetBounds(), 2, loAttr) 
	loAttr = NULL


	*!* Example 4 
	*!* Image with 50% transparency using ColorMAtrix 
	*!* Convert selected color with ALPHA 255 (Opaque) to TRANSPARENT ALPHA (0) 
	*!* Position : Bottom Right 

	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetColorMatrix(loClrMatrix)
	loAttr.SetColorKey(loOldColorMin, loOldColorMax)

	loRect.X = This.Width - Thisform.wbmplogo 
	loRect.Y = This.Height - Thisform.hBmplogo 
	loRect.Width  = Thisform.wbmplogo 
	loRect.Height = Thisform.hbmplogo 
	This.oGfx.DrawImage(Thisform.oBmpLogo, loRect, Thisform.oBmpLogo.GetBounds(), 2, loAttr) 
	loAttr = NULL


ENDWITH


RETURN
ENDPROC
      ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         ����    �   �                         7   %   :       N      H           �  U  
  B�-�� U   When,     ��1 q 2                              )   �                        ����    r  r                        �   %   
      )               �  U  � $ %�C�  � � �� C�  � � ���e �= ��C� Picutes were not loaded !�0� VFP-X GDI+ classes�x�� B� � ��C�  � �� ��C�  � � �� U  THISFORM TXTFILE VALUE TXTLOGOFILE CALCULATERANGEOFCOLORS
 IMGCANVAS1 DRAW Click,     ��1 A�A A � 1                       �       )   r                        rPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage("",lcFile)
ENDPROC
      �Top = 48
Left = 12
Height = 25
Width = 98
FontSize = 8
Anchor = 3
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Logo Picture"
TabIndex = 3
PicturePosition = 1
PictureSpacing = 1
Name = "Command3"
      commandbutton      �FontSize = 8
Anchor = 11
Enabled = .F.
Height = 25
Left = 120
TabIndex = 4
Top = 48
Width = 588
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtLogoFile"
      Form1      txtLogoFile      textbox      textbox      YAnchor = 3
Stretch = 2
Height = 96
Left = 12
Top = 84
Width = 132
Name = "Image1"
      Form1      Image1      image      image      Form1      Command1      Form1      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 11
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 12
Width = 588
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image2      Form1      ZAnchor = 3
Stretch = 2
Height = 96
Left = 12
Top = 192
Width = 132
Name = "Image2"
     %PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
Thisform.Container1.Text1.BackColor = Thisform.Container1.Shape1.BackColor 
ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmpLogo) <> "O"
	RETURN
ENDIF 

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmpLogo / This.Width
YRatio = Thisform.hBmpLogo / This.Height

LOCAL loBitmap as xfcBitmap
loBitmap = Thisform.oBmpLogo

LOCAL loColor as xfcColor
loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

WITH Thisform.Container1
	.Text1.BackColor = lnRGBClr
	.Shape1.BackColor = lnRGBClr

	Thisform.CalculateRangeofColors()
ENDWITH
ENDPROC
PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmpLogo) <> "O"
	RETURN
ENDIF 

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmpLogo / This.Width
YRatio = Thisform.hBmpLogo / This.Height

WITH _SCREEN.System.Drawing
	LOCAL loBitmap as xfcBitmap
	loBitmap = Thisform.oBmpLogo

	LOCAL loColor as xfcColor
	loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
	lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

	Thisform.Container1.Text1.BackColor = lnRGBClr
ENDWITH

ENDPROC
     ���    �  �                        a   %         �  (   >          �  U  5  ��  � � � � T� � � � �� � � � �� U	  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM
 CONTAINER1 TEXT1	 BACKCOLOR SHAPE1D ��  � � � � %�C� � ��� O��/ � B� � T� �� � � �� T�	 �� � �
 �� T� �� � � � �� T� �� � � � �� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � �	 � � � �� T� �C� � � � � � �^�� ��� � ��=� T�� � �� �� T�� � �� �� ��C� � �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMPLOGO X1 THIS LEFT Y1 TOP XRATIO WBMPLOGO WIDTH YRATIO HBMPLOGO HEIGHT LOBITMAP LOCOLOR GETPIXEL LNRGBCLR R G B
 CONTAINER1 TEXT1	 BACKCOLOR SHAPE1 CALCULATERANGEOFCOLORS- ��  � � � � %�C� � ��� O��/ � B� � T� �� � � �� T�	 �� � �
 �� T� �� � � � �� T� �� � � � �� ���9� � ��&� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � �	 � � � �� T� �C� � � � � � �^�� T� � � � �� �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMPLOGO X1 THIS LEFT Y1 TOP XRATIO WBMPLOGO WIDTH YRATIO HBMPLOGO HEIGHT SYSTEM DRAWING LOBITMAP LOCOLOR GETPIXEL LNRGBCLR R G B
 CONTAINER1 TEXT1	 BACKCOLOR
 MouseLeave,     ��	 MouseDown�     ��	 MouseMove�    ��1 1�2 1�A A BArqB2��� A 2 1�A A BArq"A2��bA 2                       �         �   �        	         )   �                        	container      	container      
Container1      Form1      �Anchor = 6
Top = 300
Left = 12
Width = 132
Height = 180
SpecialEffect = 0
Visible = .T.
TabIndex = 5
Name = "Container1"
      commandbutton      commandbutton      cmdDraw      Form1.Container1      tTop = 144
Left = 12
Height = 25
Width = 98
Anchor = 12
Caption = "Draw Logos"
TabIndex = 2
Name = "cmdDraw"
      �PROCEDURE Click
IF EMPTY(Thisform.TxtFile.Value) OR EMPTY(Thisform.TxtLogoFile.Value)
	MESSAGEBOX("Picutes were not loaded !",48,"VFP-X GDI+ classes")
	RETURN
ENDIF
Thisform.CalculateRangeofColors()
Thisform.ImgCanvas1.Draw()
ENDPROC
      �PROCEDURE Init
This.AddProperty("nOriginalToolTipTime",0)
This.nOriginalToolTipTime = _TOOLTIPTIMEOUT
_TOOLTIPTIMEOUT = 0
ENDPROC
PROCEDURE Destroy
_TOOLTIPTIMEOUT = This.nOriginalToolTipTime
ENDPROC
      commandbutton      commandbutton      rPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile,"")
ENDPROC
      Command2      Label3      shape      shape      Shape1      Form1.Container1      XTop = 24
Left = 12
Height = 60
Width = 60
BackColor = 255,255,255
Name = "Shape1"
      textbox      textbox      Text1      Form1.Container1      _Height = 37
Left = 24
SpecialEffect = 1
TabIndex = 3
Top = 36
Width = 36
Name = "Text1"
      'PROCEDURE When
RETURN .F.

ENDPROC
      commandbutton      commandbutton      6PROCEDURE Click
This.Parent.Shape2.Click()
ENDPROC
      Form1.Container1      label      label      Form1.Container1      label      label      Label1      Form1.Container1      hCaption = "Original Color"
Height = 17
Left = 12
Top = 4
Width = 84
TabIndex = 4
Name = "Label1"
      shape      shape      shpMin      Form1.Container1      XTop = 24
Left = 84
Height = 24
Width = 24
BackColor = 255,255,255
Name = "shpMin"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
      \Caption = "%"
Height = 17
Left = 65
Top = 96
Width = 12
TabIndex = 5
Name = "Label3"
      IPROCEDURE InteractiveChange
Thisform.CalculateRangeofColors()
ENDPROC
      Spinner1      spinner      shape      shape      shpMax      Form1.Container1      XTop = 60
Left = 84
Height = 24
Width = 24
BackColor = 255,255,255
Name = "shpMax"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
      spinner      �Height = 24
Increment =   1.00
KeyboardHighValue = 100
KeyboardLowValue = 0
Left = 12
SpinnerHighValue = 100.00
SpinnerLowValue =   0.00
TabIndex = 1
Top = 96
Width = 50
Value = 10
Name = "Spinner1"
     �Top = 481
Left = 12
Height = 25
Width = 26
Anchor = 12
Picture = (home() + "/samples/solution/bts.bmp")
Caption = ""
TabIndex = 6
ToolTipText = 'Select "Main or background picture"; Select "Logo Picture"; Go with your mouse over the logo picture, and click in any color to make it transparent ; The spinner determines the color range to apply transformation; Click "Draw Logos"'
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
      �Top = 12
Left = 12
Height = 25
Width = 98
FontSize = 8
Anchor = 3
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Main Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
     S���    :  :                        4�   %   �      �  -   �          �  U  � %�C�  � � ��� � B� � �� Q� XFCIMAGEATTRIBUTES� �� Q� XFCCOLOR� �� Q� XFCCOLOR� ��C� � �� ���9� �	 ���� ��C�  � � � � �
 � �� ��C�  � � � � �
 � �� �� Q� XFCCOLORMATRIX�h T� �C�� � � � � �� � � � � �� � � � � �      �?� � � � � � �� � � �� T� �C�� � � �� ��C � � � �� �� Q� XFCRECTANGLE�+ T� �C�  � � �  � � �9� �	 � � �� T� � �� � �  � �� T� � �� �� T� � ��  � �� T� � ��  � ��+ ��C�  �  � C�  � � � � � �
 � �� T� ���� T� �C�  �  �! �" �� � �� T�# �C�  �  �$ �" �� � �� T� �C�� � � �� ��C �  �# � �% �� T� � �� �� T� � �� � �  � �� T� � ��  � �� T� � ��  � ��+ ��C�  �  � C�  � � � � � �
 � �� T� ���� T� �C�� � � �� ��C � � � �� ��C �  �# � �% �� T� � �� � �  � �� T� � �� � �  � �� T� � ��  � �� T� � ��  � ��+ ��C�  �  � C�  � � � � � �
 � �� T� ���� �� B� U&  THISFORM TXTFILE VALUE LOATTR
 LOOLDCOLOR
 LONEWCOLOR THIS CLEAR SYSTEM DRAWING OGFX	 DRAWIMAGE OBMP	 RECTANGLE OBMPLOGO LOCLRMATRIX IMAGING COLORMATRIX NEW IMAGEATTRIBUTES SETCOLORMATRIX LORECT WIDTH HEIGHT X WBMPLOGO Y HBMPLOGO	 GETBOUNDS LOOLDCOLORMIN COLOR FROMRGB
 CONTAINER1 SHPMIN	 BACKCOLOR LOOLDCOLORMAX SHPMAX SETCOLORKEY
 beforedraw,     ��1 QA A �11� "����Rq��11�� ��RQ�11�� XQ��11�� C C 1                       
      )   :                       ����    �  �                        Z   %   '        1   �          �  U   ��  � � %�� � ��% �	 B��  �� � T� �� �d�� �� � � � T� �C�  �
���� T� �CC�  �
 �  ����� T� �CC�  �
  � ����� %�� � ��� �< B�C� ��� � � ��� � � ��� � �^�� ��- B�C� � � � � � � � � �^�� � U  TNRGB TNLEVEL LNRED LNGREEN LNBLUEi  ���  � ��b � T� ��� � ��! T�� � �C � �� � c�  � ��  T��	 � �C � �� � �  � �� �� U
  THISFORM
 CONTAINER1 LNRGBCLR TEXT1	 BACKCOLOR SHPMIN CHANGECOLORS SPINNER1 VALUE SHPMAX[  ���  ��T �# T�� �C�  � � �9� � � � �� T�� ��� �	 �� T��
 ��� � �� �� U  THISFORM OBMPLOGO SYSTEM DRAWING BITMAP NEW TXTLOGOFILE VALUE WBMPLOGO WIDTH HBMPLOGO HEIGHT[  ���  ��T �# T�� �C�  � � �9� � � � �� T�� ��� �	 �� T��
 ��� � �� �� U  THISFORM OBMP SYSTEM DRAWING BITMAP NEW TXTFILE VALUE WBMP WIDTH HBMP HEIGHT�  ��  � � %�C�  �
��N � T� � � ��  �� T� � � ��  �� ��C� � �� � %�C� �
��� � T� � � �� �� T� �	 � �� �� ��C� �
 �� � U  TCBACKGROUND TCLOGO THISFORM TXTFILE VALUE IMAGE1 PICTURE LOADMAIN TXTLOGOFILE IMAGE2 LOADLOGO> 	 ��C���2 ��CC�
 desert.jpg�C� foxprologo2.gif��  � �� U  THISFORM PROCESSIMAGE changecolors,     �� calculaterangeofcolorsu    �� loadlogoC    �� loadmain    �� processimage�    �� Init�    ��1 � � A � 1���� �A 2 A 2 � 1!!A 2 � 1!!A 2 � 11� A 11� A 4 � !1                       U        �  Q        p    "      .  �  )   "   �    0   .   !  v  A    )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 885863545�      �  �      �      �                    �                           WINDOWS _1TQ0E1XR9 885863545f  w  �  �  �  �      ,  �
                                               COMMENT RESERVED                                N                                                            w                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 0
Left = 0
DoCreate = .T.
Caption = "Colors"
_memberdata =       79<VFPData><memberdata name="random" type="method" display="Random"/></VFPData>

Name = "Form1"
      SPROCEDURE random
LPARAMETERS tnUpper
RETURN INT(tnUpper * RAND( ) + 1)
ENDPROC
      ����    �   �                         6v   %   U       m      e           �  U    ��  � B�C�  C��8�� U  TNUPPER random,     ��1 q !1                       H       )   �                         |_memberdata XML Metadata for customizable properties
*random Produces random numbers between 1 and the parameter sent in.
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      cAnchor = 15
Height = 252
Left = -1
Top = -1
Width = 377
usememory = .F.
Name = "Imgcanvas1"
     qPROCEDURE beforedraw
WITH _SCREEN.SYSTEM.drawing
	THIS.CLEAR()
	FOR c = 0 TO 99
		sb = .SolidBrush.New(.COLOR.FromArgb(THISFORM.RANDOM(8) * 32, ;
			THISFORM.RANDOM(255), THISFORM.RANDOM(255), THISFORM.RANDOM(255)))
		IF THISFORM.RANDOM(2) = 1
			THIS.oGfx.FillRectangle(sb, THISFORM.RANDOM(THIS.WIDTH), ;
				THISFORM.RANDOM(THIS.HEIGHT), ;
				1 + THISFORM.RANDOM(200), 1 + THISFORM.RANDOM(200))
		ELSE
			THIS.oGfx.FillEllipse(sb, THISFORM.RANDOM(THIS.WIDTH), ;
				THISFORM.RANDOM(THIS.HEIGHT), ;
				1 + THISFORM.RANDOM(200), 1 + THISFORM.RANDOM(200))
		ENDIF
		sb.Dispose()
	ENDFOR
ENDWITH

ENDPROC
     ����    �  �                        �   %         ?     #          �  U  L ���9�  � ��E� ��C� � �� �� �� �(��c��A�F T� �CCC��
 � � C���
 � C���
 � C���
 � �� �	 �� � �� %�C��
 � ���� �J ��C � C� � �
 � C� � �
 � �C���
 � �C���
 � � � � �� �0�J ��C � C� � �
 � C� � �
 � �C���
 � �C���
 � � � � �� � ��C� � �� �� �� U  SYSTEM DRAWING THIS CLEAR C SB
 SOLIDBRUSH NEW COLOR FROMARGB THISFORM RANDOM OGFX FILLRECTANGLE WIDTH HEIGHT FILLELLIPSE DISPOSE
 beforedraw,     ��1 !� qb��� �A � A A 2                       f      )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 924915763�      �  �      �      �  �(                  �                           WINDOWS _1TZ0QGKPH 924915750    =  J  \  i      �  7#                                               WINDOWS _1U40L3TVH 890062408�      �  �  �  �                                                           WINDOWS _1U40LO0FY 924915750�      �  �  �  �      4  �                                               WINDOWS _1U40NTQI6 889742887�      �      *                                                           WINDOWS _1V81F5AU2 924915516�      �  �  �  �      h  (                                               WINDOWS _1TP0L3VWK 886790211�      �  �  �  �                                                           WINDOWS _1TP0L3VWL 889742887       !   .   <   T                                                            WINDOWS _1VA0RH776 889743989�       �   �   �   �       >!  U                                               WINDOWS _1VA0RH777 889748610�!      �!  �!  u  }!      7  s                                               WINDOWS _26506H0J8 924915763*        
  �  �                                                           WINDOWS _1TP0L3VWK 889742887�      �  w  j  �      "  �                                               WINDOWS _1V91FF99H 898893181�      m  ]  P  |'                                                           COMMENT RESERVED                                                                                            *�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 14
Left = 49
Height = 352
Width = 516
DoCreate = .T.
ShowTips = .T.
Caption = "Remapping Colors"
MinHeight = 350
MinWidth = 510
obmp = 0
wbmp = 0
hbmp = 0
Name = "Form1"
     0PROCEDURE Init
LOCAL lcFile
lcFile = FULLPATH("VfpXLogoSmall.png")

WITH Thisform
	.Container1.Visible = .T.
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
	.obmp = _Screen.System.Drawing.Bitmap.FromFile(Thisform.txtFile.Value)
	.wBmp = .oBmp.Width
	.hBmp = .oBmp.Height
ENDWITH
ENDPROC
     ����    �  �                        �0   %   g      �     v          �  U  �  T�  �C��� %�C�  ���  � B� � ��� ��� � T�� � �a�� T�� � ��  �� T�� � ��  ��# T�� �C� � � �9�	 �
 � � �� T�� ��� � �� T�� ��� � �� �� U  LCFILE THISFORM
 CONTAINER1 VISIBLE TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW WBMP WIDTH HBMP HEIGHT Click,     ��1 � � A A � � 1!!A 1                       !      )   �                        obmp
wbmp
hbmp
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      }Anchor = 15
Height = 180
Left = 264
Top = 12
Width = 240
smoothingmode = 3
interpolationmode = 0
Name = "Imgcanvas1"
     }PROCEDURE afterdraw
WITH Thisform
	.oBmp = This.oBmp.Clone()
	.wBmp = .oBmp.Width
	.hBmp = .oBmp.Height
ENDWITH 
Thisform.Image1.PictureVal = Thisform.Imgcanvas1.PictureVal 
ENDPROC
PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

This.Clear

LOCAL loAttr AS xfcImageAttributes
LOCAL loColorMap as xfcColorMap
LOCAL loOldColor as xfcColor
LOCAL loNewColor as xfcColor

WITH _SCREEN.System.Drawing
	loOldColor = .Color.FromRgb(Thisform.Container1.ShpSelected.BackColor)
	loNewColor = .Color.FromRgb(Thisform.Container1.Shape2.BackColor)

	loColorMap = .Imaging.ColorMap.New()
	loColorMap.OldColor = loOldColor
	loColorMap.NewColor = loNewColor

	loAttr = .Imaging.ImageAttributes.New() 
	loAttr.SetRemapTable(loColorMap)
	
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle, Thisform.oBmp.GetBounds(), 2, loAttr) 
ENDWITH

RETURN
ENDPROC
      ����    �   �                         d�   %   c       x      r           �  U    ��C�  � � � �� U  THIS PARENT SHAPE2 CLICK Click,     ��1 11                       +       )   �                         ����    �   �                         j8   %   T       i      c           �  U    T�  � �C��� U  THIS	 BACKCOLOR Click,     ��1 1                       ,       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Click,     ��1 1                       +       )   �                         BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      Form1      Command1      commandbutton      commandbutton      �Top = 204
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      Form1      Command2      commandbutton      commandbutton      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 134
Enabled = .F.
Height = 25
Left = 120
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
     sPROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
Thisform.Container1.ShpSelected.BackColor = Thisform.Container1.Shape1.BackColor 
ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmp) <> "O"
	RETURN
ENDIF 

LOCAL x1, y1, xRatio, yRatio, lnRGBClr

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmp / This.Width
YRatio = Thisform.hBmp / This.Height

WITH _SCREEN.System.Drawing
	LOCAL loBitmap as xfcBitmap
	loBitmap = Thisform.oBmp

	LOCAL loColor as xfcColor
	loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
	lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

	Thisform.Container1.ShpSelected.BackColor = lnRGBClr
	Thisform.Container1.Shape1.BackColor = lnRGBClr
ENDWITH
ENDPROC
PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmp) <> "O"
	RETURN
ENDIF 

LOCAL x1, y1, xRatio, yRatio, lnRGBClr

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmp / This.Width
YRatio = Thisform.hBmp / This.Height

WITH _SCREEN.System.Drawing
	LOCAL loBitmap as xfcBitmap
	loBitmap = Thisform.oBmp

	LOCAL loColor as xfcColor
	loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
	lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)

	Thisform.Container1.ShpSelected.BackColor = lnRGBClr
ENDWITH

ENDPROC
     2���                              /�   %   $      �  )   ^          �  U  5  ��  � � � � T� � � � �� � � � �� U	  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM
 CONTAINER1 SHPSELECTED	 BACKCOLOR SHAPE1Z ��  � � � � %�C� � ��� O��/ � B� � �� � � �	 �
 � T� �� � � �� T� �� � � �� T� �� � � � �� T�	 �� � � � �� ���9� � ��S� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � � �	 � � �� T�
 �C� � � � � � �^�� T� � � � ��
 �� T� � � � ��
 �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMP X1 Y1 XRATIO YRATIO LNRGBCLR THIS LEFT TOP WBMP WIDTH HBMP HEIGHT SYSTEM DRAWING LOBITMAP LOCOLOR GETPIXEL R G B
 CONTAINER1 SHPSELECTED	 BACKCOLOR SHAPE1D ��  � � � � %�C� � ��� O��/ � B� � �� � � �	 �
 � T� �� � � �� T� �� � � �� T� �� � � � �� T�	 �� � � � �� ���9� � ��=� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � � �	 � � �� T�
 �C� � � � � � �^�� T� � � � ��
 �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMP X1 Y1 XRATIO YRATIO LNRGBCLR THIS LEFT TOP WBMP WIDTH HBMP HEIGHT SYSTEM DRAWING LOBITMAP LOCOLOR GETPIXEL R G B
 CONTAINER1 SHPSELECTED	 BACKCOLOR
 MouseLeave,     ��	 MouseDown�     ��	 MouseMove     ��1 1�2 1�A A rBArq"A2��baA 2 1�A A rBArq"A2��bA 2                       �         �           7  h       )                           	container      	container      
Container1      Form1      sAnchor = 6
Top = 252
Left = 12
Width = 408
Height = 96
SpecialEffect = 0
Visible = .F.
Name = "Container1"
      commandbutton      commandbutton      Command7      Form1.Container1      iTop = 60
Left = 288
Height = 25
Width = 98
Anchor = 12
Caption = "Remap Colors"
Name = "Command7"
      6PROCEDURE Click
Thisform.ImgCanvas1.Draw()
ENDPROC
      DTop = 36
Left = 36
Height = 36
Width = 48
Name = "ShpSelected"
      Form1.Container1      ShpSelected      shape      shape      6PROCEDURE Click
This.Parent.Shape2.Click()
ENDPROC
      Form1.Container1      shape      shape      Shape1      Form1.Container1      ?Top = 24
Left = 24
Height = 60
Width = 72
Name = "Shape1"
      label      label      Label1      Form1.Container1      ZCaption = "Original Color"
Height = 17
Left = 24
Top = 4
Width = 84
Name = "Label1"
      shape      shape      Shape2      Form1.Container1      @Top = 24
Left = 156
Height = 60
Width = 72
Name = "Shape2"
      7PROCEDURE Click
This.BackColor = GETCOLOR()
ENDPROC
      VCaption = "New Color"
Height = 17
Left = 156
Top = 4
Width = 84
Name = "Label2"
      Label2      label      label     ,PROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

WITH Thisform
	.Container1.Visible = .T.
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.wBmp = .oBmp.Width
	.hBmp = .oBmp.Height
ENDWITH
ENDPROC
     =���    $  $                        u�   %   l      �     �          �  U  f  ���  ��F � T�� �C� � � �� T�� ��� � �� T�� ��� � �� �� T�  � �	 ��  �
 �	 �� U  THISFORM OBMP THIS CLONE WBMP WIDTH HBMP HEIGHT IMAGE1
 PICTUREVAL
 IMGCANVAS1a %�C�  � � ��� � B� �
 �� � � �� Q� XFCIMAGEATTRIBUTES� �� Q� XFCCOLORMAP� �� Q� XFCCOLOR� �� Q� XFCCOLOR� ���9�	 �
 ��V� T� �C�  � � � �� � �� T� �C�  � � � �� � �� T� �C�� � � �� T� � �� �� T� � �� �� T� �C�� � � �� ��C � � � ��- ��C�  � � � C�  � � � � � � � �� �� B� U  THISFORM TXTFILE VALUE THIS CLEAR LOATTR
 LOCOLORMAP
 LOOLDCOLOR
 LONEWCOLOR SYSTEM DRAWING COLOR FROMRGB
 CONTAINER1 SHPSELECTED	 BACKCOLOR SHAPE2 IMAGING COLORMAP NEW OLDCOLOR NEWCOLOR IMAGEATTRIBUTES SETREMAPTABLE OGFX	 DRAWIMAGE OBMP	 RECTANGLE	 GETBOUNDS	 afterdraw,     ��
 beforedraw�     ��1 � Q!!A �2 QA A � �a11"��RR�A B 1                       �         �   r  	    )   $                       xTop = 308
Left = 480
Height = 25
Width = 26
Anchor = 12
Picture = (home() + "/samples/solution/bts.bmp")
Caption = ""
ToolTipText = 'Select an image; Go with your mouse over the left picture, and click in any color; Click "NewColor", select the color that will substitute the original; Click "Remap Colors"'
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
     ����    �  �                        m   %   o      �     }          �  U  �  ��  �  T�  �C� VfpXLogoSmall.png��� ��� ��� � T�� � �a�� T�� � ��  �� T�� � ��  ��# T�� �C� � � �9�	 �
 � � �� T�� ��� � �� T�� ��� � �� �� U  LCFILE THISFORM
 CONTAINER1 VISIBLE TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP FROMFILE WBMP WIDTH HBMP HEIGHT Init,     ��1 q � � 1!!A 1                       %      )   �                  0	   �
�                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               OBJTYPE    N                  OBJCODE    N                  NAME       M"                  EXPR       M&                  VPOS       N*   	              HPOS       N3   	              HEIGHT     N<   	              WIDTH      NE   	              STYLE      MN                  PICTURE    MR                  ORDER      MV                 UNIQUE     LZ                  COMMENT    M[                  ENVIRON    L_                  BOXCHAR    C`                  FILLCHAR   Ca                  TAG        Mb                  TAG2       Mf                 PENRED     Nj                  PENGREEN   No                  PENBLUE    Nt                  FILLRED    Ny                  FILLGREEN  N~                  FILLBLUE   N�                  PENSIZE    N�                  PENPAT     N�                  FILLPAT    N�                  FONTFACE   M�                  FONTSTYLE  N�                  FONTSIZE   N�                  MODE       N�                  RULER      N�                  RULERLINES N�                  GRID       L�                  GRIDV      N�                  GRIDH      N�                  FLOAT      L�                  STRETCH    L�                  STRETCHTOP L�                  TOP        L�                  BOTTOM     L�                  SUPTYPE    N�                  SUPREST    N�                  NOREPEAT   L�                  RESETRPT   N�                  PAGEBREAK  L�                  COLBREAK   L�                  RESETPAGE  L�                  GENERAL    N�                  SPACING    N�                  DOUBLE     L�                  SWAPHEADER L�                  SWAPFOOTER L�                  EJECTBEFOR L�                  EJECTAFTER L�                  PLAIN      L�                  SUMMARY    L�                  ADDALIAS   L�                  OFFSET     N�                  TOPMARGIN  N�                  BOTMARGIN  N�                  TOTALTYPE  N�                  RESETTOTAL N�                  RESOID     N�                  CURPOS     L�                  SUPALWAYS  L�                  SUPOVFLOW  L�                  SUPRPCOL   N�                  SUPGROUP   N�                  SUPVALCHNG L�                  SUPEXPR    M�                  USER       M�                                                                                                                                                                                                                                                                                          WINDOWS _20800B7BU 910098710 1 53           1.000    0.000    0.000   -1.000                 F                                                            0 10   20T1212   FF              T    F T               1T               WINDOWS _20800B7BV           9  1                          14480.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _20800B7BW           9  4                           2917.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _20800B7BX           9  7                            834.000    0.000                                                                                                    F  FFF           F                  F               WINDOWS _20800C2E0 910098733 8  0       16979.167  520.833 1875.00037187.500                   C           -1   -1   -1   -1   -1   -1                    0 10  1 0     FTFTF  F          0T         0       0 1  0FTT3 0F         WINDOWS _20800DJ0X 910098768 8  0       16979.16740312.500 1875.00037291.667                   C            0    0  160  255  255  221                    0 10  0 0     FTFTF  F          0T         0       0 1  0FTT3 0F         WINDOWS _20A01CH1B 910296264 5  0         312.50023750.000 2604.16730833.333                               0    0  255   -1   -1   -1                    0 16  1       FFFTF  F          0T                      0FTF3 0F         WINDOWS _20A01DA8Z 910296276 5  0       12083.333  625.000 1875.00024687.500                              128    0    0   -1   -1   -1                    5 12  1       FFFTF  F          0T                      0FTF3 0F         WINDOWS _20A01DSCM 910296307 5  0       12083.33340312.500 1875.00015937.500                              128    0    0   -1   -1   -1                    5 12  1       FFFTF  F          0T                      0FTF3 0F         WINDOWS _20A01GWPU 91029636817  0         1250.00070000.000 1562.500 8854.167                                                                                    1       FFFTF  F       0   F         0             FTT0 0F         WINDOWS _20A01HPXE 91029637617  0         1250.000 1250.000 1562.500 8854.167                                                                                    1       FFFTF  F       0   F         0             FTT0 0F         WINDOWS _20A0M4SY5 910316235 5  0        4895.833    0.000 1666.66770208.333                               -1   -1   -1   -1   -1   -1                     0 10  1       FFFTF  F          0T                      0FTT0 0F         WINDOWS _20A0M8PCD 910316243 5  0    !    6562.500    0.000 1666.66735625.000                               -1   -1   -1   -1   -1   -1               "     0 10  1       FFFTF  F          0T                      0FTT0 0F         WINDOWS                     23              16.000    8.000   12.000    9.000                                4    0                                   #     0 10                                                     F               WINDOWS                     23              16.000    7.000   13.000   19.000                                3    0                                        0 10                                                     F               WINDOWS                     23              25.000   11.000   21.000   31.000                                4    0                                        0 16                                                     F               WINDOWS                     23              18.000    9.000   15.000   28.000                                3    0                                        5 12                                                     F               WINDOWS                     25      
                                                        F                                                                                                                      F                 $   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ?ORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2794
PAPERWIDTH=2159
NTATION=0
PAPERSIZE=9
PAPERLENGTH=2794
PAPERWIDTH=2159      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
                                     dataenvironment                                               Verdana                                                       Courier New                                                   dummy.field1                                                  Verdana                                                       dummy.field2                                                  Verdana                                                       "CUSTOM REPORT LISTENER"                                      "@I"                                                          Verdana                                                       "Left Aligned Text (Default)"                                 Verdana                                                       "Full Justified Text"                                         Verdana                                                       %"image\vfpxpoweredby_alternative.gif"fpxpoweredby_altern      Verdana                                                       %"image\vfpxpoweredby_alternative.gif"fpxpoweredby_altern      Verdana                                                       k'To convert a field control to FullJustified, all you need to do is to add the tag "<FJ>" before the text.'                   Verdana                                                       7"All formatting, fonts, size and colors are respected."       Verdana                                                       Courier New                                               %     �  �  g     �)8   �� �C�
 System.app���. G~(�CC��Q��� FFC\_ReportListener.VCX�� ��  � �# T�  �C� FullJustifyListener�N�� T�  � ���� h�� Dummy� � M� � M� �� �t T� ��g GDIPlusX is a set of VFP 9.0 class libraries that wrap the 603 GDI+ Flat API functions of GDIPlus.dll. ��# r�� Dummy��� ��� <FJ>� ��� T� ��� The library currently consist of 83 VFP classes and 1,146 methods. The project is still under development so not all classes have been completed and several of the classes/methods are still being tested.��# r�� Dummy��� ��� <FJ>� ��� T� �ٻ The Readme.htm file, included with the download, shows the current coding status of each class. As of August 31, 2006, the overall status of the library is about 97% coded and 60% tested.��# r�� Dummy��� ��� <FJ>� ��� T� �� The object model of these classes closely emulates the classes contained in the System.Drawing namespace of Visual Studio .NET.��# r�� Dummy��� ��� <FJ>� ��� T� �ٵ This not only makes the library easier to use, but also allows VFP developers to tap into thousands of GDI+ code samples, written in .NET, that can be easily translated to VFP code.��# r�� Dummy��� ��� <FJ>� ��� T� �ّ The Help folder contained in the GDIPlusX download has several sample programs that were converted from the System.Drawing documentation in .NET.��# r�� Dummy��� ��� <FJ>� ��$ T� �� Get the latest release:��# r�� Dummy��� ��� <FJ>� ��G T� ��: http://www.codeplex.com/VFPX/Wiki/View.aspx?title=GDIPlusX��# r�� Dummy��� ��� <FJ>� ��l T� ��_ If you would like to be involved in the project, please send an email to gdiplusx@moxiedata.com��# r�� Dummy��� ��� <FJ>� ��] T� ��P To report any issues with the library, please use the Issue Tracker in CodePlex.��# r�� Dummy��� ��� <FJ>� �� F� � #)�+ ?�C� Report_FullJustify� FRX��.��  �� Q� � B� U  LOREPORTLISTENER I LISTENERTYPE DUMMY FIELD1 FIELD2 LCTEXTb 	 ��C��� T�  � �C�9� � � � �� ���  ��[ � ��C�� �� �� �CN����� ��C�� �� �� U	  THIS OGDIGRAPHICS SYSTEM DRAWING GRAPHICS NEW SETFRXDATASESSION ARECORDS RESETDATASESSIONH  ��  � � T� � �� � �� T� � � �� � �� ��C �   � ��� U  NBANDOBJCODE	 NFRXRECNO THIS SHAREDGDIPLUSGRAPHICS GDIPLUSGRAPHICS OGDIGRAPHICS HANDLE
# ��  � � � � � � � � �� � T� �C �  ��	 �
 ��$ %�C� ��� C� � � <FJ>	���� T� �C� �\�� T�	 � � ��	 � �� ���9� � ���� �� Q� XFCRECTANGLEF�" T� �C �  �  �  � �� � �� �� Q� XFCFONT�C T� �CC �  ��	 �
 C �  ��	 �
 C �  ��	 �
 �� � �� � �� �� � � � � T� �C �  ��	 �
 �� T� �C �  ��	 �
 �� T� �C �  ��	 �
 �� T� �C �  ��	 �
 �� �� Q� XFCSOLIDBRUSH�* T� �CC �  �  �  � �� � �� � ��$ ��C �  �  �  �  � �	 � � �� T� �C �  �	�	 �
 �� T� �C �  �
�	 �
 �� T� �C �  ��	 �
 �� T� �C �  ��	 �
 �� ��  Q� XFCSOLIDBRUSH�* T�  �CC �  �  �  � �� � �� � ��  ��C �  �  �   � �	 � �! �� �� ���) ��C �   �  �  �  �  �  �  � ��� � �� U" 
 TNFRXRECNO TNLEFT TNTOP TNWIDTH TNHEIGHT NOBJECTCONTINUATIONTYPE CCONTENTSTOBERENDERED GDIPLUSIMAGE LCTEXT THIS ARECORDS OGDIGRAPHICS HANDLE GDIPLUSGRAPHICS SYSTEM DRAWING LORECTF
 RECTANGLEF NEW LOFONT FONT GRAPHICSUNIT POINT LNRED LNGREEN LNBLUE LNALPHA LOBACKBRUSH
 SOLIDBRUSH COLOR FROMARGB FILLRECTANGLE LOTEXTBRUSH DRAWSTRINGJUSTIFIED� ��  � � T� � ��  ������ � �� T� � ��  ������ � �� T� � ��  ������ � �� T� � ��  ������ � �� T� � ��  ������ � �� T� � ��  ������ �	 �� T� � ��  ������ �
 �� T� � ��  ������ � �� T� � ��  ���	��� � �� T� � ��  ���
��� � �� T� � ��  ������ � �� T� � ��  ������ � �� U 
 TNFRXRECNO TOOBJPROPERTIES THIS ARECORDS TEXT FONTNAME	 FONTSTYLE FONTSIZE FILLRED	 FILLGREEN FILLBLUE	 FILLALPHA PENRED PENGREEN PENBLUE PENALPHA BEFOREREPORT�     
 BEFOREBAND�      RENDER]	      EvaluateContents�     ]  T�  ���� T� �� �� T� ���� � ����
 ��    �
 ��    �
 ��    �
 ��    � U  OGDIGRAPHICS NSAVEGRAPHICSHANDLE NTIMES ARECORDS FullJustifyListener _ReportListenerZ    q�� 1�q F1�1�1�1"1�	1B1r1�1�1s Q �� B = � �� � 1� A 5 � 1a7 4r �A"a"�!"33������B������B � �A D 5 � ������������3 � � � � � � � �� � 1                 !     �  E   )   �  �  Q   .   �  �  X   N   �  �  �   \   �	  �  <     %   �  v    9   �  �)86  �� �C�
 System.app���. G~(�CC��Q��� FFC\_ReportListener.VCX�� ��  � �  T�  �C� MyReportListener�N�� T�  � ����# T�  � �C� vfpxlogosmall.png���, h�� Dummy� � C���� � C���� �� ���(�����4�N r�� Dummy���% Testing ReportListener with GdiPlus-X��� Visit CodePlex�� �� F� � #)� 3� Test� dummy� ?�C� Test� frx��.��  �� Q� � � Test.fr?� B� U	  LOREPORTLISTENER I LISTENERTYPE WATERMARKIMAGE DUMMY FIELD1 FIELD2 TEST FR( 	 ��C��� T�  � �C�9� � � � �� U  THIS OGDIGRAPHICS SYSTEM DRAWING GRAPHICS NEW�  ��  � � %��  ���h � T� � �a�� %�� � 
��N � T� � �� � �� � T� � � �� � �� � ��C �   � ��� U	  NBANDOBJCODE	 NFRXRECNO THIS NEWPAGE ISSUCCESSOR SHAREDGDIPLUSGRAPHICS GDIPLUSGRAPHICS OGDIGRAPHICS HANDLE# ��  � � � � � � � � ���9� �	 ���� %��
 � ���� �� Q� XFCRECTANGLE�Z T� �C��������?�
 � ��������?�
 � �
 � �333333�?�
 � �333333�?�� � �� �� Q�	 XFCBITMAP� T� �C�
 � �� � �� �� Q� XFCCOLORMATRIX�h T� �C�� � � � � �� � � � � �� � � � � ��������?� � � � � � �� � � �� �� Q� XFCIMAGEATTRIBUTES� T� �C�� � � �� ��C � � � ��& ��C �  � C� � � � �
 � � �� T�
 � �-�� � ��) ��C �   �  �  �  �  �  �  � ��� U 	 NFRXRECNO NLEFT NTOP NWIDTH NHEIGHT NOBJECTCONTINUATIONTYPE CCONTENTSTOBERENDERED GDIPLUSIMAGE SYSTEM DRAWING THIS NEWPAGE LORECT	 RECTANGLE NEW SHAREDPAGEWIDTH SHAREDPAGEHEIGHT LOBMP BITMAP WATERMARKIMAGE LOCLRMATRIX IMAGING COLORMATRIX LOATTR IMAGEATTRIBUTES SETCOLORMATRIX OGDIGRAPHICS	 DRAWIMAGE	 GETBOUNDS BEFOREREPORT     
 BEFOREBANDs      RENDERj     D  T�  �a�� T� ���� T� ��  ��
 ��    �
 ��    �
 ��    � U  NEWPAGE OGDIGRAPHICS WATERMARKIMAGE MyReportListener _ReportListener    q�� 1�q�A q Q S�� B 9 � �3 � � 1A aA 6 4!s�C����Qb� A A �2 � � � � � � p1                    �    %      +  �  )      �  �
  5   1   }  �
        %     �  Z  9   �  �)8z  �� �C�
 System.app���. G~(�CC��Q��� FFC\_ReportListener.VCX�� ��  � �  T�  �C� MyReportListener�N�� T�  � ����$ T�  � �C� vfpxlogosmall.png���, h�� Dummy� � C���� � C���� �� ���(�����5�N r�� Dummy���% Testing ReportListener with GdiPlus-X��� Visit CodePlex�� �� F� � #)� 3� Test� dummy� ?�C� Test� frx��.��  �� Q� � � Test.fr?� B� U	  LOREPORTLISTENER I LISTENERTYPE WATERMARKIMAGE DUMMY FIELD1 FIELD2 TEST FR( 	 ��C��� T�  � �C�9� � � � �� U  THIS OGDIGRAPHICS SYSTEM DRAWING GRAPHICS NEW�  ��  � � %��  ���h � T� � �a�� %�� � 
��N � T� � �� � �� � T� � � �� � �� � ��C �   � ��� U	  NBANDOBJCODE	 NFRXRECNO THIS NEWPAGE ISSUCCESSOR SHAREDGDIPLUSGRAPHICS GDIPLUSGRAPHICS OGDIGRAPHICS HANDLEV# ��  � � � � � � � � ���9� �	 ��&� %��
 � ��"� �� Q� XFCRECTANGLE�Z T� �C��������?�
 � ��������?�
 � �
 � �333333�?�
 � �333333�?�� � �� �� Q�	 XFCBITMAP� T� �C�
 � �� � �� �� Q� XFCCOLORMATRIX�� T� �C���Q��?���Q��?���Q��?� � ���Q��?���Q��?���Q��?� � ���Q��?���Q��?���Q��?� � � � � ��������?� � � � � � �� � � �� �� Q� XFCIMAGEATTRIBUTES� T� �C�� � � �� ��C � � � ��& ��C �  � C� � � � �
 � � �� T�
 � �-�� � ��) ��C �   �  �  �  �  �  �  � ��� U 	 NFRXRECNO NLEFT NTOP NWIDTH NHEIGHT NOBJECTCONTINUATIONTYPE CCONTENTSTOBERENDERED GDIPLUSIMAGE SYSTEM DRAWING THIS NEWPAGE LORECT	 RECTANGLE NEW SHAREDPAGEWIDTH SHAREDPAGEHEIGHT LOBMP BITMAP WATERMARKIMAGE LOCLRMATRIX IMAGING COLORMATRIX LOATTR IMAGEATTRIBUTES SETCOLORMATRIX OGDIGRAPHICS	 DRAWIMAGE	 GETBOUNDS BEFOREREPORT     
 BEFOREBANDt      RENDERk     D  T�  �a�� T� ���� T� ��  ��
 ��    �
 ��    �
 ��    � U  NEWPAGE OGDIGRAPHICS WATERMARKIMAGE MyReportListener _ReportListenerP    q�� A�q�A q Q S�� B 8 � �3 � � 1A aA 6 4!s�C���Qb� A A �2 � � � � � � p1                    �  7  $      E  �  (      �  �
  4   1   x  �
       %   �  �  1	  A   �  )8�  �� �C�
 System.app���. G~(�CC��Q��� FFC\_ReportListener.VCX�� ��  � �  T�  �C� MyReportListener�N�� T�  � ����A T�  � �� Rotated StringC� C�
 � GdiPlus-X is cool !�� T�  � �C��� ���^��, h�� Dummy� � C���� � C���� �� ���(�����k�N r�� Dummy���% Testing ReportListener with GdiPlus-X��� Visit CodePlex�� �� F� � #)� 3� Test� dummy� ?�C� Test� frx��.��  �� Q� � � Test.fr?� B� ��� _ReportListener.VCX�� U
  LOREPORTLISTENER I LISTENERTYPE ROTATESTRING ROTATESTRINGCOLOR DUMMY FIELD1 FIELD2 TEST FR( 	 ��C��� T�  � �C�9� � � � �� U  THIS OGDIGRAPHICS SYSTEM DRAWING GRAPHICS NEW�  ��  � � %��  ���h � T� � �a�� %�� � 
��N � T� � �� � �� � T� � � �� � �� � ��C �   � ��� U	  NBANDOBJCODE	 NFRXRECNO THIS NEWPAGE ISSUCCESSOR SHAREDGDIPLUSGRAPHICS GDIPLUSGRAPHICS OGDIGRAPHICS HANDLE# ��  � � � � � � � � ���9� �	 ���� %��
 � ���� �� Q� XFCBRUSH�  T� �CC�
 � �� � �� � �� �� Q� XFCRECTANGLE�$ T� �C� � �
 � �
 � �� � �� �� Q� XFCSTRINGFORMAT� T� �C�� � �� T� � ��� � �� T� � ��� � �� �� Q� XFCFONT�) T� �C� Verdana�0� �� � �� � ��$ ��C�
 � ��
 � ��
 �  �! �� ��C����
 �  �" ��& ��C�
 � c��
 � c��
 �  �! ��& ��C�
 �$  �  �  �  � �
 �  �# �� ��C�
 �  �% �� T�
 � �-�� � ��) ��C �   �  �  �  �  �  �  � ��� U& 	 NFRXRECNO NLEFT NTOP NWIDTH NHEIGHT NOBJECTCONTINUATIONTYPE CCONTENTSTOBERENDERED GDIPLUSIMAGE SYSTEM DRAWING THIS NEWPAGE LOBRUSH
 SOLIDBRUSH NEW COLOR FROMRGB ROTATESTRINGCOLOR LORECT	 RECTANGLE SHAREDPAGEWIDTH SHAREDPAGEHEIGHT LOSTRINGFORMAT STRINGFORMAT	 ALIGNMENT STRINGALIGNMENT CENTER LINEALIGNMENT LOFONT FONT GRAPHICSUNIT POINT OGDIGRAPHICS TRANSLATETRANSFORM ROTATETRANSFORM
 DRAWSTRING ROTATESTRING RESETTRANSFORM BEFOREREPORTx     
 BEFOREBAND�      RENDER�     Z  T�  �a�� T� ��  �� T� �C� � � �^�� T� ����
 ��    �
 ��    �
 ��    � U  NEWPAGE ROTATESTRING ROTATESTRINGCOLOR OGDIGRAPHICS MyReportListener _ReportListener�    q�� ��q�A q Q S�� B �8 � �3 � � 1A aA 6 4!2sA�!AA#�CAab� A A �2 � � a� � � � `1                    n  �  '      �    +   !   +    7   8   �    !   0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1WL16OA13 892903692      /  F      ]                          �      �                       WINDOWS _1WL16OA14 892906695�      �  �      �                              {                           COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      resourcecanvas     uTop = 0
Left = 0
Height = 250
Width = 375
ScrollBars = 3
DoCreate = .T.
BorderStyle = 0
Caption = "ResourceCanvas"
TitleBar = 0
BackColor = 255,255,255
_memberdata =      157<VFPData><memberdata name="oparent" type="property" display="oParent"/><memberdata name="collectgarbage" type="method" display="CollectGarbage"/></VFPData>

Name = "resourcecanvas"
      6_memberdata XML Metadata for customizable properties
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KN688 889015483      /  F      ]                          �      �                       WINDOWS _1V00KN689 942183500�      �  �      �      `  �                                               WINDOWS _1V00KN68A 923479717g  x  �  �  �  �        )                                               COMMENT RESERVED                                
                                                            
=                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      cHeight = 264
Width = 300
DoCreate = .T.
AutoCenter = .T.
Caption = "Rotation"
Name = "Form1"
      7PROCEDURE Init
DO (LOCFILE("System.app"))

ENDPROC
      ����    �   �                         �L   %   J       ^      X           �  U    �C�
 System.app��� U   Init,     ��1 q2                       ,       )   �                         	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      CHeight = 264
Left = 0
Top = 0
Width = 300
Name = "Imgcanvas1"
     PROCEDURE beforedraw

LOCAL loGfx AS xfcGraphics
LOCAL loFont AS xfcFont
LOCAL loBrush AS xfcSolidBrush
LOCAL loState AS xfcGraphicsState

WITH _SCREEN.System.Drawing AS xfcDrawing

	This.Clear()

	loGfx = This.oGfx
	loFont = .Font.New("Arial",14)
	loBrush = .Brushes.Blue
	
	loState = loGfx.Save()
	loGfx.TranslateTransform(This.Width/2,This.Height/2)
	FOR x = 1 TO 8
		loGfx.RotateTransform(45)
		loGfx.DrawString("FoxPro Rocks!", loFont, loBrush, 0,0)
	ENDFOR
	loGfx.Restore(loState)
	

ENDWITH
ENDPROC
     ����    �  �                        ��   %   G      �     [          �  U  f ��  Q� XFCGRAPHICS� �� Q� XFCFONT� �� Q� XFCSOLIDBRUSH� �� Q� XFCGRAPHICSSTATE�  ���9� � �Q�
 XFCDRAWING�_� ��C� � �� T�  �� � �� T� �C� Arial���	 �
 �� T� ��� � �� T� �C�  � ��! ��C� � �� � ��  � �� �� ���(����J� ��C�-�  � ��+ ��C� FoxPro Rocks! �  � � � �  � �� �� ��C � �  � �� �� U  LOGFX LOFONT LOBRUSH LOSTATE SYSTEM DRAWING THIS CLEAR OGFX FONT NEW BRUSHES BLUE SAVE TRANSLATETRANSFORM WIDTH HEIGHT X ROTATETRANSFORM
 DRAWSTRING RESTORE
 beforedraw,     ��1 b!��� �q�A C 1                       	      )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1UZ1A05HA 910326326      /  F      ]                          �      �                       WINDOWS _1UZ1A05HB 923479077�      �  �  �                                                             WINDOWS _1UZ1A05HC 923479077�      �  �      �      L  ?                   �                           WINDOWS _1UZ1A05HD 910326483�      �  �  �  �      3  �                                               WINDOWS _1UZ1A05HA 910326433      	  �  �  �      B                                                 WINDOWS _1UZ1AA7D2 910326433-          �  �      �                                                 WINDOWS _1UZ1ACWWC 910326483�      �  �  �                                                             WINDOWS _1YY1F1Z5M 910326483        �  �  Y                                                           WINDOWS _1Z0029Q12 910326433L      ?  1  $  �                                                           WINDOWS _1UZ1A05HA 910326510�      �  y  l                                                             WINDOWS _20A0WYHSL 910326503�      �  �  �  ^                                                           COMMENT RESERVED                                5                                                            +a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      aTop = 179
Left = 230
Width = 244
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      cursor      cursor      Cursor1      Dataenvironment      �Top = 20
Left = 10
Height = 90
Width = 126
Alias = "gdiplusxsamples"
CursorSource = gdiplusxsamples.dbf
Name = "Cursor1"
      2      1      form      form      Form1     }Height = 412
Width = 456
DoCreate = .T.
AutoCenter = .T.
Caption = "GDIPlusX Samples"
_memberdata =      245<VFPData><memberdata name="runselectedsample" type="method" display="RunSelectedSample"/><memberdata name="canvasrightclick" type="method" display="CanvasRightClick"/><memberdata name="printimage" type="method" display="PrintImage"/></VFPData>

Name = "Form1"
     �PROCEDURE runselectedsample
LOCAL lcCommand
lcCommand = gdiplusxsamples.runcmd

IF "DO FORM " $ UPPER (lcCommand)
	lcCommand = lcCommand + " NAME oSample"
ENDIF

TRY
	&lcCommand
	* EXECSCRIPT(gdiplusxsamples.runcmd)

	IF VARTYPE(oSample) = "O"
		oSample.AddObject("ImgVFPXPowered", "Image")
		oSample.ShowTips = .T.
		WITH oSample.ImgVFPXPowered
			.Picture = "Image\vfpxpoweredby_alternative.gif"
			.Left = oSample.Width - .Width
			.Top = oSample.Height - .Height
			.Anchor = 192
			.ZOrder(0)
			.Visible = .T.
		ENDWITH
		
		FOR EACH loControl IN oSample.Controls
			IF loControl.Class = "Imgcanvas"
				BINDEVENT(loControl, "RightClick", This, "CanvasRightClick")
				loControl.ToolTipText = "RightClick to Save or Print Image"
			ENDIF
		ENDFOR
	ENDIF

CATCH

ENDTRY
ENDPROC
PROCEDURE canvasrightclick
LOCAL laObjects(1), loImgCanvas
AEVENTS(laObjects,0)
loImgCanvas = laObjects(1)

SET TALK OFF
SET NOTIFY OFF 
SET CONSOLE OFF 

LOCAL lnChoice, lcImgSave, lcImgPrint, lcPrinterName

lnChoice = 0
lcImgSave  = HOME() + "/graphics/Bitmaps\Offctlbr\Small\Color\Save.bmp"
lcImgPrint = HOME() + "/graphics/Bitmaps\Offctlbr\Small\Color\Print.bmp"

DEFINE POPUP CanvasMenu SHORTCUT RELATIVE FROM MROW(),MCOL()
DEFINE BAR 1 OF CanvasMenu PROMPT "Print using Default Printer " ;
	PICTURE lcImgPrint
DEFINE BAR 2 OF CanvasMenu PROMPT "Print using Selected Printer "
DEFINE BAR 3 OF CanvasMenu PROMPT "Print adjusting to Page Size "
DEFINE BAR 4 OF CanvasMenu PROMPT "Print in Landscape "
DEFINE BAR 5 OF CanvasMenu PROMPT "Save As... " ;
	PICTURE lcImgSave


ON SELECTION POPUP CanvasMenu lnChoice = BAR()

ACTIVATE POPUP CanvasMenu


DO CASE
	CASE lnchoice = 0
		RETURN
	CASE lnchoice = 1
		loImgCanvas.oBmp.ToPrinter()

	CASE lnchoice = 2
		* xfcImage.ToPrinter(tlFittoPage, tcPrinterName, tnLandScape)
		lcprintername = GETPRINTER()
		loImgCanvas.oBmp.ToPrinter(.F., lcPrinterName)

	CASE lnchoice = 3
		lcprintername = GETPRINTER()
		loImgCanvas.oBmp.ToPrinter(.T., lcPrinterName)

	CASE lnchoice = 4
		* xfcImage.ToPrinter(tlFittoPage, tcPrinterName, tnLandScape)
		lcprintername = GETPRINTER()
		loImgCanvas.oBmp.ToPrinter(.F., lcPrinterName, 1)

	CASE lnchoice = 5
		LOCAL lcImgFormatTypes, lcFile, lcExt
		LOCAL loImgFormat as xfcImageFormat
		lcImgFormatTypes = "bmp;jpg;gif;png;tif"
		lcFile = PUTFILE("Save Image as...", "", lcImgFormatTypes)
		IF EMPTY(lcFile) OR lcImgFormatTypes $ lcFile && Invalid File Name
			RETURN .F.
		ENDIF
		lcExt = LOWER(JUSTEXT(lcFile))
		DO CASE
		CASE lcExt = "bmp" OR lcExt = "bitmap"
			loImgFormat = _Screen.System.Drawing.Imaging.ImageFormat.Bmp			

		CASE lcExt = "jpg" OR lcExt = "jpeg"
			loImgFormat = _Screen.System.Drawing.Imaging.ImageFormat.Jpeg 			

		CASE lcExt = "gif"
			loImgFormat = _Screen.System.Drawing.Imaging.ImageFormat.Gif 			

		CASE lcExt = "png"
			loImgFormat = _Screen.System.Drawing.Imaging.ImageFormat.Png 

		CASE lcExt = "tif" OR lcExt = "tiff"
			loImgFormat = _Screen.System.Drawing.Imaging.ImageFormat.Tiff 
		OTHERWISE
			RETURN .F.
		ENDCASE
			
		TRY
			loImgCanvas.oBmp.Save(lcFile, loImgFormat)	
		CATCH
		ENDTRY
		
		RETURN FILE(lcFile)
ENDCASE
ENDPROC
PROCEDURE Init
SET PATH TO "samples" ADDITIVE
SET PATH TO "source" ADDITIVE

SET TALK OFF
SET NOTIFY OFF 
SET CONSOLE OFF 

This.MinWidth = This.Width
This.MinHeight = This.Height
ENDPROC
PROCEDURE Destroy
CLEAR EVENTS 
ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  ?  ��  � %�C� � �
��8 � T�  �� � �� &lcCommand
 � U 	 LCCOMMAND GDIPLUSXSAMPLES EDITCMD Click,     ��1 q 1� B 1                       �       )   �                         ����    �   �                         E�   %   ]       r      l           �  U    ��C�  � �� U  THISFORM RUNSELECTEDSAMPLE Click,     ��1 � 1                       -       )   �                        4���                              #�   %   �       �      �           �  U    ��C�  � �� U  THISFORM RUNSELECTEDSAMPLE  ��C�  � � �� U  THIS PARENT REFRESH DblClick,     �� InteractiveChange]     ��1 � 2 1                       0         X   m       )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      fAutoSize = .T.
Caption = "Category"
Height = 17
Left = 237
Top = 76
Width = 51
Name = "Label2"
      Form1      Label2      label      label      cAutoSize = .T.
Caption = "Sample"
Height = 17
Left = 16
Top = 76
Width = 45
Name = "Label1"
      Form1      Label1      label      label      {Anchor = 9
Picture = image\vfpxpoweredby_alternative.gif
Height = 16
Left = 360
Top = 12
Width = 85
Name = "Image1"
      Form1      Image1      image      image      �Picture = image\transpvfpxlogosmall.gif
Stretch = 1
BackStyle = 0
Height = 60
Left = 12
Top = 12
Width = 156
Name = "Image2"
      Form1      Image2      image      image      vAnchor = 14
Height = 53
Left = 12
Top = 348
Width = 432
ControlSource = "gdiplusxsamples.notes"
Name = "Edit1"
      Form1      Edit1      editbox      editbox      �PROCEDURE Click
LOCAL lcCommand
IF NOT EMPTY(gdiplusxsamples.editcmd)
	lcCommand = gdiplusxsamples.editcmd
	&lcCommand
**	EXECSCRIPT(gdiplusxsamples.editcmd)
ENDIF
ENDPROC
      fTop = 120
Left = 360
Height = 27
Width = 84
Anchor = 9
Caption = "Modify..."
Name = "Command2"
      Form1      Command2      commandbutton      commandbutton      8PROCEDURE Click
Thisform.RunSelectedSample()
ENDPROC
      bTop = 84
Left = 360
Height = 27
Width = 84
Anchor = 9
Caption = "Run..."
Name = "Command1"
      Form1      Command1      commandbutton      commandbutton      xPROCEDURE DblClick
Thisform.RunSelectedSample()
ENDPROC
PROCEDURE InteractiveChange
This.Parent.Refresh()
ENDPROC
      �Anchor = 15
ColumnCount = 2
ColumnWidths = "220,100"
RowSourceType = 2
RowSource = "gdiplusxsamples.Caption, Category"
Height = 242
ColumnLines = .F.
Left = 12
Top = 96
Width = 324
IntegralHeight = .T.
Name = "List1"
      Form1      List1      listbox      listbox      __memberdata XML Metadata for customizable properties
*runselectedsample 
*canvasrightclick 
     ���                              5   %   j	      �
  e   �	          �  U  � ��  � T�  �� � �� %�� DO FORM C�  f��P � T�  ��  �  NAME oSample�� � ���� &lcCommand
 %�C� ��� O����& ��C� ImgVFPXPowered� Image� � �� T� � �a�� ��� � ��H�1 T�� ��# Image\vfpxpoweredby_alternative.gif�� T�� �� �	 ��	 �� T��
 �� � �� �� T�� ����� ��C� �� �� T�� �a�� �� �� � � ��� %�� � �	 Imgcanvas����/ ��C� �
 RightClick� � CanvasRightClick��1 T� � ��! RightClick to Save or Print Image�� � �� � ���� �� U 	 LCCOMMAND GDIPLUSXSAMPLES RUNCMD OSAMPLE	 ADDOBJECT SHOWTIPS IMGVFPXPOWERED PICTURE LEFT WIDTH TOP HEIGHT ANCHOR ZORDER VISIBLE	 LOCONTROL CONTROLS CLASS THIS TOOLTIPTEXT ��  ���� � ��C��  � 	�� T� �C��  �� G2� GZ� G
� �� � � � � T� �� ��@ T� �C�Q�/ /graphics/Bitmaps\Offctlbr\Small\Color\Save.bmp��A T� �C�Q�0 /graphics/Bitmaps\Offctlbr\Small\Color\Print.bmp�� s�� �C���C���W�6 s����� "�� Print using Default Printer ���� ��1 s����� "�� Print using Selected Printer ��1 s����� "�� Print adjusting to Page Size ��' s����� "�� Print in Landscape ��% s����� "�� Save As... ���� �� 1��� � lnChoice = BAR()� t�� � H��� �� � ��$� B� �� ���E� ��C� � � �� �� ���x� T� �C��� ��C- � � � � �� �� ����� T� �C��� ��Ca � � � � �� �� ����� T� �C��� ��C- � �� � � �� �� ���� ��	 �
 � � �� Q� XFCIMAGEFORMAT�  T�	 �� bmp;jpg;gif;png;tif��% T�
 �C� Save Image as...�  �	 ��� %�C�
 �� �	 �
 ���� B�-�� � T� �CC�
 ��@�� H�����% �� � bmp� � � bitmap���� T� ��9� � � � � ��# �� � jpg� � � jpeg��!� T� ��9� � � � � �� �� � gif��P� T� ��9� � � � � �� �� � png��� T� ��9� � � � � ��# �� � tif� � � tiff���� T� ��9� � � � � �� 2��� B�-�� � ���� ��C �
  � � � � �� ���� �� B�C�
 0�� � U 	 LAOBJECTS LOIMGCANVAS LNCHOICE	 LCIMGSAVE
 LCIMGPRINT LCPRINTERNAME
 CANVASMENU OBMP	 TOPRINTER LCIMGFORMATTYPES LCFILE LCEXT LOIMGFORMAT SYSTEM DRAWING IMAGING IMAGEFORMAT BMP JPEG GIF PNG TIFF SAVE`  G)(�� samples�� G)(�� source�� G2� GZ� G
� T�  � ��  � �� T�  � ��  � �� U  THIS MINWIDTH WIDTH	 MINHEIGHT HEIGHT  �� U   runselectedsample,     �� canvasrightclick�    �� Init�    �� Destroy^	    ��1 q ��A � � Sa� aa� � � A "��A A A � B 2 b a a 2� BbqR�� � A � Q� Q� �� �Q�q A !� Q�2�B�B�2�� q A � �� A � A 2 1!b a a 212 Q 1                       (        O  �  %   [   �  x  {   c   �  �  �    )                     0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 898854279�      �  �      �                                                           WINDOWS _1TN1AHCZI 898828372e  v  �  �  �  �        �                                               WINDOWS _1YZ01R55W 898854279�      �  �    �
      �
  �	                                               COMMENT RESERVED                                {
                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      hTop = 6
Left = 13
DoCreate = .T.
Caption = "Shapes: Lines, Polygon, and Rectangles"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 252
Left = -1
Top = -1
Width = 377
Name = "Imgcanvas1"
     oPROCEDURE beforedraw
WITH _SCREEN.SYSTEM.drawing
	This.Clear() 

	* Set the Smoothing Mode
	IF Thisform.chkAntiAlias.Value
		This.oGfx.SmoothingMode = .Drawing2D.SmoothingMode.AntiAlias 
	ELSE
		This.oGfx.SmoothingMode = .Drawing2D.SmoothingMode.Default
	ENDIF

	
	* Draw 2 simple lines
	THIS.oGfx.DrawLine(.Pens.Red, 60, 5, 160, 25)
	p1 = .POINT.NEW(40, 18)
	p2 = .POINT.NEW(120, 28)
	THIS.oGfx.DrawLine(.Pens.Plum, p1, p2)


	* Draw a curve
	DIMENSION pts(20)
	angle = 0
	FOR x = 1 TO 20
		pts(x) = .PointF.NEW((x-1) * 10 + 120, 180 + 15 * SIN(angle))
		angle = angle +  PI() / 10
	NEXT
	THIS.oGfx.DrawLines(.Pens.Blue, @pts)
	LOCAL p
	FOR EACH p IN pts
		THIS.oGfx.FillEllipse(.Brushes.Green, ;
			.RectangleF.NEW(p.x - 3, p.Y - 3, 6.0, 6.0))
	NEXT


	* Draw polygon with 2 triangles
	DIMENSION POLY(5)
	POLY[1] = .POINT.NEW(80,50)
	POLY[2] = .POINT.NEW(260,120)
	POLY[3] = .POINT.NEW(260,50)
	POLY[4] = .POINT.NEW(80,120)
	POLY[5] = .POINT.NEW(80,50)
	THIS.oGfx.FillPolygon(.Brushes.Tomato, @POLY)
	PEN = .PEN.NEW(.COLOR.TAN, 4)
	THIS.oGfx.DrawPolygon(PEN, @POLY)
	PEN.Dispose()


	* Draw Blue piramid
	DIMENSION rcs(10)
	FOR x = 1 TO 10
		rcs(x) = .Rectangle.New(60 - x * 5, 110 + x * 12, x * 10, 12)
	NEXT x
	THIS.oGfx.FillRectangles(.Brushes.RoyalBlue, @rcs)
	THIS.oGfx.DrawRectangles(.Pens.YellowGreen, @rcs)
ENDWITH

ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         !Arial, 0, 9, 5, 15, 12, 16, 3, 0
      BPROCEDURE InteractiveChange
Thisform.IMGCANVAS1.Draw()
ENDPROC
      �Top = 228
Left = 180
Height = 17
Width = 72
Alignment = 0
BackStyle = 0
Caption = "AntiAlias"
Value = .F.
Name = "chkAntiAlias"
      Form1      chkAntiAlias      checkbox      checkbox     ����    �  �                        �2   %   1      �  )   E          �  U  � ���9�  � ��y� ��C� � �� %�� � � ��L � T� � � ���	 � �
 �� �n � T� � � ���	 � � �� �# ��C�� � �<����� � � �� T� �C�(��� � �� T� �C�x��� � �� ��C�� �  �  � � � � �� � ���� T� �� �� �� ���(����`�6 T� �� ��C� ��
�x���C� �D�� � �� T� �� C�M�
�� �� ��C�� � � � � � �� �� � �� � ���I ��C�� � C� � �� � ��      @�      @�� � � � � �� �� �  ���� T�  ����C�P�2�� � �� T�  ����C��x�� � �� T�  ����C��2�� � �� T�  ����C�P�x�� � �� T�  ����C�P�2�� � �� ��C�� �" �  � � �! �� T�# �C��$ �% ���# � �� ��C �# �  � � �& �� ��C�# �' �� �( ��
�� �� ���(��
��?�8 T�( �� ��C�<� ��n� �� �
���) � �� �� ��C�� �+ �( � � �* �� ��C�� �- �( � � �, �� �� U.  SYSTEM DRAWING THIS CLEAR THISFORM CHKANTIALIAS VALUE OGFX SMOOTHINGMODE	 DRAWING2D	 ANTIALIAS DEFAULT DRAWLINE PENS RED P1 POINT NEW P2 PLUM PTS ANGLE X POINTF	 DRAWLINES BLUE P FILLELLIPSE BRUSHES GREEN
 RECTANGLEF Y POLY FILLPOLYGON TOMATO PEN COLOR TAN DRAWPOLYGON DISPOSE RCS	 RECTANGLE FILLRECTANGLES	 ROYALBLUE DRAWRECTANGLES YELLOWGREEN
 beforedraw,     ��1 !� 3�� �A 4���� � qaQA �q � �A � ��������� � q�A ��A 2                       d      )   �                  0	   m                 �  PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _1890LRE8T 888956264�      �  s      �  �  \  �f          �  �  \          /  �           COMMENT RESERVED                                                                                           WINDOWS _1AD1ADSOF 892897117�      �  �      	      �            �  �  �          P  ^           COMMENT RESERVED                        =                                                                   WINDOWS _1890LRE8T 892909615      w        �  �  !{  �P          �  �  �          �  A           COMMENT RESERVED                        |                                                                    ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00     \���    C  C                           %   �      �     �          �  U    ��C�  � �� U  THIS
 DECLAREDLL� � V� GS_SplitGetDC� GS_SplitCreateCompatibleDC� GS_SplitCreateCompatibleBitmap� GS_SplitSelectObject� GS_SplitReleaseDC� GS_SplitDeleteDC� GS_SplitBitBlt� GS_SplitGetWindow� GS_SplitDeleteObject� U  + |�� GetDC� Win32APIQ� GS_SplitGetDC��E |�� CreateCompatibleDC� Win32APIQ� GS_SplitCreateCompatibleDC��Q |�� CreateCompatibleBitmap� Win32APIQ� GS_SplitCreateCompatibleBitmap����; |�� SelectObject� Win32APIQ� GS_SplitSelectObject���5 |��	 ReleaseDC� Win32APIQ� GS_SplitReleaseDC���1 |�� DeleteDC� Win32APIQ� GS_SplitDeleteDC��= |�� BitBlt� Win32APIQ� GS_SplitBitBlt����������9 |�� DeleteObject� Win32APIQ� GS_SplitDeleteObject��3 |��	 GetWindow� user32Q� GS_SplitGetWindow��� U  GETDC WIN32API GS_SPLITGETDC CREATECOMPATIBLEDC GS_SPLITCREATECOMPATIBLEDC CREATECOMPATIBLEBITMAP GS_SPLITCREATECOMPATIBLEBITMAP SELECTOBJECT GS_SPLITSELECTOBJECT	 RELEASEDC GS_SPLITRELEASEDC DELETEDC GS_SPLITDELETEDC BITBLT GS_SPLITBITBLT DELETEOBJECT GS_SPLITDELETEOBJECT	 GETWINDOW USER32 GS_SPLITGETWINDOW Init,     �� DestroyR     ��
 declaredll/    ��1 � 2 j2 �R�R��42                       #         A   7        X  �      )   C                        splitter      Ireadme^
hidecontrols^
showcontrols^
hiddencontrols^
Init
MouseDown
      Pixels      Class      1      shape      splitter      	splitter2      Pixels      splitterapi      Pixels      Splitter API declaration class      Class      1      custom      splitterapi      Pninstances
_memberdata XML Metadata for customizable properties
*declaredll 
     �Height = 15
Width = 27
ninstances = 1
_memberdata =       87<VFPData><memberdata name="declaredll" type="method" display="DeclareDll"/></VFPData>

Name = "splitterapi"
      custom      shape      �Height = 4
Width = 100
MousePointer = 7
SpecialEffect = 0
rangemin = 0.2
rangemax = 0.8
_memberdata = 
Name = "splitter2"
      	splitter2      shape      1      Class      Ireadme^
hidecontrols^
showcontrols^
hiddencontrols^
Init
MouseDown
      \Up-Down Splitter class. Support ActiveX controls. Author: gerald.santerre@siteintranet.qc.ca     �rangemin The splitter can be dragged to the top down to this value. Value < 1 is percent of parent height.
rangemax The splitter can be dragged to the bottom up to this value. Pixels from the top of the parent. Value < 1 is percent of parent height.
_memberdata XML Metadata for customizable properties
*readme 
*hidecontrols internal use
*showcontrols internal use
*split This method is called at the end of the split operation.
^hiddencontrols[1,1] Array of controls
      _Left-Right Splitter class. Support ActiveX controls. Author: gerald.santerre@siteintranet.qc.ca     Drangemin The splitter can be dragged to the left side down to this value. Pixels from the left side of the parent. Value < 1 is percent of parent width.
rangemax The splitter can be dragged to the right side up to this value. Pixels from the left side of the parent. Value < 1 is percent of parent width.
_memberdata XML Metadata for customizable properties
*readme 
*hidecontrols internal use
*showcontrols internal use
*split This method is called at the end of a split operation
^hiddencontrols[1,1] Array of controls
*declaredll 
*beforemousedown 
*aftermousedown 
     {Height = 203
Width = 4
MousePointer = 9
SpecialEffect = 0
rangemin = 0.2
rangemax = 0.8
_memberdata =      237<VFPData><memberdata name="declaredll" type="method" display="DeclareDll"/><memberdata name="beforemousedown" type="method" display="BeforeMouseDown"/><memberdata name="aftermousedown" type="method" display="AfterMouseDown"/></VFPData>

Name = "splitter"
      shape     �PROCEDURE Init

THIS.DeclareDll()
ENDPROC
PROCEDURE Destroy
Clear Dlls	;
	"GS_SplitGetDC",;
	"GS_SplitCreateCompatibleDC",;
	"GS_SplitCreateCompatibleBitmap",;
	"GS_SplitSelectObject",;
	"GS_SplitReleaseDC",;
	"GS_SplitDeleteDC",;
	"GS_SplitBitBlt",;
	"GS_SplitGetWindow",;
	"GS_SplitDeleteObject"
ENDPROC
PROCEDURE declaredll

DECLARE LONG GetDC					IN Win32API AS GS_SplitGetDC LONG HWND

DECLARE LONG CreateCompatibleDC		IN Win32API AS GS_SplitCreateCompatibleDC LONG hdc

DECLARE LONG CreateCompatibleBitmap IN Win32API AS GS_SplitCreateCompatibleBitmap  LONG hdc, LONG nWidth, LONG nHeight

DECLARE LONG SelectObject 			IN Win32API AS GS_SplitSelectObject  LONG hdc, LONG hObject

DECLARE LONG ReleaseDC 				IN Win32API AS GS_SplitReleaseDC  LONG HWND, LONG hdc

DECLARE LONG DeleteDC 				IN Win32API AS GS_SplitDeleteDC  LONG hdc

DECLARE LONG BitBlt 				IN Win32API AS GS_SplitBitBlt  ;
  LONG hDestDC, LONG x, LONG Y, LONG nWidth, LONG nHeight, ;
  LONG hSrcDC, LONG xSrc, LONG ySrc, LONG dwRop

DECLARE INTEGER DeleteObject 		IN Win32API AS GS_SplitDeleteObject  LONG hObject

DECLARE INTEGER GetWindow 			IN user32 AS GS_SplitGetWindow  ;
  INTEGER HWND,;
  INTEGER wFlag

ENDPROC
     6�PROCEDURE readme
*!*	Splitter class
*!*	May 2004

*!*	Active-X controls always drive me nuts because they use there own windows handle.
*!*	You cannot put a fox native control over them to resize the control visually.
*!*	You have to use some tricks like changing the control to 
*!*	another one for this operation and rechange it back after.
*!*	( See the class browser code )

*!*	What I want is a splitter that can handle this in a visual way 
*!*	while keeping the form (look) unchanged until the end of the split.

*!*	After many try and fail, I have finally found a way to do it
*!*	by the use of API calls. IT WORK!!!
*!* Days of work to end with only a couple of code lines :)

*!*	I am not an API guru, so if you find a way to improve this class
*!*	feel free to let me know how :)

*!*	Tested with VFP 8-7 on Windows 2000 
*!*	(no animal other than the usual fox was used in the tests)
*!*	Disclaimer: (...) <- put the usual disclaimer here!

*!*	G�rald Santerre
*!*	gerald.santerre@siteintranet.qc.ca


*!*		USAGE:

*!*		Drop this class on a form or a container between the objects that share the container. 

*!*	New release, complete redesing.
*!*	If you already use a previous version of the class, read this carefully. 
*!*	I have removed a couple of properties and change the way the classes work. 
*!*	For this reason I have also renamed the classlib to avoid conflicts 
*!*	with previous version of the class. The new design is cleaner and the control 
*!*	don't touch anything in the form (except hiding controls during split). 

*!*	A large part of the new design is from suggestions received 
*!*	from "Jarom�r Stacha" from Czech Republic. 
*!*		Thank you Jaromir :). 

*!*	The new splitter classes don't move or resize controls anymore. 
*!*	The splitter.split() method is always called after a split operation 
*!*	and you have to resize/reposition your controls from this (fake)event. 
*!*	If you don't put code in the split() method, the form.resize() event 
*!*	of the form will be called. See the resize() and splitter1.split() 
*!*	method of the demo form for a working sample.

*!*	You have only 2 properties to set in the class, 
*!*	RangeMin and RangeMax. 
*!*	If you set the value of this properties between 0 and 1, 
*!*	the value is handled as a % of the splitter's parent container width ot height. 
*!*	For example, if you enter 0.2 as value for RangeMin, 
*!*	you will be able to move the splitter down to 20% of the width/height 
*!*	of the splitter's parent container. 
*!*	Values greater than 1 will be handle as absolute values. 
*!*	Don't forget to reset absolute values when the splitter's parent container is resized.

*!*	The splitter API is now self contained and you dont have 
*!*	to worry about releasing the references to API functions. 
*!*	The splitter now also handle correctly multiple instances 
*!*	of the same form (or forms with the same name). 
*!*	The splitter automatically hide every controls that are in 
*!*	the same parent container (recursive) to avoid side effects 
*!*	(like mouse cursor beam over text boxes).

*!*	Contact: gerald.santerre@siteintranet.qc.ca

ENDPROC
PROCEDURE hidecontrols

* hide all controls include ActiveX with property visible inside container tObject
* without this splitter and form
*--------------------------------------------------------------------------------------------
LPARAMETERS tObject,nIndex

*	tObject is root object, if not passed, thisform is used
*--------------------------------------------------------------------------------------------
IF EMPTY(nIndex)

  nIndex = 2
  
ENDIF

LOCAL lcObjectBaseClass, lObject, lTempObject

* build collection hidden object for reverse setting in showcontrols
* set valid object
*--------------------------------------------------------------------------------------------
IF VARTYPE(tObject) = "O"

  lObject = tObject

ELSE

  lObject = THISFORM

ENDIF

* ignore this splitter
*--------------------------------------------------------------------------------------------
IF lObject = THIS

  RETURN nIndex

ENDIF

* unify
*--------------------------------------------------------------------------------------------
lcObjectBaseClass = LOWER(lObject.BASECLASS) + " " && " " for unique (page # pageframe)

* do not hide form window
*--------------------------------------------------------------------------------------------
IF lcObjectBaseClass # "form " AND PEMSTATUS(lObject,"visible",5)

  IF lObject.VISIBLE

    DIMENSION THIS.HiddenControls[nIndex]

    THIS.hiddencontrols[nIndex] = lObject

    lObject.VISIBLE = .F.

    nIndex = nIndex + 1

  ENDIF

ENDIF

* recurse for all children
*--------------------------------------------------------------------------------------------
DO CASE

  CASE INLIST(lcObjectBaseClass,"pageframe ")

    FOR EACH lTempObject IN lObject.PAGES

      nIndex=THIS.hidecontrols(lTempObject,nIndex)

    ENDFOR

  CASE INLIST(lcObjectBaseClass,"form ","container ","page ")

    FOR EACH lTempObject IN lObject.CONTROLS

      nIndex=THIS.hidecontrols(lTempObject,nIndex)

    ENDFOR

  CASE INLIST(lcObjectBaseClass,"commandgroup ","optiongroup ")

    FOR EACH lTempObject IN lObject.BUTTONS

      nIndex=THIS.hidecontrols(lTempObject,nIndex)

    ENDFOR

ENDCASE

RETURN nIndex + 1

ENDPROC
PROCEDURE showcontrols

* show temporary hidden objects and clear list (collection)
*------------------------------------------------------------
LPARAMETERS toRoot

IF ALEN(THIS.hiddencontrols, 1) < 2

  RETURN

ENDIF

FOR i = 2 TO ALEN(THIS.hiddencontrols, 1)

  IF TYPE("THIS.hiddencontrols[i]") = "O"

    THIS.hiddencontrols[i].VISIBLE = .T.

  ENDIF

ENDFOR

DIMENSION THIS.hiddencontrols[1]

ENDPROC
PROCEDURE split

* default behaviour
*--------------------
THISFORM.RESIZE()
ENDPROC
PROCEDURE Init

* API FUNCTIONS - declare only one for all splitter with this class
*--------------------------------------------------------------------------------------------
IF !VARTYPE(_SCREEN.___SplitterApi) = "O"

  *!*	  IF AT(UPPER((THIS.CLASSLIBRARY)),UPPER(SET("Classlib")))=0

  *!*	    SET CLASSLIB TO (THIS.CLASSLIBRARY) ADDITIVE

  *!*	  ENDIF

  *!*	  _SCREEN.ADDOBJECT("___SplitterApi","SplitterAPI")
  
  _SCREEN.NEWOBJECT("___SplitterApi","SplitterAPI", THIS.CLASSLIBRARY)

ELSE

  _SCREEN.___SplitterApi.nInstances = _SCREEN.___SplitterApi.nInstances + 1

ENDIF

RETURN VARTYPE(_SCREEN.___SplitterApi)="O"

ENDPROC
PROCEDURE MouseDown

LPARAMETERS nButton, nShift, nXCoord, nYCoord
LOCAL lcWindowName,lnScaleMode,lnMinRow,lnMaxRow,lnMRow1,lnMRow2
LOCAL lnRows,lnTop,lnOldTop,lnMin,oldMRow2
LOCAL llLockScreen,lnMousePointer
LOCAL lhDC,lhMemDC,lhMemBmp,lHWnd,lnBmpHeight,nLeftOffset,nTopOffset,oContainer,xHeight
LOCAL lcOldFormName,lhMemSplit

IF nButton # 1

  RETURN

ENDIF

lcOldFormName = THISFORM.NAME

THISFORM.NAME = SYS(2015)

lcWindowName = THISFORM.NAME

lnScaleMode = THISFORM.SCALEMODE

THISFORM.SCALEMODE = 3  && pixels

oContainer = THIS.PARENT

nLeftOffset = OBJTOCLIENT(THIS,2) - THIS.LEFT

nTopOffset = OBJTOCLIENT(THIS,1) - THIS.TOP

lnMRow1 = MROW(lcWindowName,3)

IF TYPE("lnMRow1") # "N" OR lnMRow1 <= 0

  THISFORM.SCALEMODE = lnScaleMode

  THISFORM.NAME = lcOldFormName

  RETURN

ENDIF

lnMRow1 = lnMRow1 - nTopOffset

IF lnMRow1 <> THIS.TOP + 1

  lnMRow1 = THIS.TOP + 1

  MOUSE AT lnMRow1 + nTopOffset, MCOL(lcWindowName,3) PIXELS WINDOW (lcWindowName)

ENDIF

* set some vars
*--------------------------------------------------------------------------------------------
llLockScreen = THISFORM.LOCKSCREEN

lnMousePointer = THISFORM.MOUSEPOINTER

THISFORM.MOUSEPOINTER = 7

lnTop = THIS.TOP

* check two parent level for Height- suppose that parent form always present
*--------------------------------------------------------------------------------------------
IF PEMSTATUS(oContainer,"Height",5)

  xHeight	=	oContainer.HEIGHT

ELSE

  IF PEMSTATUS(oContainer.PARENT,"PageHeight",5)

    xHeight	=	oContainer.PARENT.PAGEHEIGHT

  ELSE

    * if error that oContainer.Height and oContainer.parent.width not exist, something wrong
    *--------------------------------------------------------------------------------------------
    xHeight	=	oContainer.PARENT.HEIGHT

  ENDIF

ENDIF

* RangeMin (RangeMax) < 1
* 		RangeMin (RangeMax) are used as coeficient (%/100)
* RangeMin (RangeMax) > 1
*		RangeMin (RangeMax) are used as absolute offset in pixels
* RangeMin (RangeMax) =0
*		RangeMin (RangeMax) are ignored - no restriction

DO CASE

  CASE THIS.RangeMin <= 0

    lnMinRow = THIS.HEIGHT * 2

  CASE THIS.RangeMin > 1

    lnMinRow = MAX(THIS.HEIGHT * 2, INT(THIS.RangeMin))

  CASE THIS.RangeMin < 1

    lnMinRow = MAX(THIS.HEIGHT * 2, INT(THIS.RangeMin * xHeight))

ENDCASE

DO CASE

  CASE THIS.RangeMax <= 0

    lnMaxRow = xHeight - (THIS.HEIGHT * 3)

  CASE THIS.RangeMax > 1

    lnMaxRow = MIN(xHeight - (THIS.HEIGHT * 3), THIS.RangeMax)

  CASE THIS.RangeMax < 1

    lnMaxRow = MIN(xHeight - (THIS.HEIGHT * 3), THIS.RangeMax * xHeight)

ENDCASE

IF lnMinRow > lnMaxRow

  * nothing to move!!!
  *-------------------------------
  THISFORM.SCALEMODE = lnScaleMode
  THISFORM.NAME = lcOldFormName

  RETURN

ENDIF

lnMRow2 = lnMRow1
oldMRow2 = lnMRow2

#DEFINE SRCCOPY		13369376

* API CALLS
*---------------------------
IF THISFORM.SHOWWINDOW = 2

  * workaround, when showwindow=2 the handle is not the right one...
  * worst if you have a toolbar!
  *------------------------------------------------------------------
  *#define GW_HWNDFIRST        0
  #DEFINE GW_HWNDLAST         1
  *#define GW_HWNDNEXT         2
  *#define GW_HWNDPREV         3
  *#define GW_OWNER            4
  #DEFINE GW_CHILD            5

  lHWnd = THISFORM.HWND
  lHWnd = GS_SplitGetWindow(lHWnd,GW_CHILD)
  lHWnd = GS_SplitGetWindow(lHWnd,GW_HWNDLAST)

ELSE

  lHWnd = THISFORM.HWND

ENDIF

lhDC = GS_SplitGetDC(lHWnd)

lhMemDC = GS_SplitCreateCompatibleDC(lhDC)

* Take a copy of the portion of the form that can be dragged over
*------------------------------------------------------------------
lnBmpHeight = THIS.HEIGHT

lhMemBmp = GS_SplitCreateCompatibleBitmap(lhDC, THIS.WIDTH, lnBmpHeight)

lhMemSplit = GS_SplitCreateCompatibleBitmap(lhDC, THIS.WIDTH, lnBmpHeight)

= GS_SplitSelectObject(lhMemDC, lhMemBmp)

= GS_SplitBitBlt(lhMemDC, 0, 0,  THIS.WIDTH, lnBmpHeight, ;
  lhDC, THIS.LEFT + nLeftOffset, lnMRow1 - 1 + nTopOffset, SRCCOPY)

= GS_SplitSelectObject(lhMemDC , lhMemSplit)

= GS_SplitBitBlt(lhMemDC, 0, 0,  THIS.WIDTH, lnBmpHeight, ;
  lhDC, THIS.LEFT + nLeftOffset, lnMRow1 - 1 + nTopOffset, SRCCOPY)

* Stop fox drawing in the screen
*---------------------------------
THISFORM.LOCKSCREEN = .T.
THIS.hidecontrols(oContainer)

* update the display while dragging
*------------------------------------
DO WHILE MDOWN()

  DOEVENTS

  lnMRow2 = MROW(lcWindowName,3) - nTopOffset

  IF TYPE("lnMRow2") # "N" OR lnMRow2 = 0

    LOOP

  ENDIF

  IF lnMRow2 <= lnMinRow

    *force the mouse to stay at this position
    *------------------------------------------
    MOUSE AT lnMinRow + nTopOffset, MCOL(lcWindowName,3) PIXELS WINDOW (lcWindowName)

    lnMRow2 = lnMinRow + 1

  ENDIF

  IF lnMRow2 >= (lnMaxRow - THIS.HEIGHT)

    *force the mouse to stay at this position
    *--------------------------------------------------------------------------------------------
    MOUSE AT lnMaxRow - THIS.HEIGHT + nTopOffset, MCOL(lcWindowName,3) PIXELS WINDOW (lcWindowName)

    lnMRow2 = lnMaxRow - THIS.HEIGHT

  ENDIF

  lnMRow2 = MIN(MAX(lnMRow2, lnMinRow), lnMaxRow)

  IF oldMRow2 = lnMRow2

    LOOP

  ELSE

    * on mouse move, redraw a part of the screen from the memory copy
    * and draw "this" image at the mouse position
    * bitblt (dest...source...)
    *-------------------------------------------------------------------
    WITH THIS

      .TOP = lnTop + (lnMRow2 - lnMRow1)

      *restore
      *--------------
      = GS_SplitSelectObject(lhMemDC, lhMemBmp)

      = GS_SplitBitBlt(lhDC, .LEFT+nLeftOffset, oldMRow2 - 1 + nTopOffset, .WIDTH, .HEIGHT+3,;
        lhMemDC, 0, 0,  SRCCOPY)

      *take a new copy
      *-----------------
      = GS_SplitBitBlt(lhMemDC, 0, 0,  THIS.WIDTH, lnBmpHeight, ;
        lhDC, THIS.LEFT+nLeftOffset, lnMRow2 - 1 + nTopOffset, SRCCOPY)

      *draw
      *--------
      = GS_SplitSelectObject(lhMemDC , lhMemSplit)

      = GS_SplitBitBlt(lhDC, .LEFT+nLeftOffset, .TOP+nTopOffset, .WIDTH, .HEIGHT + 1,;
        lhMemDC, 0, 0,  SRCCOPY)

    ENDWITH

    oldMRow2 = lnMRow2

  ENDIF

ENDDO

THIS.showcontrols()

THISFORM.NAME = lcOldFormName

IF lnMRow2 < 0

  lnMRow2 = lnMRow1

ENDIF

lnRows = lnMRow2 - lnMRow1

THIS.TOP = lnTop + lnRows

THISFORM.SCALEMODE = lnScaleMode

THISFORM.MOUSEPOINTER = lnMousePointer

THIS.SPLIT()

THISFORM.LOCKSCREEN = llLockScreen

* free the memory
*----------------------------------
= GS_SplitReleaseDC(lHWnd, lhDC)
= GS_SplitDeleteObject(lhMemBmp)
= GS_SplitDeleteObject(lhMemSplit)
= GS_SplitDeleteDC(lhMemDC)

ENDPROC
PROCEDURE Destroy

* decrement instance counter, if 0 release object (this.release Dlls)
*-------------------------------------------------------------------------------
IF TYPE("_screen.___SplitterApi")="O" AND !ISNULL(_SCREEN.___SplitterApi)

  _SCREEN.___SplitterApi.nInstances = _SCREEN.___SplitterApi.nInstances - 1

  IF _SCREEN.___SplitterApi.nInstances <= 0

    _SCREEN.___SplitterApi.nInstances = NULL

    _SCREEN.REMOVEOBJECT("___SplitterApi")

  ENDIF

ENDIF


ENDPROC
     ����    �  �                        l�   %   �      "  �   ~          �  U    U  X ��  � � %�C� ���' � T� ���� � �� � � � %�C�  ��� O��\ � T� ��  �� �q � T� �� �� � %�� � ��� �	 B�� �� � T� �C� � @�  ��- %�� � form � C� � visible��h	��0� %�� � ��,� � �	 �� �� T� �	 �� ��� �� T� � �-�� T� �� ��� � � H�A�D� �C� �
 pageframe ����� �� � �
 ��� T� �C �  � � � �� ��, �C� � form �
 container � page ����� �� � � ��� T� �C �  � � � �� ��. �C� � commandgroup � optiongroup ���D� �� � � �@� T� �C �  � � � �� �� � B�� ��� U  TOBJECT NINDEX LCOBJECTBASECLASS LOBJECT LTEMPOBJECT THISFORM THIS	 BASECLASS VISIBLE HIDDENCONTROLS PAGES HIDECONTROLS CONTROLS BUTTONS�  ��  � %�C� � �����$ � B� � �� ���(�C� � ����� �* %�C� THIS.hiddencontrols[i]b� O��� � T� � �� �� �a�� � �� � � ���� U  TOROOT THIS HIDDENCONTROLS I VISIBLE  ��C�  � �� U  THISFORM RESIZE�  %�C�9�  ��� O
��I �1 ��C� ___SplitterApi� SplitterAPI� � �9� �� �` � ��C�9�  � �� � B�C�9�  ��� O�	 C�9�  �
	�� U  ___SPLITTERAPI	 NEWOBJECT THIS CLASSLIBRARY
 DECLAREDLL�  %�C�9�  ��� O
��I �1 ��C� ___SplitterApi� SplitterAPI� � �9� �� �l � T�9�  � ��9�  � ��� � B�C�9�  ��� O�	 C�9�  �
	�� U  ___SPLITTERAPI	 NEWOBJECT THIS CLASSLIBRARY
 NINSTANCES� 6 %�C� _screen.___SplitterApib� O�	 C�9�  �
	��� � T�9�  � ��9�  � ��� %��9�  � � ��� � T�9�  � ���� ��C� ___SplitterApi�9� �� � � U  ___SPLITTERAPI
 NINSTANCES REMOVEOBJECT�	 ��  � � � � ��C� � �� ��C� � �� �� � �	 �
 � � � �� � � � � � �� � �' �� � � � � � � � � � �� � � %��  ���� � B� � T� �� �  �� T� �  �C��]�� T� �� �  �� T� �� �! �� T� �! ���� T� �� �" �� T� �C� ��]� �# �� T� �C� ��]� �$ �� T� �C� ����& %�C� lnMCol1b� N� � � ���� T� �! �� �� T� �  �� �� B� � T� �� � �� %�� � �# ���
� T� �� �# ���! ��,�� ��C� ����� � �� � T� �� �% �� T� �� �& �� T� �& ��	�� T� �� �# �� %�C� � Width��h��y� T� �� �' �� ���" %�C� �" �	 PageWidth��h���� T� �� �" �( �� ��� T� �� �" �' �� � � H���v� �� �) � ��� T�	 �� �' ��� �� �) ���@� T�	 �C� �' �C� �) 8D�� �� �) ���v�" T�	 �C� �' �C� �) � 8D�� � H���"� �� �* � ���� T�
 �� � �' ��� �� �* �����! T�
 �C� � �' �� �* F�� �� �* ���"�% T�
 �C� � �' �� �* � F�� � %��	 �
 ��[� T� �! �� �� T� �  �� �� B� � T� �� �� T� �� �� %�� �+ ����� T� �� �, �� T� �C � ��- �� T� �C � ��- �� ��� T� �� �, �� � T� �C � �. �� T� �C � �/ �� T� �� �' ��� T� �C �  � � �1 �0 �� T� �C �  � � �1 �0 ��; |�� SelectObject� Win32APIQ� GS_SplitSelectObject��� ��C �  � �4 ��= ��C � � �  � � �1  � � � �� �$ � �  � �5 �� ��C �  � �4 ��= ��C � � �  � � �1  � � � �� �$ � �  � �5 �� T� �% �a�� ��C � � �6 �� +�C����� �� T� �C� ��� ��& %�C� lnMCol2b� N� � � ���� .� � %�� �	 ����! ��,�� ��C� �����	 � �� T� ��	 ��� � %�� �
 � �' ��@�, ��,�� ��C� �����
 � �' � ��� T� ��
 � �' �� � T� �CC� �	 D�
 F�� %�� � ��p� .� ��� ��� ��p� T��# �� � � �� ��C �  � �4 ��9 ��C � � � ���$ �  � ��1  � � � �  � �5 ��= ��C � � �  � � �1  � � � �� �$ � �  � �5 �� ��C �  � �4 ��: ��C � ��# � ���$ �  � ��1  � � � �  � �5 �� �� T� �� �� � � ��C� �7 �� T� �  �� �� %�� � ���� T� �� �� � T� �� � �� T� �# �� � �� T� �! �� �� T� �& �� �� ��C� �8 �� T� �% �� �� %�C� � 
��@	� B� � ��C �  � �9 �� ��C � �: �� ��C � �: �� ��C � �; �� ��C� �< �� U=  NBUTTON NSHIFT NXCOORD NYCOORD THIS BEFOREMOUSEDOWN
 DECLAREDLL LCWINDOWNAME LNSCALEMODE LNMINCOL LNMAXCOL LNMCOL1 LNMCOL2	 LNCOLUMNS LNLEFT	 LNOLDLEFT LNMIN OLDMCOL2 LLLOCKSCREEN LNMOUSEPOINTER LHDC LHMEMDC LHMEMBMP LHWND
 LNBMPWIDTH NLEFTOFFSET
 NTOPOFFSET
 OCONTAINER XWIDTH LCOLDFORMNAME
 LHMEMSPLIT THISFORM NAME	 SCALEMODE PARENT LEFT TOP
 LOCKSCREEN MOUSEPOINTER WIDTH	 PAGEWIDTH RANGEMIN RANGEMAX
 SHOWWINDOW HWND GS_SPLITGETWINDOW GS_SPLITGETDC GS_SPLITCREATECOMPATIBLEDC GS_SPLITCREATECOMPATIBLEBITMAP HEIGHT SELECTOBJECT WIN32API GS_SPLITSELECTOBJECT GS_SPLITBITBLT HIDECONTROLS SHOWCONTROLS SPLIT GS_SPLITRELEASEDC GS_SPLITDELETEOBJECT GS_SPLITDELETEDC AFTERMOUSEDOWN readme,     �� hidecontrols3     �� showcontrols%    �� split�    ��
 declaredll    �� Init�    �� Destroy�    ��	 MouseDown    ��1 �1 � � � B � U� � � B � B t�b� B B � �"�B �"�B �"�B B � 3 t �B B ��rB B 3 � 2 �� � B �2 �� �B �3 d�b�B B 5 4� � �q� q� B B 2��"bB B �BB �� "2� 4B B � BBB�B"B � B�BBRB B B � � DRR� B ""D���"�"�� � B bbB B B ��BB rB � � r$��$�B � B B � � B B� "B B $� � � � 2                       �        �  -  O   )   P  �  �   4   �  8  �   6   Y  c  �   =   ~    �   D   %  �  �   L     g7     )   �                       ���                              w�   %   W      \  �   �          �  U    U  X ��  � � %�C� ���' � T� ���� � �� � � � %�C�  ��� O��\ � T� ��  �� �q � T� �� �� � %�� � ��� �	 B�� �� � T� �C� � @�  ��- %�� � form � C� � visible��h	��0� %�� � ��,� � �	 �� �� T� �	 �� ��� �� T� � �-�� T� �� ��� � � H�A�D� �C� �
 pageframe ����� �� � �
 ��� T� �C �  � � � �� ��, �C� � form �
 container � page ����� �� � � ��� T� �C �  � � � �� ��. �C� � commandgroup � optiongroup ���D� �� � � �@� T� �C �  � � � �� �� � B�� ��� U  TOBJECT NINDEX LCOBJECTBASECLASS LOBJECT LTEMPOBJECT THISFORM THIS	 BASECLASS VISIBLE HIDDENCONTROLS PAGES HIDECONTROLS CONTROLS BUTTONS�  ��  � %�C� � �����$ � B� � �� ���(�C� � ����� �* %�C� THIS.hiddencontrols[i]b� O��� � T� � �� �� �a�� � �� � � ���� U  TOROOT THIS HIDDENCONTROLS I VISIBLE  ��C�  � �� U  THISFORM RESIZE�  %�C�9�  ��� O
��I �1 ��C� ___SplitterApi� SplitterAPI� � �9� �� �l � T�9�  � ��9�  � ��� � B�C�9�  ��� O�� U  ___SPLITTERAPI	 NEWOBJECT THIS CLASSLIBRARY
 NINSTANCES	 ��  � � � � �� � � � � �	 � ��
 � � � � � �� � �' �� � � � � � � � � � �� � � %��  ���� � B� � T� �� � �� T� � �C��]�� T� �� � �� T� �� � �� T� � ���� T� �� �  �� T� �C� ��]� �! �� T� �C� ��]� �" �� T� �C� ����& %�C� lnMRow1b� N� � � ���� T� � �� �� T� � �� �� B� � T� �� � �� %�� � �" ����� T� �� �" ���! ��,�� ��� � ��C� ���� � T� �� �# �� T� �� �$ �� T� �$ ���� T� �� �" �� %�C� � Height��h��`� T� �� �% �� ���# %�C� �  �
 PageHeight��h���� T� �� �  �& �� ��� T� �� �  �% �� � � H���^� �� �' � ���� T� �� �% ��� �� �' ���(� T� �C� �% �C� �' 8D�� �� �' ���^�" T� �C� �% �C� �' � 8D�� � H�o�
� �� �( � ���� T� �� � �% ��� �� �( �����! T� �C� � �% �� �( F�� �� �( ���
�% T� �C� � �% �� �( � F�� � %�� � ��C� T� � �� �� T� � �� �� B� � T�	 �� �� T� ��	 �� %�� �) ����� T� �� �* �� T� �C � ��+ �� T� �C � ��+ �� ��� T� �� �* �� � T� �C � �, �� T� �C � �- �� T� �� �% �� T� �C � � �/  � �. �� T� �C � � �/  � �. �� ��C �  � �0 ��= ��C � � � � �/  �  � � �! � � �� �  � �1 �� ��C �  � �0 ��= ��C � � � � �/  �  � � �! � � �� �  � �1 �� T� �# �a�� ��C � � �2 �� +�C���.� �� T�	 �C� ��� ��& %�C� lnMRow2b� N� �	 � ��E� .� � %��	 � ����! ��,�� ��� � ��C� ���� T�	 �� ��� � %��	 � � �% ����( ��,�� ��� � �% � ��C� ���� T�	 �� � �% �� � T�	 �CC�	 � D� F�� %�� �	 ��� .� �*� ��� ��� T��" �� �	 � �� ��C �  � �0 ��= ��C � ��! � � �� ��/ ��% � � � � �  � �1 ��= ��C � � � � �/  �  � � �! � �	 �� �  � �1 �� ��C �  � �0 ��: ��C � ��! � ��" � ��/ ��% � � � � �  � �1 �� �� T� ��	 �� � � ��C� �3 �� T� � �� �� %��	 � ��m� T�	 �� �� � T�
 ��	 � �� T� �" �� �
 �� T� � �� �� T� �$ �� �� ��C� �4 �� T� �# �� �� ��C �  � �5 �� ��C � �6 �� ��C � �6 �� ��C � �7 �� U8  NBUTTON NSHIFT NXCOORD NYCOORD LCWINDOWNAME LNSCALEMODE LNMINROW LNMAXROW LNMROW1 LNMROW2 LNROWS LNTOP LNOLDTOP LNMIN OLDMROW2 LLLOCKSCREEN LNMOUSEPOINTER LHDC LHMEMDC LHMEMBMP LHWND LNBMPHEIGHT NLEFTOFFSET
 NTOPOFFSET
 OCONTAINER XHEIGHT LCOLDFORMNAME
 LHMEMSPLIT THISFORM NAME	 SCALEMODE THIS PARENT LEFT TOP
 LOCKSCREEN MOUSEPOINTER HEIGHT
 PAGEHEIGHT RANGEMIN RANGEMAX
 SHOWWINDOW HWND GS_SPLITGETWINDOW GS_SPLITGETDC GS_SPLITCREATECOMPATIBLEDC GS_SPLITCREATECOMPATIBLEBITMAP WIDTH GS_SPLITSELECTOBJECT GS_SPLITBITBLT HIDECONTROLS SHOWCONTROLS SPLIT GS_SPLITRELEASEDC GS_SPLITDELETEOBJECT GS_SPLITDELETEDC� 6 %�C� _screen.___SplitterApib� O�	 C�9�  �
	��� � T�9�  � ��9�  � ��� %��9�  � � ��� � T�9�  � ���� ��C� ___SplitterApi�9� �� � � U  ___SPLITTERAPI
 NINSTANCES REMOVEOBJECT readme,     �� hidecontrols3     �� showcontrols%    �� split�    �� Init    ��	 MouseDown�    �� Destroy�    ��1 `1 � � � B � U� � � B � B t�b� B B � �"�B �"�B �"�B B � 3 t �B B ��rB B 3 � 2 �� �B 23 2�q� q� B B 2��"bB B �BB �� 22� 4B B � BBB�B"B � B�BBRB B B � � FQQ� B ""��"�"�� � B bbB B B ��BB rB � � r$��$�B � B B � � B B� $� � � 3 d�b�B B 3                       }        �  >  H   )   a  �  �   4   
  I  �   6   d  �  �   =   �  �4  �   �   �4  �6     )                          7rPROCEDURE readme
*!*	Splitter class
*!*	May 2004

*!*	Active-X controls always drive me nuts because they use there own windows handle.
*!*	You cannot put a fox native control over them to resize the control visually.
*!*	You have to use some tricks like changing the control to 
*!*	another one for this operation and rechange it back after.
*!*	( See the class browser code )

*!*	What I want is a splitter that can handle this in a visual way 
*!*	while keeping the form (look) unchanged until the end of the split.

*!*	After many try and fail, I have finally found a way to do it
*!*	by the use of API calls. IT WORK!!!
*!* Days of work to end with only a couple of code lines :)

*!*	I am not an API guru, so if you find a way to improve this class
*!*	feel free to let me know how :)

*!*	Tested with VFP 8-7 on Windows 2000 
*!*	(no animal other than the usual fox was used in the tests)
*!*	Disclaimer: (...) <- put the usual disclaimer here!

*!*	G�rald Santerre
*!*	gerald.santerre@siteintranet.qc.ca


*!*		USAGE:

*!*		Drop this class on a form or in a container between
*!*		objects that share the same container (form,page or container).

*!*	New release, complete redesing.
*!*	If you already use a previous version of the class, read this carefully. 
*!*	I have removed a couple of properties and change the way the classes work. 
*!*	For this reason I have also renamed the classlib to avoid conflicts 
*!*	with previous version of the class. The new design is cleaner and the control 
*!*	don't touch anything in the form (except hiding controls during split). 

*!*	A large part of the new design is from suggestions received 
*!*	from "Jarom�r Stacha" from Czech Republic. 
*!*		Thank you Jaromir :). 

*!*	The new splitter classes don't move or resize controls anymore. 
*!*	The splitter.split() method is always called after a split operation 
*!*	and you have to resize/reposition your controls from this (fake)event. 
*!*	If you don't put code in the split() method, the form.resize() event 
*!*	of the form will be called. See the resize() and splitter1.split() 
*!*	method of the demo form for a working sample.

*!*	You have only 2 properties to set in the class, 
*!*	RangeMin and RangeMax. 
*!*	If you set the value of this properties between 0 and 1, 
*!*	the value is handled as a % of the splitter's parent container width ot height. 
*!*	For example, if you enter 0.2 as value for RangeMin, 
*!*	you will be able to move the splitter down to 20% of the width/height 
*!*	of the splitter's parent container. 
*!*	Values greater than 1 will be handle as absolute values. 
*!*	Don't forget to reset absolute values when the splitter's parent container is resized.

*!*	The splitter API is now self contained and you dont have 
*!*	to worry about releasing the references to API functions. 
*!*	The splitter now also handle correctly multiple instances 
*!*	of the same form (or forms with the same name). 
*!*	The splitter automatically hide every controls that are in 
*!*	the same parent container (recursive) to avoid side effects 
*!*	(like mouse cursor beam over text boxes).

*!*	Contact: gerald.santerre@siteintranet.qc.ca







ENDPROC
PROCEDURE hidecontrols

* hide all controls include ActiveX with property visible inside container tObject
* without this splitter and form
*-----------------------------------------------------------------------------------
LPARAMETERS tObject,nIndex

*	tObject is root object, if not passed, thisform is used
*-----------------------------------------------------------
IF EMPTY(nIndex)

  nIndex = 2

ENDIF

LOCAL lcObjectBaseClass, lObject, lTempObject

* build collection hidden object for reverse setting in showcontrols
* set valid object
*----------------------------------------------------------------------------
IF VARTYPE(tObject) = "O"

  lObject = tObject

ELSE

  lObject = THISFORM

ENDIF

* ignore this splitter
*------------------------
IF lObject = THIS

  RETURN nIndex

ENDIF

* unify
*--------------------
lcObjectBaseClass = LOWER(lObject.BASECLASS) + " " && " " for unique (page # pageframe)

* do not hide form window
*--------------------------------
IF lcObjectBaseClass # "form " AND PEMSTATUS(lObject, "visible", 5)

  IF lObject.VISIBLE

    DIMENSION THIS.HiddenControls[nIndex]

    THIS.hiddencontrols[nIndex] = lObject

    lObject.VISIBLE = .F.

    nIndex = nIndex + 1

  ENDIF

ENDIF

* recurse for all children
*------------------------------
DO CASE

  CASE INLIST(lcObjectBaseClass,"pageframe ")

    FOR EACH lTempObject IN lObject.PAGES

      nIndex=THIS.hidecontrols(lTempObject, nIndex)

    ENDFOR

  CASE INLIST(lcObjectBaseClass,"form ","container ","page ")

    FOR EACH lTempObject IN lObject.CONTROLS

      nIndex=THIS.hidecontrols(lTempObject, nIndex)

    ENDFOR

  CASE INLIST(lcObjectBaseClass,"commandgroup ","optiongroup ")

    FOR EACH lTempObject IN lObject.BUTTONS

      nIndex=THIS.hidecontrols(lTempObject, nIndex)

    ENDFOR

ENDCASE

RETURN nIndex+1

ENDPROC
PROCEDURE showcontrols

* show temporary hidden objects and clear list (collection)
*--------------------------------------------------------------
LPARAMETERS toRoot

IF ALEN(THIS.hiddencontrols,1) < 2

  RETURN

ENDIF

FOR i = 2 TO ALEN(THIS.hiddencontrols, 1)

  IF TYPE("THIS.hiddencontrols[i]")="O"

    THIS.hiddencontrols[i].VISIBLE = .T.

  ENDIF

ENDFOR

DIMENSION THIS.hiddencontrols[1]

ENDPROC
PROCEDURE split

*default behaviour
*----------------------
THISFORM.RESIZE()
ENDPROC
PROCEDURE declaredll

IF !VARTYPE(_SCREEN.___SplitterApi) = "O"
  
  _SCREEN.NEWOBJECT("___SplitterApi", "SplitterAPI", THIS.CLASSLIBRARY)
  
ELSE 

  _SCREEN.___SplitterApi.DeclareDll()

ENDIF

RETURN VARTYPE(_SCREEN.___SplitterApi) == "O" AND !ISNULL(_SCREEN.___SplitterApi)
ENDPROC
PROCEDURE Init

* API FUNCTIONS - declare only one for all splitter with this class
*--------------------------------------------------------------------
IF !VARTYPE(_SCREEN.___SplitterApi) = "O"

  *!*	  IF AT(UPPER((THIS.CLASSLIBRARY)),UPPER(SET("Classlib")))=0

  *!*	    SET CLASSLIB TO (THIS.CLASSLIBRARY) ADDITIVE

  *!*	  ENDIF

  *!*	  _SCREEN.ADDOBJECT("___SplitterApi","SplitterAPI")
  
  _SCREEN.NEWOBJECT("___SplitterApi", "SplitterAPI", THIS.CLASSLIBRARY)

ELSE

  _SCREEN.___SplitterApi.nInstances = _SCREEN.___SplitterApi.nInstances + 1

ENDIF

RETURN VARTYPE(_SCREEN.___SplitterApi) == "O" AND !ISNULL(_SCREEN.___SplitterApi)

ENDPROC
PROCEDURE Destroy

* decrement instance counter, if 0 release object (this.release Dlls)
*-------------------------------------------------------------------------
IF TYPE("_screen.___SplitterApi")="O" AND !ISNULL(_SCREEN.___SplitterApi)

  _SCREEN.___SplitterApi.nInstances = _SCREEN.___SplitterApi.nInstances - 1

  IF _SCREEN.___SplitterApi.nInstances <= 0

    _SCREEN.___SplitterApi.nInstances = NULL

    _SCREEN.REMOVEOBJECT("___SplitterApi")

  ENDIF
  
ENDIF



ENDPROC
PROCEDURE MouseDown

#DEFINE SRCCOPY		13369376

LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.BeforeMouseDown()

THIS.DeclareDll()

LOCAL lcWindowName,lnScaleMode,lnMinCol,lnMaxCol,lnMCol1,lnMCol2
LOCAL lnColumns,lnLeft,lnOldLeft,lnMin,oldMCol2
LOCAL llLockScreen,lnMousePointer
LOCAL lhDC,lhMemDC,lhMemBmp,lHWnd,lnBmpWidth,nLeftOffset,nTopOffset,oContainer,xWidth
LOCAL lcOldFormName,lhMemSplit

IF nButton # 1

	RETURN
	
ENDIF

lcOldFormName = THISFORM.NAME

THISFORM.NAME = SYS(2015)

lcWindowName = THISFORM.NAME

lnScaleMode = THISFORM.SCALEMODE

THISFORM.SCALEMODE = 3  && pixels

oContainer = THIS.PARENT

nLeftOffset = OBJTOCLIENT(THIS, 2) - THIS.LEFT

nTopOffset = OBJTOCLIENT(THIS, 1) - THIS.TOP

lnMCol1 = MCOL(lcWindowName, 3)

IF TYPE("lnMCol1") # "N" OR lnMCol1 <= 0

	THISFORM.SCALEMODE = lnScaleMode
	
	THISFORM.NAME = lcOldFormName
	
	RETURN
	
ENDIF

lnMCol1 = lnMCol1 - nLeftOffset

IF lnMCol1 <> THIS.LEFT + 1

	lnMCol1 = THIS.LEFT + 1
	
	MOUSE AT MROW(lcWindowName, 3), lnMCol1 + nLeftOffset PIXELS WINDOW (lcWindowName)
	
ENDIF

* set some vars
*-------------------
llLockScreen			=	THISFORM.LOCKSCREEN

lnMousePointer			=	THISFORM.MOUSEPOINTER

THISFORM.MOUSEPOINTER	=	9

lnLeft					=	THIS.LEFT

* check two parent level for width - suppose that parent form always present
*----------------------------------------------------------------------------
IF PEMSTATUS(oContainer, "Width", 5)

	xWidth	=	oContainer.WIDTH
	
ELSE

	IF PEMSTATUS(oContainer.PARENT,"PageWidth",5)
	
		xWidth	=	oContainer.PARENT.PAGEWIDTH
		
	ELSE
	
		* if error that oContainer.width and oContainer.parent.width not exist, something wrong
		*----------------------------------------------------------------------------------------
		xWidth	=	oContainer.PARENT.WIDTH
		
	ENDIF
	
ENDIF

* RangeMin (RangeMax) < 1
* 		RangeMin (RangeMax) are used as coeficient (%/100)
* RangeMin (RangeMax) > 1
*		RangeMin (RangeMax) are used as absolute offset in pixels
* RangeMin (RangeMax) =0
*		RangeMin (RangeMax) are ignored - let 2 times this.width

DO CASE

	CASE THIS.RangeMin <= 0
	
		lnMinCol = THIS.WIDTH*2
		
	CASE THIS.RangeMin > 1
	
		lnMinCol = MAX(THIS.WIDTH*2, INT(THIS.RangeMin))
		
	CASE THIS.RangeMin < 1
	
		lnMinCol = MAX(THIS.WIDTH * 2, INT(THIS.RangeMin * xWidth))
		
ENDCASE

DO CASE

	CASE THIS.RangeMax <= 0
	
		lnMaxCol = xWidth - (THIS.WIDTH * 3)
		
	CASE THIS.RangeMax > 1
	
		lnMaxCol = MIN(xWidth - (THIS.WIDTH*3), THIS.RangeMax)
		
	CASE THIS.RangeMax < 1
	
		lnMaxCol = MIN(xWidth - (THIS.WIDTH*3), THIS.RangeMax * xWidth)
		
ENDCASE

IF lnMinCol > lnMaxCol

	* nothing to move!!!
	*------------------------------
	THISFORM.SCALEMODE = lnScaleMode
	
	THISFORM.NAME = lcOldFormName
	
	RETURN
	
ENDIF

lnMCol2 = lnMCol1

oldMCol2 = lnMCol2

* API CALLS
*-----------------------------
IF THISFORM.SHOWWINDOW = 2

	* workaround, when showwindow=2 the handle is not the right one...
	* worst if you have a toolbar!
	*--------------------------------------------------------------------
	*#define GW_HWNDFIRST        0
	#define GW_HWNDLAST         1
	*#define GW_HWNDNEXT         2
	*#define GW_HWNDPREV         3
	*#define GW_OWNER            4
	#define GW_CHILD            5

	lHWnd=THISFORM.HWND
	
	lHWnd = GS_SplitGetWindow(lHWnd, GW_CHILD)
	
	lHWnd = GS_SplitGetWindow(lHWnd, GW_HWNDLAST)
	
ELSE
	lHWnd = THISFORM.HWND
	
ENDIF

lhDC = GS_SplitGetDC(lHWnd)

lhMemDC = GS_SplitCreateCompatibleDC(lhDC)

* Take a copy of the portion of the form that can be dragged over
*-------------------------------------------------------------------
lnBmpWidth = THIS.WIDTH + 1

lhMemBmp = GS_SplitCreateCompatibleBitmap(lhDC, lnBmpWidth, THIS.HEIGHT)

lhMemSplit = GS_SplitCreateCompatibleBitmap(lhDC, lnBmpWidth, THIS.HEIGHT)

DECLARE LONG SelectObject IN Win32API AS GS_SplitSelectObject  LONG hdc, LONG hObject

= GS_SplitSelectObject(lhMemDC , lhMemBmp)

= GS_SplitBitBlt(lhMemDC, 0, 0, lnBmpWidth, THIS.HEIGHT, ;
	lhDC, lnMCol1 + nLeftOffset - 2, THIS.TOP + nTopOffset, SRCCOPY)
	
= GS_SplitSelectObject(lhMemDC , lhMemSplit)

= GS_SplitBitBlt(lhMemDC, 0, 0, lnBmpWidth, THIS.HEIGHT, ;
	lhDC, lnMCol1 + nLeftOffset - 1, THIS.TOP + nTopOffset, SRCCOPY)
	

* Stop fox drawing in the screen
*--------------------------------
THISFORM.LOCKSCREEN = .T.

THIS.hidecontrols(oContainer)

* update the display while dragging
*-----------------------------------
DO WHILE MDOWN()

	DOEVENTS
	
	lnMCol2 = MCOL(lcWindowName, 3) - nLeftOffset
	
	IF TYPE("lnMCol2") # "N" OR lnMCol2 = 0
	
		LOOP
		
	ENDIF
	
	IF lnMCol2<=lnMinCol
	
		*force the mouse to stay at this position
		*--------------------------------------------------------------------------------
		MOUSE AT MROW(lcWindowName, 3), lnMinCol+nLeftOffset PIXELS WINDOW (lcWindowName)
		
		lnMCol2 = lnMinCol + 1
		
	ENDIF
	
	IF lnMCol2 >= (lnMaxCol - THIS.WIDTH)
	
		*force the mouse to stay at this position
		*----------------------------------------------
		MOUSE AT MROW(lcWindowName,3), lnMaxCol - THIS.WIDTH+nLeftOffset + 1 PIXELS WINDOW (lcWindowName)
		
		lnMCol2 = lnMaxCol - THIS.WIDTH
		
	ENDIF
	
	lnMCol2 = MIN(MAX(lnMCol2, lnMinCol), lnMaxCol)
	
	IF oldMCol2 = lnMCol2
	
		LOOP
		
	ELSE
	
		* on mouse move, redraw a part of the screen from the memory copy
		* and draw "this" image at the mouse position
		* bitblt (dest...source...)
		*------------------------------------------------------------------
		WITH THIS
		
			.LEFT=lnLeft+(lnMCol2 - lnMCol1)
			
			*restore
			*-------------------------------------------
			= GS_SplitSelectObject(lhMemDC , lhMemBmp)
			
			= GS_SplitBitBlt(lhDC, oldMCol2+nLeftOffset - 2, .TOP+nTopOffset, lnBmpWidth, .HEIGHT,;
				lhMemDC, 0, 0,  SRCCOPY)
				
			*take a new copy
			*-------------------------------------------------------------
			= GS_SplitBitBlt(lhMemDC, 0, 0, lnBmpWidth, THIS.HEIGHT, ;
				lhDC, lnMCol2 + nLeftOffset - 2, THIS.TOP + nTopOffset, SRCCOPY)
				
			*draw the bar
			*--------------------------------------------
			= GS_SplitSelectObject(lhMemDC , lhMemSplit)
			
			= GS_SplitBitBlt(lhDC, .LEFT + nLeftOffset-1, .TOP + nTopOffset, lnBmpWidth, .HEIGHT,;
				lhMemDC, 0, 0,  SRCCOPY)
				
		ENDWITH
		
		oldMCol2 = lnMCol2
		
	ENDIF
	
ENDDO

THIS.showcontrols()

THISFORM.NAME = lcOldFormName

IF lnMCol2<0

	lnMCol2=lnMCol1
	
ENDIF

lnColumns=lnMCol2-lnMCol1

THIS.LEFT=lnLeft + lnColumns

THISFORM.SCALEMODE=lnScaleMode

THISFORM.MOUSEPOINTER=lnMousePointer

This.Split()

THISFORM.LOCKSCREEN=llLockScreen

IF !THIS.DeclareDll()

  RETURN

ENDIF 

* free the memory
*--------------------------------
= GS_SplitReleaseDC(lHWnd, lhDC)
= GS_SplitDeleteObject(lhMemBmp)
= GS_SplitDeleteObject(lhMemSplit)
= GS_SplitDeleteDC(lhMemDC)

THIS.AfterMouseDown()

ENDPROC
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 942183505�      �  �      �      T  :9                  �7                           WINDOWS _1TP0L3VWK 915585572�7      �7  �7  �7  r7                                                           WINDOWS _1TP0L3VWK 915607707]7      H7  87  +7  Z8      Q6  �$                                               WINDOWS _2140ISJXN 915586908B6      36  $6  6  �5                                                           WINDOWS _1TP0L3VWK 915585572�5      �5  |5  o5  5                                                           WINDOWS _1TP0L3VWK 9155855725      �4  �4  �4  �4                                                           WINDOWS _22B00X25T 9155855724      r4  d4  W4   4                                                           WINDOWS _22B04JZC8 915585572�3      �3  �3  �3  s3                                                           WINDOWS _22B07J6QE 915585572f3      Y3  K3  >3  �2                                                           WINDOWS _22D0MQ1VH 915607776�2      �2  �2  �2  �1                                                           WINDOWS _1TP0L3VWK 915586908�1      �1  �1  �1  /1                                                           WINDOWS _1TP0L3VWK 915585572"1      1  1  �0  ;0                                                           WINDOWS _22D0N4H65 915585572.0      !0  0  0  F/                                                           WINDOWS _22D0N4H66 9155855729/      ,/  /  /  Q.                                                           WINDOWS _22D0N4H67 915585572D.      7.  ).  .  \-                                                           WINDOWS _22D0N4H68 915585572O-      B-  4-  '-  f,                                                           WINDOWS _22D0N4H69 915585572Y,      L,  >,  1,  p+                                                           WINDOWS _22D0N4H6A 915607776[+      F+  6+  )+  ]*       *  �#                                               WINDOWS _22D0O4W9P 915586908*      *  �)  �)  �(                                                           WINDOWS _22D0UWIYS 915607776�(      �(  ~(  q(  (                                                           WINDOWS _1TP0L3VWK 915625091(      �'  �'  �'  X'                                                           WINDOWS _22E0MPZMK 915625091H'      8'  &'  '  �&                                                           COMMENT RESERVED                                I&                                                            M=                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     QHeight = 615
Width = 882
ShowWindow = 2
DoCreate = .T.
AutoCenter = .T.
Caption = "Stream Testing"
WindowState = 0
_memberdata =      682<?xml version="1.0" standalone="yes"?>
<VFPData>
	<memberdata name="foomethod" type="method" display="fooMethod" favorites="True"/>
	<memberdata name="Form1" type="property" display="Form1" favorites="True"/>
	<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>
	<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>
	<memberdata name="error" type="method" display="eRRor" favorites="True"/>
	<memberdata name="processimage" type="method" display="ProcessImage"/><memberdata name="showmemory" type="method" display="ShowMemory"/><memberdata name="hideobjects" type="method" display="HideObjects"/></VFPData>

Name = "Form1"
     �PROCEDURE processimage
LOCAL lcFile, llProgress, lnTimes, n, lcBuffer, lnSecs
lcFile = Thisform.txtFile.Value
IF EMPTY(lcFile)
	RETURN
ENDIF

Thisform.HideObjects()
llProgress = Thisform.ChkProgress.Value
lnTimes = Thisform.SpnTests.Value

LOCAL loBmp AS xfcBitmap
LOCAL loBmp2 AS xfcBitmap
LOCAL loImgFormat AS xfcImageFormat
loImgFormat = EVALUATE("_Screen.System.Drawing.Imaging." + Thisform.Combo1.Value)


WITH _SCREEN.System.Drawing

* Sample 1 - Using GetPictureVal new function
lnSecs = SECONDS()
Thisform.Image1.Visible = .T.
FOR n = 1 TO lnTimes
	loBmp = .Bitmap.FromFile(lcFile)
	lcBuffer = loBmp.GetPictureVal(loImgFormat)
	Thisform.Image1.PictureVal = lcBuffer

	IF llProgress
		WAIT WINDOW ("Test 1 - Using GetPictureVal Function - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
	ENDIF 
ENDFOR
loBmp.Dispose()
lcBuffer = NULL
Thisform.Label1.Caption = "Test 1 - Using GetPictureVal new function" + ;
	CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
Thisform.Label1.Visible = .T.


* Sample 2 - Saving directly to the image object
lnSecs = SECONDS()
Thisform.Image2.Visible = .T.
FOR n = 1 TO lnTimes
	loBmp = .Bitmap.FromFile(lcFile)
	loBmp.Save(Thisform.Image2, loImgFormat) && Save directly to the image object
	IF llProgress
		WAIT WINDOW ("Test 2 - SAVE TO IMAGE FILE - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
	ENDIF 
ENDFOR
loBmp.Dispose()
Thisform.Label2.Caption = "Test 2 - Saving directly to the image object" + ;
	CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
Thisform.Label2.Visible = .T.


* Sample 3 - Saving to a stream and retrieving to PictureVal
lnSecs = SECONDS()
Thisform.Image3.Visible = .T.
FOR n = 1 TO lnTimes
	LOCAL loStream as xfcMemoryStream
	loStream = _Screen.System.IO.MemoryStream.New()
	loBmp = .Bitmap.FromFile(lcFile)
	loBmp.Save(loStream, loImgFormat) && Save directly to the Stream object
	Thisform.Image3.PictureVal = loStream.GetBuffer()
	IF llProgress
		WAIT WINDOW ("Test 3 - SAVE TO IMAGE FILE - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
	ENDIF
	
ENDFOR
loStream = NULL
loBmp.Dispose()
Thisform.Label3.Caption = "Test 3 - Saving to a stream and retrieving to PictureVal" + ;
	CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
Thisform.Label3.Visible = .T.


* Sample 4 - Saving to a stream, loading from stream and use GetPictureVal
lnSecs = SECONDS()
Thisform.Image4.Visible = .T.
FOR n = 1 TO lnTimes
	LOCAL loStream as xfcMemoryStream
	loStream = _Screen.System.IO.MemoryStream.New()
	loBmp = .Bitmap.FromFile(lcFile)
	loBmp.Save(loStream, loImgFormat) && Save directly to the Stream object

	LOCAL loBmp2 as xfcBitmap
	loBmp2 = _Screen.System.Drawing.Bitmap.FromStream(loStream)	
	Thisform.Image4.PictureVal = loBmp2.GetPictureVal(loImgFormat)

	IF llProgress
		WAIT WINDOW ("Test 4 - Saving to a stream, loading from stream and use GetPictureVal - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
	ENDIF 
ENDFOR
loBmp.Dispose()
loBmp2.Dispose()
loStream = NULL
Thisform.Label4.Caption = "Test 4 - Saving to a stream, loading from stream and use GetPictureVal" + ;
	CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
Thisform.Label4.Visible = .T.


* Sample 5 - Using GetPictureValfromHBitmap new function
lnSecs = SECONDS()
Thisform.Image5.Visible = .T.
FOR n = 1 TO lnTimes
	loBmp = .Bitmap.FromFile(lcFile)
	lcBuffer = loBmp.GetPictureValfromHBitmap()
	Thisform.Image5.PictureVal = lcBuffer
	IF llProgress
		WAIT WINDOW ("Test 5 - Using GetPictureValfromHBitmap Function - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
	ENDIF 
ENDFOR
loBmp.Dispose()
lcBuffer = NULL
Thisform.Label5.Caption = "Test 5 - GetPictureValfromHBitmap new function" + ;
	CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
Thisform.Label5.Visible = .T.


* Sample 6 - Using Calvin Hsia Active-X wrapper
* See this article: "Use an IStream object to avoid disk access"
* http://blogs.msdn.com/calvin_hsia/archive/2006/02/17/534529.aspx
* The COM server is a light weight 39K dll, that wraps the ISTREAM class
* This test will be able to compare the performance between all different aproaches

* To Unregister this Active-X, run the code below:
* RUN /N REGSVR32 /u vfpStream.dll

LOCAL llRunTest
llRunTest = Thisform.chkIStream.Value

DO WHILE llRunTest

	LOCAL loStream as "VFPStream.Cstream"

	TRY 
		loStream = CREATEOBJECT("VFPStream.Cstream")
	CATCH 
		IF MESSAGEBOX("Calvin Hsia's VFPStream class is not installed or registered" + CHR(13) + ;
				"The COM server is a light weight 39K dll, that wraps the ISTREAM class" + CHR(13) + ; 
				"Do you want to install this Active-X now ?", 32 + 4, "Install VFP Stream Active-X ?") = 6
			LOCAL lcStreamFile, lcCommand
			lcStreamFile = LOCFILE("..\Samples\vfpStream.dll")
			lcCommand = "RUN /N REGSVR32 /S " + lcStreamFile
			&lcCommand
	
			TRY 
				loStream = CREATEOBJECT("VFPStream.Cstream")
			CATCH 
				MESSAGEBOX("Could not install the IStream class", 16, "Error")
				llRunTest = .F.
			ENDTRY
		ELSE
			llRunTest = .F.
		ENDIF
	ENDTRY 
	IF llRunTest = .F.
		EXIT
	ENDIF 

	lnSecs = SECONDS()
	Thisform.Image6.Visible = .T.

	FOR n = 1 TO lnTimes
		loBmp = .Bitmap.FromFile(lcFile)

		* Create a Stream Object
		* Write to a stream: avoid the file I/O
		loStream = CREATEOBJECT("VFPStream.Cstream")
		m.lhStream = loStream.CreateStream(1)  && Create a Stream

		loBmp.Save(m.lhStream, loImgFormat) && Pass the stream handle to Save method
	
		lcBuffer = ""
		loStream.ReadStream(m.lhStream,"lcBuffer",0)    && Read stream into blob field directly
		loStream.ReleaseStream(m.lhStream)

		* Now pass the variable that contains the Image to the PictureVal property of
		* a picture Image, which was never written to disk
		Thisform.Image6.PictureVal = lcBuffer
		IF llProgress
			WAIT WINDOW ("Test 6 - USING CALVIN'S ACTIVE-X WRAPPER - " + TRANSFORM((n/lnTimes)*100, "999.9") + "%") NOWAIT 
		ENDIF 
	ENDFOR
	loBmp.Dispose()
	loStream = NULL
	lcBuffer = NULL
	Thisform.Label6.Caption = "Test 6 - Using Calvin Hsia Active-X wrapper" + ;
		CHR(13) + TRANSFORM(SECONDS() - lnSecs) + " seconds"
	Thisform.Label6.Visible = .T.

	EXIT 
ENDDO 

WAIT CLEAR 

ENDWITH

RETURN
ENDPROC
PROCEDURE hideobjects
WITH Thisform as Form
	.Label2.Visible = .F.	
	.Label3.Visible = .F.
	.Label4.Visible = .F.
	.Label5.Visible = .F.
	.Label6.Visible = .F.

	.Image2.Visible = .F.	
	.Image3.Visible = .F.
	.Image4.Visible = .F.
	.Image5.Visible = .F.
	.Image6.Visible = .F.
ENDWITH
ENDPROC
PROCEDURE Init
DO (LOCFILE("System.app"))


LOCAL lcFile
lcFile = LOCFILE("Cebolinha.png")
Thisform.TxtFile.Value = lcFile
Thisform.Image1.Picture = lcFile
Thisform.HideObjects()

WITH Thisform.Combo1 as ComboBox 
	.AddItem("ImageFormat.Bmp")
	.AddItem("\ImageFormat.Png")
	.AddItem("ImageFormat.Jpeg")
	.AddItem("ImageFormat.Gif")
	.AddItem("ImageFormat.Tiff")
	.Value = "ImageFormat.Bmp"
ENDWITH

ENDPROC
      ����    �   �                         6v   %   X       m      g           �  U    ��C�  � �� U  THISFORM PROCESSIMAGE Click,     ��1 � 2                       *       )   �                        n���    U  U                        ��   %   �         
   �           �  U  m  T�  �C��� %�C�  ���  � B� � ��C� � �� T� � � ��  �� T� � � ��  �� T� � � ��  �� U  LCFILE THISFORM HIDEOBJECTS TXTFILE VALUE IMAGE1
 PICTUREVAL PICTURE Click,     ��1 � � A A � 2112                       �       )   U                        BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
      ~Top = 29
Left = 760
Height = 17
Width = 106
Alignment = 0
Caption = "IStream ActiveX"
Value = .F.
Name = "chkIStream"
      Form1      
chkIStream      checkbox      checkbox      }Top = 10
Left = 760
Height = 17
Width = 108
Alignment = 0
Caption = "Show Progress"
Value = .T.
Name = "chkProgress"
      Form1      chkProgress      checkbox      checkbox      LHeight = 24
Left = 600
Style = 2
Top = 48
Width = 144
Name = "Combo1"
      Form1      Combo1      combobox      combobox     7AutoSize = .T.
FontSize = 11
WordWrap = .T.
Caption = "Select a picture, enter the number of tests in the spinner, and click 'GO' to perform test using different techniques to obtain PictureVal without accessing the disk."
Height = 36
Left = 12
Top = 4
Width = 562
ForeColor = 0,0,160
Name = "Label7"
      Form1      Label7      label      label      5PROCEDURE Click
Thisform.ProcessImage()

ENDPROC
      �Top = 48
Left = 792
Height = 25
Width = 72
Anchor = 12
Picture = ..\gdiplusx_20070831\new samples\
Caption = "Go !"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command1"
      Form1      Command1      commandbutton      commandbutton      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 36
Left = 588
Top = 348
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label6"
      Form1      Label6      label      label      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 36
Left = 300
Top = 348
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label5"
      Form1      Label5      label      label      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 48
Left = 12
Top = 348
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label4"
      Form1      Label4      label      label      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 48
Left = 588
Top = 84
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label3"
      Form1      Label3      label      label      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 36
Left = 300
Top = 84
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label2"
      Form1      Label2      label      label      �AutoSize = .F.
FontBold = .T.
WordWrap = .T.
Caption = "Test Result"
Height = 36
Left = 12
Top = 84
Width = 276
ForeColor = 255,0,0
BackColor = 255,255,255
Name = "Label1"
      Form1      Label1      label      label      jBackStyle = 0
Caption = "Nr of Tests"
Height = 17
Left = 600
Top = 12
Width = 72
Name = "lblTests"
      Form1      lblTests      label      label      �Height = 24
Increment =   5.00
KeyboardHighValue = 10000
KeyboardLowValue = 1
Left = 684
SpinnerHighValue = 10000.00
SpinnerLowValue =   1.00
Top = 12
Width = 60
Value = 200
Name = "SpnTests"
      Form1      SpnTests      spinner      spinner      PStretch = 1
Height = 252
Left = 588
Top = 348
Width = 276
Name = "Image6"
      Form1      Image6      image      image      PStretch = 1
Height = 252
Left = 300
Top = 348
Width = 276
Name = "Image5"
      Form1      Image5      image      image      OStretch = 1
Height = 252
Left = 12
Top = 348
Width = 276
Name = "Image4"
      Form1      Image4      image      image      OStretch = 1
Height = 252
Left = 588
Top = 84
Width = 276
Name = "Image3"
      Form1      Image3      image      image      OStretch = 1
Height = 252
Left = 300
Top = 84
Width = 276
Name = "Image2"
      Form1      Image2      image      image      kFontSize = 8
Anchor = 12
Height = 25
Left = 108
TabIndex = 2
Top = 48
Width = 468
Name = "txtFile"
      Form1      txtFile      textbox      textbox      �PROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

Thisform.HideObjects()

Thisform.TxtFile.Value = lcFile
Thisform.Image1.PictureVal = ""
Thisform.Image1.Picture = lcFile

ENDPROC
      Form1      Command3      commandbutton      commandbutton      NStretch = 1
Height = 252
Left = 12
Top = 84
Width = 276
Name = "Image1"
      Form1      Image1      image      image      U_memberdata XML Metadata for customizable properties
*processimage 
*hideobjects 
      �Top = 48
Left = 12
Height = 25
Width = 84
Anchor = 12
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
     ����    �  �                        �R   %   �      y  �   )          �  U   ��  � � � � � � T�  �� � � �� %�C�  ���A � B� � ��C� �	 �� T� �� �
 � �� T� �� � � �� �� Q�	 XFCBITMAP� �� Q�	 XFCBITMAP� �� Q� XFCIMAGEFORMAT�8 T� �C� _Screen.System.Drawing.Imaging.� � � ��� ���9� � ���� T� �C��� T� � � �a�� �� ���(�� ���� T� �C �  �� � �� T� �C � � � �� T� � � �� �� %�� ����P R,:��( Test 1 - Using GetPictureVal Function - C� � �d� 999.9_� %�� � �� ��C� � �� T� ����W T� � � ��) Test 1 - Using GetPictureVal new functionC� CC�� _�  seconds�� T� � � �a�� T� �C��� T� � � �a�� �� ���(�� ��� T� �C �  �� � �� ��C� �  � � � �� %�� ���F R,:�� Test 2 - SAVE TO IMAGE FILE - C� � �d� 999.9_� %�� � �� ��C� � ��Z T� � � ��, Test 2 - Saving directly to the image objectC� CC�� _�  seconds�� T� � � �a�� T� �C��� T� � � �a�� �� ���(�� ���� �� Q� XFCMEMORYSTREAM� T� �C�9� �  �! �" �� T� �C �  �� � �� ��C �  � � � �� T� � � �C� �# �� %�� ����F R,:�� Test 3 - SAVE TO IMAGE FILE - C� � �d� 999.9_� %�� � �� T� ���� ��C� � ��f T� �$ � ��8 Test 3 - Saving to a stream and retrieving to PictureValC� CC�� _�  seconds�� T� �$ � �a�� T� �C��� T� �% � �a�� �� ���(�� ���� �� Q� XFCMEMORYSTREAM� T� �C�9� �  �! �" �� T� �C �  �� � �� ��C �  � � � �� �� Q�	 XFCBITMAP� T� �C � �9� � � �& �� T� �% � �C � � � �� %�� ��}�q R,:��I Test 4 - Saving to a stream, loading from stream and use GetPictureVal - C� � �d� 999.9_� %�� � �� ��C� � �� ��C� � �� T� ����t T� �' � ��F Test 4 - Saving to a stream, loading from stream and use GetPictureValC� CC�� _�  seconds�� T� �' � �a�� T� �C��� T� �( � �a�� �� ���(�� ��	� T� �C �  �� � �� T� �C� �) �� T� �( � �� �� %�� ���[ R,:��3 Test 5 - Using GetPictureValfromHBitmap Function - C� � �d� 999.9_� %�� � �� ��C� � �� T� ����\ T� �* � ��. Test 5 - GetPictureValfromHBitmap new functionC� CC�� _�  seconds�� T� �* � �a�� ��+ � T�+ �� �, � �� +��+ ���� �� Q� VFPStream.Cstream� ����! T� �C� VFPStream.Cstream�N�� ���
�� %�C�< Calvin Hsia's VFPStream class is not installed or registeredC� �F The COM server is a light weight 39K dll, that wraps the ISTREAM classC� �* Do you want to install this Active-X now ?�$� Install VFP Stream Active-X ?�x����
� ��- �. �( T�- �C� ..\Samples\vfpStream.dll���$ T�. �� RUN /N REGSVR32 /S �- �� &lcCommand
 ���
�! T� �C� VFPStream.Cstream�N�� ���
�: ��C�# Could not install the IStream class�� Error�x�� T�+ �-�� �� ��
� T�+ �-�� � �� %��+ -��� !� � T� �C��� T� �/ � �a�� �� ���(�� ��_� T� �C �  �� � ��! T� �C� VFPStream.Cstream�N�� T��0 �C�� �1 �� ��C ��0  � � � �� T� ��  ��! ��C ��0 � lcBuffer� � �2 �� ��C ��0 � �3 �� T� �/ � �� �� %�� ��[�S R,:��+ Test 6 - USING CALVIN'S ACTIVE-X WRAPPER - C� � �d� 999.9_� %�� � �� ��C� � �� T� ���� T� ����Y T� �4 � ��+ Test 6 - Using Calvin Hsia Active-X wrapperC� CC�� _�  seconds�� T� �4 � �a�� !� � R� �� B� U5  LCFILE
 LLPROGRESS LNTIMES N LCBUFFER LNSECS THISFORM TXTFILE VALUE HIDEOBJECTS CHKPROGRESS SPNTESTS LOBMP LOBMP2 LOIMGFORMAT COMBO1 SYSTEM DRAWING IMAGE1 VISIBLE BITMAP FROMFILE GETPICTUREVAL
 PICTUREVAL DISPOSE LABEL1 CAPTION IMAGE2 SAVE LABEL2 IMAGE3 LOSTREAM IO MEMORYSTREAM NEW	 GETBUFFER LABEL3 IMAGE4
 FROMSTREAM LABEL4 IMAGE5 GETPICTUREVALFROMHBITMAP LABEL5	 LLRUNTEST
 CHKISTREAM LCSTREAMFILE	 LCCOMMAND IMAGE6 LHSTREAM CREATESTREAM
 READSTREAM RELEASESTREAM LABEL6�  ���  �Q� FORM�� � T�� � �-�� T�� � �-�� T�� � �-�� T�� � �-�� T�� � �-�� T�� � �-�� T�� � �-�� T��	 � �-�� T��
 � �-�� T�� � �-�� �� U  THISFORM LABEL2 VISIBLE LABEL3 LABEL4 LABEL5 LABEL6 IMAGE2 IMAGE3 IMAGE4 IMAGE5 IMAGE6B �C�
 System.app��� ��  � T�  �C� Cebolinha.png��� T� � � ��  �� T� � � ��  �� ��C� � �� ��� � �Q� COMBOBOX�;� ��C� ImageFormat.Bmp�� �� ��C� \ImageFormat.Png�� �� ��C� ImageFormat.Jpeg�� �� ��C� ImageFormat.Gif�� �� ��C� ImageFormat.Tiff�� �� T�� �� ImageFormat.Bmp�� �� U	  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE HIDEOBJECTS COMBO1 ADDITEM processimage,     �� hideobjects@    �� InitY    ��1 �1� A A � 11BA��#� qaQ1� A A � � r� qaq� aA A � �� q��aQq� aA B � � b� q��aQB��� A A � � � B� qa1� �A A � � �| 1� �� � s� �A� � � �� A � � A A � A A � raar� 14� 1A A � � � �B A R B B 2 Q� � � � � � � � � � A 2 qs �11� �������A 2                       �     �   �  �  �   �     �  �    )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KWTK5 889015724      /  F      ]                          �      �                       WINDOWS _1V00KWTK6 923480988�      �  �      �                              �                           WINDOWS _1V00KWTK7 898851866�      (  :  G      �  #                                               COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 0
Left = 0
Height = 306
Width = 457
DoCreate = .T.
Caption = "Text to Graphics Path drawn using texture image"
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      6_memberdata XML Metadata for customizable properties
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 276
Left = 12
Top = 12
Width = 432
Name = "Imgcanvas1"
     zPROCEDURE beforedraw
LOCAL oGfx AS xfcGraphics
LOCAL oPth AS xfcGraphicsPath
LOCAL oBrsh AS xfcTextureBrush
LOCAL oImg AS xfcImage
LOCAL oFam AS xfcFontFamily

WITH _SCREEN.System.Drawing

	cString = "Using VFP and SednaX to render text with a Texture brush"

	oGfx = This.oGfx
	oGfx.SmoothingMode = 4

	oRect = .Rectangle.New(0,0,This.Width,This.Height)
	oImg = .Image.FromFile(HOME(4)+[Gifs\morphfox.gif])
	oFam = .FontFamily.New("Arial",32)
	oBrsh = .TextureBrush.New(oImg)

	oPth = .Drawing2D.GraphicsPath.New()
	oPth.AddString(cString, oFam, 1, 40, oRect)

	oGfx.FillPath(oBrsh, oPth)
	
ENDWITH
ENDPROC
     Y���    @  @                        �   %   �      �     �          �  U  � ��  Q� XFCGRAPHICS� �� Q� XFCGRAPHICSPATH� �� Q� XFCTEXTUREBRUSH� �� Q� XFCIMAGE� �� Q� XFCFONTFAMILY� ���9� � ����E T� ��8 Using VFP and SednaX to render text with a Texture brush�� T�  �� �  �� T�  �	 ����$ T�
 �C� � � � � � �� � ��- T� �CC��Q� Gifs\morphfox.gif�� � �� T� �C� Arial� �� � �� T� �C � �� � �� T� �C�� � � �� ��C �  � ��( �
 � � �� ��C �  � �  � �� �� U  OGFX OPTH OBRSH OIMG OFAM SYSTEM DRAWING CSTRING THIS SMOOTHINGMODE ORECT	 RECTANGLE NEW WIDTH HEIGHT IMAGE FROMFILE
 FONTFAMILY TEXTUREBRUSH	 DRAWING2D GRAPHICSPATH	 ADDSTRING FILLPATH
 beforedraw,     ��1 a��1�"RB��aR�RB 1                       o      )   @                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00KZBQ8 889015787      /  F      ]                          �      �                       WINDOWS _1V00KZBQ9 889016776�      �  �      �                                                           WINDOWS _1V00KZBQA 889016776c  t  �  �  �  �        �                                               COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      fHeight = 302
Width = 458
DoCreate = .T.
AutoCenter = .T.
Caption = "System Demo"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
imgCanvas1      Form1      EHeight = 276
Left = 12
Top = 12
Width = 432
Name = "imgCanvas1"
     �PROCEDURE beforedraw


WITH _SCREEN.System.Drawing
	This.Clear()
	
	This.oGfx.SmoothingMode = 4
	
	This.oGfx.DrawIcon(.SystemIcons.Warning,      20, 5)
	This.oGfx.DrawIcon(.SystemIcons.Hand,         60, 5)
	This.oGfx.DrawIcon(.SystemIcons.Information, 100, 5)
	This.oGfx.DrawIcon(.SystemIcons.Question,    140, 5)

	oFont = .Font.New("Arial",12)
	
	x = 10
	y = 60
	This.oGfx.FillRectangle(.SystemBrushes.ActiveCaption,     x, y, 24, 24)
	This.oGfx.DrawString("ActiveCaption", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ActiveCaptionText, x, y, 24, 24)
	This.oGfx.DrawString("ActiveCaptionText", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.AppWorkspace,      x, y, 24, 24)
	This.oGfx.DrawString("AppWorkspace", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ControlLightLight, x, y, 24, 24)
	This.oGfx.DrawString("ControlLightLight", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ControlLight,      x, y, 24, 24)
	This.oGfx.DrawString("ControlLight", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.Control,           x, y, 24, 24)
	This.oGfx.DrawString("Control", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ControlText,       x, y, 24, 24)
	This.oGfx.DrawString("ControlText", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ControlDark,       x, y, 24, 24)
	This.oGfx.DrawString("ControlDark", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ControlDarkDark,   x, y, 24, 24)
	This.oGfx.DrawString("ControlDarkDark", oFont, .SystemBrushes.ControlText, x+25,y)
	
	x = x + 200
	y = 60
	This.oGfx.FillRectangle(.SystemBrushes.Desktop,           x, y, 24, 24)
	This.oGfx.DrawString("Desktop", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.Highlight,         x, y, 24, 24)
	This.oGfx.DrawString("Highlight", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.HighlightText,     x, y, 24, 24)
	This.oGfx.DrawString("HighlightText", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.HotTrack,          x, y, 24, 24)
	This.oGfx.DrawString("HotTrack", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.InactiveBorder,    x, y, 24, 24)
	This.oGfx.DrawString("InactiveBorder", oFont, .SystemBrushes.ControlText, x+25,y)
	
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.InactiveCaption,   x, y, 24, 24)
	This.oGfx.DrawString("InactiveCaption", oFont, .SystemBrushes.ControlText, x+25,y)
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.Menu,              x, y, 24, 24)
	This.oGfx.DrawString("Menu", oFont, .SystemBrushes.ControlText, x+25,y)
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.ScrollBar,         x, y, 24, 24)
	This.oGfx.DrawString("ScrollBar", oFont, .SystemBrushes.ControlText, x+25,y)
	y = y + 24
	This.oGfx.FillRectangle(.SystemBrushes.WindowText,        x, y, 24, 24)
	This.oGfx.DrawString("WindowText", oFont, .SystemBrushes.ControlText, x+25,y)
	
ENDWITH
 
ENDPROC
     (���                              ��   %   ,
      �
  C   @
          �  U  Z ���9�  � ��S� ��C� � �� T� � � ���� ��C�� � ��� � � �� ��C�� �	 �<�� � � �� ��C�� �
 �d�� � � �� ��C�� � ���� � � �� T� �C� Arial��� � �� T� ��
�� T� ��<��% ��C�� �  �  � ��� � � ��6 ��C� ActiveCaption � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��: ��C� ActiveCaptionText � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��5 ��C� AppWorkspace � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��: ��C� ControlLightLight � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��5 ��C� ControlLight � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��0 ��C� Control � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��4 ��C� ControlText � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��4 ��C� ControlDark � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��8 ��C� ControlDarkDark � �� � � � � � � � �� T� �� ���� T� ��<��% ��C�� �  �  � ��� � � ��0 ��C� Desktop � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��2 ��C�	 Highlight � �� � � � � � � � �� T� �� ���% ��C�� �  �  � ��� � � ��6 ��C� HighlightText � �� � � � � � � � �� T� �� ���% ��C�� �   �  � ��� � � ��1 ��C� HotTrack � �� � � � � � � � �� T� �� ���% ��C�� �!  �  � ��� � � ��7 ��C� InactiveBorder � �� � � � � � � � �� T� �� ���% ��C�� �"  �  � ��� � � ��8 ��C� InactiveCaption � �� � � � � � � � �� T� �� ���% ��C�� �#  �  � ��� � � ��- ��C� Menu � �� � � � � � � � �� T� �� ���% ��C�� �$  �  � ��� � � ��2 ��C�	 ScrollBar � �� � � � � � � � �� T� �� ���% ��C�� �%  �  � ��� � � ��3 ��C�
 WindowText � �� � � � � � � � �� �� U&  SYSTEM DRAWING THIS CLEAR OGFX SMOOTHINGMODE DRAWICON SYSTEMICONS WARNING HAND INFORMATION QUESTION OFONT FONT NEW X Y FILLRECTANGLE SYSTEMBRUSHES ACTIVECAPTION
 DRAWSTRING CONTROLTEXT ACTIVECAPTIONTEXT APPWORKSPACE CONTROLLIGHTLIGHT CONTROLLIGHT CONTROL CONTROLDARK CONTROLDARKDARK DESKTOP	 HIGHLIGHT HIGHLIGHTTEXT HOTTRACK INACTIVEBORDER INACTIVECAPTION MENU	 SCROLLBAR
 WINDOWTEXT
 beforedraw,     ��1 #� 2������ � QaQ�QQQ�QQQQAQAQ�� QQ!QaQQqQ�Q�Q!Q1B 2                       �      )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TN1AHCZ8 885697831      /  F      ]                          �      �                       WINDOWS _1TN1AHCZH 885699857�      �  �      �                                                           WINDOWS _1TN1AHCZI 885699857C  T  r    �  �      �  �                                               COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      FTop = -1
Left = 0
DoCreate = .T.
Caption = "Text"
Name = "Form1"
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      RAnchor = 15
Height = 252
Left = -1
Top = -1
Width = 377
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
WITH _SCREEN.SYSTEM.drawing
	This.Clear()
    fn = .Font.New("Times New Roman", 10)
    str = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla facilisi. "+ ;
    "Quisque dolor leo, sollicitudin a, porta vel, faucibus id, nunc. Suspendisse mollis nonummy "+ ;
    "tellus. Sed auctor pulvinar odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices "+ ;
    "posuere cubilia Curae; Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin lorem lacus, "+ ;
    "mattis et, cursus ut, viverra faucibus, purus. Sed feugiat mauris quis velit. Etiam iaculis hendrerit "+ ;
    "urna. Vivamus volutpat dui vel est. Sed dictum est in metus. Nullam facilisis aliquet turpis. "+ ;
    "Duis varius enim ut orci. Donec lorem ligula, pellentesque ac, sodales at, ornare non, lacus. Vivamus rutrum aliquam leo. "
    sf = .StringFormat.GenericTypographic.Clone()
    sf.Alignment = 1 && StringAlignment.Center
    sf.LineAlignment = 1 && StringAlignment.Center
    this.oGfx.DrawString(str, fn, .Brushes.Black, ;
    	.RectangleF.New(10, 10, This.Width - 20, This.Height - 20), sf)
    fn.Dispose()
ENDWITH

ENDPROC
     !���                              ^   %   �      �     �          �  U  � ���9�  � ���� ��C� � ��' T� �C� Times New Roman�
�� � ���T� ��J Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla facilisi. �\ Quisque dolor leo, sollicitudin a, porta vel, faucibus id, nunc. Suspendisse mollis nonummy �c tellus. Sed auctor pulvinar odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices �d posuere cubilia Curae; Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin lorem lacus, �f mattis et, cursus ut, viverra faucibus, purus. Sed feugiat mauris quis velit. Etiam iaculis hendrerit �^ urna. Vivamus volutpat dui vel est. Sed dictum est in metus. Nullam facilisis aliquet turpis. �z Duis varius enim ut orci. Donec lorem ligula, pellentesque ac, sodales at, ornare non, lacus. Vivamus rutrum aliquam leo. �� T� �C��	 �
 � �� T� � ���� T� � ����E ��C �  � �� � C�
�
� � �� � ��� �  � � � � �� ��C� � �� �� U  SYSTEM DRAWING THIS CLEAR FN FONT NEW STR SF STRINGFORMAT GENERICTYPOGRAPHIC CLONE	 ALIGNMENT LINEALIGNMENT OGFX
 DRAWSTRING BRUSHES BLACK
 RECTANGLEF WIDTH HEIGHT DISPOSE
 beforedraw,     ��1 !� q-QR� A 2                       �      )                           !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898828679�      �  �      �                              �                           WINDOWS _1TP0L3VWK 897781372�  �  �  �  �  �      Z  -                                               WINDOWS _1U40L3TVH 897778927      ,  ;  J  W      �  �+                                               WINDOWS _1YI061BS9 897778927�      �  �  �  �      t  �&                                               WINDOWS _1YI061BSA 897778927:      O  d  t  �         �%                                               WINDOWS _1TP0L3VWK 898828679�      �  �  �  �      V  J                                               WINDOWS _1YI061BSB 897778224u      �  �  �  �        �                                               WINDOWS _1TP0L3VWK 897778224+      8  E  S  `                                                           WINDOWS _1YI1FCYOY 897778379�      �      "                                                           WINDOWS _1YI1FCYOZ 897778927�      �  �  �  �      H  c                                               WINDOWS _1YI1FCYP0 897778224        "  5  B                                                           WINDOWS _1YI1FCYP1 897778379�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 897778948^      k  x  �  �                                                           WINDOWS _1YJ00MJII 897778948        (  6  C                                                           WINDOWS _1TP0L3VWK 897778927�      �  �  �  �      �  �                                               WINDOWS _1TP0L3VWK 8977789278!      G!  V!  f!  s!      @"                                                 WINDOWS _1TP0L3VWK 897778224�#      �#  �#  �#  �#                                                           WINDOWS _1TP0L3VWL 897778725�#      ~#  p#  c#  V$                                                           WINDOWS _1YJ019JKQ 897778927T#      E#  5#  (#  �$      �"  r                                               WINDOWS _1YJ019JKR 897778797�"      �"  *!  !  �                                                            WINDOWS _1YJ01ES1W 897781372)  �  �      .       (                                                 COMMENT RESERVED                                z                                                            1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 10
Left = 2
Height = 305
Width = 674
DoCreate = .T.
Caption = "Shadowed and Blocked Text"
mode = 0
Name = "Form1"
      mode
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 60
Left = 240
Top = 108
Width = 420
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
LOCAL loFont AS xfcFont

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	FOR n = 1 TO Thisform.Spinner3.Value
		This.oGfx.TranslateTransform(Thisform.Spinner1.Value,Thisform.Spinner2.Value)
		This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
			.SolidBrush.New(.Color.FromRGB(Thisform.Shape2.BackColor)), ;
    		This.Rectangle)
	ENDFOR
		
	This.oGfx.ResetTransform()

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

ENDWITH
RETURN
ENDPROC
     ����    �  �                        g   %   I      �     ]          �  U  � ��  Q� XFCFONT� ���9� � ���� ��C� � �� �� � T� �� � � �� H�X �� � �� � B��{ � T�	 ���
 � �� �� � I��� � T�	 ���
 � �� �� � BI��� � T�	 ���
 � �� 2�� � T�	 ���
 � �� �( T�  �C� � � � � �  �	 �� � ��6 ��C� � � � � � � � � � � � � � � ��< ��C� � �  �  CC� � � �� � �� � � � � � � �� ��C� � �  ��< ��C� � �  �  CC� �! � �� � �� � � � � � � �� �� B� U"  LOFONT SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE OGFX TRANSLATETRANSFORM SPINNER1 SPINNER3 SPINNER2
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE2	 BACKCOLOR	 RECTANGLE RESETTRANSFORM SHAPE1
 beforedraw,     ��1 !"� r 1� !!1� A �d��B A 1                       �      )   �                        Form1      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 240
TabIndex = 1
Top = 36
Width = 420
Name = "txtText"
      �PROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 1                       S       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      image      commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      �PROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 2                       U       )   �                         
Imgcanvas2      	imgcanvas      commandbutton      commandbutton      Command2      Form1      wTop = 144
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Shadow Color"
TabIndex = 3
Name = "Command2"
      �PROCEDURE Click
Thisform.Shape2.BackColor = GETCOLOR(Thisform.Shape2.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 1                       S       )   �                         ..\source\gdiplusx.vcx      shape      shape      Shape1      Form1      XTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 0,128,255
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND2 CLICK Click,     ��1 1                       +       )   �                         shape      shape      Shape2      Form1      ZTop = 144
Left = 132
Height = 25
Width = 25
BackColor = 202,202,202
Name = "Shape2"
      6PROCEDURE Click
This.Parent.Command2.Click
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 240
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
     ����    �  �                        �   %         7     '          �  U  �  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� ��C� � � �� U	  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 � ���2                             )   �                        textbox      textbox      TxtFontSize      Form1      nAlignment = 3
Value = 24
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      textbox      textbox      TxtFontStyle      Form1      _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      label      label      Label2      Form1      sAutoSize = .T.
Caption = "Blocked"
Height = 17
Left = 240
Top = 84
Width = 46
TabIndex = 5
Name = "Label2"
      label      label      Label3      Form1      uAutoSize = .T.
Caption = "Shadowed"
Height = 17
Left = 240
Top = 204
Width = 61
TabIndex = 5
Name = "Label3"
      spinner      spinner      Spinner1      Form1      �Height = 24
Increment =   1.00
KeyboardHighValue = 2
KeyboardLowValue = -2
Left = 132
SpinnerHighValue =   2.00
SpinnerLowValue =  -2.00
Top = 192
Width = 48
Value = 1
Name = "Spinner1"
      ^PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      fAnchor = 15
Height = 60
Left = 240
Top = 228
Width = 420
smoothingmode = 0
Name = "Imgcanvas2"
      yAutoSize = .T.
Caption = "Shadow Pixels"
Height = 17
Left = 12
Top = 264
Width = 83
TabIndex = 5
Name = "Label6"
      Form1      Label6      spinner      spinner      Spinner2      Form1      �Height = 24
Increment =   1.00
KeyboardHighValue = 2
KeyboardLowValue = -2
Left = 132
SpinnerHighValue =   2.00
SpinnerLowValue =  -2.00
Top = 228
Width = 48
Value = 1
Name = "Spinner2"
      `PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      label      label      ^PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      Form1      Spinner3      spinner      spinner      Form1      Label5      label      label      Form1      Label4      label      label      �AutoSize = .T.
Caption = "Horizontal Transform"
Height = 17
Left = 12
Top = 192
Width = 117
TabIndex = 5
Name = "Label4"
      AutoSize = .T.
Caption = "Vertical Transform"
Height = 17
Left = 12
Top = 228
Width = 102
TabIndex = 5
Name = "Label5"
      �Height = 24
Increment =   1.00
KeyboardHighValue = 10
KeyboardLowValue = 1
Left = 132
SpinnerHighValue =  10.00
SpinnerLowValue =   1.00
Top = 264
Width = 48
Value = 6
Name = "Spinner3"
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE2	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          �PROCEDURE beforedraw
LOCAL loFont AS xfcFont

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	This.oGfx.TranslateTransform(;
		Thisform.Spinner1.Value * Thisform.Spinner3.Value, ;
		Thisform.Spinner2.Value * Thisform.Spinner3.Value)
	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape2.BackColor)), ;
   		This.Rectangle)
		
	This.oGfx.ResetTransform()

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

ENDWITH
RETURN
ENDPROC
     1���                              ��   %   �       �      �           �  U  7  ��  � �	 ��C��� ��C� � � �� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 � � 1                       �       )                          ���    �  �                        p�   %   Y      �     m          �  U  � ��  Q� XFCFONT� ���9� � ���� ��C� � �� �� � T� �� � � �� H�X �� � �� � B��{ � T�	 ���
 � �� �� � I��� � T�	 ���
 � �� �� � BI��� � T�	 ���
 � �� 2�� � T�	 ���
 � �� �( T�  �C� � � � � �  �	 �� � �� �� ���(�� � � ����" ��C� � � � � � � � � ��< ��C� � �  �  CC� � � �� � �� � � �  � � � �� �� ��C� � �! ��< ��C� � �  �  CC� �" � �� � �� � � �  � � � �� �� B� U#  LOFONT SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE N SPINNER3 OGFX TRANSLATETRANSFORM SPINNER1 SPINNER2
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE2	 BACKCOLOR	 RECTANGLE RESETTRANSFORM SHAPE1
 beforedraw,     ��1 !"� r 1� !!1� A ��!�A �B A 1                       �      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898872536�      �  �      �                              �                           WINDOWS _1TP0L3VWK 897877465�    $  1  C  P      �  �'                                               WINDOWS _1U40L3TVH 897877079�      �  �  �  �      Y  w                                               WINDOWS _1YI061BS9 897877079)      >  S  c  p      �  �                                               WINDOWS _1TP0L3VWK 897877079�      �  �  �  �      >  �                                               WINDOWS _1TP0L3VWK 897778224g      t  �  �  �                                                           WINDOWS _1TP0L3VWK 897877079       /  >  Q  ^      �  �                                               WINDOWS _1YI1FCYOZ 897877079!      6  K    ]      �  �                                               WINDOWS _1YI1FCYP0 897877079�      �  t    �        �                                               WINDOWS _1YI1FCYP1 897877079�      �  �  �  �        �                                               WINDOWS _1TP0L3VWK 897877079�      �  �  �  $                                                           WINDOWS _1YJ00MJII 897877079�      �  v  i  �                                                           WINDOWS _1YK0ZR4GU 897877465  �  �  �  }  |         $                                               COMMENT RESERVED                                T                                                            +�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 10
Left = 2
Height = 305
Width = 674
DoCreate = .T.
Caption = "Embossed and Engraved Text"
mode = 0
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      <mode
_memberdata XML Metadata for customizable properties
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 60
Left = 240
Top = 108
Width = 420
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!* http://www.codeguru.com/columns/dotnettips/article.php/c8487__2/

LOCAL loFont AS xfcFont
LOCAL loFontFamily AS xfcFontFamily

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

	This.oGfx.TranslateTransform(1, 1)
		This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
			.SolidBrush.New(.Color.FromRGB(This.Parent.BackColor)), ;
    		This.Rectangle)
		
	This.oGfx.ResetTransform()
ENDWITH
RETURN
ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                        ����    �  �                        �   %         7     '          �  U  �  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� ��C� � � �� U	  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 � ���2                             )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      
Imgcanvas2      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 240
TabIndex = 1
Top = 36
Width = 420
Name = "txtText"
      �PROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         image      ..\source\gdiplusx.vcx      	imgcanvas      commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      �PROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         Form1      Label3      label      label      Form1      shape      shape      Shape1      Form1      VTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 0,0,128
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      fAnchor = 15
Height = 60
Left = 240
Top = 228
Width = 420
smoothingmode = 0
Name = "Imgcanvas2"
      uAutoSize = .T.
Caption = "Engraved"
Height = 17
Left = 240
Top = 204
Width = 54
TabIndex = 5
Name = "Label3"
      label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 240
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      tAutoSize = .T.
Caption = "Embossed"
Height = 17
Left = 240
Top = 84
Width = 63
TabIndex = 5
Name = "Label2"
      Label2      label      label      Form1      TxtFontStyle      textbox      textbox      Form1      Form1      commandbutton      commandbutton      
cmdGetFont      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                           TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      TxtFontSize      textbox      textbox      nAlignment = 3
Value = 24
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
     1���                              ��   %   �       �      �           �  U  7  ��  � �	 ��C��� ��C� � � �� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 � � 1                       �       )                           _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
     �PROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/columns/dotnettips/article.php/c8487__2/

LOCAL loFont AS xfcFont
LOCAL loFontFamily AS xfcFontFamily

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

	This.oGfx.TranslateTransform(-1, -1)
		This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
			.SolidBrush.New(.Color.FromRGB(This.Parent.BackColor)), ;
    		This.Rectangle)

		
	This.oGfx.ResetTransform()
ENDWITH
RETURN
ENDPROC
     ����    �  �                        jv   %   3      y     G          �  U  � ��  Q� XFCFONT� �� Q� XFCFONTFAMILY� ���9� � ���� ��C� � �� �� � T� �� � �	 �� H�p �� � �� � B��� � T�
 ��� � �� �� � I��� � T�
 ��� � �� �� � BI��� � T�
 ��� � �� 2�� � T�
 ��� � �� �( T�  �C� � �	 � � �	  �
 �� � ��< ��C� � �	  �  CC� � � �� � �� � � � � � � �� ��C������� � � ��< ��C� � �	  �  CC� � � �� � �� � � � � � � �� ��C� � � �� �� B� U   LOFONT LOFONTFAMILY SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE OGFX
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE TRANSLATETRANSFORM PARENT RESETTRANSFORM
 beforedraw,     ��1 $�"� r 1� !!1� A ����A A 1                       �      )   �                       ����    �  �                        DQ   %   1      w     E          �  U  � ��  Q� XFCFONT� �� Q� XFCFONTFAMILY� ���9� � ���� ��C� � �� �� � T� �� � �	 �� H�p �� � �� � B��� � T�
 ��� � �� �� � I��� � T�
 ��� � �� �� � BI��� � T�
 ��� � �� 2�� � T�
 ��� � �� �( T�  �C� � �	 � � �	  �
 �� � ��< ��C� � �	  �  CC� � � �� � �� � � � � � � �� ��C��� � � ��< ��C� � �	  �  CC� � � �� � �� � � � � � � �� ��C� � � �� �� B� U   LOFONT LOFONTFAMILY SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE OGFX
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE TRANSLATETRANSFORM PARENT RESETTRANSFORM
 beforedraw,     ��1 $�"� r 1� !!1� A ��b�A A 1                       �      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898872524�      �  �      �                              �                           WINDOWS _1TP0L3VWK 897849611�  �  �  �  �  �      f  `#                                               WINDOWS _1U40L3TVH 897849149�      �  �  �  �      A  �                                               WINDOWS _1YI061BS9 897848905�      �      !      �  ?                                               WINDOWS _1YI061BSA 8978489053      H  ]  m  z      �  0                                               WINDOWS _1TP0L3VWK 897849036�      �  �  �  �        O                                               WINDOWS _1YI061BSB 8978490368       E   R   `   m       �   n                                               WINDOWS _1TP0L3VWK 897849149�!      �!  �!  �!  �!                                                           WINDOWS _1YI1FCYOY 897778379�!      �!  w!  +   !                                                           WINDOWS _1YI1FCYOZ 897848795          �  �  o      a"  �                                               WINDOWS _1YI1FCYP0 897849043`      Q  o  b  �      �                                                 WINDOWS _1YI1FCYP1 897778379�      �  z  &  �                                                           WINDOWS _1TP0L3VWK 897849149�      �  �  w                                                             COMMENT RESERVED                                N                                                            )�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 10
Left = 2
Height = 230
Width = 674
DoCreate = .T.
Caption = "Halo effect on text"
MinHeight = 200
mode = 0
Name = "Form1"
      mode
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      gAnchor = 15
Height = 108
Left = 216
Top = 108
Width = 444
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
*!*	Totally based on Bob Powell article
*!*	http://www.bobpowell.net/halo.htm


*!*	Create a new bitmap that is smaller than your original drawing area by some fixed ratio.  In this case 1/5th. 
*!*	Create a GraphicsPath and had the desired text to it.  
*!*	Obtain a graphics object for the bitmap and create a matrix that shrinks all drawing output by the chosen ratio.  
*!*	Fill the text path using the desired halo color and then, just for good measure, stroke the text path with a pen to provide a little bit of edge to the aura.  
*!*	Set the interpolation mode in the destination graphics object to HighQualityBilinear and stretch the bitmap containing the halo using the chosen ratio again.  
*!*	Finally, on the destination graphics object, fill the text path without changing the size.  This should register the text correctly with the fuzzy outline of the halo and produce the final effect.  

LOCAL loFont AS xfcFont

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	* Create a bitmap in a fixed ratio to the original drawing area.
	LOCAL loBmp as xfcBitmap
	loBmp = .Bitmap.New(This.Width / 5, This.Height / 5)

	* Create a GraphicsPath object.  
	LOCAL loPath as xfcGraphicsPath
	loPath = .Drawing2D.GraphicsPath.New()

	* Add the string in the chosen style.  
	loPath.AddString(Thisform.TxtText.Value, ;
		.FontFamily.New(Thisform.TxtFontName.Value), ;
		loStyle, ;
		Thisform.TxtFontSize.Value, ;
		.Point.New(0, 0), ;
		.StringFormat.GenericTypographic)

	* Get the graphics object for the image.  
	LOCAL loGfx as xfcGraphics
	loGfx = .Graphics.FromImage(loBmp)

	* Create a matrix that shrinks the drawing output by the fixed ratio.  
	LOCAL loMatrix as xfcMatrix
	loMatrix = .Drawing2D.Matrix.New(1/5, 0, 0, 1/5, -1/5, -1/5)

	* Choose an appropriate smoothing mode for the halo.  
	loGfx.SmoothingMode = .Drawing2D.SmoothingMode.AntiAlias

	* Transform the graphics object so that the same half may be used for both halo and text output.  
	loGfx.Transform = loMatrix

	* Using a suitable pen...
	LOCAL loPen as xfcPen
	loPen = .Pen.New(.Color.FromRGB(Thisform.Shape2.BackColor))

	* Draw around the outline of the path
	loGfx.DrawPath(loPen, loPath)

	* and then fill in for good measure.  
	loGfx.FillPath( .SolidBrush.New(.Color.FromRGB(Thisform.Shape2.BackColor)), loPath)

	* setup the smoothing mode for path drawing
	This.oGfx.SmoothingMode = .Drawing2D.SmoothingMode.AntiAlias

	* and the interpolation mode for the expansion of the halo bitmap 
	This.oGfx.InterpolationMode = .Drawing2D.InterpolationMode.HighQualityBicubic

	* expand the halo making the edges nice and fuzzy.  
	This.oGfx.DrawImage(loBmp, This.Rectangle, 0, 0, ;
		loBmp.Width, loBmp.Height, .GraphicsUnit.Pixel)

	* Redraw the original text 
	This.oGfx.FillPath(.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), loPath)

ENDWITH
RETURN
ENDPROC
      ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 2                       -       )   �                        {���    b  b                        ��   %   �                      �  U  y  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� U  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW Click,     ��1 � ���2                       �       )   b                        ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND2 CLICK Click,     ��1 1                       +       )   �                         ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                        ���    �   �                         �f   %   �       �      �           �  U  /  T�  � � �C�  � � ��� ��C�  � � �� U  THISFORM SHAPE2	 BACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 �2                       n       )   �                        ���    �   �                         �f   %   �       �      �           �  U  /  T�  � � �C�  � � ��� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 �2                       n       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 216
TabIndex = 1
Top = 36
Width = 444
Name = "txtText"
      vPROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()

ENDPROC
     ���    �   �                         �   %   �       �      �           �  U  '  ��  � �	 ��C��� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 � � 2                       k       )   �                         commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      yPROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()

ENDPROC
      pAutoSize = .T.
Caption = "Halo"
Height = 17
Left = 216
Top = 84
Width = 28
TabIndex = 5
Name = "Label2"
      Label2      label      label      _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      Form1      commandbutton      commandbutton      Command2      Form1      wTop = 144
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Shadow Color"
TabIndex = 3
Name = "Command2"
      yPROCEDURE Click
Thisform.Shape2.BackColor = GETCOLOR(Thisform.Shape2.BackColor)
Thisform.Imgcanvas1.Draw()

ENDPROC
      TxtFontStyle      textbox      textbox      8PROCEDURE Valid
Thisform.Imgcanvas1.Draw()

ENDPROC
      nAlignment = 3
Value = 48
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      Form1      TxtFontSize      shape      shape      Shape1      Form1      TTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 0,0,0
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      textbox      textbox      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
      Form1      
cmdGetFont      commandbutton      commandbutton      Form1      shape      shape      Shape2      Form1      ZTop = 144
Left = 132
Height = 25
Width = 25
BackColor = 255,255,128
Name = "Shape2"
      6PROCEDURE Click
This.Parent.Command2.Click
ENDPROC
      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      TxtFontName      textbox      textbox      Form1      Label1      label      label      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 216
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      �PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()

ENDPROC
     u���    \  \                        �Q   %   �        &   �          �  U  U ��  Q� XFCFONT� ���9� � ��J� ��C� � �� �� � T� �� � � �� H�X �� � �� � B��{ � T�	 ���
 � �� �� � I��� � T�	 ���
 � �� �� � BI��� � T�	 ���
 � �� 2�� � T�	 ���
 � �� � �� Q�	 XFCBITMAP�& T� �C� � �� � ��� � �� �� Q� XFCGRAPHICSPATH� T� �C�� � � ��I ��C� � � C� � � �� �  �	 � � � C� � �� � �� � � � �� �� Q� XFCGRAPHICS� T� �C � ��  �! �� ��" Q�	 XFCMATRIX�K T�" �C� �������?�� � � �������?�� ������ɿ�� ������ɿ��� �# � �� T� �$ ��� �$ �% �� T� �& ��" �� ��' Q� XFCPEN�# T�' �CC� �+ �, ��) �* ��( � �� ��C �'  � � �- ��* ��CCC� �+ �, ��) �* ��/ �  � � �. �� T� �0 �$ ��� �$ �% �� T� �0 �1 ��� �1 �2 ��3 ��C � � �4 � � � � � � ��5 �6 � �0 �3 ��- ��CCC� �7 �, ��) �* ��/ �  � � �0 �. �� �� B� U8  LOFONT SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR LOBMP BITMAP NEW WIDTH HEIGHT LOPATH	 DRAWING2D GRAPHICSPATH	 ADDSTRING TXTTEXT
 FONTFAMILY TXTFONTNAME TXTFONTSIZE POINT STRINGFORMAT GENERICTYPOGRAPHIC LOGFX GRAPHICS	 FROMIMAGE LOMATRIX MATRIX SMOOTHINGMODE	 ANTIALIAS	 TRANSFORM LOPEN PEN COLOR FROMRGB SHAPE2	 BACKCOLOR DRAWPATH FILLPATH
 SOLIDBRUSH OGFX INTERPOLATIONMODE HIGHQUALITYBICUBIC	 DRAWIMAGE	 RECTANGLE GRAPHICSUNIT PIXEL SHAPE1
 beforedraw,     ��1 ,"� r 1� !!1� A Ca�Q�caC�s1S���4�B A 1                       �      )   \                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898872540�      �  �      �                              �                           WINDOWS _1TP0L3VWK 897877484�  �    %  7  D      �  �4                                               WINDOWS _1U40L3TVH 897782731�      �            �  �'                                               WINDOWS _1YI061BS9 897782731z      �  �  �  �      >  �&                                               WINDOWS _1YI061BSA 897782731        0  @  M      �  �"                                               WINDOWS _1TP0L3VWK 897864584�      �  �  �  �      $  j                                               WINDOWS _1YI061BSB 897782731E      R  _  m  z      �  �                                               WINDOWS _1TP0L3VWK 897778224�          #  0                                                           WINDOWS _1TP0L3VWK 886790211�      �  �  �  �      \  8                                               WINDOWS _1YI1FCYOZ 897782731�       �   �   �   �       m!  �                                               WINDOWS _1YI1FCYP0 897864534%$      4$  C$  V$  c$      �$                                                 WINDOWS _1YI1FCYP1 897864534=&      L&  $  �   [&      �#                                                 WINDOWS _1TP0L3VWK 886790211�      8  *    �%                                                           WINDOWS _1YJ00MJII 897782731      �  v  i  5%                                                           WINDOWS _1YJ01ES1W 897877484�  K  �  �  �  �      ()  E/                                               WINDOWS _1TP0L3VWK 897864717�      k  [  N  �        �                                               WINDOWS _1YK0MLAAL 897864733A      4  �  �  b                                                           COMMENT RESERVED                                �                                                            9�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 10
Left = 2
Height = 305
Width = 674
DoCreate = .T.
Caption = "Reflected Text"
mode = 0
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      <mode
_memberdata XML Metadata for customizable properties
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 60
Left = 240
Top = 108
Width = 420
smoothingmode = 0
Name = "Imgcanvas1"
     DPROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/cpp/g-m/gdi/gdi/article.php/c8703__2/

LOCAL loFont AS xfcFont
LOCAL loFontFamily AS xfcFontFamily

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)
	loFontFamily = .FontFamily.New(Thisform.TxtFontName.Value)
	
	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

	LOCAL lnCy, lnLineHeight, lnLineAscent, lnLineSpacing
	lnLineAscent = loFontFamily.GetCellAscent(loStyle)
	lnLineSpacing = loFontFamily.GetLineSpacing(loStyle)
	lnLineHeight = loFont.GetHeight(This.oGfx)
	lnCy = lnLineHeight * lnLineAscent / lnLineSpacing

	This.oGfx.ScaleTransform(1, -1)
	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape2.BackColor)), ;
   		.PointF.New(0, -(lnCy*2)-1))
	
	This.oGfx.ResetTransform()

ENDWITH
RETURN
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 1                       S       )   �                         ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                        ����    �  �                        �   %         7     '          �  U  �  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� ��C� � � �� U	  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 � ���2                             )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      Label4      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 240
TabIndex = 1
Top = 36
Width = 420
Name = "txtText"
      �PROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         label      label      Form1      Spinner3      spinner      commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      �PROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND2 CLICK Click,     ��1 1                       +       )   �                         spinner      Form1      
Imgcanvas2      image      	imgcanvas      commandbutton      commandbutton      Command2      Form1      zTop = 144
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Reflected Color"
TabIndex = 3
Name = "Command2"
      �PROCEDURE Click
Thisform.Shape2.BackColor = GETCOLOR(Thisform.Shape2.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         ..\source\gdiplusx.vcx      Form1      Label3      label      shape      shape      Shape1      Form1      VTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 0,0,128
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      �AutoSize = .F.
Alignment = 2
Caption = "X Shear Transform"
Height = 24
Left = 12
Top = 228
Width = 120
TabIndex = 5
BackColor = 255,255,210
Name = "Label4"
      label      Form1      Label2      label      shape      shape      Shape2      Form1      ZTop = 144
Left = 132
Height = 25
Width = 25
BackColor = 202,202,202
Name = "Shape2"
      6PROCEDURE Click
This.Parent.Command2.Click
ENDPROC
      ^PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      fAnchor = 15
Height = 60
Left = 240
Top = 228
Width = 420
smoothingmode = 0
Name = "Imgcanvas2"
      label      label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 240
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      �Height = 24
Increment =   0.05
KeyboardHighValue = 10
KeyboardLowValue = -10
Left = 132
SpinnerHighValue =  10.00
SpinnerLowValue = -10.00
Top = 228
Width = 60
BackColor = 255,255,210
Value = 1.000
Name = "Spinner3"
      Form1      commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE2	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                           TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      TxtFontStyle      textbox      textbox      TxtFontSize      Form1      nAlignment = 3
Value = 24
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      �AutoSize = .T.
Caption = "Reflected and sheared"
Height = 17
Left = 240
Top = 204
Width = 127
TabIndex = 5
Name = "Label3"
      uAutoSize = .T.
Caption = "Reflected"
Height = 17
Left = 240
Top = 84
Width = 54
TabIndex = 5
Name = "Label2"
      textbox      textbox      _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          1���                              ��   %   �       �      �           �  U  7  ��  � �	 ��C��� ��C� � � �� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 � � 1                       �       )                          PROCEDURE beforedraw
*!*	BAsed on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/cpp/g-m/gdi/gdi/article.php/c8703__2/

LOCAL loFont AS xfcFont
LOCAL loFontFamily AS xfcFontFamily
LOCAL loMatrix AS xfcMatrix

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)
	loFontFamily = .FontFamily.New(Thisform.TxtFontName.Value)
	
	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
		This.Rectangle)

	LOCAL lnCy, lnLineHeight, lnLineAscent, lnLineSpacing, lnShear
	lnLineAscent = loFontFamily.GetCellAscent(loStyle)
	lnLineSpacing = loFontFamily.GetLineSpacing(loStyle)
	lnLineHeight = loFont.GetHeight(This.oGfx)
	lnCy = lnLineHeight * lnLineAscent / lnLineSpacing

	lnShear = Thisform.Spinner3.Value
	loMatrix = .Drawing2D.Matrix.New()
	loMatrix.Shear(lnShear, 0)
	loMatrix.Scale(1, -1)

	This.oGfx.MultiplyTransform(loMatrix)

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape2.BackColor)), ;
   		.PointF.New(0 + (-0.82 * lnLineHeight * lnShear) , -(lnCy*2)-1))

	This.oGfx.ResetTransform()

ENDWITH
RETURN
ENDPROC
     ����    �  �                        ��   %   �      J  $             �  U  � ��  Q� XFCFONT� �� Q� XFCFONTFAMILY� �� Q�	 XFCMATRIX� ���9� � ���� ��C� � �� �� � T� �� �	 �
 �� H�� �� �� � B��� � T� ��� � �� �� � I��� � T� ��� � �� �� � BI��� � T� ��� � �� 2�� T� ��� � �� �( T�  �C� � �
 � � �
  � �� � �� T� �C� � �
 �� � ��< ��C� � �
  �  CC� � � �� � �� � � � � � � �� �� �  �! �" �# � T�! �C � � �$ �� T�" �C � � �% �� T�  �C� � �  �& �� T� ��  �! �" �� T�# �� �' �
 �� T� �C��( �) � �� ��C �# � � �* �� ��C����� �+ �� ��C � � � �, ��c ��C� � �
  �  CC� �- � �� � �� � C� �=
ףp=��  �# � �c���. � � � � �� ��C� � �/ �� �� B� U0  LOFONT LOFONTFAMILY LOMATRIX SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE
 FONTFAMILY OGFX
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE LNCY LNLINEHEIGHT LNLINEASCENT LNLINESPACING LNSHEAR GETCELLASCENT GETLINESPACING	 GETHEIGHT SPINNER3	 DRAWING2D MATRIX SHEAR SCALE MULTIPLYTRANSFORM SHAPE2 POINTF RESETTRANSFORM
 beforedraw,     ��1 $�A"� r 1� !!1� A ���rQQqQ2QAAB4B A 1                       
      )   �                       ����    �  �                        ��   %   3      �     G          �  U  _ ��  Q� XFCFONT� �� Q� XFCFONTFAMILY� ���9� � ��T� ��C� � �� �� � T� �� � �	 �� H�p �� � �� � B��� � T�
 ��� � �� �� � I��� � T�
 ��� � �� �� � BI��� � T�
 ��� � �� 2�� � T�
 ��� � �� �( T�  �C� � �	 � � �	  �
 �� � �� T� �C� � �	 �� � ��< ��C� � �	  �  CC� � � �� � �� � � � � � � �� �� � �  �! � T�  �C �
 � �" �� T�! �C �
 � �# �� T� �C� � �  �$ �� T� �� �  �! �� ��C����� � �% ��N ��C� � �	  �  CC� �& � �� � �� � C� � �c���' � � � � �� ��C� � �( �� �� B� U)  LOFONT LOFONTFAMILY SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE
 FONTFAMILY OGFX
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE LNCY LNLINEHEIGHT LNLINEASCENT LNLINESPACING GETCELLASCENT GETLINESPACING	 GETHEIGHT SCALETRANSFORM SHAPE2 POINTF RESETTRANSFORM
 beforedraw,     ��1 $�"� r 1� !!1� A ���2QQqQr�B A 1                       9      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 898872555�      �  �      �                              ~                           WINDOWS _1TP0L3VWK 897781111�  �  �  �  �  �      U  I+                                               WINDOWS _1U40L3TVH 897780187�
      �
  �
  �
        �  *                                               WINDOWS _1YI061BS9 897780677_      t  �  �  �      "  �(                                               WINDOWS _1TP0L3VWK 897780677�      �            }  �                                               WINDOWS _1TP0L3VWK 897778224�      �  �  �  �                                                           WINDOWS _1YI1FCYOY 897778379U      d  s  �  �                                                           WINDOWS _1YI1FCYOZ 897780187�        '  9  F      �  �                                               WINDOWS _1YI1FCYP0 897778224u      �  �  �  �                                                           WINDOWS _1YI1FCYP1 897778379)      8  G  [  h                                                           WINDOWS _1TP0L3VWK 897780187�      �  �  �                                                             WINDOWS _1YJ00MJII 897781304}      �  �  �  �                                                           WINDOWS _1TP0L3VWK 8977811636      E  T  d  q      @  "                                               WINDOWS _1TP0L3VWL 897780686�      �  �  �  �      �  Z	                                               WINDOWS _1TP0L3VWK 897780677,      9  F  T  a                                                           WINDOWS _1U40L3TVH 897780677          �  �                                                           WINDOWS _1YJ01ES1W 897781111�  �  ~  l  _  �      A   �#                                               WINDOWS _1YJ037X9E 897781224P      A  �  �  (      m  R                                               WINDOWS _1YJ037X9F 897781224�      �  �  R  &      ,  J                                               WINDOWS _1YJ037X9G 897780677E      8  *  �
  �                                                           WINDOWS _1YJ037X9H 897780677�
      �
  �
  �
  �                                                           COMMENT RESERVED                                b
                                                            .�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      {Top = 10
Left = 2
Height = 327
Width = 674
DoCreate = .T.
Caption = "Scale and Shear Text"
mode = 0
Name = "Form1"
      mode
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 84
Left = 240
Top = 108
Width = 420
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
LOCAL loFont AS xfcFont

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	This.oGfx.ScaleTransform(Thisform.Spinner1.Value, Thisform.Spinner2.Value)
	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
   		This.Rectangle)
	This.oGfx.ResetTransform()

ENDWITH
RETURN
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 2                       U       )   �                         ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 1                       S       )   �                         ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 2                       U       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      Label7      label      label      Form1      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 240
TabIndex = 1
Top = 36
Width = 420
Name = "txtText"
      �PROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ���    �   �                         ��   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 1                       S       )   �                         Label6      label      label      Form1      commandbutton      commandbutton      Command1      Form1      tTop = 84
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      �PROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         Spinner4      spinner      spinner      Form1      Spinner3      shape      shape      Shape1      Form1      WTop = 84
Left = 132
Height = 25
Width = 25
BackColor = 128,64,64
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      ~AutoSize = .T.
Caption = "Y Shear Transform"
Height = 17
Left = 12
Top = 288
Width = 105
TabIndex = 5
Name = "Label7"
      spinner      spinner      Form1      
Imgcanvas2      image      	imgcanvas      label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 240
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
     ����    �  �                        �   %         7     '          �  U  �  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� ��C� � � �� U	  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 � ���2                             )   �                        textbox      textbox      TxtFontSize      Form1      nAlignment = 3
Value = 24
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      textbox      textbox      TxtFontStyle      Form1      _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      label      label      Label2      Form1      qAutoSize = .T.
Caption = "Scale"
Height = 17
Left = 240
Top = 84
Width = 33
TabIndex = 5
Name = "Label2"
      label      label      Label3      Form1      |AutoSize = .T.
Caption = "Scale and Shear"
Height = 17
Left = 240
Top = 204
Width = 93
TabIndex = 5
Name = "Label3"
      spinner      spinner      Spinner1      Form1      �Height = 24
Increment =   0.10
KeyboardHighValue = 10
KeyboardLowValue = 0
Left = 132
SpinnerHighValue =  10.00
SpinnerLowValue =   0.00
Top = 132
Width = 60
Value = 0.8
Name = "Spinner1"
      ^PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ~AutoSize = .T.
Caption = "X Shear Transform"
Height = 17
Left = 12
Top = 252
Width = 105
TabIndex = 5
Name = "Label6"
      `PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      ..\source\gdiplusx.vcx      spinner      spinner      Spinner2      Form1      �Height = 24
Increment =   0.10
KeyboardHighValue = 20
KeyboardLowValue = -2
Left = 132
SpinnerHighValue =  20.00
SpinnerLowValue =  -2.00
Top = 168
Width = 60
Value = 1.00
Name = "Spinner2"
      `PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      �Height = 24
Increment =   0.05
KeyboardHighValue = 10
KeyboardLowValue = -2
Left = 132
SpinnerHighValue =  10.00
SpinnerLowValue =  -2.00
Top = 288
Width = 60
Value = 0.15
Name = "Spinner4"
      Form1      Label5      label      label      label      label      Label4      Form1      ~AutoSize = .T.
Caption = "X Scale Transform"
Height = 17
Left = 12
Top = 132
Width = 103
TabIndex = 5
Name = "Label4"
      ~AutoSize = .T.
Caption = "Y Scale Transform"
Height = 17
Left = 12
Top = 168
Width = 103
TabIndex = 5
Name = "Label5"
      ^PROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      fAnchor = 15
Height = 84
Left = 240
Top = 228
Width = 420
smoothingmode = 0
Name = "Imgcanvas2"
     �PROCEDURE beforedraw
LOCAL loFont AS xfcFont
LOCAL loMatrix AS xfcMatrix

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	loMatrix = .Drawing2D.Matrix.New()
	loMatrix.Shear(Thisform.Spinner3.Value, Thisform.Spinner4.Value)
	loMatrix.Scale(Thisform.Spinner1.Value, Thisform.Spinner2.Value)

	This.oGfx.MultiplyTransform(loMatrix)

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), ;
   		This.Rectangle)

	This.oGfx.ResetTransform()

ENDWITH
RETURN
ENDPROC
     *���                              M�   %   ~      �     �          �  U  � ��  Q� XFCFONT� �� Q�	 XFCMATRIX� ���9� � ���� ��C� � �� �� � T� �� � �	 �� H�l �� � �� � B��� � T�
 ��� � �� �� � I��� � T�
 ��� � �� �� � BI��� � T�
 ��� � �� 2�� � T�
 ��� � �� �( T�  �C� � �	 � � �	  �
 �� � �� T� �C�� � � �� ��C� � �	 � � �	 � � �� ��C� � �	 � � �	 � � �� ��C � � � � ��< ��C� � �	  �  CC� �# �$ ��! �" ��  � � �% � � � �� ��C� � �& �� �� B� U'  LOFONT LOMATRIX SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE	 DRAWING2D MATRIX SHEAR SPINNER3 SPINNER4 SCALE SPINNER1 SPINNER2 OGFX MULTIPLYTRANSFORM
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE RESETTRANSFORM
 beforedraw,     ��1 !A"� r 1� !!1� A �R��B�B A 1                       �      )                           �Height = 24
Increment =   0.05
KeyboardHighValue = 10
KeyboardLowValue = -2
Left = 132
SpinnerHighValue =  10.00
SpinnerLowValue =  -2.00
Top = 252
Width = 60
Value = -0.40
Name = "Spinner3"
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          1���                              ��   %   �       �      �           �  U  7  ��  � �	 ��C��� ��C� � � �� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 � � 1                       �       )                          ����    n  n                        ��   %   �      %     �          �  U  � ��  Q� XFCFONT� ���9� � ��u� ��C� � �� �� � T� �� � � �� H�X �� � �� � B��{ � T�	 ���
 � �� �� � I��� � T�	 ���
 � �� �� � BI��� � T�	 ���
 � �� 2�� � T�	 ���
 � �� �( T�  �C� � � � � �  �	 �� � ��" ��C� � � � � � � � � ��< ��C� � �  �  CC� � � �� � �� � � � � � � �� ��C� � � �� �� B� U   LOFONT SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE OGFX SCALETRANSFORM SPINNER1 SPINNER2
 DRAWSTRING TXTTEXT
 SOLIDBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR	 RECTANGLE RESETTRANSFORM
 beforedraw,     ��1 !"� r 1� !!1� A �"�B A 1                       �      )   n                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 914232743�      �  �      �                              �                           WINDOWS _1TP0L3VWK 914232743�    +  8  J  W      �  m#                                               WINDOWS _1U40L3TVH 897932081�      �  �  
        �  R"                                               WINDOWS _1YI061BS9 8979317640      E  Z  j  w      �  i                                               WINDOWS _1YI061BSA 897931764�      �  �  �  �      S  �                                               WINDOWS _1TP0L3VWK 897932074�      �  �          z  u                                               WINDOWS _1YI061BSB 897932090�      �  �  �  �      '                                                 WINDOWS _1TP0L3VWK 897849149M      Z  g  u  �                                                           WINDOWS _1YI1FCYOY 897778379        $  7  D                                                           WINDOWS _1YI1FCYOZ 897931764�      �  �  �  �      j  M                                               WINDOWS _1YI1FCYP0 897931764�       �   !  !  %!      �!  o                                               WINDOWS _1YI1FCYP1 897932437C"      �   9  ,  �!      x   m                                               WINDOWS _1YL0OOPJ0 897932365      �  }  p  e      8  �                                               WINDOWS _1YL0OOPJ1 897932258c      V  "  �  �                                                           COMMENT RESERVED                                �                                                            '�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 10
Left = 2
Height = 230
Width = 925
DoCreate = .T.
Caption = "Text with Border"
MinHeight = 200
mode = 0
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      <mode
_memberdata XML Metadata for customizable properties
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      gAnchor = 15
Height = 108
Left = 216
Top = 108
Width = 696
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
LOCAL loFont AS xfcFont

WITH _SCREEN.SYSTEM.Drawing
	This.Clear(.Color.White)

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	* Create a GraphicsPath object.  
	LOCAL loPath as xfcGraphicsPath
	loPath = .Drawing2D.GraphicsPath.New()

	* Add the string in the chosen style.  
	loPath.AddString(Thisform.TxtText.Value, ;
		.FontFamily.New(Thisform.TxtFontName.Value), ;
		loStyle, ;
		Thisform.TxtFontSize.Value, ;
		.Point.New(0, 0))

	* Using a suitable pen...
	LOCAL loPen as xfcPen
	loPen = .Pen.New(.Color.FromRGB(Thisform.Shape2.BackColor),This.Parent.Spinner1.Value)

	* Choose an appropriate smoothing mode for the border.
	This.oGfx.SmoothingMode = .Drawing2D.SmoothingMode.AntiAlias

	* Draw around the outline of the path
	This.oGfx.DrawPath(loPen, loPath)

	* Redraw the original text 
	This.oGfx.FillPath(.SolidBrush.New(.Color.FromRGB(Thisform.Shape1.BackColor)), loPath)

ENDWITH
RETURN
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         ����    �   �                         ƀ   %   �       �      �           �  U  (  T�  � �C�  � f�� ��C� � � �� U  THIS VALUE THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 Q2                       M       )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Valid,     ��1 2                       -       )   �                        {���    b  b                        ��   %   �                      �  U  y  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� U  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW Click,     ��1 � ���2                       �       )   b                        Form1      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 216
TabIndex = 1
Top = 36
Width = 468
Name = "txtText"
      vPROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()

ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND2 CLICK Click,     ��1 1                       +       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Label3      commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      yPROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()

ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         label      label      Form1      Spinner1      commandbutton      commandbutton      Command2      Form1      wTop = 144
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Shadow Color"
TabIndex = 3
Name = "Command2"
      yPROCEDURE Click
Thisform.Shape2.BackColor = GETCOLOR(Thisform.Shape2.BackColor)
Thisform.Imgcanvas1.Draw()

ENDPROC
     ���    �   �                         �f   %   �       �      �           �  U  /  T�  � � �C�  � � ��� ��C�  � � �� U  THISFORM SHAPE2	 BACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 �2                       n       )   �                         shape      shape      Shape1      Form1      ZTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 255,255,255
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      xAutoSize = .T.
Caption = "Border Width"
Height = 17
Left = 12
Top = 192
Width = 73
TabIndex = 5
Name = "Label3"
      BPROCEDURE InteractiveChange
Thisform.Imgcanvas1.Draw()
ENDPROC
      spinner      shape      shape      Shape2      Form1      YTop = 144
Left = 132
Height = 25
Width = 25
BackColor = 255,128,64
Name = "Shape2"
      6PROCEDURE Click
This.Parent.Command2.Click
ENDPROC
      �Height = 24
KeyboardHighValue = 20
KeyboardLowValue = 1
Left = 96
SpinnerHighValue =  20.00
SpinnerLowValue =   1.00
Top = 192
Width = 60
Value = 4
Name = "Spinner1"
      spinner      Form1      TxtFontStyle      label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 216
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
      �PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()

ENDPROC
     ���    �   �                         �f   %   �       �      �           �  U  /  T�  � � �C�  � � ��� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW Click,     ��1 �2                       n       )   �                         XPROCEDURE Valid
This.Value = UPPER(This.Value)
Thisform.Imgcanvas1.Draw()

ENDPROC
      textbox      textbox      textbox      TxtFontSize      Form1      nAlignment = 3
Value = 48
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      8PROCEDURE Valid
Thisform.Imgcanvas1.Draw()

ENDPROC
      `Value = BI
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      textbox     ���    �   �                         �   %   �       �      �           �  U  '  ��  � �	 ��C��� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 � � 2                       k       )   �                        Y���    @  @                        �J   %   �      �     �          �  U   ��  Q� XFCFONT� ���9� � ���� ��C�� � � � �� �� � T� �� �	 �
 �� H�_ �� � �� � B��� � T� ��� � �� �� � I��� � T� ��� � �� �� � BI��� � T� ��� � �� 2�� � T� ��� � �� � �� Q� XFCGRAPHICSPATH� T� �C�� � � ��B ��C� � �
 C� � �
 �� �  � � � �
 C� � �� � � � �� �� Q� XFCPEN�/ T� �CC� � � �� � � �  �! �
 �� � �� T� �" �# ��� �# �$ �� ��C �  � � �" �% ��- ��CCC� �( � �� � ��' �  � � �" �& �� �� B� U)  LOFONT SYSTEM DRAWING THIS CLEAR COLOR WHITE LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR LOPATH	 DRAWING2D GRAPHICSPATH NEW	 ADDSTRING TXTTEXT
 FONTFAMILY TXTFONTNAME TXTFONTSIZE POINT LOPEN PEN FROMRGB SHAPE2	 BACKCOLOR PARENT SPINNER1 OGFX SMOOTHINGMODE	 ANTIALIAS DRAWPATH FILLPATH
 SOLIDBRUSH SHAPE1
 beforedraw,     ��1 !"Ar 1� !!1� A �Q'����B A 1                       �      )   @                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923479122�      �  �      �                              �                           WINDOWS _1TP0L3VWK 897879881�      +  =  J      �  �>                                               WINDOWS _1U40L3TVH 897878416�      �  �  �  �      V  u9                                               WINDOWS _1TP0L3VWK 886790211'      <  Q  a  n      �  H8                                               WINDOWS _1YI061BSA 897880928�      �  �  �  �      ~  .                                               WINDOWS _1TP0L3VWK 897878416H      U  b  p  }      �  �                                               WINDOWS _1YI061BSB 897880928�          "  /      �                                                 WINDOWS _1TP0L3VWK 897778224�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 897878416h      w  �  �  �        ,$                                               WINDOWS _1YI1FCYOZ 898777130h      }  �  �  �      $   �6                                               WINDOWS _1YI1FCYP0 897878416#      +#  :#  M#  Z#      �#  [!                                               WINDOWS _1YI1FCYP1 897878416(%      7%  F%  Z%  g%      �%  l                                               WINDOWS _1TP0L3VWK 897879882('      5'  B'  P'  ]'                                                           WINDOWS _1TP0L3VWK 897879882�'      �'  (  (  (                                                           WINDOWS _1TP0L3VWK 897879804�(      �(  �(  �(  �(      �)                                                 WINDOWS _1YK10VTE2 897878416�*      �*  �*  +  +                                                           WINDOWS _1YK112IBN 899091131�+      �+  �+  �+  �+      �,  �                                               WINDOWS _1YK112IBO 899091131{-      n-  `-  '  �-                                                           WINDOWS _1TP0L3VWK 897880928#  '  �"  �"  �"  m*      C/  �2                                               WINDOWS _1YK12IPBA 897880928�"      �"  :  -  �,                                                           WINDOWS _1YK134XUZ 897880928        �  �  �)      �&  �                                               WINDOWS _1YK134XV0 923479122�      ~  p    *&                                                           WINDOWS _1YK134XV1 898777099	  �  �  z  m  W"      �:  F                                               COMMENT RESERVED                                D                                                            B�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 10
Left = 2
Height = 419
Width = 674
DoCreate = .T.
Caption = "Text with Different Brushes"
mode = 0
_memberdata =      528<?xml version="1.0"     encoding="Windows-1252" standalone="yes" ?>     

<VFPData>

<memberdata name="foomethod" type="method"     display="fooMethod"     favorites="True"/>

<memberdata name="Form1" type="property" display="Form1" favorites="True"/>

<memberdata name="_memberdata" type="property" display="_MemberData" favorites="True"/>

<memberdata name="baseclass" type="property" display="BaseClasS" favorites="True"/>

<memberdata name="error" type="method" display="eRRor" favorites="True"/>

</VFPData>

Name = "Form1"
      <mode
_memberdata XML Metadata for customizable properties
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      fAnchor = 15
Height = 60
Left = 240
Top = 108
Width = 420
smoothingmode = 0
Name = "Imgcanvas1"
     �PROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/columns/dotnettips/article.php/c8441/

LOCAL loFont AS xfcFont
LOCAL loBrush AS xfcLinearGradientBrush
LOCAL loRectangleF As xfcRectangleF
LOCAL loSizeF AS xfcSizeF

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)

	loSizeF = This.oGfx.MeasureString(Thisform.TxtText.Value, loFont)
	loRectangleF = _screen.system.Drawing.RectangleF.New(0,0,loSizeF.Width, loSizeF.Height)
	
	loBrush = .Drawing2D.LinearGradientBrush.New(loRectangleF,;
		.Color.FromRGB(Thisform.Shape1.BackColor), ;
		.Color.FromRGB(Thisform.Shape2.BackColor),;
		Thisform.SpnGradMode.Value)

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		loBrush, loRectangleF)

ENDWITH
RETURN
ENDPROC
     ����    �  �                        f�   %   D      �     X          �  U  � ��  � T�  �� � � � �� %�C�  �� C�  0
��] �# R,�� No picture was selected !�� B� � �� Q� XFCFONT� �� Q� XFCTEXTUREBRUSH� ���9� � ���� ��C� �	 �� ��
 � T�
 �� � � �� H�� �V� ��
 � B��� � T� ��� � �� ��
 � I��� T� ��� � �� ��
 � BI��=� T� ��� � �� 2�V� T� ��� � �� �( T� �C� � � � � �  � �� � �� T� �� � � �� T� �CC �  �� � �� � ��' ��C� � �  �  � � �  � � � �� �� B� U! 	 LCPICTURE THIS PARENT IMAGE1 PICTURE LOFONT LOBRUSH SYSTEM DRAWING CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE LNSTYLE SPNHATCH TEXTUREBRUSH IMAGE FROMFILE OGFX
 DRAWSTRING TXTTEXT	 RECTANGLE
 beforedraw,     ��1 t a�1A A "�"� r 1� !!1� A �1�sB A 1                       �      )   �                        !Arial, 0, 9, 5, 15, 12, 32, 3, 0
      Form1      
Imgcanvas3      image      textbox      textbox      txtText      Form1      {Anchor = 131
Value = GdiPlus-X is Cool !
Height = 25
Left = 240
TabIndex = 1
Top = 36
Width = 420
Name = "txtText"
      �PROCEDURE InteractiveChange
LPARAMETERS nKeyCode, nShiftAltCtrl
DODEFAULT()
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         �   %   �       �      �           �  U  &  T�  � � �C��� ��C�  � � �� U  THISFORM IMAGE1 PICTURE
 IMGCANVAS3 DRAW Click,     ��1 11                       P       )   �                         ..\gdiplusx.vcx      	imgcanvas      Form1      commandbutton      commandbutton      Command1      Form1      uTop = 108
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Main Color"
TabIndex = 4
Name = "Command1"
      �PROCEDURE Click
Thisform.Shape1.BackColor = GETCOLOR(Thisform.Shape1.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW InteractiveChange,     ��1 1                       7       )   �                         Image1      image      image      Form1      Command3      commandbutton      commandbutton      Command2      Form1      zTop = 132
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Secondary Color"
TabIndex = 3
Name = "Command2"
      �PROCEDURE Click
Thisform.Shape2.BackColor = GETCOLOR(Thisform.Shape2.BackColor)
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
ENDPROC
      ����    �   �                         �N   %   _       �      z           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS2 DRAW InteractiveChange,     ��1 1                       7       )   �                         commandbutton      commandbutton      Form1      Label6      shape      shape      Shape1      Form1      VTop = 108
Left = 132
Height = 25
Width = 25
BackColor = 0,0,128
Name = "Shape1"
      6PROCEDURE Click
This.Parent.Command1.Click
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND2 CLICK Click,     ��1 1                       +       )   �                         shape      shape      Shape2      Form1      YTop = 132
Left = 132
Height = 25
Width = 25
BackColor = 255,128,64
Name = "Shape2"
      6PROCEDURE Click
This.Parent.Command2.Click
ENDPROC
      ����    �   �                         ��   %   b       w      q           �  U    ��  � � � � U  THIS PARENT COMMAND1 CLICK Click,     ��1 1                       +       )   �                         label      label      Label1      Form1      |AutoSize = .T.
Caption = "Enter text below"
Height = 17
Left = 240
Top = 12
Width = 88
TabIndex = 5
Name = "Label1"
      textbox      textbox      TxtFontName      Form1      bValue = Arial
Height = 25
Left = 12
TabIndex = 4
Top = 48
Width = 108
Name = "TxtFontName"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         commandbutton      commandbutton      
cmdGetFont      Form1      kTop = 12
Left = 12
Height = 25
Width = 108
Caption = "Choose Font"
TabIndex = 3
Name = "cmdGetFont"
     /PROCEDURE Click
lcFont = GETFONT()
Thisform.TxtFontName.Value = GETWORDNUM(lcFont,1,',')
Thisform.TxtFontSize.Value = VAL(GETWORDNUM(lcFont,2,','))
Thisform.TxtFontStyle.Value = GETWORDNUM(lcFont,3,',')
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()
Thisform.Imgcanvas3.Draw()

ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         fAnchor = 15
Height = 60
Left = 240
Top = 348
Width = 420
smoothingmode = 0
Name = "Imgcanvas3"
      label      label      Form1      
Imgcanvas2      image      	imgcanvas      textbox      textbox      TxtFontSize      Form1      nAlignment = 3
Value = 24
Height = 25
Left = 132
TabIndex = 5
Top = 48
Width = 30
Name = "TxtFontSize"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      ����    �   �                         �@   %   {       �      �           �  U  #  ��C�  � � �� ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 Valid,     ��1 2                       I       )   �                         textbox      textbox      TxtFontStyle      Form1      _Value = B
Height = 25
Left = 168
TabIndex = 6
Top = 48
Width = 24
Name = "TxtFontStyle"
      TPROCEDURE Valid
Thisform.Imgcanvas1.Draw()
Thisform.Imgcanvas2.Draw()

ENDPROC
      oPicture = image\foxprologo2.png
Stretch = 1
Height = 60
Left = 132
Top = 348
Width = 72
Name = "Image1"
      [PROCEDURE Click
Thisform.Image1.Picture = GETPICT()
Thisform.Imgcanvas3.Draw()
ENDPROC
      ..\gdiplusx.vcx      Form1      label      label      Label2      Form1      �AutoSize = .T.
Caption = "Linear Gradient Brush"
Height = 17
Left = 240
Top = 84
Width = 123
TabIndex = 5
Name = "Label2"
      label      label      Label3      Form1      xAutoSize = .T.
Caption = "Hatch Brush"
Height = 17
Left = 240
Top = 204
Width = 70
TabIndex = 5
Name = "Label3"
      spinner      spinner      SpnHatch      Form1      �Height = 24
Increment =   1.00
KeyboardHighValue = 52
KeyboardLowValue = 0
Left = 132
SpinnerHighValue =  52.00
SpinnerLowValue =   0.00
Top = 228
Width = 48
Value = 21
Name = "SpnHatch"
      BPROCEDURE InteractiveChange
Thisform.Imgcanvas2.Draw()
ENDPROC
      vTop = 348
Left = 12
Height = 25
Width = 108
Anchor = 1
Caption = "Get Picture"
TabIndex = 4
Name = "Command3"
      fAnchor = 15
Height = 60
Left = 240
Top = 228
Width = 420
smoothingmode = 0
Name = "Imgcanvas2"
      label      label      Label4      Form1      wAutoSize = .T.
Caption = "Hatch Brush"
Height = 17
Left = 48
Top = 228
Width = 70
TabIndex = 5
Name = "Label4"
      spinner      spinner      SpnGradMode      Form1      �Anchor = 3
Height = 25
KeyboardHighValue = 3
KeyboardLowValue = 0
Left = 132
SpinnerHighValue =   3.00
SpinnerLowValue =   0.00
Top = 168
Width = 36
Value = 0
Name = "SpnGradMode"
      BPROCEDURE InteractiveChange
Thisform.imgcanvas1.Draw()
ENDPROC
      zAutoSize = .T.
Caption = "Texture Brush"
Height = 17
Left = 240
Top = 324
Width = 78
TabIndex = 5
Name = "Label6"
      Label5      label      label      �AutoSize = .T.
Anchor = 3
BackStyle = 0
Caption = "Gradient Mode"
Height = 17
Left = 36
Top = 168
Width = 82
Name = "Label5"
     %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE2	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          �PROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/columns/dotnettips/article.php/c8441/

LOCAL loFont AS xfcFont
LOCAL loBrush AS xfcHatchBrush

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)
	lnStyle = Thisform.SpnHatch.Value
	loBrush = .Drawing2D.HatchBrush.New(lnStyle, ;
		.Color.FromRGB(Thisform.Shape2.BackColor), ;
		.Color.FromRGB(Thisform.Shape1.BackColor))

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		loBrush, This.Rectangle)

ENDWITH
RETURN
ENDPROC
     ����    �  �                        �O   %   �      A               �  U  � ��  Q� XFCFONT� �� Q� XFCHATCHBRUSH� ���9� � ���� ��C� � �� �� � T� �� � �	 �� H�p �� � �� � B��� � T�
 ��� � �� �� � I��� � T�
 ��� � �� �� � BI��� � T�
 ��� � �� 2�� � T�
 ��� � �� �( T�  �C� � �	 � � �	  �
 �� � �� T� �� � �	 ��; T� �C � C� � � �� � C� � � �� � �� � � ��' ��C� � �	  �   � � �  � � � �� �� B� U!  LOFONT LOBRUSH SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE LNSTYLE SPNHATCH	 DRAWING2D
 HATCHBRUSH COLOR FROMRGB SHAPE2	 BACKCOLOR SHAPE1 OGFX
 DRAWSTRING TXTTEXT	 RECTANGLE
 beforedraw,     ��1 $�"� r 1� !!1� A �1�sB A 1                       �      )   �                       ����    �  �                        A�   %   4      U  	   C          �  U  �  T�  �C�'�� T� � � �C�  �� ,���� T� � � �CC�  �� ,��g�� T� � � �C�  �� ,���� ��C� � � �� ��C� � � �� ��C� �	 � �� U
  LCFONT THISFORM TXTFONTNAME VALUE TXTFONTSIZE TXTFONTSTYLE
 IMGCANVAS1 DRAW
 IMGCANVAS2
 IMGCANVAS3 Click,     ��1 � ���2                       $      )   �                       %���                              ��   %   �       �      �           �  U  ?  T�  � � �C�  � � ��� ��C�  � � �� ��C�  � � �� U  THISFORM SHAPE1	 BACKCOLOR
 IMGCANVAS1 DRAW
 IMGCANVAS2 Click,     ��1 �1                       �       )                          1���                              ��   %   �       �      �           �  U  7  ��  � �	 ��C��� ��C� � � �� ��C� � � �� U  NKEYCODE NSHIFTALTCTRL THISFORM
 IMGCANVAS1 DRAW
 IMGCANVAS2 InteractiveChange,     ��1 � � 1                       �       )                          �PROCEDURE beforedraw
*!*	Based on Tom Archer's article at CodeGuru.com
*!*	http://www.codeguru.com/columns/dotnettips/article.php/c8441/

LOCAL lcPicture
lcPicture = This.Parent.Image1.Picture
IF EMPTY(lcPicture) OR NOT FILE(lcPicture)
	WAIT WINDOW "No picture was selected !"
	RETURN
ENDIF

LOCAL loFont AS xfcFont
LOCAL loBrush AS xfcTextureBrush

WITH _SCREEN.SYSTEM.Drawing
	This.Clear()

	LOCAL lcStyle
	lcStyle = Thisform.TxtFontStyle.Value
	DO CASE
	CASE lcStyle == "B"
		loStyle = .FontStyle.Bold 
	CASE lcStyle == "I"
		loStyle = .FontStyle.Italic
	CASE lcStyle == "BI"
		loStyle = .FontStyle.BoldItalic
	OTHERWISE  
		loStyle = .FontStyle.Regular
	ENDCASE
	
	loFont = .Font.New(Thisform.TxtFontName.Value, Thisform.TxtFontSize.Value, loStyle)
	lnStyle = Thisform.SpnHatch.Value
	loBrush = .TextureBrush.New(.Image.FromFile(lcPicture))

	This.oGfx.DrawString(Thisform.TxtText.Value, loFont, ;
		loBrush, This.Rectangle)

ENDWITH
RETURN
ENDPROC
     V���    =  =                        U   %   �      �     �          �  U   ��  Q� XFCFONT�! �� Q� XFCLINEARGRADIENTBRUSH� �� Q� XFCRECTANGLEF� �� Q� XFCSIZEF� ���9� � ��� ��C� � �� �� � T� ��	 �
 � �� H�� �'� �� � B��� � T� ��� � �� �� � I��� � T� ��� � �� �� � BI��� T� ��� � �� 2�'� T� ��� � �� �( T�  �C�	 � � �	 � �  � �� � ��! T� �C�	 � �  �  � � � ��+ T� �C� � � � � � �9� � � � ��D T� �C � C�	 �  �! �� � C�	 �" �! �� � �	 �# � �� � � ��% ��C�	 � �  �   �  � � � �$ �� �� B� U%  LOFONT LOBRUSH LORECTANGLEF LOSIZEF SYSTEM DRAWING THIS CLEAR LCSTYLE THISFORM TXTFONTSTYLE VALUE LOSTYLE	 FONTSTYLE BOLD ITALIC
 BOLDITALIC REGULAR FONT NEW TXTFONTNAME TXTFONTSIZE OGFX MEASURESTRING TXTTEXT
 RECTANGLEF WIDTH HEIGHT	 DRAWING2D LINEARGRADIENTBRUSH COLOR FROMRGB SHAPE1	 BACKCOLOR SHAPE2 SPNGRADMODE
 DRAWSTRING
 beforedraw,     ��1 $�1"� r 1� !!1� A ��ESB A 1                       {      )   =                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _1XX15WLPC 896248181c*  �"  �"  Q*      �0  �*  �"  `          �*  w*  @*          �*               COMMENT RESERVED                        �*                                                                   WINDOWS _1XX19B579 896248289�*  �0  |0  	+      �/      .  k          �*  �*              �*               COMMENT RESERVED                        �*                                                                   WINDOWS _1XX19ONU7 896248459<D  �D  �D  PD      dD                      &D  3D              D               COMMENT RESERVED                        D                                                                   WINDOWS _1XX19RNDN 896248536�G  �F  �F  �G      G                      �G  �G              �G               COMMENT RESERVED                        �G                                                                   WINDOWS _1XX19UWG3 896248644cJ  ^K  OK  wJ      �J      �J  �          MJ  ZJ              ?J               COMMENT RESERVED                        2J                                                                   WINDOWS _1XX1A0BCN 896248861�G  J  �F   H      wK  �-  H  �           .  �F  G          �-               COMMENT RESERVED                        �-                                                                   WINDOWS _1XX1AAFPS 896248994�,  �-  �-  �,      -      �,            �,  7*              �,               COMMENT RESERVED                        q,                                                                   WINDOWS _1XX1ADRKF 896249395�)  *  *  �)      |_      �D  �          �)  �)  �)          �)               COMMENT RESERVED                        n)                                                                   WINDOWS _1XX1AU0FI 896249467�!  �"  x"  �!      �!                      �!  �!              �!               COMMENT RESERVED                        �!                                                                   WINDOWS _1XX11GSFY 896250378�       �!  �       4:  �  �U  h          �   �   +          �                WINDOWS _1XX17LRME 896250358x!  d!  W!  D!  0!  �       &                                                 COMMENT RESERVED                        {                                                                    i�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00     H���    /  /                        t[   %   �      �     p          �  U  6  ��  � � � �  ��C �   �  �  � � � � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS PARENT	 MOUSEDOWN6  ��  � � � �  ��C �   �  �  � � � � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS PARENT
 MOUSEENTER6  ��  � � � �  ��C �   �  �  � � � � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS PARENT
 MOUSELEAVE6  ��  � � � �  ��C �   �  �  � � � � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS PARENT	 MOUSEMOVE6  ��  � � � �  ��C �   �  �  � � � � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS PARENT MOUSEUP6  ��  � � � �  ��C �  �  �  � � � � �� U 
 NDIRECTION NSHIFT NXCOORD NYCOORD THIS PARENT
 MOUSEWHEEL NBUTTON	 MouseDown,     ��
 MouseEnter�     ��
 MouseLeave    ��	 MouseMove�    �� MouseUp    ��
 MouseWheelz    ��1 13 13 13 13 13 12                       �         �           .  �     
   �  %        C  �        �  <      )   /                       Y���    @  @                        �   %   Z      
  G   �	          �  U  *  T�  � �-�� ��C�	 LostFocus�  � �� U  THIS LFOCUSED CHANGESTATE=  ��  � � � � T� � �a�� ��C�	 MouseDown� � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LPRESSED CHANGESTATE>  ��  � � � � T� � �a�� ��C�
 MouseEnter� � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LHOT CHANGESTATE>  ��  � � � � T� � �-�� ��C�
 MouseLeave� � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LHOT CHANGESTATE;  ��  � � � � T� � �-�� ��C� MouseUp� � �� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LPRESSED CHANGESTATE  ��  � � � � U  NBUTTON NSHIFT NXCOORD NYCOORD  ��  � � � � U 
 NDIRECTION NSHIFT NXCOORD NYCOORD8  ��  �. ��CC� � � � Enable�
 � Disable6� � �� U  LENABLED THIS CHANGESTATE ENABLED�  ��  Q� STRING� H� �� � �� � 
��B � ��C ��  � � �� �� � ��e � ��C ��  � � �� �� � ��� � ��C ��  � � �� �� � ��� � ��C ��  � �	 �� 2�� � ��C ��  � �
 �� � U  CEVENT THIS ENABLED DRAWDISABLED LPRESSED DRAWPRESSED LHOT DRAWHOT LFOCUSED DRAWFOCUSED
 DRAWNORMAL'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE� T�  � � ��  � �� T�  � � ��  � �� T�  � � ����" T�  � � �C�  � �  ���� T�  � � ��  � ��) ��C�  �	 MouseDown�  � OnMouseDown��% ��C�  � MouseUp�  �	 OnMouseUp��+ ��C�  �
 MouseEnter�  � OnMouseEnter��+ ��C�  �
 MouseLeave�  � OnMouseLeave��) ��C�  �	 MouseMove�  � OnMouseMove��+ ��C�  �
 MouseWheel�  � OnMouseWheel��' ��C�  � GotFocus�  �
 OnGotFocus��) ��C�  �	 LostFocus�  � OnLostFocus��( ��C�  � Enabled�  �	 OnEnabled��� U  THIS OTHEMEIMAGE WIDTH HEIGHT ANCHOR
 THEMECLASS	 THEMEPART onlostfocus,     �� onmousedownw     �� onmouseenter�     �� onmouseleavev    ��	 onmouseup�    �� onmousemoves    �� onmousewheel�    ��	 onenabled�    �� changestateR    �� drawdisabled�    �� drawpressed�    �� drawhot5    �� drawfocused�    ��
 drawnormal�    �� Init+    ��1 � �2 1� �2 1� �2 1� �2 1� r2 14 14 q �3 � 2222� 2B 3 23 23 23 23 23 ba1"b�Q����q��2                       M         o   �         �   Y        |  �        �  a        �  �  #      �  H  (      h  �  -      �  &  3   )   I  �  P   ,   �  �  V   /     L  \   2   n  �  b   5   �    h   8   ,  �	  n    )   @                       F���    -  -                        M   %   a      �     �          �  U  v  ��  � %���  ��) � T� � � ���� �D � T� � � ���� � T� � � �� � � �� T� �  ���  �� U 	 LEXPANDED THIS OTHEMEIMAGE	 THEMEPART
 THEMESTATE*  ��  � � � � T� � �� � 
�� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS	 LEXPANDED  ��  Q� STRING� �� U  CEVENT lexpanded_assign,     ��	 onmouseup�     �� drawdisabled=    ��1 q � 2� 2B �"4 1B3 B 1                       �      
     s        �  �      )   -                        ����    �   �                         �e   %   P       n      f           �  U    ��  Q� STRING� �� U  CEVENT drawdisabled,     ��1 B 1                       B       )   �                        ����    �  �                        ԰   %   �           �          �  U  C  ��  � � � � T� � �� � 
�� ��C �   �  �  � ��� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LCHECKEDV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LCHECKED OTHEMEIMAGE
 THEMESTATEV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LCHECKED OTHEMEIMAGE
 THEMESTATE	 onmouseup,     �� drawhot�     ��
 drawnormal1    ��1 1B�3 2� 2B 2 2� 2B 1                       �         �   B  	      c  �      )   �                        ����    �   �                         �e   %   P       n      f           �  U    ��  Q� STRING� �� U  CEVENT drawdisabled,     ��1 B 1                       B       )   �                        ����    �  �                        $F   %   �      K     +          �  U  '  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE'  ��  Q� STRING� T� � � ���� U  CEVENT THIS OTHEMEIMAGE
 THEMESTATE drawdisabled,     �� drawpressed~     �� drawhot�     �� drawfocused"    ��
 drawnormalt    ��1 23 22 23 23 22                       Y         {   �         �        
   ;  |        �  �      )   �                       ���    �  �                        !�   %   �      q  !   /          �  U  C  ��  � � � � T� � �� � 
�� ��C �   �  �  � ��� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS LPINNEDV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LPINNED OTHEMEIMAGE
 THEMESTATEV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LPINNED OTHEMEIMAGE
 THEMESTATEV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LPINNED OTHEMEIMAGE
 THEMESTATEV  ��  Q� STRING� %�� � ��4 � T� � � ���� �O � T� � � ���� � U  CEVENT THIS LPINNED OTHEMEIMAGE
 THEMESTATE	 onmouseup,     ��
 drawnormal�     �� drawfocused/    �� drawhot�    �� drawpressedC    ��1 1B�2 2� 2B 2 2� 2B 2 2� 2B 2 2� 2B 1                       �         �   @        b  �          �  "      �  D  /    )   �                        ctlthemebase      �ldisabled
lhot
lpressed
lfocused
themeclass
themepart
onlostfocus
onmousedown
onmouseenter
onmouseleave
onmouseup
onmousemove
onmousewheel
onenabled
ongotfocus
changestate
drawdisabled
drawpressed
drawhot
drawfocused
drawnormal
      Pixels      Class      2      control      ctlthemebase      QBackStyle = 0
Height = 75
Left = 0
Top = 0
Width = 75
Name = "oThemeImage"
      ctlthemebase      oThemeImage      image      gdiplusx.vcx      imgthemebase      control      combobutton      Pixels      Class      1      ctlthemebase      combobutton      wWidth = 15
Height = 16
themeclass = COMBOBOX
themepart = 1
Name = "combobutton"
oThemeImage.Name = "oThemeImage"
      control      themecontrols.vcx      themecontrols.vcx      control     OPROCEDURE onmouseup
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lPinned = not THIS.lPinned

DODEFAULT(nButton, nShift, nXCoord, nYCoord)
ENDPROC
PROCEDURE drawnormal
LPARAMETERS cEvent AS STRING

IF THIS.lPinned

  THIS.oThemeImage.Themestate = 4

ELSE

  THIS.oThemeImage.Themestate = 1

ENDIF
ENDPROC
PROCEDURE drawfocused
LPARAMETERS cEvent AS STRING

IF THIS.lPinned
  
  THIS.oThemeImage.Themestate = 5
  
ELSE

  THIS.oThemeImage.Themestate = 2

ENDIF
ENDPROC
PROCEDURE drawhot
LPARAMETERS cEvent AS STRING

IF THIS.lPinned

  THIS.oThemeImage.Themestate = 5

ELSE

  THIS.oThemeImage.Themestate = 2

ENDIF
ENDPROC
PROCEDURE drawpressed
LPARAMETERS cEvent AS STRING

IF THIS.lPinned

  THIS.oThemeImage.Themestate = 6

ELSE

  THIS.oThemeImage.Themestate = 3

ENDIF
ENDPROC
     GPROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSEDOWN(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE MouseEnter
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSEENTER(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSELEAVE(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSEMOVE(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE MouseUp
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSEUP(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE MouseWheel
LPARAMETERS nDirection, nShift, nXCoord, nYCoord

THIS.PARENT.MOUSEWHEEL(nButton, nShift, nXCoord, nYCoord)

ENDPROC
      groupexpandcollapsebutton      Pixels      Class      1      ctlthemebase      groupexpandcollapsebutton      lexpanded
*lexpanded_assign 
      control      themecontrols.vcx      1      	lpinned
      
pushbutton      ctlthemebase      1      Class      Pixels      	Enabled
      
pushbutton      closebutton      Pixels      Class      1      ctlthemebase      closebutton     M_memberdata XML Metadata for customizable properties
ldisabled
lhot
lpressed
lfocused
themeclass
themepart
*onlostfocus 
*onmousedown 
*onmouseenter 
*onmouseleave 
*onmouseup 
*onmousemove 
*onmousewheel 
*onenabled 
*ongotfocus 
*changestate 
*drawdisabled 
*drawpressed 
*drawhot 
*drawfocused 
*drawnormal 
      iemenubutton      Pixels      Class      ctlthemebase      iemenubutton      MPROCEDURE drawdisabled
LPARAMETERS cEvent AS STRING

NODEFAULT 
ENDPROC
      {Width = 19
Height = 19
themeclass = EXPLORERBAR
themepart = 4
Name = "iemenubutton"
oThemeImage.Name = "oThemeImage"
      control      themecontrols.vcx      tbdropdownbutton      
lchecked
      Pixels      Class     �PROCEDURE drawdisabled
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 4

ENDPROC
PROCEDURE drawpressed
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 3
ENDPROC
PROCEDURE drawhot
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 2

ENDPROC
PROCEDURE drawfocused
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 2

ENDPROC
PROCEDURE drawnormal
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 1

ENDPROC
      vWidth = 21
Height = 21
themeclass = WINDOW
themepart = 18
Name = "closebutton"
oThemeImage.Name = "oThemeImage"
      control      themecontrols.vcx     	�Width = 16
Height = 16
lpinned = .F.
_memberdata =     1763<VFPData><memberdata name="onmousedown" type="property" display="OnMouseDown"/><memberdata name="onmouseenter" type="property" display="OnMouseEnter"/><memberdata name="onmouseleave" type="property" display="OnMouseLeave"/><memberdata name="onmouseup" type="property" display="OnMouseUp"/><memberdata name="onmousemove" type="property" display="OnMouseMove"/><memberdata name="onmousewheel" type="property" display="OnMouseWheel"/><memberdata name="onlostfocus" type="method" display="OnLostFocus"/><memberdata name="onmousedown" type="method" display="OnMouseDown"/><memberdata name="onmouseenter" type="method" display="OnMouseEnter"/><memberdata name="onmouseleave" type="method" display="OnMouseLeave"/><memberdata name="onmouseup" type="method" display="OnMouseUp"/><memberdata name="onmousemove" type="method" display="OnMouseMove"/><memberdata name="onmousewheel" type="method" display="OnMouseWheel"/><memberdata name="onenabled" type="method" display="OnEnabled"/><memberdata name="ongotfocus" type="method" display="OnGotFocus"/><memberdata name="changestate" type="method" display="ChangeState"/><memberdata name="ldisabled" type="property" display="lDisabled"/><memberdata name="lhot" type="property" display="lHot"/><memberdata name="lpressed" type="property" display="lPressed"/><memberdata name="lfocused" type="property" display="lFocused"/><memberdata name="drawdisabled" type="method" display="DrawDisabled"/><memberdata name="drawpressed" type="method" display="DrawPressed"/><memberdata name="drawhot" type="method" display="DrawHot"/><memberdata name="drawfocused" type="method" display="DrawFocused"/><memberdata name="drawnormal" type="method" display="DrawNormal"/><memberdata name="lpinned" type="property" display="lPinned"/></VFPData>

themeclass = EXPLORERBAR
themepart = 3
Name = "pushbutton"
oThemeImage.Name = "oThemeImage"
     	�BackStyle = 0
_memberdata =     1835<VFPData><memberdata name="onmousedown" type="property" display="OnMouseDown"/><memberdata name="onmouseenter" type="property" display="OnMouseEnter"/><memberdata name="onmouseleave" type="property" display="OnMouseLeave"/><memberdata name="onmouseup" type="property" display="OnMouseUp"/><memberdata name="onmousemove" type="property" display="OnMouseMove"/><memberdata name="onmousewheel" type="property" display="OnMouseWheel"/><memberdata name="onlostfocus" type="method" display="OnLostFocus"/><memberdata name="onmousedown" type="method" display="OnMouseDown"/><memberdata name="onmouseenter" type="method" display="OnMouseEnter"/><memberdata name="onmouseleave" type="method" display="OnMouseLeave"/><memberdata name="onmouseup" type="method" display="OnMouseUp"/><memberdata name="onmousemove" type="method" display="OnMouseMove"/><memberdata name="onmousewheel" type="method" display="OnMouseWheel"/><memberdata name="onenabled" type="method" display="OnEnabled"/><memberdata name="ongotfocus" type="method" display="OnGotFocus"/><memberdata name="changestate" type="method" display="ChangeState"/><memberdata name="ldisabled" type="property" display="lDisabled"/><memberdata name="lhot" type="property" display="lHot"/><memberdata name="lpressed" type="property" display="lPressed"/><memberdata name="lfocused" type="property" display="lFocused"/><memberdata name="drawdisabled" type="method" display="DrawDisabled"/><memberdata name="drawpressed" type="method" display="DrawPressed"/><memberdata name="drawhot" type="method" display="DrawHot"/><memberdata name="drawfocused" type="method" display="DrawFocused"/><memberdata name="drawnormal" type="method" display="DrawNormal"/><memberdata name="themeclass" type="property" display="ThemeClass"/><memberdata name="themepart" type="property" display="ThemePart"/></VFPData>

ldisabled = .F.
lhot = .F.
lpressed = .F.
lfocused = .F.
themeclass = 
themepart = 
Name = "ctlthemebase"
      pfbackground      Pixels      Class      1      imgthemebase      pfbackground      athemeclass = ( STRCONV("TAB" + 0h00, 5))
themepart = 10
themestate = 1
Name = "pfbackground"
      image      gdiplusx.vcx     �PROCEDURE lexpanded_assign
LPARAMETERS lExpanded

IF m.lExpanded

  THIS.oThemeImage.ThemePart = 7

ELSE

  THIS.oThemeImage.ThemePart = 6

ENDIF

THIS.oTHemeImage.ThemeState = THIS.oTHemeImage.ThemeState

THIS.lExpanded = m.lExpanded


ENDPROC
PROCEDURE onmouseup
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lExpanded = NOT THIS.lExpanded

ENDPROC
PROCEDURE drawdisabled
LPARAMETERS cEvent AS STRING

NODEFAULT 
ENDPROC
      1      control      themecontrols.vcx      control      
lchecked
      uWidth = 21
Height = 21
themeclass = WINDOW
themepart = 23
Name = "helpbutton"
oThemeImage.Name = "oThemeImage"
      
helpbutton      ctlthemebase      1      Class      Pixels      
helpbutton      ctlthemebase      tbdropdownbutton     �PROCEDURE onmouseup
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lChecked = NOT THIS.lChecked

DODEFAULT(nButton, nShift, nXCoord, nYCoord)

ENDPROC
PROCEDURE drawhot
LPARAMETERS cEvent AS STRING

IF THIS.lChecked

  THIS.oThemeImage.ThemeState = 6

ELSE

  THIS.oThemeImage.ThemeState = 2

ENDIF
ENDPROC
PROCEDURE drawnormal
LPARAMETERS cEvent AS STRING

IF THIS.lChecked

  THIS.oThemeImage.ThemeState = 5

ELSE

  THIS.oThemeImage.ThemeState = 1

ENDIF
ENDPROC
      themecontrols.vcx      rebar      Pixels      Class      1      ctlthemebase      rebar      MPROCEDURE drawdisabled
LPARAMETERS cEvent AS STRING

NODEFAULT 
ENDPROC
      nWidth = 20
Height = 23
themeclass = REBAR
themepart = 4
Name = "rebar"
oThemeImage.Name = "oThemeImage"
      control      themecontrols.vcx     
Width = 11
Height = 23
themeclass = TOOLBAR
themepart = 4
lchecked = .F.
_memberdata =     1899<VFPData><memberdata name="onmousedown" type="property" display="OnMouseDown"/><memberdata name="onmouseenter" type="property" display="OnMouseEnter"/><memberdata name="onmouseleave" type="property" display="OnMouseLeave"/><memberdata name="onmouseup" type="property" display="OnMouseUp"/><memberdata name="onmousemove" type="property" display="OnMouseMove"/><memberdata name="onmousewheel" type="property" display="OnMouseWheel"/><memberdata name="onlostfocus" type="method" display="OnLostFocus"/><memberdata name="onmousedown" type="method" display="OnMouseDown"/><memberdata name="onmouseenter" type="method" display="OnMouseEnter"/><memberdata name="onmouseleave" type="method" display="OnMouseLeave"/><memberdata name="onmouseup" type="method" display="OnMouseUp"/><memberdata name="onmousemove" type="method" display="OnMouseMove"/><memberdata name="onmousewheel" type="method" display="OnMouseWheel"/><memberdata name="onenabled" type="method" display="OnEnabled"/><memberdata name="ongotfocus" type="method" display="OnGotFocus"/><memberdata name="changestate" type="method" display="ChangeState"/><memberdata name="ldisabled" type="property" display="lDisabled"/><memberdata name="lhot" type="property" display="lHot"/><memberdata name="lpressed" type="property" display="lPressed"/><memberdata name="lfocused" type="property" display="lFocused"/><memberdata name="drawdisabled" type="method" display="DrawDisabled"/><memberdata name="drawpressed" type="method" display="DrawPressed"/><memberdata name="drawhot" type="method" display="DrawHot"/><memberdata name="drawfocused" type="method" display="DrawFocused"/><memberdata name="drawnormal" type="method" display="DrawNormal"/><memberdata name="themeclass" type="property" display="ThemeClass"/><memberdata name="themepart" type="property" display="ThemePart"/><memberdata name="lchecked" type="property" display="lChecked"/></VFPData>

Name = "tbdropdownbutton"
oThemeImage.Name = "oThemeImage"
     	�PROCEDURE onlostfocus

THIS.lFocused = .F.

THIS.ChangeState("LostFocus")
ENDPROC
PROCEDURE onmousedown
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lPressed = .T.

THIS.ChangeState("MouseDown")
ENDPROC
PROCEDURE onmouseenter
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lHot = .T.

THIS.ChangeState("MouseEnter")
ENDPROC
PROCEDURE onmouseleave
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lHot = .F.

THIS.ChangeState("MouseLeave")
ENDPROC
PROCEDURE onmouseup
LPARAMETERS nButton, nShift, nXCoord, nYCoord

THIS.lPressed = .F.

THIS.ChangeState("MouseUp")
ENDPROC
PROCEDURE onmousemove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

*THIS.ChangeState("MouseMove")
ENDPROC
PROCEDURE onmousewheel
LPARAMETERS nDirection, nShift, nXCoord, nYCoord

*THIS.ChangeState("MouseWheel")
ENDPROC
PROCEDURE onenabled
LPARAMETERS lEnabled

THIS.ChangeState(IIF(THIS.Enabled, "Enable", "Disable"))

ENDPROC
PROCEDURE changestate

LPARAMETERS cEvent AS STRING

DO CASE

  CASE NOT THIS.Enabled

    THIS.DrawDisabled(m.cEvent)

  CASE THIS.lPressed

    THIS.DrawPressed(m.cEvent)

  CASE THIS.lHot

    THIS.DrawHot(m.cEvent)

  CASE THIS.lFocused

    THIS.DrawFocused(m.cEvent)

  OTHERWISE

    THIS.DrawNormal(m.cEvent)

ENDCASE

ENDPROC
PROCEDURE drawdisabled
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 4

ENDPROC
PROCEDURE drawpressed
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 3

ENDPROC
PROCEDURE drawhot
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 2

ENDPROC
PROCEDURE drawfocused
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 2

ENDPROC
PROCEDURE drawnormal
LPARAMETERS cEvent AS STRING

THIS.oThemeImage.ThemeState = 1

ENDPROC
PROCEDURE Init

THIS.oThemeImage.WIDTH = THIS.WIDTH
THIS.oThemeImage.HEIGHT = THIS.HEIGHT
THIS.oThemeImage.ANCHOR = 15

THIS.oThemeImage.ThemeClass = STRCONV(THIS.ThemeClass + 0h00, 5)

THIS.oThemeImage.ThemePart = THIS.ThemePart

BINDEVENT(THIS, "MouseDown", THIS, "OnMouseDown")
BINDEVENT(THIS, "MouseUp", THIS, "OnMouseUp")
BINDEVENT(THIS, "MouseEnter", THIS, "OnMouseEnter")
BINDEVENT(THIS, "MouseLeave", THIS, "OnMouseLeave")
BINDEVENT(THIS, "MouseMove", THIS, "OnMouseMove")
BINDEVENT(THIS, "MouseWheel", THIS, "OnMouseWheel")
BINDEVENT(THIS, "GotFocus", THIS, "OnGotFocus")
BINDEVENT(THIS, "LostFocus", THIS, "OnLostFocus")
BINDEVENT(THIS, "Enabled", THIS, "OnEnabled", 1)

ENDPROC
     
#Width = 19
Height = 19
lexpanded = .F.
themeclass = EXPLORERBAR
themepart = 7
_memberdata =     1901<VFPData><memberdata name="onmousedown" type="property" display="OnMouseDown"/><memberdata name="onmouseenter" type="property" display="OnMouseEnter"/><memberdata name="onmouseleave" type="property" display="OnMouseLeave"/><memberdata name="onmouseup" type="property" display="OnMouseUp"/><memberdata name="onmousemove" type="property" display="OnMouseMove"/><memberdata name="onmousewheel" type="property" display="OnMouseWheel"/><memberdata name="onlostfocus" type="method" display="OnLostFocus"/><memberdata name="onmousedown" type="method" display="OnMouseDown"/><memberdata name="onmouseenter" type="method" display="OnMouseEnter"/><memberdata name="onmouseleave" type="method" display="OnMouseLeave"/><memberdata name="onmouseup" type="method" display="OnMouseUp"/><memberdata name="onmousemove" type="method" display="OnMouseMove"/><memberdata name="onmousewheel" type="method" display="OnMouseWheel"/><memberdata name="onenabled" type="method" display="OnEnabled"/><memberdata name="ongotfocus" type="method" display="OnGotFocus"/><memberdata name="changestate" type="method" display="ChangeState"/><memberdata name="ldisabled" type="property" display="lDisabled"/><memberdata name="lhot" type="property" display="lHot"/><memberdata name="lpressed" type="property" display="lPressed"/><memberdata name="lfocused" type="property" display="lFocused"/><memberdata name="drawdisabled" type="method" display="DrawDisabled"/><memberdata name="drawpressed" type="method" display="DrawPressed"/><memberdata name="drawhot" type="method" display="DrawHot"/><memberdata name="drawfocused" type="method" display="DrawFocused"/><memberdata name="drawnormal" type="method" display="DrawNormal"/><memberdata name="themeclass" type="property" display="ThemeClass"/><memberdata name="themepart" type="property" display="ThemePart"/><memberdata name="lexpanded" type="property" display="lExpanded"/></VFPData>

Name = "groupexpandcollapsebutton"
oThemeImage.Name = "oThemeImage"
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1XX1727SD 896245942      /  F      ]                          �      �                       WINDOWS _1XX1727SE 898895392�      �  �      �                                                           WINDOWS _1XX19QXD4 896250400K  _  x  �  �  �                                                           WINDOWS _1XX172HPR 896250576  #  <  K  ^  k                                                           WINDOWS _1XX19JWCK 896250576�  �  �  �                                                               WINDOWS _1XX19U1Y8 896250576v  �  �  �  �  �                                                           WINDOWS _1XX19YB79 896250576'  4  M  \  j  w                                                           WINDOWS _1XX1A7BSB 896250576�  �  �    !  .                                                           WINDOWS _1XX1ACAO5 896250576�  �  �  �  �  �                                                           WINDOWS _1XX1AMB9O 896250576A  b  {  �  �  �                                                           WINDOWS _1XX1AVEPC 896250576	  2	  K	  Z	  n	  {	                                                           WINDOWS _1XX1727SD 896250576�	      �	  �	  �	  
                                                           WINDOWS _1XX1B6JGV 896250576�
      �
  �
  �
  �
                                                           WINDOWS _1XX1B6JGW 896250576Y      f  s  �  �                                                           WINDOWS _1XX1B6JGX 896250576$      1  >  L  Y                                                           WINDOWS _1XX1B6JGY 896250576�      �                                                                 WINDOWS _1XX1B6JGZ 896250576�      �  �  �  �                                                           WINDOWS _1XX1B6JH0 896250576w      �  �  �  �                                                           WINDOWS _1XX1B6JH1 8962505765      B  O  ^  k                                                           WINDOWS _1XX1727SD 896250576�          *  7      �                                                 WINDOWS _1XX1B8ZYA 896250576|      �  �  �  �                                                           COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      NDoCreate = .T.
AutoCenter = .T.
Caption = "Theme Controls"
Name = "Form1"
      pfbackground      themecontrols.vcx      image      Pfbackground1      Form1      bAnchor = 15
Height = 250
Left = 0
Top = 0
Visible = .F.
Width = 375
Name = "Pfbackground1"
      
pushbutton      themecontrols.vcx      control      Pushbutton1      Form1      OTop = 180
Left = 324
Name = "Pushbutton1"
oThemeImage.Name = "oThemeImage"
      closebutton      themecontrols.vcx      control      Closebutton1      Form1      PTop = 108
Left = 132
Name = "Closebutton1"
oThemeImage.Name = "oThemeImage"
      
helpbutton      themecontrols.vcx      control      Helpbutton1      Form1      OTop = 144
Left = 132
Name = "Helpbutton1"
oThemeImage.Name = "oThemeImage"
      rebar      themecontrols.vcx      control      Rebar1      Form1      ITop = 36
Left = 324
Name = "Rebar1"
oThemeImage.Name = "oThemeImage"
      tbdropdownbutton      themecontrols.vcx      control      Tbdropdownbutton1      Form1      UTop = 144
Left = 324
Name = "Tbdropdownbutton1"
oThemeImage.Name = "oThemeImage"
      iemenubutton      themecontrols.vcx      control      Iemenubutton1      Form1      PTop = 72
Left = 324
Name = "Iemenubutton1"
oThemeImage.Name = "oThemeImage"
      groupexpandcollapsebutton      themecontrols.vcx      control      Groupexpandcollapsebutton1      Form1      ^Top = 108
Left = 324
Name = "Groupexpandcollapsebutton1"
oThemeImage.Name = "oThemeImage"
      combobutton      themecontrols.vcx      control      Combobutton1      Form1      OTop = 72
Left = 132
Name = "Combobutton1"
oThemeImage.Name = "oThemeImage"
      label      label      Label1      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "PushButton"
Height = 17
Left = 252
Top = 180
Width = 66
Name = "Label1"
      label      label      Label4      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "ComboButton"
Height = 17
Left = 48
Top = 72
Width = 78
Name = "Label4"
      label      label      Label5      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "TbDropDownButton"
Height = 17
Left = 208
Top = 144
Width = 110
Name = "Label5"
      label      label      Label6      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "CloseButton"
Height = 17
Left = 56
Top = 108
Width = 70
Name = "Label6"
      label      label      Label7      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "GroupExpandButton"
Height = 17
Left = 206
Top = 108
Width = 112
Name = "Label7"
      label      label      Label8      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "HelpButton"
Height = 17
Left = 63
Top = 144
Width = 63
Name = "Label8"
      label      label      Label9      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "Rebar"
Height = 17
Left = 282
Top = 36
Width = 36
Name = "Label9"
      label      label      Label10      Form1      �AutoSize = .T.
Alignment = 1
BackStyle = 0
Caption = "IeMenuButton"
Height = 17
Left = 241
Top = 72
Width = 77
Name = "Label10"
      checkbox      checkbox      Check1      Form1      �Top = 180
Left = 48
Height = 17
Width = 107
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "Enable Controls"
Value = 1
Name = "Check1"
     .PROCEDURE InteractiveChange

THISFORM.combobutton1.ENABLED = NOT THISFORM.combobutton1.ENABLED

THISFORM.closebutton1.ENABLED = NOT THISFORM.closebutton1.ENABLED

THISFORM.helpbutton1.ENABLED = NOT THISFORM.helpbutton1.ENABLED

THISFORM.rebar1.ENABLED = NOT THISFORM.rebar1.ENABLED

ENDPROC
     h���    O  O                        j   %   �            �           �  U  k  T�  � � ��  � � 
�� T�  � � ��  � � 
�� T�  � � ��  � � 
�� T�  � � ��  � � 
�� U  THISFORM COMBOBUTTON1 ENABLED CLOSEBUTTON1 HELPBUTTON1 REBAR1 InteractiveChange,     ��1 ����2                       #      )   O                        checkbox      checkbox      Check2      Form1      �Top = 36
Left = 36
Height = 17
Width = 186
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "Show PageFrame Background"
ControlSource = "THISFORM.pfBackground1.visible"
Name = "Check2"
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1V00L12JY 889015829      /  F      ]                          �      �                       WINDOWS _1V00L12JZ 923481070�      �  �      �      d                                                 WINDOWS _1V00L12JY 889015829Z  p  �  �  �  �      	  J	                                               WINDOWS _1V00L12KE 889015829�  �  �  �  �  �                                                           WINDOWS _1V00L12NV 889015830�  �  �  �                                                               COMMENT RESERVED                                �                                                            �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      gHeight = 132
Width = 414
DoCreate = .T.
AutoCenter = .T.
Caption = "Theme Sample"
Name = "Form1"
      �PROCEDURE Init
IF NOT FILE(GETENV("windir")+"\system32\uxtheme.dll")
	MESSAGEBOX("This sample requires that you are using Windows XP or higher")
	RETURN .F.
ENDIF

ENDPROC
     3���                              ��   %   �       �      �           �  U  � 1 %�CC� windir5� \system32\uxtheme.dll0
��� �H ��C�< This sample requires that you are using Windows XP or higher�x�� B�-�� � U   Init,     ��1 �q A 2                       �       )                           imgthemebutton      ..\gdiplusx.vcx      image      Imgthemebutton1      Form1      IHeight = 36
Left = 48
Top = 48
Width = 108
Name = "Imgthemebutton1"
     9PROCEDURE DblClick
This.Click()
ENDPROC
PROCEDURE Click
WITH This.Parent.ctlthemeprogressbar1
	IF .Value > 90
		.Value = 10
	ELSE
		.Value = .Value + 10
	ENDIF
	This.Parent.ctlthemeprogressbar2.Value = .Value
ENDWITH
ENDPROC
PROCEDURE beforedraw

** Draw the theme
DODEFAULT()

LOCAL oGfx AS xfcGraphics
LOCAL loBrush, loFont
LOCAL x, y

WITH _SCREEN.System.Drawing
	loFont = .Font.New("Arial", 9, 1)
	x = 25+IIF(This.ThemeState = 3, 2, 0)
	y = 10+IIF(This.ThemeState = 3, 2, 0)
	loRect = .Rectangle.New(x,y,56,20)
	loBrush = .Drawing2D.LinearGradientBrush.New(loRect, .Color.Red, .Color.Blue, 0)
	This.oGfx.DrawString("Click Me", loFont, loBrush, x, y)
	This.oGfx.DrawIcon(.SystemIcons.Asterisk, x-16, y, 16, 16)
	This.oGfx.DrawIcon(.SystemIcons.Question, x+56, y, 16, 16)
ENDWITH

ENDPROC
     9���                                )�   %   L      �     �          �  U    ��C�  � �� U  THIS CLICKp  ���  � � ��i � %��� �Z��3 � T�� ��
�� �N � T�� ��� �
�� � T�  � � � ��� �� �� U  THIS PARENT CTLTHEMEPROGRESSBAR1 VALUE CTLTHEMEPROGRESSBAR2	 ��C��� ��  Q� XFCGRAPHICS� �� � � �� � � ���9� � ��x�  T� �C� Arial�	��� � ��& T� ��C�	 �
 �� �� � 6��& T� ��
C�	 �
 �� �� � 6��  T� �C �  � �8��� � ��* T� �C � �� � �� � � �� � � ��+ ��C� Click Me �  �  �  � �	 �  � ��( ��C�� � � � � ���	 �  � ��( ��C�� � � �8 � ���	 �  � �� �� U  OGFX LOBRUSH LOFONT X Y SYSTEM DRAWING FONT NEW THIS
 THEMESTATE LORECT	 RECTANGLE	 DRAWING2D LINEARGRADIENTBRUSH COLOR RED BLUE
 DRAWSTRING DRAWICON SYSTEMICONS ASTERISK QUESTION DblClick,     �� ClickM     ��
 beforedraw    ��1 � 2 1!� � 1A qA 2 � b� � "aa����A 2                                 <   �           .      )                            ctlthemeprogressbar      ..\gdiplusx.vcx      control      Ctlthemeprogressbar1      Form1      �Top = 12
Left = 48
Width = 296
Height = 24
value = 10
max = 100
Name = "Ctlthemeprogressbar1"
Imgthemebase1.Name = "Imgthemebase1"
Imgthemebase2.Name = "Imgthemebase2"
      ctlthemeprogressbar      ..\gdiplusx.vcx      control      Ctlthemeprogressbar2      Form1      �Top = 12
Left = 12
Width = 24
Height = 84
value = 10
orientation = 1
Name = "Ctlthemeprogressbar2"
Imgthemebase1.Name = "Imgthemebase1"
Imgthemebase2.Name = "Imgthemebase2"
      !Arial, 0, 9, 5, 15, 12, 32, 3, 0
0	!   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 923479130�      �  �      �      J  :                  �	                           WINDOWS _1TZ0QGKPH 889606775/
  @
  W
  d
  v
  �
      �
  G6                                               WINDOWS _1U40L3TVH 890050086�      �                                                                 WINDOWS _1U40LO0FY 889491650�      �  �                                                               WINDOWS _1U40NTQI6 898870973s      �  �  �  �                                                           WINDOWS _1TP0L3VWK 890050086:      K  \  n  �                                                           WINDOWS _1V60OXU46 890050086�          (  @                                                           WINDOWS _1TP0L3VWK 890050086�      �  �  �  �                                                           WINDOWS _1TP0L3VWK 890050086f      {  �  �  �      K  �.                                               WINDOWS _1TP0L3VWL 890050086�      �  �  �  	      �  �+                                               WINDOWS _1TZ0QGKPH 890050086        *  8  P                                                           WINDOWS _1U40L3TVG 890050086�      �  �  �                                                             WINDOWS _1U40L3TVH 890050086r      �  �  �  �      W  -)                                               WINDOWS _1U40LO0FY 890050086�      �  �          �  o%                                               WINDOWS _1U40NTQI6 890050086$!      1!  >!  L!  d!                                                           WINDOWS _1TP0L3VWK 890050086�!      �!  �!  "   "      �"  #                                               WINDOWS _1TP0L3VWL 890050086'$      <$  Q$  a$  y$      %                                                  WINDOWS _1V601AHGF 890050086�&      �&  �&  �&  �&                                                           WINDOWS _1TZ0QGKPH 890050086:'      G'  T'  b'  z'                                                           WINDOWS _1V601AHGH 890050086�'      �'  (  (  7(      �(  �                                               WINDOWS _1V601AHGI 890050086>*      S*  h*  x*  �*      #+  �                                               WINDOWS _1V601AHGJ 890050086�,      �,  �,  �,  �,                                                           WINDOWS _1TP0L3VWK 890050086A-      V-  k-  {-  �-      &.  �                                               WINDOWS _1TP0L3VWL 890050086�/      �/  �/  �/  �/      �0  6                                               WINDOWS _1TP0L3VWK 890050086�1      �1  2  2  .2                                                           WINDOWS _1V80M31JV 890050086�2      �2  �2  �2  
3                                                           WINDOWS _1V80M31JW 890050086y3      �3  �  �3  �3      P4  %                                               WINDOWS _1V80M31JX 890050086�1      �1  �  �  �5      J5                                                 WINDOWS _1V80N1MPB 890050086�      �  �  j  �4                                                           WINDOWS _1TP0L3VWK 898870900U      @  �	  �	  �0      	  �                                               COMMENT RESERVED                                �                                                            <'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     GTop = 11
Left = 133
Height = 337
Width = 516
DoCreate = .T.
Caption = "Matrix Transformations"
obmp = 0
xshear = 0
yshear = 0
xscale = 0
yscale = 0
nrotate = 0
ncenterrotate = 0
_memberdata =       91<VFPData><memberdata name="processimage" type="method" display="ProcessImage"/></VFPData>

Name = "Form1"
     APROCEDURE processimage
LPARAMETERS tcFile
tcFile = LOCFILE(tcFile)
WITH Thisform
	.txtFile.Value = tcFile
	.Image1.Picture = tcFile
	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.Imgcanvas1.Draw()
ENDWITH
ENDPROC
PROCEDURE Init
DODEFAULT()
Thisform.ProcessImage("GotData.gif")
ENDPROC
     ���    �   �                         �f   %   �       �      �           �  U  8  T�  �C��� %�C�  ���  � B� � ��C �  � � �� U  LCFILE THISFORM PROCESSIMAGE Click,     ��1 � � A A 1                       d       )   �                         eArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
Arial, 1, 16, 10, 25, 19, 55, 5, 1
      oPROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF
Thisform.ProcessImage(lcFile)
ENDPROC
      Form1      Command2      �obmp
xshear
yshear
xscale
yscale
nrotate
ncenterrotate
_memberdata XML Metadata for customizable properties
*processimage 
      	imgcanvas      ..\gdiplusx.vcx      image      
Imgcanvas1      Form1      SAnchor = 15
Height = 180
Left = 264
Top = 12
Width = 240
Name = "Imgcanvas1"
     /PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value)
	RETURN
ENDIF

This.Clear

LOCAL loMatrix AS xfcMatrix
LOCAL loPointF AS xfcPointF

WITH _SCREEN.System.Drawing
	loMatrix = .Drawing2D.Matrix.New()
	loMatrix.Shear(Thisform.xShear, Thisform.yShear)
	loMatrix.Scale(Thisform.xScale + 1, Thisform.yScale + 1)

	DO CASE 
	CASE Thisform.nRotate <> 0
		loMatrix.Rotate(Thisform.nRotate)
	CASE Thisform.nCenterRotate <> 0
		loPointF = _SCREEN.System.Drawing.PointF.New(This.Width / 2, This.Height / 2)
		loMatrix.RotateAt(Thisform.nCenterRotate, loPointF)
	ENDCASE

	This.oGfx.MultiplyTransform(loMatrix)
	This.oGfx.DrawImage(Thisform.oBmp, This.Rectangle)
ENDWITH

WITH Thisform
	.xScale = 0
	.yScale = 0
	.xShear = 0
	.yShear = 0
	.nRotate = 0
	.nCenterRotate = 0
ENDWITH
ENDPROC
     ���    �   �                         u   %   �       �      �           �  U  0  ���  ��) � T�� ��
�� ��C�� � �� �� U  THISFORM NCENTERROTATE
 IMGCANVAS1 DRAW Click,     ��1 � � � A 2                       U       )   �                        	���    �   �                          �   %   �       �      �           �  U  1  ���  ��* � T�� ������ ��C�� � �� �� U  THISFORM NCENTERROTATE
 IMGCANVAS1 DRAW Click,     ��1 � � � A 2                       U       )   �                        ���    �   �                         ~   %   �       �      �           �  U  0  ���  ��) � T�� ��
�� ��C�� � �� �� U  THISFORM NROTATE
 IMGCANVAS1 DRAW Click,     ��1 � � � A 2                       O       )   �                         commandbutton      commandbutton      Form1.Container1      Label8      label      label      Form1.Container1      	Command12      	Command11      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 6
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 204
Width = 384
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
      	container      	container      
Container1      Form1      ~Anchor = 6
Top = 241
Left = 3
Width = 512
Height = 84
BackStyle = 0
BorderWidth = 0
TabIndex = 3
Name = "Container1"
      	container      	container      
Container3      Form1.Container1      fTop = 4
Left = 386
Width = 121
Height = 36
SpecialEffect = 0
TabIndex = 13
Name = "Container3"
      	container      	container      
Container2      Form1.Container1      fTop = 4
Left = 196
Width = 168
Height = 78
SpecialEffect = 0
TabIndex = 14
Name = "Container2"
      	container      	container      
Container1      Form1.Container1      dTop = 4
Left = 4
Width = 168
Height = 78
SpecialEffect = 0
TabIndex = 15
Name = "Container1"
      commandbutton      commandbutton      Command1      Form1.Container1      �Top = 12
Left = 104
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 1
Name = "Command1"
      YPROCEDURE Click
WITH Thisform
	.xShear = -0.05
	.imgcanvas1.Draw()
ENDWITH
ENDPROC
     ���    �   �                         �(   %   �       �      �           �  U  1  ���  ��* � T�� ������ ��C�� � �� �� U  THISFORM NROTATE
 IMGCANVAS1 DRAW Click,     ��1 � � � A 2                       O       )   �                         commandbutton      commandbutton      Command2      Form1.Container1      �Top = 12
Left = 140
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 2
Name = "Command2"
      [PROCEDURE Click
WITH Thisform
	.xShear = +0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ���������?�� ��C�� � �� �� U  THISFORM YSCALE
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       O       )   �                         label      label      Label1      Form1.Container1      pFontBold = .T.
Caption = "Shear"
Height = 25
Left = 8
Top = 12
Width = 36
TabIndex = 16
Name = "Label1"
      label      label      Label2      Form1.Container1      bCaption = "X Axys"
Height = 25
Left = 56
Top = 12
Width = 36
TabIndex = 17
Name = "Label2"
      commandbutton      commandbutton      Command3      Form1.Container1      �Top = 48
Left = 104
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 3
Name = "Command3"
      [PROCEDURE Click
WITH Thisform
	.yShear = -0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ������������ ��C�� � �� �� U  THISFORM YSCALE
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         commandbutton      commandbutton      Command4      Form1.Container1      �Top = 48
Left = 140
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 4
Name = "Command4"
      [PROCEDURE Click
WITH Thisform
	.yShear = +0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ���������?�� ��C�� � �� �� U  THISFORM XSCALE
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         label      label      Label3      Form1.Container1      bCaption = "Y Axys"
Height = 25
Left = 56
Top = 48
Width = 36
TabIndex = 18
Name = "Label3"
      commandbutton      commandbutton      Command5      Form1.Container1      �Top = 12
Left = 296
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 5
Name = "Command5"
      [PROCEDURE Click
WITH Thisform
	.xScale = -0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ������������ ��C�� � �� �� U  THISFORM XSCALE
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         commandbutton      commandbutton      Command6      Form1.Container1      �Top = 12
Left = 332
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 6
Name = "Command6"
      [PROCEDURE Click
WITH Thisform
	.xScale = +0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ���������?�� ��C�� � �� �� U  THISFORM YSHEAR
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         label      label      Label4      Form1.Container1      rFontBold = .T.
Caption = "Scale"
Height = 25
Left = 200
Top = 12
Width = 36
TabIndex = 19
Name = "Label4"
      label      label      Label5      Form1.Container1      cCaption = "X Axys"
Height = 25
Left = 248
Top = 12
Width = 36
TabIndex = 20
Name = "Label5"
      commandbutton      commandbutton      Command7      Form1.Container1      �Top = 48
Left = 296
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 7
Name = "Command7"
      [PROCEDURE Click
WITH Thisform
	.yScale = -0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ������������ ��C�� � �� �� U  THISFORM YSHEAR
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         commandbutton      commandbutton      Command8      Form1.Container1      �Top = 48
Left = 332
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 8
Name = "Command8"
      ZPROCEDURE Click
WITH Thisform
	.yScale = 0.05
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ���������?�� ��C�� � �� �� U  THISFORM XSHEAR
 IMGCANVAS1 DRAW Click,     ��1 � a� A 2                       P       )   �                         label      label      Label6      Form1.Container1      cCaption = "Y Axys"
Height = 25
Left = 248
Top = 48
Width = 36
TabIndex = 21
Name = "Label6"
      commandbutton      commandbutton      Command9      Form1.Container1      �Top = 12
Left = 440
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 9
Name = "Command9"
      ZPROCEDURE Click
WITH Thisform
	.nRotate = -10
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
     	���    �   �                          �   %   �       �      �           �  U  8  ���  ��1 � T�� ������������ ��C�� � �� �� U  THISFORM XSHEAR
 IMGCANVAS1 DRAW Click,     ��1 � a� A 1                       N       )   �                         commandbutton      commandbutton      	Command10      Form1.Container1      �Top = 12
Left = 476
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 10
Name = "Command10"
      ZPROCEDURE Click
WITH Thisform
	.nRotate = +10
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      �Top = 204
Left = 12
Height = 25
Width = 98
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
      commandbutton      commandbutton      label      label      Label7      Form1.Container1      �FontBold = .T.
WordWrap = .T.
Caption = "Rotate (0,0)"
Height = 29
Left = 392
Top = 7
Width = 36
TabIndex = 22
Name = "Label7"
      	container      	container      
Container4      Form1.Container1      gTop = 45
Left = 386
Width = 121
Height = 36
SpecialEffect = 0
TabIndex = 23
Name = "Container4"
      commandbutton      commandbutton      Form1.Container1      �Top = 48
Left = 440
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "-"
TabIndex = 11
Name = "Command11"
      `PROCEDURE Click
WITH Thisform
	.nCenterRotate = -10
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      �FontBold = .T.
WordWrap = .T.
Caption = "Rotate Center"
Height = 29
Left = 392
Top = 48
Width = 36
TabIndex = 24
Name = "Label8"
      `PROCEDURE Click
WITH Thisform
	.nCenterRotate = +10
	.imgcanvas1.Draw()
ENDWITH

ENDPROC
      �Top = 48
Left = 476
Height = 25
Width = 24
FontBold = .T.
FontSize = 16
Anchor = 12
Caption = "+"
TabIndex = 12
Name = "Command12"
     ����    �  �                        �g   %         d     (          �  U  � %�C�  � � ��� � B� �
 �� � � �� Q�	 XFCMATRIX� �� Q�	 XFCPOINTF� ���9� � ��p� T� �C��	 �
 � �� ��C�  � �  � � � ��! ��C�  � ��  � �� � �� H�� �<� ��  � � ��� � ��C�  � � � �� ��  � � ��<�- T� �C� � �� � ��9� � � � �� ��C�  �  � � � �� � ��C � � � � �� ��C�  � � � � � � �� �� ���  ���� T�� �� �� T�� �� �� T�� �� �� T�� �� �� T�� �� �� T�� �� �� �� U  THISFORM TXTFILE VALUE THIS CLEAR LOMATRIX LOPOINTF SYSTEM DRAWING	 DRAWING2D MATRIX NEW SHEAR XSHEAR YSHEAR SCALE XSCALE YSCALE NROTATE ROTATE NCENTERROTATE POINTF WIDTH HEIGHT ROTATEAT OGFX MULTIPLYTRANSFORM	 DRAWIMAGE OBMP	 RECTANGLE
 beforedraw,     ��1 QA A � BA"Q�� A1A�qA B�A � � � � � � � A 1                       $      )   �                       
���    �  �                        ��   %   Z      �     ~          �  U  ~  ��  � T�  �C�  ��� ��� ��w � T�� � ��  �� T�� � ��  ��# T�� �C� � � �9� � �	 �
 �� ��C�� � �� �� U  TCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW
 IMGCANVAS1 DRAW' 	 ��C��� ��C� GotData.gif�  � �� U  THISFORM PROCESSIMAGE processimage,     �� Init    ��1 q � 1� A 2 � �1                       �      
     6      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _28B1DAQLU 930265090      /  F      ]                          �      �                       WINDOWS _28B1DAQLY 941888867�      �  �      �      �  �*                  j                            WINDOWS _28B1DAQLZ 930724463�   �   �   !  !  +!      �!                                                 WINDOWS _28B1DAQMA 941888867Q$      f$  {$  �$  �$      w%                                                 WINDOWS _28B1DAQMB 930265090)      )  &)  5)  B)                                                           WINDOWS _28C00BXIF 941888867*      *  #*  �(  5*                                                           WINDOWS _28C00BXIG 930283817�*      �(  �(  9$  Y(      �'                                                 WINDOWS _28C00BXIH 930283817$$      $  �#  �#  i'      �&  
                                               WINDOWS _28C00BXII 930619192�#      �#  �#  R   %#      �"                                                 WINDOWS _28C00BXIJ 930283817E       8   *      �                                                           WINDOWS _28H062A5A 930724463�      �  t  g                                                             COMMENT RESERVED                                �                                                            7#                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1     �Top = 0
Left = 0
Height = 422
Width = 576
DoCreate = .T.
Caption = "Testing Image Canvas Rendering modes / Performances"
x = .F.
y = .F.
obitmap = .F.
_memberdata =      253<VFPData><memberdata name="createeffect" type="method" display="CreateEffect"/><memberdata name="obitmap" type="property" display="oBitmap"/><memberdata name="x" type="property" display="X"/><memberdata name="y" type="property" display="Y"/></VFPData>

omatrix = 0
Name = "Form1"
     *PROCEDURE createeffect
LOCAL loBmp as xfcBitmap
LOCAL loGfx as xfcGraphics

LOCAL lnSeconds, n, lnWidth, lnHeight, lnOption

lnSeconds = SECONDS()

lnWidth  = Thisform.Imgcanvas1.Width
lnHeight = Thisform.Imgcanvas1.Height

WITH _Screen.System.Drawing

loSrc = .Bitmap.FromFile(Thisform.TxtFile.Value)

loBmp = .Bitmap.New(loSrc, lnWidth, lnHeight)
loGfx = Thisform.Imgcanvas1.oGfx 
Thisform.oBitmap = loBmp

lnOption = Thisform.Optiongroup1.Value 

DO CASE 
CASE lnOption = 1 && Scroll Down

	Thisform.X = 0
	FOR n = -lnHeight TO lnHeight
		Thisform.Y = n
		Thisform.Imgcanvas1.Draw()
	ENDFOR
	

CASE lnOption = 2 && Scroll Horizontal

	Thisform.Y = 0
	FOR n = -lnWidth TO lnWidth
		Thisform.X = n
		Thisform.Imgcanvas1.Draw()
	ENDFOR

	
CASE lnOption = 3 && Transparency Effect
	LOCAL loClrMatrix as xfcColorMatrix
	LOCAL loCloned as xfcBitmap
	loCloned = loBmp.Clone()
	
	loClrMatrix = .Imaging.ColorMatrix.New()
	Thisform.X = 0
	Thisform.Y = 0

	FOR n = 0.1 TO 1 STEP 0.01
		loClrMatrix.Matrix33 = n
		loBmp = loCloned.Clone()
		loBmp.ApplyColorMatrix(loClrMatrix)
		Thisform.oBitmap = loBmp
		Thisform.Imgcanvas1.Draw()
	ENDFOR


CASE lnOption = 4 && Rotate Image
	LOCAL loMatrix as xfcMatrix
	LOCAL loPointF AS xfcPointF
	
	Thisform.X = 0
	Thisform.Y = 0

	loMatrix = .Drawing2D.Matrix.New()
	loPointF = .PointF.New(lnWidth / 2, lnHeight / 2)

	FOR n = 0 TO 360 STEP 2
		loMatrix.RotateAt(2, loPointF)
		Thisform.Imgcanvas1.oGfx.MultiplyTransform(loMatrix)
		Thisform.Imgcanvas1.Draw()
		Thisform.Imgcanvas1.oGfx.ResetTransform() 
	ENDFOR


CASE lnOption = 5 && Open Rectangle

	LOCAL loWorkBmp as xfcBitmap
	LOCAL loCloned as xfcBitmap
	LOCAL loGfx as xfcGraphics
	LOCAL x, y, w, h
	
	Thisform.X = 0
	Thisform.Y = 0

	loWorkBmp = loBmp.Clone()
	loGfx = .Graphics.FromImage(loWorkBmp)
	loGfx.Clear(.Color.White)

	FOR n = 1 TO 50 STEP 0.5

		x = (lnWidth / 2) - n * (lnWidth / 100)
		y = (lnHeight / 2) - n * (lnHeight / 100)
		w = ((lnWidth / 2) - x) * 2
		h = ((lnHeight / 2) - y) * 2

		IF x < 1
			x = 0
			y = 0
			w = lnWidth
			h = lnHeight
		ENDIF
		loCloned = loBmp.Clone(.Rectangle.New(x, y, w, h))
		loGfx.DrawImage(loCloned, x, y)

		Thisform.oBitmap = loWorkBmp
		Thisform.Imgcanvas1.Draw()
	ENDFOR


CASE lnOption = 6 && Gamma effect

	LOCAL loWorkBmp as xfcBitmap
	LOCAL loGfx as xfcGraphics
	LOCAL loAttr as xfcImageAttributes
	LOCAL loRect as xfcRectangleF

	loWorkBmp = loBmp.Clone()
	loGfx = .Graphics.FromImage(loWorkBmp)
	loGfx.Clear(.Color.White)
	loAttr = .Imaging.ImageAttributes.New()
	loRect = loBmp.GetBounds()

	Thisform.X = 0
	Thisform.Y = 0
	Thisform.oBitmap = loWorkBmp

	FOR n = 0 TO 1 STEP 0.005
		loAttr.SetGamma(n)
		loGfx.DrawImage(loBmp, loRect, loRect, .GraphicsUnit.Pixel, loAttr)
		Thisform.Imgcanvas1.Draw()
	ENDFOR

ENDCASE 

ENDWITH

MESSAGEBOX("Elapsed : " + TRANSFORM(SECONDS() - lnSeconds) + " Seconds", 64)
ENDPROC
PROCEDURE Init
Thisform.TxtFile.Value = LOCFILE("CebolinhaBMPSmall.Bmp")
Thisform.X = 0
Thisform.Y = 0

WITH _Screen.System.Drawing
	Thisform.oBitmap = .Bitmap.New(.Bitmap.FromFile(Thisform.TxtFile.Value), Thisform.Imgcanvas1.Width, Thisform.Imgcanvas1.Height)
	Thisform.Imgcanvas1.DrawWhenInvisible = .T.
	Thisform.Imgcanvas1.Draw()
ENDWITH 
ENDPROC
      ����    �   �                         �   %   �       �      �           �  U  #  T�  � � ���� ��C�  � �� U  THISFORM
 IMGCANVAS1
 RENDERMODE CREATEEFFECT Click,     ��1 1� 1                       `       )   �                         ����    �   �                         �   %   �       �      �           �  U  #  T�  � � ���� ��C�  � �� U  THISFORM
 IMGCANVAS1
 RENDERMODE CREATEEFFECT Click,     ��1 1� 1                       `       )   �                         ����    �   �                         �   %   �       �      �           �  U  #  T�  � � �� �� ��C�  � �� U  THISFORM
 IMGCANVAS1
 RENDERMODE CREATEEFFECT Click,     ��1 1� 1                       `       )   �                        ���    �  �                        l   %   u      �     �          �  U  �  ��  � � � T�  �C��� %�C�  ���/ � B� � T� � � ��  �� T� �� � � �� T� �� � � �� ���9�	 �
 ��� �) T� � �CC �  �� �  �  � �� � �� ��C� � � �� �� U  LCFILE LNWIDTH LNHEIGHT THISFORM TXTFILE VALUE
 IMGCANVAS1 WIDTH HEIGHT SYSTEM DRAWING OBITMAP BITMAP NEW FROMFILE DRAW Click,     ��1 � � � A A 221"�A 1                       l      )   �                       ����                              �v   %         6  	   $          �  U  �  ��  Q� XFCGRAPHICS� T�  �� � �� ��C�9� � � � �  � �� %�C� �	 ��� O��] � B� � ��C� �	 � � � � �  �
 �� U  LOGFX THIS OGFX CLEAR SYSTEM DRAWING COLOR WHITE THISFORM OBITMAP	 DRAWIMAGE X Y
 beforedraw,     ��1 a��A A �1                             )                           BArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
     YButtonCount = 6
Value = 1
Height = 132
Left = 12
Top = 60
Width = 192
Name = "Optiongroup1"
Option1.Caption = "Scroll Image Down"
Option1.Value = 1
Option1.Height = 17
Option1.Left = 5
Option1.Top = 5
Option1.Width = 122
Option1.AutoSize = .T.
Option1.Name = "Option1"
Option2.Caption = "Scroll Image Horizontal"
Option2.Height = 17
Option2.Left = 5
Option2.Top = 24
Option2.Width = 145
Option2.AutoSize = .T.
Option2.Name = "Option2"
Option3.Caption = "Transparency Effect"
Option3.Height = 17
Option3.Left = 5
Option3.Top = 43
Option3.Width = 126
Option3.AutoSize = .T.
Option3.Name = "Option3"
Option4.Caption = "Rotate Image"
Option4.Height = 17
Option4.Left = 5
Option4.Top = 62
Option4.Width = 92
Option4.AutoSize = .T.
Option4.Name = "Option4"
Option5.Caption = "Open Rectangle"
Option5.Height = 17
Option5.Left = 5
Option5.Top = 81
Option5.Width = 107
Option5.AutoSize = .T.
Option5.Name = "Option5"
Option6.Caption = "Gamma Effect"
Option6.Height = 17
Option6.Left = 5
Option6.Top = 100
Option6.Width = 96
Option6.AutoSize = .T.
Option6.Name = "Option6"
      Form1      Optiongroup1      optiongroup      optiongroup      \Caption = "Rendering Modes"
Height = 17
Left = 4
Top = 11
Width = 120
Name = "Label1"
      Form1.Container1      Label1      label      label      Form1.Container1      ^x
y
obitmap
_memberdata XML Metadata for customizable properties
omatrix
*createeffect 
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      UBackStyle = 0
Height = 360
Left = 228
Top = 48
Width = 336
Name = "Imgcanvas1"
     "PROCEDURE beforedraw
LOCAL loGfx as xfcGraphics && This is to enable Intellisense for "oGfx"
loGfx = This.oGfx

loGfx.Clear(_Screen.System.Drawing.Color.White)

IF VARTYPE(Thisform.oBitmap) <> "O"
	RETURN
ENDIF

loGfx.DrawImage(Thisform.oBitmap, Thisform.X, Thisform.Y)
ENDPROC
      kPROCEDURE Click
Thisform.Imgcanvas1.RenderMode = 1 && PictureVal / BMP
Thisform.CreateEffect()
ENDPROC
      �Top = 143
Left = 4
Height = 27
Width = 192
Caption = "   1 - Picture - TMP FILES (DISK)"
Alignment = 0
Name = "Command4"
      Command4      commandbutton      commandbutton      Form1.Container1      Command2      commandbutton      commandbutton      Form1.Container1      commandbutton      commandbutton      Command3      Form1      �Top = 12
Left = 12
Height = 25
Width = 96
Anchor = 1
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Get Picture"
TabIndex = 1
PicturePosition = 1
PictureMargin = 1
Name = "Command3"
     wPROCEDURE Click
LOCAL lcFile, lnWidth, lnHeight
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

Thisform.txtFile.Value = lcFile

lnWidth  = Thisform.Imgcanvas1.Width
lnHeight = Thisform.Imgcanvas1.Height

WITH _Screen.System.Drawing
	Thisform.oBitmap = .Bitmap.New(.Bitmap.FromFile(lcFile), lnWidth, lnHeight)
	Thisform.Imgcanvas1.Draw()
ENDWITH 
ENDPROC
      kPROCEDURE Click
Thisform.Imgcanvas1.RenderMode = 4 && PictureVal / BMP
Thisform.CreateEffect()
ENDPROC
      uTop = 95
Left = 4
Height = 27
Width = 192
Caption = "   4 - PictureVal - PNG"
Alignment = 0
Name = "Command2"
      kPROCEDURE Click
Thisform.Imgcanvas1.RenderMode = 0 && PictureVal / BMP
Thisform.CreateEffect()
ENDPROC
      uTop = 47
Left = 4
Height = 27
Width = 192
Caption = "   0 - PictureVal - BMP"
Alignment = 0
Name = "Command1"
      Command1      commandbutton      Form1      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 131
Enabled = .F.
Height = 25
Left = 120
TabIndex = 2
Top = 12
Width = 444
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      	container      	container      
Container1      fTop = 228
Left = 12
Width = 200
Height = 180
BorderWidth = 0
Visible = .T.
Name = "Container1"
      commandbutton     c���    J  J                        RB   %   �
      �  n             �  U  m ��  Q�	 XFCBITMAP� �� Q� XFCGRAPHICS� �� � � � � � T� �C��� T� �� � �	 �� T� �� � �
 �� ���9� � ��8� T� �C� � � �� � �� T�  �C �  �  � �� � �� T� �� � � �� T� � ��  �� T� �� � � �� H��4� �� ���^� T� � �� �� �� �� c�(�� ��Z� T� � �� �� ��C� � � �� �� �� ����� T� � �� �� �� �� c�(�� ���� T� � �� �� ��C� � � �� �� �� ����� �� Q� XFCCOLORMATRIX� �� Q�	 XFCBITMAP� T� �C�  � �� T� �C�� � � �� T� � �� �� T� � �� ��- �� ���������?�(������{�G�z�?���� T� � �� �� T�  �C� � �� ��C � �  � �� T� � ��  �� ��C� � � �� �� �� ����� ��  Q�	 XFCMATRIX� ��! Q�	 XFCPOINTF� T� � �� �� T� � �� �� T�  �C��" �# � ��  T�! �C� �� ���$ � �� �� �� �(��h�������� ��C� �! �  �% �� ��C �  � � � �& �� ��C� � � �� ��C� � � �' �� �� �� ����� ��( Q�	 XFCBITMAP� �� Q�	 XFCBITMAP� �� Q� XFCGRAPHICS� �� � �) �* � T� � �� �� T� � �� �� T�( �C�  � �� T� �C �( ��+ �, �� ��C��. �/ � �- ��% �� ���(��2����      �?���� T� �� �� � �d�� T� �� �� � �d�� T�) �� �� ��� T�* �� �� ��� %�� ���[� T� �� �� T� �� �� T�) �� �� T�* �� �� �) T� �CC �  �  �)  �* ��0 � �  � �� ��C �  �  � � �1 �� T� � ��( �� ��C� � � �� �� �� ���4� ��( Q�	 XFCBITMAP� �� Q� XFCGRAPHICS� ��2 Q� XFCIMAGEATTRIBUTES� ��3 Q� XFCRECTANGLEF� T�( �C�  � �� T� �C �( ��+ �, �� ��C��. �/ � �- �� T�2 �C�� �4 � �� T�3 �C�  �5 �� T� � �� �� T� � �� �� T� � ��( ��% �� �� �(������{�G�zt?��0� ��C � �2 �6 ��$ ��C �   �3  �3 ��7 �8  �2 � �1 �� ��C� � � �� �� � ��. ��C�
 Elapsed : CC�� _�  Seconds�@�x�� U9  LOBMP LOGFX	 LNSECONDS N LNWIDTH LNHEIGHT LNOPTION THISFORM
 IMGCANVAS1 WIDTH HEIGHT SYSTEM DRAWING LOSRC BITMAP FROMFILE TXTFILE VALUE NEW OGFX OBITMAP OPTIONGROUP1 X Y DRAW LOCLRMATRIX LOCLONED CLONE IMAGING COLORMATRIX MATRIX33 APPLYCOLORMATRIX LOMATRIX LOPOINTF	 DRAWING2D MATRIX POINTF ROTATEAT MULTIPLYTRANSFORM RESETTRANSFORM	 LOWORKBMP W H GRAPHICS	 FROMIMAGE CLEAR COLOR WHITE	 RECTANGLE	 DRAWIMAGE LOATTR LORECT IMAGEATTRIBUTES	 GETBOUNDS SETGAMMA GRAPHICSUNIT PIXEL� + T�  � � �C� CebolinhaBMPSmall.Bmp��� T�  � �� �� T�  � �� �� ���9� � ��� �8 T�  � �CC�  � � �� �
 �  � � �  � � �� �	 �� T�  � � �a�� ��C�  � � �� �� U  THISFORM TXTFILE VALUE X Y SYSTEM DRAWING OBITMAP BITMAP NEW FROMFILE
 IMGCANVAS1 WIDTH HEIGHT DRAWWHENINVISIBLE DRAW createeffect,     �� Init�	    ��1 Aar� 21"��12� �A �A �AR�A AAR�Aq1A BAa1aAR����� � � � A ��A Ba��aAQRAA B B �2 �"�A 1                       �     e   �    �    )   J                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1TP0L3VWK 886790211      /  F      ]                          �      �                       WINDOWS _1TP0L3VWL 924916019�      �  �      �                              �                           WINDOWS _1TZ0QGKPH 924916019�  �      .  ;      �  ,                                               WINDOWS _1TP0L3VWK 898893230U      d  s  �  �                                                           WINDOWS _1U40LO0FY 890640240O      \  i  w  �      �  *                                               WINDOWS _1U40NTQI6 890640240          %   7   D                                                            WINDOWS _1V81F5AU2 890640240�       �   �   !   !      �!  }                                               WINDOWS _1TP0L3VWK 890606287�"      �"  #  #  1#                                                           WINDOWS _1VA0OJPIR 890640240x#      �#  �#  �#  �#      "$  �                                               WINDOWS _1TP0L3VWK 890640240%      %  %  +%  C%                                                           WINDOWS _1VO036QV8 890653842�%      �$  �$  �$  �%                                                           WINDOWS _1TP0L3VWL 890640240�$      �$  �$  �$  &&      '  .                                               WINDOWS _1V91FF99H 898893210t$      _$  O$  H  �*                                                           WINDOWS _1VN13DSQD 8988932309      *      �)                                                           WINDOWS _1VN13DSQE 890640240�      �  �  �  "      )  �                                               COMMENT RESERVED                                [                                                            2�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      Form1      �Top = 11
Left = 8
Height = 402
Width = 697
DoCreate = .T.
ShowTips = .T.
Caption = "Create Transparent GIFs"
MinHeight = 350
MinWidth = 510
obmp = 0
hbmp = 0
wbmp = 0
Name = "Form1"
      obmp
hbmp
wbmp
      	imgcanvas      ..\source\gdiplusx.vcx      image      
Imgcanvas1      Form1      }Anchor = 15
Height = 300
Left = 264
Top = 12
Width = 420
smoothingmode = 3
interpolationmode = 0
Name = "Imgcanvas1"
     	�PROCEDURE beforedraw
IF EMPTY(Thisform.txtFile.Value) OR EMPTY(Thisform.txtFile2.Value)
	WAIT WINDOW ("Please select both GIF and background pictures") NOWAIT 
	RETURN
ENDIF

This.Clear

LOCAL loSrcBitmap as xfcBitmap
LOCAL loDstBitmap as xfcBitmap
LOCAL loBmpData AS xfcBitmapData
LOCAL loPalette AS xfcColorPalette
LOCAL loColor AS xfcColor
LOCAL loTransColor AS xfcColor

WITH _SCREEN.System.Drawing

* Get the RGB values of the color to be changed to transparent
loTransColor = .Color.FromRGB(Thisform.Container1.Text1.BackColor)

* Load GIF
loSrcBitmap = .Bitmap.New(Thisform.txtFile.Value)

* Get the Color Palette that will be modified
loPalette = loSrcBitmap.Palette

* Indicate that one of the palette entries contains alpha (transparency) information. 
loPalette.Flags = .Imaging.PaletteFlags.HasAlpha

* Loop through the palette looking for the desired color.
* When found, setting ALPHA to Transparent - 0
* Otherwise, set ALPHA to Opaque - 255
FOR n = 1 TO ALEN(loPalette.Entries)
	loColor	= loPalette.Entries(n)
	loColor.A = 255
	IF loColor.Equals(loTransColor)
		loPalette.Entries(n) = .Color.FromArgb(0, loColor) && Transparent
	ELSE
		loPalette.Entries(n) = .Color.FromArgb(255, loColor) && Opaque
	ENDIF
ENDFOR 

* Resend the modified palette to the Bitmap
loSrcBitmap.Palette = loPalette

* Call LockBits just to make sure the GIF Bitmap will apply the modiied palette
LOCAL loSrc as xfcBitmapData
loSrc = loSrcBitmap.LockBits(.Rectangle.New(0, 0, loSrcBitmap.Width, loSrcBitmap.Height), ;
	.Imaging.ImageLockMode.WriteOnly, ;
	.Imaging.PixelFormat.Format8bppIndexed)

* Call UnLockBits to apply changes
loSrcBitmap.UnlockBits(loSrc)

* Save Image using the GIF image format
LOCAL lcDestination
*lcDestination = JUSTPATH(Thisform.txtFile.Value) + "\_" + JUSTSTEM(Thisform.txtFile.Value) + ".gif"
lcDestination = ADDBS(SYS(2023)) + "_" + JUSTSTEM(Thisform.txtFile.Value) + ".gif"
loSrcBitmap.Save(lcDestination, .Imaging.Imageformat.Gif)
	
* Draw the modified GIF over a Background Image to show the results
LOCAL loBackBitmap as xfcBitmap
loBackBitmap = .Bitmap.New(Thisform.txtFile2.Value)
This.oGfx.DrawImage(loBackBitmap, This.Rectangle)
This.oGfx.DrawImage(loSrcBitmap, 0, 0)

* Show Transparent GIF file name
MESSAGEBOX("Transparent GIF created" + CHR(13) + CHR(13) + ;
			"A new file was created with the desired transparency effect:" + ;
			CHR(13) + lcDestination,64,"Transparent GIF Created Successfully")

ENDWITH

RETURN
ENDPROC
     x���    _  _                        ;$   %   �            �           �  U  ~  T�  �C��� %�C�  ���  � B� � ��� ��w � T�� � ��  ��" %�C�� � �
� C�� � �
	��s � T�� � �a�� � �� U  LCFILE THISFORM TXTFILE2 VALUE TXTFILE
 CONTAINER1 VISIBLE Click,     ��1 � � A A � !� A A 1                       �       )   _                       ����    v  v                        i   %   �      -               �  U  5 T�  �C� GIF��� %�C�  ���& � B� � %�CC�  ��f� GIF�� �8 R,��- Only GIF images are allowed for this sample !�� B� � ��� ��.� T�� � ��  �� T�� � ��  ��# T�� �C� � � �9� � �	 �
 �� T�� ��� � �� T�� ��� � ��" %�C�� � �
� C�� � �
	��*� T�� � �a�� � �� U  LCFILE THISFORM TXTFILE VALUE IMAGE1 PICTURE OBMP SYSTEM DRAWING BITMAP NEW WBMP WIDTH HBMP HEIGHT TXTFILE2
 CONTAINER1 VISIBLE Click,     ��1 1� A A ��A A � 2!!"� A A 1                       �      )   v                        ����    �   �                         7   %   :       N      H           �  U  
  B�-�� U   When,     ��1 q 1                              )   �                         ����    �   �                         7�   %   _       t      n           �  U    ��C�  � � �� U  THISFORM
 IMGCANVAS1 DRAW Click,     ��1 1                       +       )   �                         cArial, 0, 9, 5, 15, 12, 32, 3, 0
Arial, 0, 8, 5, 14, 11, 29, 3, 0
Arial, 1, 9, 6, 15, 12, 32, 3, 0
      Form1      Command3      commandbutton      commandbutton      Form1      txtFile2      textbox      textbox      Form1      textbox      textbox      txtFile      Form1      �FontSize = 8
Anchor = 134
Enabled = .F.
Height = 25
Left = 144
TabIndex = 4
Top = 324
Width = 504
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile"
      image      image      Image1      Form1      ZAnchor = 3
Stretch = 2
Height = 180
Left = 12
Top = 12
Width = 240
Name = "Image1"
     <PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
Thisform.Container1.Text1.BackColor = Thisform.Container1.Shape1.BackColor 
Thisform.Container1.lblRGB.Caption = ""

ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord
Thisform.Container1.Shape1.BackColor = Thisform.Container1.Text1.BackColor
ENDPROC
PROCEDURE MouseMove
LPARAMETERS nButton, nShift, nXCoord, nYCoord

IF VARTYPE(Thisform.oBmp) <> "O"
	RETURN
ENDIF 

LOCAL x1, y1, xRatio, yRatio, lnRGBClr

X1 = nXCoord - This.Left
Y1 = nYCoord - This.Top

XRatio = Thisform.wBmp / This.Width
YRatio = Thisform.hBmp / This.Height

WITH _SCREEN.System.Drawing
	LOCAL loBitmap as xfcBitmap
	loBitmap = Thisform.oBmp

	LOCAL loColor as xfcColor
	loColor = loBitmap.GetPixel(X1 * xRatio,Y1 * yRatio)
	lnRGBClr = RGB(loColor.R, loColor.G, loColor.B)
	Thisform.Container1.lblRGB.Caption = ;
		"RGB (" + TRANSFORM(loColor.R) +"," + ;
		TRANSFORM(loColor.G) + "," + ;
		TRANSFORM(loColor.B) + ")"
	Thisform.Container1.Text1.BackColor = lnRGBClr
ENDWITH

ENDPROC
     ����    �  �                        iR   %   �      O               �  U  K  ��  � � � � T� � � � �� � � � �� T� � �	 �
 ��  �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM
 CONTAINER1 TEXT1	 BACKCOLOR SHAPE1 LBLRGB CAPTION5  ��  � � � � T� � � � �� � � � �� U	  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM
 CONTAINER1 SHAPE1	 BACKCOLOR TEXT1� ��  � � � � %�C� � ��� O��/ � B� � �� � � �	 �
 � T� �� � � �� T� �� � � �� T� �� � � � �� T�	 �� � � � �� ���9� � ���� �� Q�	 XFCBITMAP� T� �� � �� �� Q� XFCCOLOR� T� �C� � � �	 � � �� T�
 �C� � � � � � �^��E T� � � � �� RGB (C� � _� ,C� � _� ,C� � _� )�� T� � � � ��
 �� �� U  NBUTTON NSHIFT NXCOORD NYCOORD THISFORM OBMP X1 Y1 XRATIO YRATIO LNRGBCLR THIS LEFT TOP WBMP WIDTH HBMP HEIGHT SYSTEM DRAWING LOBITMAP LOCOLOR GETPIXEL R G B
 CONTAINER1 LBLRGB CAPTION TEXT1	 BACKCOLOR
 MouseLeave,     ��	 MouseDown�     ��	 MouseMovek    ��1 1�a3 1�2 1�A A rBArq"A2��TaA 2                       �         �   T        t  1      )   �                        	container      	container      
Container1      Form1      �Anchor = 6
Top = 204
Left = 12
Width = 240
Height = 108
SpecialEffect = 0
Visible = .F.
TabIndex = 3
Name = "Container1"
      commandbutton      commandbutton      Command7      Form1.Container1      �Top = 67
Left = 101
Height = 25
Width = 120
FontBold = .T.
Anchor = 12
Caption = "Make Transparent"
TabIndex = 1
BackColor = 221,255,255
Name = "Command7"
      6PROCEDURE Click
Thisform.ImgCanvas1.Draw()
ENDPROC
      �Top = 360
Left = 12
Height = 25
Width = 120
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "Background Pict"
TabIndex = 2
PicturePosition = 1
PictureSpacing = 1
Name = "Command3"
      shape      shape      Shape1      Form1.Container1      ?Top = 32
Left = 12
Height = 60
Width = 72
Name = "Shape1"
      textbox      textbox      Text1      Form1.Container1      _Height = 37
Left = 24
SpecialEffect = 1
TabIndex = 2
Top = 44
Width = 48
Name = "Text1"
      %PROCEDURE When
RETURN .F.
ENDPROC
      Command1      commandbutton      commandbutton      Form1      Command2      commandbutton      commandbutton      Form1.Container1      lblRGB      label      label      label      Label1      Form1.Container1      iCaption = "Original Color"
Height = 17
Left = 12
Top = 12
Width = 84
TabIndex = 3
Name = "Label1"
      label      ]Caption = ""
Height = 17
Left = 104
Top = 36
Width = 132
TabIndex = 4
Name = "lblRGB"
      �Top = 324
Left = 12
Height = 25
Width = 120
Anchor = 6
Picture = (home() + "/graphics/bitmaps/outline/open.bmp")
Caption = "GIF Picture"
TabIndex = 1
PicturePosition = 1
PictureSpacing = 1
Name = "Command2"
     �PROCEDURE Click
lcFile = GETPICT("GIF")
IF EMPTY(lcFile)
	RETURN
ENDIF

IF UPPER(JUSTEXT(lcFile)) <> "GIF"
	WAIT WINDOW ("Only GIF images are allowed for this sample !")
	RETURN
ENDIF


WITH Thisform
	.txtFile.Value = lcFile
	.Image1.Picture = lcFile

	.obmp = _Screen.System.Drawing.Bitmap.New(Thisform.txtFile.Value)
	.wBmp = .oBmp.Width
	.hBmp = .oBmp.Height

	IF NOT EMPTY(.txtFile.Value) AND NOT EMPTY(.txtFile2.Value)
		.Container1.Visible = .T.
	ENDIF 
ENDWITH
ENDPROC
      �PROCEDURE Click
lcFile = GETPICT()
IF EMPTY(lcFile)
	RETURN
ENDIF

WITH Thisform
	.txtFile2.Value = lcFile
	IF NOT EMPTY(.txtFile.Value) AND NOT EMPTY(.txtFile2.Value)
		.Container1.Visible = .T.
	ENDIF 
ENDWITH
ENDPROC
      �FontSize = 8
Anchor = 134
Enabled = .F.
Height = 25
Left = 144
TabIndex = 6
Top = 360
Width = 504
DisabledBackColor = 255,255,255
DisabledForeColor = 0,0,0
Name = "txtFile2"
     ZTop = 324
Left = 660
Height = 25
Width = 26
Anchor = 12
Picture = (home() + "/samples/solution/bts.bmp")
Caption = ""
TabIndex = 5
ToolTipText = 'Select an image; Go with your mouse over the left picture, and click in the color to become transparent; Click "Make Transparent"'
PicturePosition = 1
PictureSpacing = 1
Name = "Command1"
     ����    �  �                        �|   %   �      G  )   �          �  U  �$ %�C�  � � �� C�  � � ���b �: R,:��. Please select both GIF and background pictures�� B� �
 �� � � �� Q�	 XFCBITMAP� �� Q�	 XFCBITMAP� �� Q� XFCBITMAPDATA� ��	 Q� XFCCOLORPALETTE� ��
 Q� XFCCOLOR� �� Q� XFCCOLOR� ���9� � ���� T� �C�  � � � �� � �� T� �C�  � � �� � �� T�	 �� � �� T�	 � ��� � � �� �� ���(�C�	 � ���� T�
 �C � �	 � �� T�
 � ����� %�C � �
 � ����" T�	 � �� ��C�  �
 �� � �� ��" T�	 � �� ��C�� �
 �� � �� � �� T� � ��	 �� �� Q� XFCBITMAPDATA�? T� �CC� � � �" � �# ��! � �� �$ �% �� �& �' � �  �� ��C � � �( �� ��) �- T�) �CC��]��� _C�  � � ��� .gif�� ��C �) �� �+ �, � �* �� ��- Q�	 XFCBITMAP� T�- �C�  � � �� � �� ��C �- � �! � �. �/ �� ��C � � � � �. �/ ��� ��C� Transparent GIF createdC� C� �< A new file was created with the desired transparency effect:C� �) �@�$ Transparent GIF Created Successfully�x�� �� B� U0  THISFORM TXTFILE VALUE TXTFILE2 THIS CLEAR LOSRCBITMAP LODSTBITMAP	 LOBMPDATA	 LOPALETTE LOCOLOR LOTRANSCOLOR SYSTEM DRAWING COLOR FROMRGB
 CONTAINER1 TEXT1	 BACKCOLOR BITMAP NEW PALETTE FLAGS IMAGING PALETTEFLAGS HASALPHA N ENTRIES A EQUALS FROMARGB LOSRC LOCKBITS	 RECTANGLE WIDTH HEIGHT IMAGELOCKMODE	 WRITEONLY PIXELFORMAT FORMAT8BPPINDEXED
 UNLOCKBITS LCDESTINATION SAVE IMAGEFORMAT GIF LOBACKBITMAP OGFX	 DRAWIMAGE
 beforedraw,     ��1 A�A A � BA��11"��s�QQ!� !A A ��s ��C���5
B B 1                       �	      )   �                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                              WINDOWS _1WG1E5WSJ 892582887      /  F      ]                          �      �                       WINDOWS _1WG1E5WSK 942183509�      �  �             e  {                  �x                           WINDOWS _1WG1E5WSL 896237922�x      �x  rx  Zx  x      �w  �[  �k  Lk                                       WINDOWS _1WK10QMNA 892832403;k      *k  k  �j  �j                                                           WINDOWS _1WK10QMNT 892838900qj      ^j  Jj  &j  gg                                                           WINDOWS _1WK10QMNU 896237922Xg      Ig  8g  g  �f      Bf  �Z                                               WINDOWS _1WG1E5WSJ 8962360445f      (f  f  �e  e                                                           WINDOWS _1WK10QMNW 896237922pe      ae  Qe  -e  �d      ]d  �Y                                               WINDOWS _1WK10QMNX 896236044Pd      Cd  5d  d  �c                                                           WINDOWS _1WL174EIU 892904054�c      �c  pc  Lc  �b                                                           WINDOWS _1WG1E5WSJ 896236044�b      �b  �b  b  
b                                                           WINDOWS _1WG1E5WSK 896236044�a      �a  �a  �a  Ka                                                           WINDOWS _1XX0STF54 896236044>a      1a  "a  �`  y`                                                           WINDOWS _1WG1E5WSJ 896236711j`      [`  L`  (`  �_                                                           WINDOWS _1XX0WPLHF 896236711�_      �_  y_  U_  �^                                                           WINDOWS _1WK10QMNZ 896237922�^  �^  �^  �^  q^  ^      �\  �W                                               COMMENT RESERVED                                �\                                                            �f                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      VFPTHEMEEXPLORER     ]Height = 612
Width = 673
DoCreate = .T.
AutoCenter = .T.
Caption = "VFP Theme Explorer"
AllowOutput = .F.
_memberdata =     1999<VFPData><memberdata name="ixmldocument" type="property" display="IXMLDocument"/><memberdata name="ixmldomelement" type="property" display="IXMLDOMElement"/><memberdata name="getnodedetails" type="method" display="GetNodeDetails"/><memberdata name="drawresource" type="method" display="DrawResource"/><memberdata name="oselectednode" type="property" display="oSelectedNode"/><memberdata name="oselectednode_assign" type="property" display="oSelectedNode_Assign"/><memberdata name="npartsize" type="property" display="nPartSize"/><memberdata name="npartsize_assign" type="property" display="nPartSize_Assign"/><memberdata name="nimageheight" type="property" display="nImageHeight"/><memberdata name="nimagewidth" type="property" display="nImageWidth"/><memberdata name="lresize" type="property" display="lResize"/><memberdata name="lresize_assign" type="property" display="lResize_Assign"/><memberdata name="onresize" type="method" display="OnResize"/><memberdata name="nsize" type="property" display="nSize"/><memberdata name="render" type="method" display="Render"/><memberdata name="evaluatenode" type="method" display="EvaluateNode"/><memberdata name="cclass" type="property" display="cClass"/><memberdata name="npartid" type="property" display="nPartId"/><memberdata name="nstateid" type="property" display="nStateId"/><memberdata name="ocanvas" type="property" display="oCanvas"/><memberdata name="createcanvas" type="method" display="CreateCanvas"/><memberdata name="resizecanvas" type="method" display="ResizeCanvas"/><memberdata name="drawthemecolors" type="method" display="DrawThemeColors"/><memberdata name="loadtree" type="method" display="LoadTree"/><memberdata name="loadtreeview" type="method" display="LoadTreeView"/><memberdata name="cpart" type="property" display="cPart"/><memberdata name="cpartconstant" type="property" display="cPartConstant"/><memberdata name="nheight" type="property" display="nHeight"/><memberdata name="nwidth" type="property" display="nWidth"/></VFPData>

ixmldomelement = 
oselectednode = .NULL.
npartsize = 2
nimageheight = 22
nimagewidth = 44
lresize = .F.
nsize = 1
cclass = 
npartid = 0
nstateid = 0
ocanvas = .NULL.
cpart = 
cpartconstant = 
nheight = 0
nwidth = 0
Name = "VFPTHEMEEXPLORER"
     I�PROCEDURE drawresource
*!*	TS_MIN Receives the minimum size of a visual style part.
*!*	TS_TRUE Receives the size of the visual style part that will best fit the available space.
*!*	TS_DRAW Receives the size that the theme manager uses to draw a part.
#DEFINE TS_MIN  0
#DEFINE TS_TRUE 1
#DEFINE TS_DRAW 2
#DEFINE S_OK 0

LPARAMETERS cClass, nPartId, nStateId, nTop, nLeft

LOCAL cUnicodeClass AS STRING, ;
  nHtheme AS INTEGER, ;
  nHdc AS INTEGER, ;
  nPrect AS INTEGER, ;
  nSize AS INTEGER, ;
  cPartSize AS STRING, ;
  nWidth AS LONG, ;
  nHeight AS LONG, ;
  nResult AS INTEGER, ;
  nOldAnchor AS INTEGER, ;
  oCanvas AS FORM, ;
  oResource AS imgThemeBase IN GdiPlusX.vcx

oResource = NULL
cUnicodeClass = STRCONV(m.cClass + 0h00, 5)
nPrect = 0
nSize = INT(THISFORM.nSize)
cPartSize = SPACE(8)
oCanvas = THISFORM.oCanvas
nHtheme = OpenThemeData(0, m.cUnicodeClass)

IF m.nHtheme > 0

  oCanvas.NEWOBJECT("oResource" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "imgThemeBase", "GdiPlusX.vcx")
  oResource = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
  nHdc = oResource.hdc
  nResult = GetThemePartSize(nHtheme, nHdc, nPartId, nStateId, @nPrect, nSize, @cPartSize)

  IF m.nResult == S_OK

    *!*	The SIZE structure specifies the width and height of a rectangle.

    *!*	typedef struct tagSIZE {
    *!*	  LONG cx;
    *!*	  LONG cy;
    *!*	} SIZE, *PSIZE;

    *!*	Members
    *!*	cx    Specifies the rectangle's width. The units depend on which function uses this.
    *!*	cy    Specifies the rectangle's height. The units depend on which function uses this.

    IF m.nSize = 1 AND THISFORM.lResize
		nWidth = THISFORM.nImageWidth
		nHeight = THISFORM.nImageHeight
    ELSE
		nWidth = INT(CTOBIN(LEFT(cPartSize, 4),"RS"))
		nHeight = INT(CTOBIN(RIGHT(cPartSize, 4),"RS"))
    ENDIF

    oResource.TOP = m.nTop
    oResource.LEFT = m.nLeft
    oResource.WIDTH = m.nWidth
    oResource.HEIGHT = m.nHeight
    oResource.themeclass = m.cUnicodeClass
    oResource.themepart = m.nPartId
    oResource.themestate = m.nStateId
    oResource.ANCHOR = 3
    oResource.VISIBLE = .T.

  ELSE

    oResource = NULL
    oCanvas.REMOVEOBJECT(oCanvas.CONTROLS(oCanvas.CONTROLCOUNT).NAME)

  ENDIF

  CloseThemeData(m.nHtheme)

ENDIF

RETURN oResource
ENDPROC
PROCEDURE oselectednode_assign

LPARAMETERS oNode AS MSComctlLib.NODE

LOCAL oParams AS OBJECT

IF ISNULL(oNode)

  RETURN

ENDIF

oParams = THISFORM.EvaluateNode(oNode)

THISFORM.cClass = oParams.cClass
THISFORM.cPart = TRANSFORM(oParams.nPartId)
THISFORM.cPartConstant = oParams.cPart
THISFORM.nPartId = oParams.nPartId
THISFORM.nStateId = oParams.nStateId

THISFORM.DisplayPane.lblPart.VISIBLE = THISFORM.nPartId != -1

THISFORM.DisplayPane.txtPart.VISIBLE = THISFORM.nPartId != -1

THISFORM.DisplayPane.txtPartConstant.VISIBLE = THISFORM.nPartId != -1

THISFORM.DisplayPane.txtPart.Refresh()

THISFORM.DisplayPane.txtPartConstant.Refresh()

THISFORM.DisplayPane.txtClass.Refresh()

THISFORM.oSelectedNode = oNode

THISFORM.RENDER()

ENDPROC
PROCEDURE npartsize_assign


LPARAMETERS nPartSize

LOCAL cClass AS STRING

IF m.nPartSize = 3

  THIS.lResize = .T.
  THISFORM.nSize = 1

  *THISFORM.DisplayPane.txtHeight.ENABLED = .T.
  *THISFORM.DisplayPane.TXTWIDTH.ENABLED = .T.
  
ELSE

  THIS.lResize = .F.

  *THISFORM.DisplayPane.txtHeight.ENABLED = .F.
  *THISFORM.DisplayPane.TXTWIDTH.ENABLED = .F.

  THISFORM.nSize = INT(m.nPartSize - 1)

ENDIF

THIS.nPartSize = m.nPartSize

THIS.oSelectedNode = THIS.oSelectedNode

*THIS.DrawResource(THISFORM.cClass, THISFORM.DisplayPane.imgThemeResource.themepart, THISFORM.DisplayPane.imgThemeResource.themestate)
*THIS.Render()

ENDPROC
PROCEDURE lresize_assign

LPARAMETERS lResize

THIS.lResize = m.lResize

*THISFORM.nPartSize = THISFORM.nPartSize

ENDPROC
PROCEDURE onresize

LOCAL lOldLockScreen AS Logical, ;
  nOldAnchor AS INTEGER, ;
  nLeft, nWidth, nHeight as Integer
  
nLeft = 0

nHeight = THISFORM.Height

lOldLockScreen = THISFORM.LOCKSCREEN

THISFORM.LOCKSCREEN = .T.

nOldAnchor = THISFORM.oTreeView.ANCHOR

THISFORM.oTreeView.ANCHOR = 0

nHalf = INT(THIS.WIDTH / 2)

IF THISFORM.oTreeView.WIDTH > m.nHalf

  THISFORM.oTreeView.WIDTH = m.nHalf - THISFORM.SPLITBAR.WIDTH
  
  THISFORM.SPLITBAR.LEFT = THISFORM.oTreeView.WIDTH

ELSE

  THISFORM.oTreeView.WIDTH = THISFORM.SPLITBAR.LEFT

ENDIF

THISFORM.oTreeView.Height = m.nHeight

nWidth = THISFORM.SPLITBAR.LEFT

THISFORM.oTreeView.WIDTH = m.nWidth

THISFORM.oTreeView.ANCHOR = m.nOldAnchor

nOldAnchor = THISFORM.DisplayPane.ANCHOR

THISFORM.DisplayPane.ANCHOR = 0

THISFORM.DisplayPane.LEFT = THISFORM.SPLITBAR.LEFT + THISFORM.SPLITBAR.WIDTH

THISFORM.DisplayPane.WIDTH = THISFORM.WIDTH - THISFORM.DisplayPane.LEFT

THISFORM.DisplayPane.Height = m.nHeight

THISFORM.DisplayPane.ANCHOR = m.nOldAnchor

THISFORM.ResizeCanvas()

THISFORM.LOCKSCREEN = m.lOldLockScreen

ENDPROC
PROCEDURE render
LOCAL oChildNode AS MSComctlLib.NODE, ;
  oGrandChildNode AS MSComctlLib.NODE, ;
  oNode AS MSComctlLib.NODE, ;
  nLeft, nTop, nMaxHeight AS INTEGER, ;
  oResource AS imgThemeBase IN GdiPlusX.vcx, ;
  oCanvas AS FORM, ;
  lOldLockScreen AS Logical, ;
  oColor AS SHAPE, ;
  nColor AS INTEGER

oCanvas = THISFORM.oCanvas
lOldLockScreen = oCanvas.LOCKSCREEN

oCanvas.LOCKSCREEN = .T.

IF THIS.nPartSize != 3
	THISFORM.nImageWidth = 0
	THISFORM.nImageHeight = 0
ENDIF

nLeft = 4
nTop = 4
nMaxHeight = 0
oNode = THISFORM.oSelectedNode

* Clear all existing controls
*-----------------------------
DO WHILE oCanvas.CONTROLCOUNT > 0
	oCanvas.REMOVEOBJECT(oCanvas.CONTROLS[1].NAME)
ENDDO

ACTIVATE WINDOW resourcecanvas

DO CASE

  CASE THISFORM.nPartId <= 0

    * no part or state specified
    * draw parts vertically and states horizontally
    *-----------------------------------------------
    oChildNode = oNode.CHILD

    FOR nChild = 1 TO oNode.children

      oGrandChildNode = oChildNode.CHILD

      FOR nGrandChild = 1 TO oChildNode.children
        oParams = THISFORM.EvaluateNode(oGrandChildNode)
        oResource = THISFORM.DrawResource(oParams.cClass, oParams.nPartId, oParams.nStateId, m.nTop, m.nLeft)

        IF !ISNULL(oResource)
			nLeft = oResource.LEFT + oResource.WIDTH + 4
			nMaxHeight = IIF(oResource.HEIGHT > nMaxHeight, oResource.HEIGHT, nMaxHeight)
			oResource = NULL
		ENDIF

        oGrandChildNode = oGrandChildNode.NEXT

      ENDFOR

      nTempLeft = nLeft  + 4&&oCanvas.CONTROLS(oCanvas.CONTROLCOUNT).WIDTH + 4

      * Add a state value text box.
      *------------------------------------
      oCanvas.ADDOBJECT("oText" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")

      oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
      oText.TOP = m.nTop
      oText.HEIGHT = 23
      oText.LEFT = m.nTempLeft
      oText.VALUE = oParams.cPart
      oText.WIDTH = (LEN(oText.VALUE) * (FONTMETRIC(6) + 4)) + 5&&96
      oText.VISIBLE = .T.

      * Start a new row
      *----------------------------
      nTop = nTop + MAX(oText.Height, nMaxHeight) + 4
      nLeft = 4
      nMaxHeight = 0
      oChildNode = oChildNode.NEXT

    ENDFOR

  CASE THISFORM.nStateId <= 0

    * no state specified
    * draw the states vertically
    *-------------------------------
    oChildNode = oNode.CHILD

    FOR nChild = 1 TO oNode.children

      oParams = THISFORM.EvaluateNode(oChildNode)
      oResource = THISFORM.DrawResource(oParams.cClass, oParams.nPartId, oParams.nStateId, m.nTop, m.nLeft)
      nTempLeft = oResource.LEFT + oResource.WIDTH + 4

      * Add a state value text box.
      *------------------------------------
      oCanvas.ADDOBJECT("oText" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")
      oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
      oText.TOP = m.nTop
      oText.HEIGHT = 23
      oText.LEFT = m.nTempLeft
      oText.VALUE = TRANSFORM(oParams.nStateID)
      oText.WIDTH = (LEN(oText.VALUE) * FONTMETRIC(6)) + 15 &&96
      oText.VISIBLE = .T.

      nTempLeft = oText.LEFT + oText.WIDTH + 4

      * Add a state constant text box.
      *------------------------------------
      oCanvas.ADDOBJECT("oText" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")
      oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
      oText.TOP = m.nTop
      oText.HEIGHT = 23
      oText.LEFT = m.nTempLeft
      oText.VALUE = oParams.cState
      oText.WIDTH = LEN(oText.VALUE) * (FONTMETRIC(6) + 4) &&96
      oText.VISIBLE = .T.

      THISFORM.nImageWidth = oResource.WIDTH
      THISFORM.nImageHeight = oResource.HEIGHT

      IF !ISNULL(oResource)

        * Start a new row
        *----------------------------
        nTop = nTop + MAX(oResource.HEIGHT, 23) + 4
        oResource = NULL

      ENDIF

      oChildNode = oChildNode.NEXT

    ENDFOR

  OTHERWISE

    * Part and state are specified
    * Draw the resource
    *-----------------------------------------
    oParams = THISFORM.EvaluateNode(oNode)
    oResource = THISFORM.DrawResource(oParams.cClass, oParams.nPartId, oParams.nStateId, m.nTop, m.nLeft)

    THISFORM.nImageWidth = oResource.WIDTH
    THISFORM.nImageHeight = oResource.HEIGHT

    nTempLeft = oResource.LEFT + oResource.WIDTH + 4

    * Add a state value text box.
    *------------------------------------
    oCanvas.ADDOBJECT("oText" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")
    oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
    oText.TOP = m.nTop
    oText.HEIGHT = 23
    oText.LEFT = m.nTempLeft
    oText.VALUE = TRANSFORM(oParams.nStateID)
    oText.WIDTH = (LEN(oText.VALUE) * FONTMETRIC(6)) + 15 &&96
    oText.VISIBLE = .T.

    nTempLeft = oText.LEFT + oText.WIDTH + 4

    * Add a state constant text box.
    *------------------------------------
    oCanvas.ADDOBJECT("oText" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")

    oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)
    oText.TOP = m.nTop
    oText.HEIGHT = 23
    oText.LEFT = m.nTempLeft
    oText.VALUE = oParams.cState
    oText.WIDTH = LEN(oText.VALUE) * (FONTMETRIC(6) + 4) &&96
    oText.VISIBLE = .T.

    nTop = m.nTop + MAX(oResource.HEIGHT, 23) + 4

ENDCASE

THISFORM.cClass = oParams.cClass
THISFORM.nPartId = oParams.nPartId
THISFORM.nStateId = oParams.nStateId

* Draw theme colors.
*---------------------------------------
THISFORM.DrawThemeColors(m.nTop)

oCanvas.LOCKSCREEN = m.lOldLockScreen
THISFORM.DisplayPane.txtHeight.REFRESH()
THISFORM.DisplayPane.TXTWIDTH.REFRESH()
ENDPROC
PROCEDURE evaluatenode

LPARAMETERS oNode AS MSComctlLib.NODE

IF ISNULL(oNode)

  RETURN

ENDIF

LOCAL cKey AS STRING, ;
  nPosition AS INTEGER, ;
  cClass AS STRING, ;
  cPart AS STRING, ;
  cState AS STRING, ;
  nPartId AS INTEGER , ;
  nStateId  AS INTEGER, ;
  oReturn AS OBJECT

oReturn = CREATEOBJECT("EMPTY")
cKey = oNode.KEY
cClass = ""
cPart = ""
cState = ""
nPartId  = -1
nStateId  = -1

* what type of key is it?
*--------------------------
DO CASE

  CASE LEFT(m.cKey, 1) = "C" && class

    cClass = SUBSTR(m.cKey, 2)

  CASE LEFT(m.cKey, 1) = "P" && part

    cClass = SUBSTR(oNode.PARENT.KEY, 2)

    nPosition = AT(":", m.cKey)

    cPart = SUBSTR(m.cKey, 2, nPosition - 3)

    nPartId  = VAL(SUBSTR(m.cKey, m.nPosition + 1))

  CASE LEFT(m.cKey, 1) = "S" && state

    cClass = SUBSTR(oNode.PARENT.PARENT.KEY, 2)
    
    nPosition =  AT(":", oNode.PARENT.KEY)

    cPart = SUBSTR(oNode.PARENT.KEY, 2, nPosition - 3)

    nPartId  = VAL(SUBSTR(oNode.PARENT.KEY, m.nPosition + 1))

    nPosition = AT(":", m.cKey)

    cState = SUBSTR(m.cKey, 2, nPosition - 3)

    nStateId  = VAL(SUBSTR(m.cKey, m.nPosition + 1))

ENDCASE

ADDPROPERTY(oReturn,"cClass", m.cClass)
ADDPROPERTY(oReturn,"cPart", m.cPart)
ADDPROPERTY(oReturn,"cState", m.cState)
ADDPROPERTY(oReturn,"nPartId", INT(m.nPartId))
ADDPROPERTY(oReturn,"nStateId", INT(m.nStateId))

RETURN oReturn

ENDPROC
PROCEDURE createcanvas

SET STEP ON

DO FORM ResourceCanvas NOSHOW

SHOW WINDOW ResourceCanvas IN VFPThemeExplorer

THIS.oCanvas = ResourceCanvas

THIS.oCanvas.oParent = THIS

With THIS.oCanvas

   .Top = THIS.DisplayPane.shpCanvas.Top

   .Left = THIS.DisplayPane.shpCanvas.Left

   .Height = THIS.DisplayPane.shpCanvas.Height

   .Width = THIS.DisplayPane.shpCanvas.Width

ENDWITH
ENDPROC
PROCEDURE resizecanvas

LOCAL oCanvas as Form, ;
  lOldLockScreen as Logical, ;
  oShape as Shape

oCanvas = THIS.oCanvas

oShape = THIS.DisplayPane.shpCanvas

lOldLockScreen = oCanvas.LockScreen

oCanvas.LockScreen = .T.

oCanvas.TOP = oShape.TOP

oCanvas.LEFT = oShape.LEFT + THIS.DisplayPane.LEFT

oCanvas.HEIGHT = oShape.HEIGHT

* For reasons that I cannot discern,
* the canvas window extends beyond 
* the width of the parent window.
*-------------------------------------
*!*	IF oCanvas.WIDTH + oShape.Left > oShape.Parent.width ;
*!*	  OR oShape.Parent.width > THISFORM.Width - oShape.Parent.Left

*!*	  *SET STEP ON

*!*	  oCanvas.WIDTH = oShape.WIDTH - oShape.Left


*!*	ELSE

  *oCanvas.WIDTH = oShape.WIDTH 
  
  oCanvas.WIDTH = oShape.Parent.Width - (2 * oShape.Left)

*!*	ENDIF

ACTIVATE WINDOW resourcecanvas 

oCanvas.LockScreen = m.lOldLockScreen


ENDPROC
PROCEDURE drawthemecolors

LPARAMETERS nTop as Integer

nTheme = OpenThemeData(0, STRCONV(THISFORM.cClass + 0h00, 5))

IF nTheme > 0

  FOR nPropID = 3801 TO 3823

    nColor = 0

    *nReturn = GetThemeColor(m.nTheme, oParams.nPartId, oParams.nStateId, m.nPropID, @m.nColor)
    nReturn = GetThemeColor(m.nTheme, THISFORM.nPartId, THISFORM.nStateId, m.nPropID, @m.nColor)

    IF m.nReturn = 0 && The color exists.

      * Add a shape to display the color.
      *------------------------------------------
      oCanvas.ADDOBJECT("oColor" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "shape")

      oColor = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)

      oColor.TOP = m.nTop

      oColor.HEIGHT = 24

      oColor.WIDTH = 96

      oColor.LEFT = 4

      oColor.BACKCOLOR = m.nColor

      oColor.VISIBLE = .T.

      oCanvas.ADDOBJECT("oColor" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "textbox")

      * Add a text box to provide the color value for copy/paste.
      *------------------------------------------------------------
      oText = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)

      oText.TOP = m.nTop

      oText.HEIGHT = 24

      oText.LEFT = oColor.LEFT + oColor.WIDTH + 4

      oText.VALUE = TRANSFORM(m.nColor)

      oText.WIDTH = 80

      oText.VISIBLE = .T.

      oCanvas.ADDOBJECT("oColor" + TRANSFORM(oCanvas.CONTROLCOUNT + 1), "label")

      * Add a label with the color's "name".
      *---------------------------------------
      oLabel = oCanvas.CONTROLS(oCanvas.CONTROLCOUNT)

      oLabel.TOP = m.nTop

      oLabel.HEIGHT = 24

      oLabel.WIDTH = 156

      oLabel.LEFT = oText.LEFT + oText.WIDTH + 4

      oLabel.CAPTION  = THIS.oProps(TRANSFORM(m.nPropID))

      oLabel.BACKSTYLE = 0

      oLabel.VISIBLE = .T.

      nTop = m.nTop + oColor.HEIGHT + 4

    ENDIF

  ENDFOR

  CloseThemeData(m.nTheme)

ENDIF
ENDPROC
PROCEDURE loadtreeview
#DEFINE tvwChild 4

LOCAL oXmlDom AS Msxml2.DOMDocument

oXmlDom = THISFORM.IXMLDOMELEMENT

LOCAL cClass, cPart, cState, cId AS STRING
LOCAL oClasses, oParts, oStates, oClassElement, oPartElement, oStateElement AS Msxml2.IXMLDOMNode
LOCAL oRootNode, oClassNode, oPartNode AS MSComctlLib.NODE
LOCAL oTreeView AS MSComctlLib.ITreeView

oTreeView = THISFORM.oTreeView
oClasses = oXmlDom.selectNodes("ThemeData/Class")

FOR EACH oClassElement IN oClasses
  cClass = oClassElement.GetAttribute("name")
  oClassNode = oTreeView.Nodes.ADD(, , "C" + m.cClass, m.cClass)
  oParts = oClassElement.selectNodes("Part")

  FOR EACH oPartElement IN oParts
    cPart = oPartElement.GetAttribute("name")
    cId = oPartElement.GetAttribute("id")
    oPartNode = oTreeView.Nodes.ADD(oClassNode, tvwChild, "P" + cPart + "I:" + cId, cPart + " (" + cId + ")")
    oStates = oPartElement.selectNodes("State")

    FOR EACH oStateElement IN oStates
      cState = oStateElement.GetAttribute("name")
      cId = oStateElement.GetAttribute("id")
      oTreeView.Nodes.ADD(oPartNode, tvwChild, "S" + cState + "P" + cPart + "I:" + cId, cState + " (" + cId + ")")
    ENDFOR

  ENDFOR

ENDFOR
ENDPROC
PROCEDURE Load
DO LOCFILE("System.app")
ENDPROC
PROCEDURE Init
THIS.IXMLDOMELEMENT = CREATEOBJECT("Msxml2.DomDocument.4.0")
THIS.IXMLDOMELEMENT.ASYNC = .F.
THIS.IXMLDOMELEMENT.LOAD(LOCFILE("uxtheme.xml"))

IF NOT EMPTY(THIS.IXMLDOMELEMENT.parseError.errorCode)
	MESSAGEBOX("Failed to load XML.")
	RETURN .F.
ENDIF

DECLARE LONG OpenThemeData IN UXTHEME LONG HWND, STRING classList

  
* Create a collection for GetThemeColor parameters.
*---------------------------------------------------
THIS.NEWOBJECT("oProps", "COLLECTION")

THIS.oProps.ADD("BORDERCOLOR","3801")
THIS.oProps.ADD("FILLCOLOR","3802")
THIS.oProps.ADD("TEXTCOLOR","3803")
THIS.oProps.ADD("EDGELIGHTCOLOR","3804")
THIS.oProps.ADD("EDGEHIGHLIGHTCOLOR","3805")
THIS.oProps.ADD("EDGESHADOWCOLOR","3806")
THIS.oProps.ADD("EDGEDKSHADOWCOLOR","3807")
THIS.oProps.ADD("EDGEFILLCOLOR","3808")
THIS.oProps.ADD("TRANSPARENTCOLOR","3809")
THIS.oProps.ADD("GRADIENTCOLOR1","3810")
THIS.oProps.ADD("GRADIENTCOLOR2","3811")
THIS.oProps.ADD("GRADIENTCOLOR3","3812")
THIS.oProps.ADD("GRADIENTCOLOR4","3813")
THIS.oProps.ADD("GRADIENTCOLOR5","3814")
THIS.oProps.ADD("SHADOWCOLOR","3815")
THIS.oProps.ADD("GLOWCOLOR","3816")
THIS.oProps.ADD("TEXTBORDERCOLOR","3817")
THIS.oProps.ADD("TEXTSHADOWCOLOR","3818")
THIS.oProps.ADD("GLYPHTEXTCOLOR","3819")
THIS.oProps.ADD("GLYPHTRANSPARENTCOLOR","3820")
THIS.oProps.ADD("FILLCOLORHINT","3821")
THIS.oProps.ADD("BORDERCOLORHINT","3822")
THIS.oProps.ADD("ACCENTCOLORHINT","3823")



THIS.LoadTreeView()

DO FORM ResourceCanvas NAME THIS.oCanvas NOSHOW
SHOW WINDOW ResourceCanvas IN vfpthemeexplorer

THISFORM.ResizeCanvas()
BINDEVENT(THIS, "Resize", THIS, "OnResize", 1)

THIS.oSelectedNode = THISFORM.oTreeView.Nodes(1)

THIS.MINHEIGHT = INT(THIS.HEIGHT / 2)
THIS.MINWIDTH = INT(THIS.WIDTH / 2)

IF _VFP.STARTMODE = 4
	_SCREEN.CLOSABLE = .F.
	ON SHUTDOWN CLEAR EVENTS
	SHOW WINDOW vfpthemeexplorer
	READ EVENTS
ELSE
	SHOW WINDOW vfpthemeexplorer
ENDIF
ENDPROC
PROCEDURE Destroy

THIS.oCanvas = NULL

DODEFAULT()

IF _VFP.STARTMODE = 4

  QUIT 

ENDIF
ENDPROC
     ����    �  �                        *�   %   ;      ~  	   l          �  U  L ' ��C� lOldLockScreen� � � �  � �� T� � � �a�� T� � � �-�� U  THIS ADDPROPERTY THISFORM OCANVAS
 LOCKSCREEN VISIBLE2  T�  � � �a�� t,� � T�  � � �� � �� U  THISFORM OCANVAS VISIBLE RESOURCECANVAS
 LOCKSCREEN THIS LOLDLOCKSCREEN beforemousedown,     �� aftermousedown�     ��1 r3 � b1                       �         �   B  
    )   �                        ����    �   �                         k�   %   [       p      j           �  U    T�  � ��  � �� U  THISFORM	 NPARTSIZE Valid,     ��1 23                       >       )   �                         ����    �   �                         k�   %   [       p      j           �  U    T�  � ��  � �� U  THISFORM	 NPARTSIZE Valid,     ��1 23                       >       )   �                         ����    �   �                         �    %   i       �      |           �  U    ��  � T� � ��  �� U  NODE THISFORM OSELECTEDNODE	 NodeClick,     ��1 r 2                       g       )   �                         !Arial, 0, 9, 5, 15, 12, 32, 3, 0
     MPROCEDURE beforemousedown

THIS.AddProperty("lOldLockScreen", THISFORM.oCanvas.LockScreen)

THISFORM.oCanvas.LockScreen = .T.

THISFORM.oCanvas.Visible = .F.

ENDPROC
PROCEDURE aftermousedown

THISFORM.oCanvas.Visible = .T.

ACTIVATE WINDOW resourcecanvas 

THISFORM.oCanvas.LockScreen = THIS.lOldLockScreen
ENDPROC
      RTop = 0
Left = 264
Height = 612
Anchor = 5
rangemax = 0.5
Name = "SplitBar"
      VFPTHEMEEXPLORER      SplitBar      shape      splitter.vcx      splitter      �ControlSource = "THISFORM.cPartConstant"
Height = 23
Left = 191
Top = 30
Visible = .F.
Width = 132
Name = "txtPartConstant"
      VFPTHEMEEXPLORER.DisplayPane      txtPartConstant      textbox      textbox      rControlSource = "THISFORM.cPart"
Height = 23
Left = 158
Top = 30
Visible = .F.
Width = 31
Name = "txtPart"
      VFPTHEMEEXPLORER.DisplayPane      txtPart      textbox      textbox      }Anchor = 3
BackStyle = 0
Caption = "Part"
Height = 17
Left = 116
Top = 33
Visible = .F.
Width = 40
Name = "lblPart"
      VFPTHEMEEXPLORER.DisplayPane      lblPart      label      label      eControlSource = "THISFORM.cClass"
Height = 23
Left = 157
Top = 5
Width = 100
Name = "txtClass"
      VFPTHEMEEXPLORER.DisplayPane      txtClass      textbox      textbox      mAnchor = 3
BackStyle = 0
Caption = "Class"
Height = 17
Left = 115
Top = 8
Width = 40
Name = "Label3"
      VFPTHEMEEXPLORER.DisplayPane      Label3      label      label      yTop = 108
Left = 9
Height = 492
Width = 384
Anchor = 15
Visible = .F.
BackColor = 255,255,255
Name = "shpCanvas"
      VFPTHEMEEXPLORER.DisplayPane      	shpCanvas      shape      shape      nAnchor = 3
BackStyle = 0
Caption = "Width"
Height = 17
Left = 116
Top = 83
Width = 40
Name = "Label2"
      VFPTHEMEEXPLORER.DisplayPane      Label2      label      label      IPROCEDURE Valid

THISFORM.nPartSize = THISFORM.nPartSize


ENDPROC
      wAnchor = 3
ControlSource = "THISFORM.nImageWidth"
Height = 23
Left = 158
Top = 80
Width = 100
Name = "txtWidth"
      VFPTHEMEEXPLORER.DisplayPane      txtWidth      textbox      textbox      oAnchor = 3
BackStyle = 0
Caption = "Height"
Height = 17
Left = 116
Top = 58
Width = 40
Name = "Label1"
      VFPTHEMEEXPLORER.DisplayPane      Label1      label      label      IPROCEDURE Valid

THISFORM.nPartSize = THISFORM.nPartSize


ENDPROC
      yAnchor = 3
ControlSource = "THISFORM.nImageHeight"
Height = 23
Left = 158
Top = 55
Width = 100
Name = "txtHeight"
      VFPTHEMEEXPLORER.DisplayPane      	txtHeight      textbox      textbox     �ButtonCount = 3
Anchor = 3
BackStyle = 0
Value = 1
ControlSource = "THISFORM.nPartSize"
Height = 90
Left = 12
Top = 12
Width = 94
Name = "Optiongroup1"
Option1.Caption = "Minimum"
Option1.Value = 1
Option1.Height = 27
Option1.Left = 5
Option1.SpecialEffect = 0
Option1.Style = 1
Option1.Top = 5
Option1.Width = 84
Option1.Name = "Option1"
Option2.Caption = "Default"
Option2.Value = 2
Option2.Height = 27
Option2.Left = 5
Option2.Style = 1
Option2.Top = 33
Option2.Width = 84
Option2.Name = "Option2"
Option3.Caption = "Fill"
Option3.Value = 3
Option3.Height = 27
Option3.Left = 5
Option3.Style = 1
Option3.Top = 61
Option3.Width = 84
Option3.Name = "Option3"
      VFPTHEMEEXPLORER.DisplayPane      Optiongroup1      optiongroup      optiongroup      sAnchor = 15
Top = 0
Left = 267
Width = 406
Height = 612
BackStyle = 0
BorderWidth = 0
Name = "DisplayPane"
      VFPTHEMEEXPLORER      DisplayPane      	container      	container      .OLEObject = C:\WINDOWS\system32\MSCOMCTL.OCX
      ��ࡱ�                >  ��	                               ����        ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������   ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������R o o t   E n t r y                                               ��������                               `�
OR�   @       O l e O b j e c t D a t a                                            ����                                        j        A c c e s s O b j S i t e D a t a                             &  ������������                                       \        C h a n g e d P r o p s                                         ������������                                       <            ����   ����         ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������Aǉ���j ��(6(!C4   I  A?  �<�j  "   = i �  � 	��ͫ\                          $   8                       9368265E-85FE-11d1-8BE3-0000F8754DA1g ) R L o } o @ y ? ) ( q s w M ) .   �   HideSelection    L       Indentation    N             ؤ F       �$�    \ ��  h� ? V X B ] 2 d I L p *   C@
   LabelEdit 	   I
      
   LineStyle 	   I
         MousePointer 	   I
          PathSeparator 
   H       \   Style 	   I
         OLEDragMode 	   I
          OLEDropMode 	   I
          Appearance 	   I
       
   SingleSel    L    sed Z��w   	 JZ "              �      RColonna MT oolbook mpressed Z��w   	 S� %              �      Cooper Black lbook mpressed Z��w   	 \� $              �      "Copperplate Gothic Bold sed Z��w   	 e� #              �      "Copperplate Gothic Light ed Z��w   	 n� *              �      RCurlz MT te Gothic Light ed Z��w   	 w� $              �      "Eras Light ITC t ITC ght ed Z��w   	 ��       rPROCEDURE NodeClick
*** ActiveX Control Event ***
LPARAMETERS NODE

THISFORM.oSelectedNode = NODE

ENDPROC
      NTop = 0
Left = 0
Height = 612
Width = 264
Anchor = 7
Name = "oTreeView"
      VFPTHEMEEXPLORER      	oTreeView      
olecontrol      
olecontrol     d_memberdata XML Metadata for customizable properties
ixmldomelement Reference to the IXMLDOMElement object after successful execution of LoadXML() method or Attach method. NULL when not populated.
oselectednode
npartsize
nimageheight
nimagewidth
lresize
nsize
cclass
npartid
nstateid
ocanvas
cpart
cpartconstant
nheight
nwidth
*drawresource 
*oselectednode_assign 
*npartsize_assign 
*lresize_assign 
*onresize 
*render Occurs when Report Engine is ready to provide output for each layout object in a band.
*evaluatenode 
*createcanvas 
*resizecanvas 
*drawthemecolors 
*loadtreeview 
     0K���    20  20                        ��   %   �*      /  �  	,          �  U  o ��  � � � � �� �� Q� STRING� Q� INTEGER� Q� INTEGER� Q� INTEGER�	 Q� INTEGER�
 Q� STRING� Q� LONG� Q� LONG� Q� INTEGER� Q� INTEGER� Q� FORM� Q� IMGTHEMEBASE� T� ���� T� �C��  �  ���� T� �� �� T�	 �C� �	 8�� T�
 �C�X�� T� �� � �� T� �C�  �� � �� %��� � ��_�D ��C�	 oResourceC� � �_� imgThemeBase� GdiPlusX.vcx� � �� T� �C� � � � �� T� �� � ��* T� �C �  �  �  � �  �	 �
 � �� %��� � ��� %���	 �� � � 	��;� T� �� � �� T� �� � �� �{� T� �CCC�
 �=� RS��8�� T� �CCC�
 �R� RS��8�� � T� � ��� �� T� � ��� �� T� � ��� �� T� � ��� �� T� � ��� �� T� �  ��� �� T� �! ��� �� T� �" ���� T� �# �a�� �K� T� ���� ��CC� � � � �% � �$ �� � ��C �� �& �� �	 B�� �� U'  CCLASS NPARTID NSTATEID NTOP NLEFT CUNICODECLASS NHTHEME NHDC NPRECT NSIZE	 CPARTSIZE NWIDTH NHEIGHT NRESULT
 NOLDANCHOR OCANVAS	 ORESOURCE THISFORM OPENTHEMEDATA	 NEWOBJECT CONTROLCOUNT CONTROLS HDC GETTHEMEPARTSIZE LRESIZE NIMAGEWIDTH NIMAGEHEIGHT TOP LEFT WIDTH HEIGHT
 THEMECLASS	 THEMEPART
 THEMESTATE ANCHOR VISIBLE REMOVEOBJECT NAME CLOSETHEMEDATAl ��  Q� MSCOMCTLLIB.NODE� �� Q� OBJECT� %�C�  ���? � B� � T� �C �  � � �� T� � �� � �� T� � �C� � _�� T� � �� � �� T� � �� � �� T� � �� � �� T� �	 �
 � �� � ����� T� �	 � � �� � ����� T� �	 � � �� � ����� ��C� �	 � � �� ��C� �	 � � �� ��C� �	 � � �� T� � ��  �� ��C� � �� U  ONODE OPARAMS THISFORM EVALUATENODE CCLASS CPART NPARTID CPARTCONSTANT NSTATEID DISPLAYPANE LBLPART VISIBLE TXTPART TXTPARTCONSTANT REFRESH TXTCLASS OSELECTEDNODE RENDER�  ��  � �� Q� STRING� %���  ���I � T� � �a�� T� � ���� �w � T� � �-�� T� � �C��  �8�� � T� �  ���  �� T� � �� � �� U 	 NPARTSIZE CCLASS THIS LRESIZE THISFORM NSIZE OSELECTEDNODE  ��  � T� �  ���  �� U  LRESIZE THIS,8 ��  Q� LOGICAL� Q� INTEGER� � � Q� INTEGER� T� �� �� T� �� � �� T�  �� � �� T� � �a�� T� �� � �	 �� T� � �	 �� �� T�
 �C� � �8�� %�� � � ��
 �� � T� � � ���
 � � � �� T� � � �� � � �� �!� T� � � �� � � �� � T� � � ��� �� T� �� � � �� T� � � ��� �� T� � �	 ��� �� T� �� � �	 �� T� � �	 �� ��# T� � � �� � � � � � ��  T� � � �� � � � � �� T� � � ��� �� T� � �	 ��� �� ��C� � �� T� � ���  �� U  LOLDLOCKSCREEN
 NOLDANCHOR NLEFT NWIDTH NHEIGHT THISFORM HEIGHT
 LOCKSCREEN	 OTREEVIEW ANCHOR NHALF THIS WIDTH SPLITBAR LEFT DISPLAYPANE RESIZECANVAS�v ��  Q� MSCOMCTLLIB.NODE� Q� MSCOMCTLLIB.NODE� Q� MSCOMCTLLIB.NODE� � � Q� INTEGER� Q� IMGTHEMEBASE� T� �� � �� T�	 �� �
 �� T� �
 �a�� %�� � ���� � T� � �� �� T� � �� �� � T� ���� T� ���� T� �� �� T� �� � �� +�� � � ��B� ��CC�� � � � � �� � t,� � H�[�q� �� � � ���� T�  �� � �� �� ���(�� � ���� T� ��  � �� �� ���(��  � ��v� T� �C � � � ��/ T� �C� � � � � �  ��  �� � � �� %�C� �
��b� T� �� � � �  ���% T� �C� �! � �	 � �! � � 6�� T� ���� � T� �� �" �� �� T�# �� ���, ��C� oTextC� � �_� textbox� �$ �� T�% �C� � � � �� T�% �& ��� �� T�% �! ���� T�% � ���# �� T�% �' �� �( ��& T�% �  �C�% �' >C��$���� T�% �) �a�� T� �� C�% �! � D��� T� ���� T� �� �� T�  ��  �" �� �� �� � � ��6� T�  �� � �� �� ���(�� � ��2� T� �C �  � � ��/ T� �C� � � � � �  ��  �� � � �� T�# �� � � �  ���, ��C� oTextC� � �_� textbox� �$ �� T�% �C� � � � �� T�% �& ��� �� T�% �! ���� T�% � ���# �� T�% �' �C� � _��! T�% �  �C�% �' >C��$��� T�% �) �a�� T�# ��% � �% �  ���, ��C� oTextC� � �_� textbox� �$ �� T�% �C� � � � �� T�% �& ��� �� T�% �! ���� T�% � ���# �� T�% �' �� �* ��! T�% �  �C�% �' >C��$��� T�% �) �a�� T� � �� �  �� T� � �� �! �� %�C� �
��� T� �� C� �! �D��� T� ���� � T�  ��  �" �� �� 2�q� T� �C � � � ��/ T� �C� � � � � �  ��  �� � � �� T� � �� �  �� T� � �� �! �� T�# �� � � �  ���, ��C� oTextC� � �_� textbox� �$ �� T�% �C� � � � �� T�% �& ��� �� T�% �! ���� T�% � ���# �� T�% �' �C� � _��! T�% �  �C�% �' >C��$��� T�% �) �a�� T�# ��% � �% �  ���, ��C� oTextC� � �_� textbox� �$ �� T�% �C� � � � �� T�% �& ��� �� T�% �! ���� T�% � ���# �� T�% �' �� �* ��! T�% �  �C�% �' >C��$��� T�% �) �a�� T� ��� C� �! �D��� � T� � �� � �� T� � �� � �� T� � �� � �� ��C �� � �+ �� T� �
 ���	 �� ��C� �, �- �. �� ��C� �, �/ �. �� U0 
 OCHILDNODE OGRANDCHILDNODE ONODE NLEFT NTOP
 NMAXHEIGHT	 ORESOURCE OCANVAS THISFORM LOLDLOCKSCREEN
 LOCKSCREEN THIS	 NPARTSIZE NIMAGEWIDTH NIMAGEHEIGHT OSELECTEDNODE CONTROLCOUNT REMOVEOBJECT CONTROLS NAME RESOURCECANVAS NPARTID CHILD NCHILD CHILDREN NGRANDCHILD OPARAMS EVALUATENODE DRAWRESOURCE CCLASS NSTATEID LEFT WIDTH HEIGHT NEXT	 NTEMPLEFT	 ADDOBJECT OTEXT TOP VALUE CPART VISIBLE CSTATE DRAWTHEMECOLORS DISPLAYPANE	 TXTHEIGHT REFRESH TXTWIDTH7 ��  Q� MSCOMCTLLIB.NODE� %�C�  ���. � B� �v �� Q� STRING� Q� INTEGER� Q� STRING� Q� STRING� Q� STRING� Q� INTEGER� Q� INTEGER� Q� OBJECT� T� �C� EMPTY�N�� T� ��  �	 �� T� ��  �� T� ��  �� T� ��  �� T� ������ T� ������ H���� �C�� �=� C��J� T� �C�� �\�� �C�� �=� P���� T� �C�  �
 �	 �\�� T� �C� :�� �� T� �C�� �� �\�� T� �CC�� �� �\g�� �C�� �=� S���� T� �C�  �
 �
 �	 �\�� T� �C� :�  �
 �	 �� T� �C�  �
 �	 �� �\��  T� �CC�  �
 �	 �� �\g�� T� �C� :�� �� T� �C�� �� �\�� T� �CC�� �� �\g�� � ��C� � cClass�� 
�� ��C� � cPart�� 
�� ��C� � cState�� 
�� ��C� � nPartIdC�� 8
�� ��C� � nStateIdC�� 8
��	 B�� �� U  ONODE CKEY	 NPOSITION CCLASS CPART CSTATE NPARTID NSTATEID ORETURN KEY PARENT�  G1 � � ResourceCanvas�� �,� �  � T� � ��  �� T� � � �� �� ��� � ��� � T�� �� � � � �� T�� �� � � � �� T��	 �� � � �	 �� T��
 �� � � �
 �� �� U  RESOURCECANVAS VFPTHEMEEXPLORER THIS OCANVAS OPARENT TOP DISPLAYPANE	 SHPCANVAS LEFT HEIGHT WIDTH� + ��  Q� FORM� Q� LOGICAL� Q� SHAPE� T�  �� �  �� T� �� � � �� T� ��  � �� T�  � �a�� T�  � �� � �� T�  � �� � � � � �� T�  �	 �� �	 ��" T�  �
 �� � �
 �� � �� t,� � T�  � ��� �� U  OCANVAS LOLDLOCKSCREEN OSHAPE THIS DISPLAYPANE	 SHPCANVAS
 LOCKSCREEN TOP LEFT HEIGHT WIDTH PARENT RESOURCECANVAS	 ��  Q� INTEGER�# T� �C� C� � �  ��� �� %�� � ��� �� ����(������� T� �� ��, T� �C �� � �	 � �
  �� �� � �� %��� � ����+ ��C� oColorC� � �_� shape� � �� T� �C� � � � �� T� � ���  �� T� � ���� T� � ��`�� T� � ���� T� � ��� �� T� � �a��- ��C� oColorC� � �_� textbox� � �� T� �C� � � � �� T� � ���  �� T� � ���� T� � �� � � � ��� T� � �C�� _�� T� � ��P�� T� � �a��+ ��C� oColorC� � �_� label� � �� T� �C� � � � �� T� � ���  �� T� � ���� T� � ����� T� � �� � � � ��� T� � �CC�� _� � �� T� � �� �� T� � �a�� T�  ���  � � ��� � �� ��C �� � �� � U  NTOP NTHEME OPENTHEMEDATA THISFORM CCLASS NPROPID NCOLOR NRETURN GETTHEMECOLOR NPARTID NSTATEID OCANVAS	 ADDOBJECT CONTROLCOUNT OCOLOR CONTROLS TOP HEIGHT WIDTH LEFT	 BACKCOLOR VISIBLE OTEXT VALUE OLABEL CAPTION THIS OPROPS	 BACKSTYLE CLOSETHEMEDATA{ ��  Q� MSXML2.DOMDocument� T�  �� � �� �� � � � Q� STRING�1 �� � �	 �
 � � Q� MSXML2.IXMLDOMNode�# �� � � Q� MSCOMCTLLIB.NODE�  �� Q� MSCOMCTLLIB.ITreeView� T� �� � ��# T� �C� ThemeData/Class�  � �� ��
 � �t� T� �C� name�
 � ��& T� �C��� C��  �� � � � �� T� �C� Part�
 � �� �� � �p� T� �C� name� � �� T� �C� id� � ��? T� �C � �� P� � I:� � �  (� � )� � � �� T�	 �C� State� � �� �� �	 �l� T� �C� name� � �� T� �C� id� � ��D ��C � �� S� � P� � I:� � �  (� � )� � � �� �� �� �� U  OXMLDOM THISFORM IXMLDOMELEMENT CCLASS CPART CSTATE CID OCLASSES OPARTS OSTATES OCLASSELEMENT OPARTELEMENT OSTATEELEMENT	 OROOTNODE
 OCLASSNODE	 OPARTNODE	 OTREEVIEW SELECTNODES GETATTRIBUTE NODES ADD  �C�
 System.app��� U  �) T�  � �C� Msxml2.DomDocument.4.0�N�� T�  � � �-��! ��CC� uxtheme.xml��  � � �� %�C�  � � � �
��� � ��C� Failed to load XML.�x�� B�-�� �# |�� OpenThemeData� UXTHEME���# ��C� oProps�
 COLLECTION�  � ��% ��C� BORDERCOLOR� 3801�  �	 �
 ��# ��C�	 FILLCOLOR� 3802�  �	 �
 ��# ��C�	 TEXTCOLOR� 3803�  �	 �
 ��( ��C� EDGELIGHTCOLOR� 3804�  �	 �
 ��, ��C� EDGEHIGHLIGHTCOLOR� 3805�  �	 �
 ��) ��C� EDGESHADOWCOLOR� 3806�  �	 �
 ��+ ��C� EDGEDKSHADOWCOLOR� 3807�  �	 �
 ��' ��C� EDGEFILLCOLOR� 3808�  �	 �
 ��* ��C� TRANSPARENTCOLOR� 3809�  �	 �
 ��( ��C� GRADIENTCOLOR1� 3810�  �	 �
 ��( ��C� GRADIENTCOLOR2� 3811�  �	 �
 ��( ��C� GRADIENTCOLOR3� 3812�  �	 �
 ��( ��C� GRADIENTCOLOR4� 3813�  �	 �
 ��( ��C� GRADIENTCOLOR5� 3814�  �	 �
 ��% ��C� SHADOWCOLOR� 3815�  �	 �
 ��# ��C�	 GLOWCOLOR� 3816�  �	 �
 ��) ��C� TEXTBORDERCOLOR� 3817�  �	 �
 ��) ��C� TEXTSHADOWCOLOR� 3818�  �	 �
 ��( ��C� GLYPHTEXTCOLOR� 3819�  �	 �
 ��/ ��C� GLYPHTRANSPARENTCOLOR� 3820�  �	 �
 ��' ��C� FILLCOLORHINT� 3821�  �	 �
 ��) ��C� BORDERCOLORHINT� 3822�  �	 �
 ��) ��C� ACCENTCOLORHINT� 3823�  �	 �
 �� ��C�  � �� � ResourceCanvasJ�  � �� �,� � � ��C� � ��& ��C�  � Resize�  � OnResize��� T�  � �C�� � � �� T�  � �C�  � �8�� T�  � �C�  � �8�� %��C� ���q� T�9� �-�� 1�� CLEAR EVENTS� �,� � 9�� ��� �,� � � U  THIS IXMLDOMELEMENT ASYNC LOAD
 PARSEERROR	 ERRORCODE OPENTHEMEDATA UXTHEME	 NEWOBJECT OPROPS ADD LOADTREEVIEW RESOURCECANVAS OCANVAS VFPTHEMEEXPLORER THISFORM RESIZECANVAS OSELECTEDNODE	 OTREEVIEW NODES	 MINHEIGHT HEIGHT MINWIDTH WIDTH	 STARTMODE CLOSABLE5  T�  � ����	 ��C��� %��C� ���. � 8� � U  THIS OCANVAS	 STARTMODE drawresource,     �� oselectednode_assign"    �� npartsize_assignN    �� lresize_assign7    �� onresizef    �� render:    �� evaluatenode&    �� createcanvas�    �� resizecanvas�    �� drawthemecolorsW    �� loadtreeviewy     �� Load�#    �� Init�#    �� Destroy�*    ��1 y� �� !� q2Bq�2�� ��A "!!!!!!� � � �B B � 2 �� B B R2Q111���222� 3 s 2� � � �B "26 r "5 �� � 22b���� �B R2RR222RR� "3 i� BA � � � T�A � � B��Q��Q� A B �r!!1a� �� � B B�R���q!!Q� ��q!!1� 21�� B B � U�21��q!!Q� ��r!!1� �B 2114"112 �� B B iR� � � � � � �B��R������R��B ������ 3 b r� 2rrrrB 2 �2� 2�2!� "4 "2�� �2�r""� �t"�B� �t"��� �B B B 2 ��11� �a�� �a��� �aAA B B 2 a2 ���q A 25R11����q������Q1����q��� �� � a���2� A� Q � � A 2 � � 2B B 1                       	     (   :	    T   <   D  �  y   H   �  B  �   K   a  �  �   f   �  �)  �   �   *  �/  �  �   �/  ;1  �    ^1  �4  �    �4  c<  *  6  �<  4A  }  O  OA  gA  �  Q  �A  I  �  �  6I  �I  �   )   20                  0	   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _1SZ0YVE5L 884048434,  d
  J
        �	      �  �          W
                 �               COMMENT RESERVED                        I                                                                   WINDOWS _1SZ0Z0B1N 884048521�  �  �  f      �                        #                             COMMENT RESERVED                        �                                                                   WINDOWS _1SZ0Z2FEC 884052427�      �  �      �  �  !  �          �  �  �                         WINDOWS _1SZ0XT1S0 884051547�  �    �  �  �                                                           WINDOWS _1SZ0ZA5BZ 884051547b  v  �  �  �  	                                                           COMMENT RESERVED                        �                                                                   WINDOWS _1SZ13URAM 884053120�  �  f  �      #                      ~  X              s               COMMENT RESERVED                                                                                           WINDOWS _1SZ0YMNIB 884080685b  �  �  v            �            U  @              G               COMMENT RESERVED                        1                                                                   WINDOWS _1TO03WFQY 885723255P      �  x
              W          �  s  "          �               WINDOWS _1TO040VN1 885722772   6
  �  �  |                                                             COMMENT RESERVED                        �                                                                   WINDOWS _1SZ0Y2C1V 932580421�  "
  �  �      1      �@  �]          �  �  �          s               COMMENT RESERVED                        _                                                                   WINDOWS _1SM0PX95U 942154604      a  n      y8  �
  xo  f#          	  O  �          A      )       COMMENT RESERVED                                                                                          ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      	imgcanvas      system.drawing.h      Pixels      1      1      image      	imgcanvas      imgthemeclock      gdiplusx.vcx      imgthemebase      1      Class      Pixels      	ctlcanvas      control      1      Class      image      1      imgthemebase      1      imgthemetoolbarbutton      image      2      	ctlcanvas      
Imgcanvas1      image      Imgthemebase1      ctlthemeprogressbar      ~Height = 21
Left = 3
Top = 3
Width = 57
themeclass = (STRCONV("Progress"+0h00,5))
themepart = 1
Name = "Imgthemebase1"
      imgthemebase      gdiplusx.vcx      image      Imgthemebase2      ctlthemeprogressbar      ctlthemeprogressbar      control      3      Class      Pixels      image      &ogfx
*beforedraw 
*setup 
*clear 
      control      imgthemebase      Pixels      Class      	imgcanvas      imgthemebase      image      Pixels      imgthemeclock      imgthemebase      gdiplusx.vcx      D  system.drawing.hf5$8 system.h&gT�&8 gdiplusconstants.h.h5$8     ����    �  �                        �   %         P  
   <          �  U    ��C�  � � �� U  THIS
 IMGCANVAS1 RESIZEB  T�  � � ��  � �� T�  � � ��  � �� T�  � � ���� U  THIS
 IMGCANVAS1 WIDTH HEIGHT ANCHOR  ��  � ��C �  � � � �� U  ECOLOR THIS
 IMGCANVAS1 CLEAR Resize,     �� Init]     �� clear�     ��1 2 aa12 q B1                       ,         G   �         �   �   
    )   �                        Qthemestate = 0
themepart = 0
themeclass = 
isxp = .F.
Name = "imgthemebase"
      min
max
value Specifies the current state of a control.
orientation
*value_assign 
*orientation_assign 
*updatecontrol 
      Height = 21
Left = 62
Top = 3
Width = 57
themeclass = (STRCONV("Progress"+0h00,5))
themepart = 1
Name = "Imgthemebase2"
      �Height = 37
Width = 37
themestate = 1
themeclass = (STRCONV("Toolbar"+0h00,5))
themepart = 1
Name = "imgthemetoolbarbutton"
      gdiplusx.vcx      gdiplusx.vcx      image      Class      gdiplusx.vcx      	ctlcanvas      �_bmpwidth
_bmpheight
_tempfile
_hwnd
_hbitmapold
deleteosb
renderosb
createosb
rectangle_access
smoothingmode_assign
textrenderinghint_assign
interpolationmode_assign
width_access
height_access
backstyle_access
      Pixels      image      �Height = 20
Width = 207
themestate = 1
themeclass = (STRCONV("Progress"+0h00,5))
themepart = 1
Name = "imgthemeprogressbar"
      ^Width = 348
Height = 252
BackStyle = 0
BorderWidth = 0
ogfx = (NULL)
Name = "ctlcanvas"
      Class     �PROCEDURE MouseEnter
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 2
ENDPROC
PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 1
ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 3
ENDPROC
PROCEDURE MouseUp
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 2
ENDPROC
      CHeight = 252
Left = 0
Top = 0
Width = 348
Name = "Imgcanvas1"
      imgthemeprogressbar      updatecontrol
      ctlthemeprogressbar      gdiplusx.vcx      imgthemebase      control      imgthemeprogressbar      Pixels      Class      	imgcanvas      imgthemebutton      Pixels      Class      imgthemebase      imgthemebutton     �PROCEDURE MouseUp
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 2
ENDPROC
PROCEDURE MouseDown
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 3
ENDPROC
PROCEDURE MouseLeave
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 1
ENDPROC
PROCEDURE MouseEnter
LPARAMETERS nButton, nShift, nXCoord, nYCoord
This.ThemeState = 2
ENDPROC
      {Height = 29
Width = 114
themestate = 1
themeclass = (STRCONV("Button"+0h00,5))
themepart = 1
Name = "imgthemebutton"
      image      gdiplusx.vcx      >themestate
themepart
themeclass
isxp
*themestate_assign 
      imgthemetoolbarbutton      xHeight = 94
Width = 99
themeclass = (STRCONV("Clock"+0h00,5))
themepart = 1
themestate = 1
Name = "imgthemeclock"
      hWidth = 296
Height = 28
min = 0
max = 100
value = 0
orientation = 0
Name = "ctlthemeprogressbar"
     PROCEDURE Resize

This.imgcanvas1.Resize()
ENDPROC
PROCEDURE Init
This.imgcanvas1.Width = This.Width
This.imgCanvas1.Height = This.Height
This.imgCanvas1.Anchor = 15
ENDPROC
PROCEDURE clear
LPARAMETERS eColor

This.imgcanvas1.Clear(eColor)
ENDPROC
     �PROCEDURE value_assign
LPARAMETERS tnValue
LOCAL lnPct
IF BETWEEN(m.tnValue, This.Min, This.Max)
	This.Value = m.tnValue
	This.UpdateControl()
ENDIF
	

ENDPROC
PROCEDURE orientation_assign
LPARAMETERS tnOrientation

IF BETWEEN(m.tnOrientation, 0, 1)
	This.Orientation = m.tnOrientation
	This.Value = This.Value
ENDIF

ENDPROC
PROCEDURE updatecontrol

WITH This.imgthemebase1
	.Top = 0
	.Left = 0
	.Width = This.Width
	.Height = This.Height

	IF This.Orientation = 0	&& Horizontal
		.ThemePart = 1
	ELSE
		.ThemePart = 2
	ENDIF
	
	.Draw()
ENDWITH

WITH This.imgthemebase2
	.Top = 4
	.Left = 4

	m.lnPct = (This.Value-This.Min)/(This.Max-This.Min)
	IF This.Orientation = 0	&& Horizontal
		.Width = (This.Width-8)*m.lnPct
		.Height = This.Height-8
		.ThemePart = 3
	ELSE
		.Width = This.Width-8
		.Height = (This.Height-8)*m.lnPct
		.Top = This.Height-4-.Height
		.ThemePart = 4
	ENDIF
	
	.Draw()
ENDWITH

ENDPROC
PROCEDURE Init
This.UpdateControl()
ENDPROC
     ����    �  �                        ��   %   �           �          �  U  &  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE MouseUp,     ��	 MouseDown�     ��
 MouseLeave�     ��
 MouseEnterI    ��1 12 12 12 11                       U         u   �         �     	   
   ;  }      )   �                       ����    �  �                        F�   %   �      8  -   �          �  U  Q  ��  � �� � %�C��  � � � � ���J � T� � ���  �� ��C� � �� � U  TNVALUE LNPCT THIS MIN MAX VALUE UPDATECONTROLJ  ��  � %�C��  � ����C � T� � ���  �� T� � �� � �� � U  TNORIENTATION THIS ORIENTATION VALUE� ���  � ��� � T�� �� �� T�� �� �� T�� ��  � �� T�� ��  � �� %��  � � ��p � T�� ���� �� � T�� ���� � ��C�� �� �� ���  �	 ���� T�� ���� T�� ����) T��
 ��  � �  � �  � �  � �� %��  � � ��A� T�� ��  � ���
 �� T�� ��  � ��� T�� ���� ��� T�� ��  � ��� T�� ��  � ���
 �� T�� ��  � ��� �� T�� ���� � ��C�� �� �� U  THIS IMGTHEMEBASE1 TOP LEFT WIDTH HEIGHT ORIENTATION	 THEMEPART DRAW IMGTHEMEBASE2 LNPCT VALUE MIN MAX  ��C�  � �� U  THIS UPDATECONTROL value_assign,     �� orientation_assign�     �� updatecontrol.    �� Init^    ��1 q q �!� A 4 q r!1A 3 � � B� � � A � A � � �A�Q� � Q��� A � A 3 � 1                       �         �   N        r  �     +   �  �  9    )   �                       �ogfx
hdc
_memberdata XML Metadata for customizable properties
controls An array for accessing the controls in a container object.
_bmpwidth
_bmpheight
_tempfile
rectangle
smoothingmode
textrenderinghint
interpolationmode
obmp
rendermode 0 = Memory BMP ; 1 = File BMP ; 4 = Memory PNG
_hwnd
_hbitmapold
_csize
drawwheninvisible
lredrawnow
*draw Repaints a Form object.
*clear Clears the contents of a ComboBox or ListBox control.
*beforedraw 
*deleteosb 
*renderosb 
*createosb 
*refresh Repaints a Form or control and refreshes any values.
*setup 
*resize Occurs when an object is resized.
*rectangle_access 
*smoothingmode_assign 
*textrenderinghint_assign 
*interpolationmode_assign 
*save 
*afterdraw 
*getextent 
*width_access 
*height_access 
*backstyle_access 
*declaredll 
*rendermode_assign 
*activate Occurs when a FormSet, Form, or Page object becomes active or when a ToolBar object is shown.
*lredrawnow_assign 
     ���    �  �                        �:   %   s      y  �   #          �  U   ��  � �' %�� � 
� � � 
	� � � 
	��6 � B� �, T� � �C� � � 4rs�C� �	 � 4rs��� %�C��  ���� � T��  �� � �� T�� �� �	 �� �& %�� �
 ��  � � � �� ��� � ��C ��   �� � � �� � ��C� � �� ��C� � �� ��C� � �� U  TNWIDTH TNHEIGHT THIS
 LREDRAWNOW THISFORM VISIBLE DRAWWHENINVISIBLE _CSIZE WIDTH HEIGHT	 _BMPWIDTH
 _BMPHEIGHT	 CREATEOSB
 BEFOREDRAW	 RENDEROSB	 AFTERDRAW ��  � H� �� �C��  ��� O��A � ��C ��  � � � ��2 �C��  ��� N� C��  �
      ��A�� 	��� �% ��CC ��  �9� � � � � � � �� �C��  ��� N��� �% ��CC ��  �9� � � � � � � �� 2��% ��CC�	 �
 �9� � � � � � � �� � U  ECOLOR THIS OGFX CLEAR SYSTEM DRAWING COLOR FROMRGB FROMARGB THISFORM	 BACKCOLOR  T�  � ���� T�  � ���� U  THIS OGFX OBMPR H� �G� ��  � � ��8 � T�  � �C�  � � �� ��  � ���� %�C�  � ���� �% T�  � �CC��]��C��]� .bmp�� �� � ��  � �� ���  � ��% T�  � �CC��]��C��]� .bmp�� �' ��C�  � �9� � �	 �
 � �  � � �� T�  � ��  � �� ��  � ���G�( T�  � �C�9� � �	 �
 � �  � � �� � B� U  THIS
 RENDERMODE
 PICTUREVAL OBMP GETPICTUREVALFROMHBITMAP	 _TEMPFILE SAVE SYSTEM DRAWING IMAGING IMAGEFORMAT BMP PICTURE GETPICTUREVAL PNG� ��  � � ��C� � �� %�C��  ���M � T��  �� � �� T�� �� � �� � T� � ���  �� T� � ��� �� T��  �C��  �D�� T�� �C�� �D�� %�� � ���� �9 T� �	 �C ��   �� �9�
 � � � � �9�
 � � � �� ��( T� �	 �C ��   �� �9�
 � � � �� �" T� � �C� �	 �9�
 � � � �� T� � � �� � �� T� � � �� � �� T� � � �� � �� U  TNWIDTH TNHEIGHT THIS	 DELETEOSB WIDTH HEIGHT	 _BMPWIDTH
 _BMPHEIGHT
 RENDERMODE OBMP SYSTEM DRAWING BITMAP NEW IMAGING PIXELFORMAT FORMAT24BPPRGB OGFX GRAPHICS	 FROMIMAGE SMOOTHINGMODE TEXTRENDERINGHINT INTERPOLATIONMODE6 " %��  � � � �  � � 	��/ � ��C�  � �� � U  THIS STRETCH ANCHOR DRAW�  %�C�  � ��� O��F �. T�  � �C� � �  � �  � �9� � � � �� �z � T�  � � ��  � �� T�  � � ��  � �� � B��  � �� U  THIS	 RECTANGLE SYSTEM DRAWING NEW WIDTH HEIGHT1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS SMOOTHINGMODE OGFX1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS TEXTRENDERINGHINT OGFX1  ��  � T� � ���  �� T� � � ���  �� U  VNEWVAL THIS INTERPOLATIONMODE OGFX� < ��  � Q� XFCIMAGECODECINFO� Q� XFCENCODERPARAMETERS� �� � ��m �" ��C ��   ��  �� � � � �� �(�� �� � ���� �� �� U 
 TCFILENAME	 TOENCODER TOENCODERPARAMS LOEXC THIS OBMP SAVE?  %��  � � � Column��, � B��  � � �� � B��  � �� U  THIS PARENT	 BASECLASS WIDTHB  %��  � � � Column��/ � B��  � � � �� � B��  � �� U  THIS PARENT	 BASECLASS	 ROWHEIGHT HEIGHT  ��C�  � �� B��  � �� U  THIS DRAW	 BACKSTYLE)  ��  � T� � ���  �� ��C� � �� U  VNEWVAL THIS
 RENDERMODE	 CREATEOSB�  ��  �+ T��  �C� � � 4rs�C� � � 4rs��� %�� � ��  
��V � ��C� � �� �% ��C� � Activate� � Activate�� U 	 LCNEWSIZE THIS WIDTH HEIGHT _CSIZE DRAW THISFORMF  ��  � %���  ��? � T� � �a�� ��C� � �� T� � �-�� � U  TLNOW THIS
 LREDRAWNOW DRAWV  ��C����  � � �� T�  � ���� ��C�  � �� %�C�  � 0��O � ��  � �� � U  THIS CONTROLS REMOVE	 DELETEOSB	 _TEMPFILEt ��  � %�C�9� ��� O��� � %�C�
 system.app0��K � ��
 system.app�� �� �+ T��  �CCCC�]C�  C�]��\������ ���  �
 system.prg�� � � ��C� � �� T� � �C�
 Collection�N�� ��C� � ��% ��C� � Activate� � Activate�� %�� � � � Page��A�* ��C� � � � Resize� � Resize��� �m�$ ��C� � � Resize� � Resize�� � U	  LCPATH SYSTEM THIS	 CREATEOSB CONTROLS SETUP THISFORM PARENT	 BASECLASSw  ��  � �� � %���  ��p �+ T�� �C� � � 4rs�C� � � 4rs��� %�� � �� 
��l � ��C� � �� � � U  LENABLE	 LCNEWSIZE THIS WIDTH HEIGHT _CSIZE DRAW draw,     �� clear�    ��	 deleteosbI    ��	 renderosb~    ��	 createosbl    �� resize�    �� rectangle_access@    �� smoothingmode_assign	    �� textrenderinghint_assign`	    �� interpolationmode_assign�	    �� save
    �� width_access�
    �� height_accessO    �� backstyle_access�    �� rendermode_assign�    �� activateK    �� lredrawnow_assign	    �� Destroyr    �� Init�    �� UIEnable�    ��1 � {A A �!!A b�A � � � 2 q � qa!QqQ� RA 3 � � 2 � AqB"Q� � � QA rAC�B B 2 � � !!A "!baB�� �A $aaa2 !� A 2 ��� aaA � 3 q !Q4 q !Q3 q !Q3 �r � !� � A 4 �� A � 3 �!A � 3 � � 3 q "� 2 �q �q� A Q3 } � � � � A 3 A� � "� A 3 | r�A� ��A A � �� Q��� AA 2 q r � �q� A A 2                       A        ]  ^  *      ~  �  ;       �  G
  ?   2   g
  K  Y   F   h  �  v   J     �  {   R     w  �   V   �    �   Z   7  �  �   ^   �  �  �   f     u  �   k   �  �  �   p   &  J  �   s   r  �  �   w     �  �      �  �  �   �   �  +    �   F  6%    �   U%  �)  ?   )   �                       	Height = 162
Width = 182
ogfx = (NULL)
hdc = 0
_memberdata =     1183<VFPData><memberdata name="beforedraw" type="method" display="BeforeDraw"/><memberdata name="hdc" type="property" display="HDC"/><memberdata name="ogfx" type="property" display="oGfx"/><memberdata name="refresh" type="method" display="Refresh"/><memberdata name="clear" type="method" display="Clear"/><memberdata name="draw" type="method" display="Draw"/><memberdata name="controls" type="property" display="Controls"/><memberdata name="setup" type="method" display="SetUp"/><memberdata name="save" type="method" display="Save"/><memberdata name="afterdraw" type="method" display="AfterDraw"/><memberdata name="interpolationmode" type="property" display="InterpolationMode"/><memberdata name="rectangle" type="property" display="Rectangle"/><memberdata name="rendermode" type="property" display="RenderMode"/><memberdata name="smoothingmode" type="property" display="SmoothingMode"/><memberdata name="textrenderinghint" type="property" display="TextRenderingHint"/><memberdata name="obmp" type="property" display="oBmp"/><memberdata name="drawwheninvisible" type="property" display="DrawWhenInvisible"/><memberdata name="lredrawnow" type="property" display="lRedrawNow"/></VFPData>

controls = (NULL)
_bmpwidth = 0
_bmpheight = 0
_tempfile = 
rectangle = (NULL)
smoothingmode = 4
textrenderinghint = 3
interpolationmode = 7
obmp = (NULL)
rendermode = 0
_hwnd = 0
_hbitmapold = 0
_csize = 
drawwheninvisible = .F.
lredrawnow = .F.
Name = "imgcanvas"
     PROCEDURE themestate_assign
LPARAMETERS vNewVal
THIS.themestate = m.vNewVal
This.Draw()

ENDPROC
PROCEDURE Init
This.IsXP = FILE(GETENV("windir")+"\system32\uxtheme.dll")
This.DeclareDll()

DODEFAULT()
ENDPROC
PROCEDURE beforedraw
IF NOT This.IsXP
	RETURN
ENDIF


*!* Here's a super simple example
*!* There's more to this obviously, such as printing text on certain controls like Tabs or Buttons
*!* Anyways, I wanted to get most of the grunt work out of the way, now we can play

*!* Also, if you're wondering where I got all this stuff... I ripped and figured it out from a very impressive sample
*!* VB 6.0 application that Explores all of the stuff in uxtheme.dll
*!*	http://www.vbaccelerator.com/home/vb/code/libraries/XP_Visual_Styles/Drawing_with_XP_Visual_Styles/article.asp
*!*	I'd like us to make an example like what that guy did for this... only make it even better. :)

LOCAL System AS xfcSystem, lcThemeClass, ;
	lnHDC, lnTheme, lqRectStruct
System = _SCREEN.System	&& NEWOBJECT("xfcSystem","System")

This.Clear()

WITH _SCREEN.System
	m.lnTheme = OpenThemeData(0, This.ThemeClass) && Get ready to draw some theme stuff
	IF m.lnTheme > 0
		m.lnHDC = This.oGfx.GetHDC()
		m.lqRectStruct = 0h00000000+0h00000000+BINTOC(This.Width,"4rs")+BINTOC(This.Height,"4rs")
		hr=DrawThemeParentBackground(ThisForm.HWnd, m.lnHDC, @lqRectStruct)
	**	hr=DrawThemeBackground(lnTheme, lnHDC, EBP_NORMALGROUPCOLLAPSE, EBNGC_NORMAL, @lcRectStruct, @lcRectStruct)
		hr=DrawThemeBackground(m.lnTheme, m.lnHDC, This.ThemePart, This.ThemeState, m.lqRectStruct, m.lqRectStruct)
		This.oGfx.ReleaseHDC(m.lnHDC)
		CloseThemeData(m.lnTheme)
	ENDIF
ENDWITH

*!* One thing to keep in mind here is that we aren't anti-aliasing yet
*!* (VB 6.0 application didn't either) so the rendered controls look a little rough.
ENDPROC
PROCEDURE declaredll
DODEFAULT()

IF NOT This.IsXP
	RETURN
ENDIF

TRY 

imgThemeBaseDeclareDLL(0)

CATCH

DECLARE Long Sleep IN WIN32API AS imgThemeBaseDeclareDLL Long

*!* Here are the declares, as I haven't tested all of them there may be some that need adjusting
*!* most notably will be some of the ones that have a "LONG @" which may actually be STRING @ since
*!* they are looking for a structure

DECLARE LONG CloseThemeData IN UXTHEME LONG hTheme
DECLARE LONG DrawThemeBackground IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, STRING @pRect, STRING @pClipRect
DECLARE LONG DrawThemeBackgroundEx IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pRect, STRING @poptions
DECLARE LONG DrawThemeEdge IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pDestRect, uint egde, uint flags, LONG @pRect
DECLARE LONG DrawThemeIcon IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pRect, LONG himl, LONG iImageIndex
DECLARE LONG DrawThemeParentBackground IN UXTHEME LONG hWnd, LONG hdc, STRING @pRect
DECLARE LONG DrawThemeText IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, STRING text, LONG textLength, LONG textFlags, LONG textFlags2, LONG @pRect
DECLARE LONG EnableThemeDialogTexture IN UXTHEME LONG hWnd, STRING flags
DECLARE LONG EnableTheming IN UXTHEME LONG fEnable
DECLARE LONG GetCurrentThemeName IN UXTHEME STRING stringThemeName, LONG lengthThemeName, STRING stringColorName, LONG lengthColorName, STRING stringSizeName, LONG lengthSizeName
DECLARE STRING GetThemeAppProperties IN UXTHEME
DECLARE LONG GetThemeBackgroundContentRect IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pBoundingRect, LONG @pContentRect
DECLARE LONG GetThemeBackgroundExtent IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pRect, LONG @pClipRect
DECLARE LONG GetThemeBackgroundRegion IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG @pRect, LONG @pRegion
DECLARE LONG GetThemeBool IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pfVal
DECLARE LONG GetThemeColor IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pColor
DECLARE LONG GetThemeDocumentationProperty IN UXTHEME STRING stringThemeName, STRING stringPropertyName, STRING @stringValue, LONG lengthValue
DECLARE LONG GetThemeEnumValue IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @piVal
DECLARE LONG GetThemeFilename IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, STRING themeFileName, LONG themeFileNameLength
DECLARE LONG GetThemeFont IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pFont
DECLARE LONG GetThemeInt IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @piVal
DECLARE LONG GetThemeIntList IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pIntList
DECLARE LONG GetThemeMargins IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pMargins
DECLARE LONG GetThemeMetric IN UXTHEME LONG hTheme, LONG hDC, LONG iPartId, LONG iStateId, LONG iPropId, LONG @piVal
DECLARE LONG GetThemePartSize IN UXTHEME INTEGER hTheme, INTEGER hdc, INTEGER iPartId, INTEGER iStateId, INTEGER @pRect, INTEGER eSize, STRING @SIZE

DECLARE LONG GetThemePosition IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pPoint
DECLARE LONG GetThemePropertyOrigin IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pOrigin
DECLARE LONG GetThemeRect IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, LONG @pRect
DECLARE LONG GetThemeString IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId, LONG iPropId, STRING @themeString, LONG themeStringLength
DECLARE LONG GetThemeSysBool IN UXTHEME LONG hTheme, LONG iBoolId
DECLARE LONG GetThemeSysBrush IN UXTHEME LONG hTheme, LONG iColorId
DECLARE LONG GetThemeSysColor IN UXTHEME LONG hTheme, LONG iColorId
DECLARE LONG GetThemeSysFont IN UXTHEME LONG hTheme, LONG iFontId, LONG @plf
DECLARE LONG GetThemeSysInt IN UXTHEME LONG hTheme, LONG iIntId, LONG @piVal
DECLARE LONG GetThemeSysSize IN UXTHEME LONG hTheme, LONG iSizeId
DECLARE LONG GetThemeSysString IN UXTHEME LONG hTheme, LONG iStringId, STRING @stringSys, LONG stringSysLength
DECLARE LONG GetThemeTextExtent IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, STRING text, LONG textLength, LONG textFlags, LONG @boundingRect, STRING @extentRect
DECLARE LONG GetThemeTextMetrics IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, STRING @textMetric
DECLARE LONG GetWindowTheme IN UXTHEME LONG hWnd
DECLARE LONG HitTestThemeBackground IN UXTHEME LONG hTheme, LONG hdc, LONG iPartId, LONG iStateId, LONG dwOptions, LONG @pRect, LONG hrgn, POINT ptTest, STRING @code 
DECLARE LONG IsAppThemed IN UXTHEME
DECLARE LONG IsThemeActive IN UXTHEME
DECLARE LONG IsThemeBackgroundPartiallyTransparent IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId
DECLARE LONG IsThemeDialogTextureEnabled IN UXTHEME LONG hWnd
DECLARE LONG IsThemePartDefined IN UXTHEME LONG hTheme, LONG iPartId, LONG iStateId
DECLARE LONG OpenThemeData IN UXTHEME LONG hWnd, STRING classList
DECLARE LONG SetSystemVisualStyle IN UXTHEME STRING pszFilename, STRING pszColor, STRING pszSize, LONG dwReserved
DECLARE SetThemeAppProperties IN UXTHEME STRING props
DECLARE LONG SetWindowTheme IN UXTHEME LONG hWnd, STRING textSubAppName, STRING textSubIdList

ENDTRY
ENDPROC
     ����    �  �                        ��   %   J      G  V   �          �  U  )  ��  � T� � ���  �� ��C� � �� U  VNEWVAL THIS
 THEMESTATE DRAWL 3 T�  � �CC� windir5� \system32\uxtheme.dll0�� ��C�  � ��	 ��C��� U  THIS ISXP
 DECLAREDLLh %��  � 
�� � B� �$ �� Q�	 XFCSYSTEM� � � � � T� ��9� �� ��C�  � �� ���9� ��a� T�� �C� �  �	 � �� %��� � ��]� T�� �C�  �
 � ��= T�� ��     �     C�  � � 4rs�C�  � � 4rs��� T� �C� �  �� � � ��2 T� �C ��  �� �  � �  �  ��  �� � �� ��C �� �  �
 � �� ��C �� � �� � �� U  THIS ISXP SYSTEM LCTHEMECLASS LNHDC LNTHEME LQRECTSTRUCT CLEAR OPENTHEMEDATA
 THEMECLASS OGFX GETHDC WIDTH HEIGHT HR DRAWTHEMEPARENTBACKGROUND THISFORM HWND DRAWTHEMEBACKGROUND	 THEMEPART
 THEMESTATE
 RELEASEHDC CLOSETHEMEDATA		 ��C��� %��  � 
�� � B� � ��7 � ��C� � �� ����4 |�� Sleep� WIN32APIQ� imgThemeBaseDeclareDLL��" |�� CloseThemeData� UXTHEME��3 |�� DrawThemeBackground� UXTHEME�������5 |�� DrawThemeBackgroundEx� UXTHEME�������+ |�� DrawThemeEdge� UXTHEME������. |�� DrawThemeIcon� UXTHEME��������2 |�� DrawThemeParentBackground� UXTHEME����2 |�� DrawThemeText� UXTHEME����������. |�� EnableThemeDialogTexture� UXTHEME���! |�� EnableTheming� UXTHEME��1 |�� GetCurrentThemeName� UXTHEME�������( |�� GetThemeAppProperties� UXTHEME�= |�� GetThemeBackgroundContentRect� UXTHEME�������8 |�� GetThemeBackgroundExtent� UXTHEME�������8 |�� GetThemeBackgroundRegion� UXTHEME�������) |�� GetThemeBool� UXTHEME������* |�� GetThemeColor� UXTHEME������8 |�� GetThemeDocumentationProperty� UXTHEME�����. |�� GetThemeEnumValue� UXTHEME������. |�� GetThemeFilename� UXTHEME�������+ |�� GetThemeFont� UXTHEME�������( |�� GetThemeInt� UXTHEME������, |�� GetThemeIntList� UXTHEME������. |�� GetThemeMargins� UXTHEME�������- |�� GetThemeMetric� UXTHEME�������2 |�� GetThemePartSize� UXTHEME��������- |�� GetThemePosition� UXTHEME������3 |�� GetThemePropertyOrigin� UXTHEME������) |�� GetThemeRect� UXTHEME������- |�� GetThemeString� UXTHEME�������% |�� GetThemeSysBool� UXTHEME���& |�� GetThemeSysBrush� UXTHEME���& |�� GetThemeSysColor� UXTHEME���( |�� GetThemeSysFont� UXTHEME����' |�� GetThemeSysInt� UXTHEME����% |�� GetThemeSysSize� UXTHEME���, |�� GetThemeSysString� UXTHEME�����8 |�� GetThemeTextExtent� UXTHEME����������0 |�� GetThemeTextMetrics� UXTHEME������" |�� GetWindowTheme� UXTHEME��8 |�� HitTestThemeBackground� UXTHEME�������� |�� IsAppThemed� UXTHEME�  |�� IsThemeActive� UXTHEME�= |��% IsThemeBackgroundPartiallyTransparent� UXTHEME����/ |�� IsThemeDialogTextureEnabled� UXTHEME��* |�� IsThemePartDefined� UXTHEME����# |�� OpenThemeData� UXTHEME���. |�� SetSystemVisualStyle� UXTHEME�����( |� SetThemeAppProperties� UXTHEME��& |�� SetWindowTheme� UXTHEME���� �� U7  THIS ISXP IMGTHEMEBASEDECLAREDLL SLEEP WIN32API CLOSETHEMEDATA UXTHEME DRAWTHEMEBACKGROUND DRAWTHEMEBACKGROUNDEX DRAWTHEMEEDGE DRAWTHEMEICON DRAWTHEMEPARENTBACKGROUND DRAWTHEMETEXT ENABLETHEMEDIALOGTEXTURE ENABLETHEMING GETCURRENTTHEMENAME GETTHEMEAPPPROPERTIES GETTHEMEBACKGROUNDCONTENTRECT GETTHEMEBACKGROUNDEXTENT GETTHEMEBACKGROUNDREGION GETTHEMEBOOL GETTHEMECOLOR GETTHEMEDOCUMENTATIONPROPERTY GETTHEMEENUMVALUE GETTHEMEFILENAME GETTHEMEFONT GETTHEMEINT GETTHEMEINTLIST GETTHEMEMARGINS GETTHEMEMETRIC GETTHEMEPARTSIZE GETTHEMEPOSITION GETTHEMEPROPERTYORIGIN GETTHEMERECT GETTHEMESTRING GETTHEMESYSBOOL GETTHEMESYSBRUSH GETTHEMESYSCOLOR GETTHEMESYSFONT GETTHEMESYSINT GETTHEMESYSSIZE GETTHEMESYSSTRING GETTHEMETEXTEXTENT GETTHEMETEXTMETRICS GETWINDOWTHEME HITTESTTHEMEBACKGROUND ISAPPTHEMED ISTHEMEACTIVE% ISTHEMEBACKGROUNDPARTIALLYTRANSPARENT ISTHEMEDIALOGTEXTUREENABLED ISTHEMEPARTDEFINED OPENTHEMEDATA SETSYSTEMVISUALSTYLE SETTHEMEAPPPROPERTIES SETWINDOWTHEME themestate_assign,     �� Initz     ��
 beforedraw�     ��
 declaredllD    ��1 q !� 3 1� � 2 A A M� � � �1a��"aA A 5 � A A � � � B&1Q��!!���������������!�1��Qaa�qQ��!�����1��aB 1                       \         w   �      	   �   7        X  �  2    )   �                       )�PROCEDURE draw
*********************************************************************
** Method: ImgCanvas.Draw
**
** Aplies the recived ColorMatrix to the current image
**
** History:
**	2006/../..: BDurban - Coded
**	2007/12/23: CWollenhaupt - Fixed observations below
**
*********************************************************************

LPARAMETERS tnWidth, tnHeight


*========================================================================================
* When we have many GDI+ objects on a form we have to make sure that we don't redraw
* them too many times as this reduces performance quite a bit. While the form is not
* visible we cannot rely on the current dimension. It might change without us being 
* notified. Therefore we filter calls only redrawing when there's actually something to
* do.
*========================================================================================

IF NOT This.lRedrawNow AND NOT Thisform.Visible AND NOT This.DrawWhenInvisible 
	RETURN
ENDIF

This._cSize = BINTOC(This.Width,"4rs") + BINTOC(This.Height,"4rs")

IF EMPTY(m.tnWidth)
	m.tnWidth = This.Width
	m.tnHeight = This.Height
ENDIF

IF This._BMPWidth <> m.tnWidth OR This._BMPHeight <> m.tnHeight
	This.CreateOSB(m.tnWidth, m.tnHeight)
ENDIF
This.BeforeDraw()
This.RenderOSB()
This.AfterDraw()
ENDPROC
PROCEDURE clear
LPARAMETERS eColor

** eColor can be RGB, ARGB or Color object
DO CASE
CASE VARTYPE(m.eColor) = "O"
	This.oGfx.Clear(m.eColor)
CASE VARTYPE(m.eColor) = "N" AND BITAND(m.eColor,0xFF000000) = 0
	This.oGfx.Clear(_SCREEN.System.Drawing.Color.FromRGB(m.eColor))
CASE VARTYPE(m.eColor) = "N"
	This.oGfx.Clear(_SCREEN.System.Drawing.Color.FromARGB(m.eColor))
OTHERWISE
	*! ToDo: Need to add support for XP theme background
	This.oGfx.Clear(_SCREEN.System.Drawing.Color.FromRGB(ThisForm.BackColor))
ENDCASE

ENDPROC
PROCEDURE deleteosb
This.oGfx = NULL
This.oBMP = NULL
ENDPROC
PROCEDURE renderosb
DO CASE
CASE This.RenderMode = 0	&& Memory BITMAP
	This.PictureVal = This.oBmp.GetPictureValfromHBitmap()
	
CASE This.RenderMode = 1	&& File BITMAP

	IF EMPTY(This._tempfile)
		This._tempfile = ADDBS(SYS(2023))+SYS(2015)+".bmp"
	ELSE
		DELETE FILE (This._tempfile)
		CLEAR RESOURCES (This._tempfile)
		This._tempfile = ADDBS(SYS(2023))+SYS(2015)+".bmp"
	ENDIF

	This.oBmp.Save(This._tempfile, _Screen.System.Drawing.Imaging.ImageFormat.Bmp)
	This.Picture = (This._tempfile)
	

CASE This.RenderMode = 4	&& Memory PNG
	This.PictureVal = This.oBmp.GetPictureVal(_Screen.System.Drawing.Imaging.ImageFormat.Png)
	
ENDCASE

RETURN
ENDPROC
PROCEDURE createosb
LPARAMETERS tnWidth, tnHeight

This.DeleteOSB()

IF EMPTY(m.tnWidth)
	m.tnWidth = This.Width
	m.tnHeight = This.Height
ENDIF

This._BMPWidth = m.tnWidth
This._BMPHeight = m.tnHeight

m.tnWidth = MAX(m.tnWidth,1)
m.tnHeight = MAX(m.tnHeight,1)

IF This.RenderMode = 1 && Render to File
	This.oBmp = _Screen.System.Drawing.Bitmap.New(m.tnWidth, m.tnHeight, _Screen.System.Drawing.Imaging.PixelFormat.Format24bppRGB)
ELSE
	This.oBmp = _SCREEN.System.Drawing.Bitmap.New(m.tnWidth, m.tnHeight)
ENDIF



This.oGfx = _SCREEN.System.Drawing.Graphics.FromImage(This.oBmp)
This.oGfx.SmoothingMode = This.SmoothingMode
This.oGfx.TextRenderingHint = This.TextRenderingHint
This.oGfx.InterpolationMode = This.InterpolationMode 
ENDPROC
PROCEDURE resize
IF This.Stretch = 0 AND This.Anchor > 0 && AND (m.nWidth <> This.Width OR m.nHeight <> This.Height)
	This.Draw()
ENDIF
ENDPROC
PROCEDURE rectangle_access

IF VARTYPE(This.Rectangle) <> "O"
	This.Rectangle = _SCREEN.System.Drawing.Rectangle.New(0,0,This.Width,This.Height)
ELSE
	This.Rectangle.Width = This.Width
	This.Rectangle.Height = This.Height
ENDIF

RETURN This.Rectangle

ENDPROC
PROCEDURE smoothingmode_assign
LPARAMETERS vNewVal
THIS.SmoothingMode = m.vNewVal
This.oGfx.SmoothingMode = m.vNewVal


ENDPROC
PROCEDURE textrenderinghint_assign
LPARAMETERS vNewVal
THIS.TextRenderingHint = m.vNewVal
This.oGfx.TextRenderingHint = m.vNewVal

ENDPROC
PROCEDURE interpolationmode_assign
LPARAMETERS vNewVal
THIS.InterpolationMode = m.vNewVal
This.oGfx.InterpolationMode = m.vNewVal

ENDPROC
PROCEDURE save
*********************************************************************
** Method: Save
** 
** Saves an image of the current canvas object
**
** History:
**  2006/08/05: BDurban/CChalom - Added save method
**  2006/08/10: BDurban - Changed to use new oBMP property
*********************************************************************
LPARAMETERS tcFilename ;
			, toEncoder AS xfcImageCodecInfo, toEncoderParams AS xfcEncoderParameters
			
LOCAL loExc
TRY 
	This.oBMP.Save(m.tcFilename, m.toEncoder, m.toEncoderParams)
	
CATCH TO m.loExc
	THROW m.loExc
ENDTRY


ENDPROC
PROCEDURE width_access
IF This.Parent.BaseClass = "Column"
	RETURN This.Parent.Width
ENDIF
RETURN THIS.Width

ENDPROC
PROCEDURE height_access
IF This.Parent.BaseClass = "Column"
	RETURN This.Parent.Parent.RowHeight
ENDIF
RETURN THIS.Height

ENDPROC
PROCEDURE backstyle_access
This.Draw()
RETURN THIS.BackStyle

ENDPROC
PROCEDURE rendermode_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.RenderMode = m.vNewVal
This.CreateOSB()
ENDPROC
PROCEDURE activate
*********************************************************************
** Method: ImgCanvas.Activate
**
** Occurs when the Image Canvas is activated for the 1st time
**
** History:
**	2007/12/23: CWollenhaupt - Coded - observations below
**
*********************************************************************

*========================================================================================
* We cannot display a control properly during the initialization of a form. Because the
* form is invisible while it's loaded, it doesn't trigger any Resize event when the size
* changes or controls are moved around. Nor are several properties updated correctly at
* this point. The form becomes visible when the Activate event is triggered. 
*
* The control might have been drawn already, for instance, by calling the Draw method
* directly. If the control's size hasn't changed, there's no need to repeat drawing the
* control. However, if the size differs we now have to redraw the control with the 
* actual size. 
*
* Activate can fire repeatedly. There's little advantage of frequently drawing the same
* image. Hence, we unbind the control once it was triggered.
*
*========================================================================================

LOCAL lcNewSize
m.lcNewSize = BINTOC(This.Width, "4rs") + BINTOC(This.Height, "4rs")
IF NOT This._cSize == m.lcNewSize
	This.Draw()
ENDIF 
UNBINDEVENTS(Thisform,"Activate",This,"Activate")

ENDPROC
PROCEDURE lredrawnow_assign
*********************************************************************
** Method: lRedrawNow_Assign
**
** History:
**	2007/12/23: CWollenhaupt - Coded - observations below
**
*********************************************************************

*========================================================================================
* Force the control to resize itself. Draw additionaly ensures that we only draw the
* control when it is visible.
*========================================================================================
LPARAMETERS tlNow

IF m.tlNow
	This.lRedrawNow = .T.
	This.Draw()
	This.lRedrawNow = .F.
ENDIF 

ENDPROC
PROCEDURE Destroy
This.Controls.Remove(-1)
This.Controls = NULL
This.DeleteOSB()

IF FILE(This._tempfile)
	DELETE FILE (This._tempFile)
ENDIF

ENDPROC
PROCEDURE Init
*********************************************************************
** Method: ImgCanvas.Init
**
** Initializes the ImageCanvas
**
** History:
**	2006/../..: BDurban - Coded
**	2007/12/23: CWollenhaupt - Fixed observations below
**
*********************************************************************

LOCAL lcPath

IF VARTYPE(_SCREEN.System) <> "O"
	IF FILE("system.app")
		DO ("system.app")
	ELSE
		m.lcPath = ADDBS(JUSTPATH(SUBSTR(SYS(16), AT(" ",SYS(16),2)+1)))
		DO (m.lcPath+"system.prg")
	ENDIF
ENDIF

This.CreateOSB()
This.Controls=CREATEOBJECT("Collection")
This.Setup()

*========================================================================================
* Changes to the original class:
*
* - Bind the Form's Activate method to a new Activate method in this control. Previously
*   the method was bound to Draw which forces a redraw. By redirecting this to Activate
*   we can use additionally checks to confirm that we actually need to redraw the 
*   control. In addition, we only have to draw the control the first time the form is 
*   activated. After that any need to redraw is triggered by a Resize, the UIEnabled 
*   event or an explicit call to Draw.
*
* - Pages don't have a Resize event. In order to add this control a page it must respond
*   to the PageFrame's Resize event after VFP completed the Resize event. Otherwise the
*   PageWidth and PageHeight properties still contain the old values.
*
*========================================================================================

BINDEVENT(Thisform, "Activate", This, "Activate")
IF This.Parent.BaseClass == "Page"
	BINDEVENT(This.Parent.Parent, "Resize", This, "Resize", 1)
ELSE 
	BINDEVENT(This.Parent, "Resize", This, "Resize")
ENDIF
ENDPROC
PROCEDURE UIEnable
*********************************************************************
** Method: ImgCanvas.UIEnable
**
** Occurs for all objects contained in a Page objects whenever the page is activated or deactivated
**
** History:
**	2007/12/23: CWollenhaupt - Coded - observations below
**
*********************************************************************

*========================================================================================
* Using the form's Activate event only works for controls that reside on the form
* directly. It doesn't work for controls on a pageframe when the pageframe is anchored
* and resizes automatically. Controls on invisible pages aren't notified. Therefore we
* use the UIEnable event to redraw controls when the page becomes visible.
*========================================================================================

LPARAMETERS lEnable

LOCAL lcNewSize
IF m.lEnable
	m.lcNewSize = BINTOC(This.Width, "4rs") + BINTOC(This.Height, "4rs")
	IF NOT This._cSize == m.lcNewSize
		This.Draw()
	ENDIF  
ENDIF 

ENDPROC
     ����    �  �                        ��   %   �           �          �  U  &  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE&  ��  � � � � T� � ���� U  NBUTTON NSHIFT NXCOORD NYCOORD THIS
 THEMESTATE
 MouseEnter,     ��
 MouseLeave�     ��	 MouseDown�     �� MouseUpI    ��1 12 12 12 11                       X         y   �         �     	   
   ;  }      )   �                  GIF89aU  �     �������f �����թ�������T�~(�����������������>����k��������j�������ʧ�������q���            !�  ,    U   �  �di�h��,��p,�tm�x.������p��0Ȥr�l:���H���Ьv��z�C�x$�"�F��x� w�,H�SW	�	��tHI\�N�H�
u^``a@�W	n�
��
�H�ĞHXH�?n�a���>@ޙ�~��
���ˠGU R���
��W����̓2��R��������P���
�z�}ģ
�#x��
ЗxH���X�8b
	�(��5{�$���Ձ�0�����	��%Ax�Z�O�>$��*�I�ٖI@0����
�l���7^*>��8�Kx�����.��p��My�L��e-2k��yE ;GIF89a� @ �     ����` fff(((����@ ��Z`& �����\��~�sSXE9)$!�ʦ������dK:��k՚r�P ������ppp
 ! �d<<<���3 �F �Է�cMZZZP  �z��t������ƕv�Ĝ�Y Ο���b���@ ������BBB�f  �����f����b�mY{_M333!!!���vZHVRP��k�zY0 �: �ѳ��zъ\�׽��m�L ����������ȤD:3�j���̒lp- ��ߜ{e��eIIIŋd������{mc~~~��t�έ�te�kRVLFaRHdZS;2-�S ��kfff��m�j�o�޽��{֒f�uYNA8/*'�zo��i�}Y�~sjRB�3 ����{]�yydWK<3�s�dK͏d                                                                                                                                                                                                                                                                                                                                                                                                !�  6 ,    � @  � H����*\Ȱ�Ç#*T`��ŋ �h�ȱ�Ǐ Cr@��ɓ(S�\ɲ�˗0c���ME�,���H�@�
Jtf��}~Dф�R�$�J�J�(M�s>eZ�+
�OCF�J��Y� �b�V#
[�~m�q�ٻx�^]�Ui��*HxKw�ݼ��L��mۿ-��K��aŘ��ڷ#׎�lい�L�>����]�|A�n
.��7a��w��H;k䙛ph[L�[*K3�MP�D�(#	
�3H��i��aPnn��Yb�JP:���_��M�M��豥��[�`�i�8WO��]|CQ�u�$|����GiPDp���Aq� j�TPCE7�@ҵH��0�(#��fPw�K�ل_hE�n��VP � *t�_z,9� PJ�b�2�蒎S.fapߡ�BA2�	��d%��w�G�@T$�s�-VSli�
E�aP�h0Bĉ���Vf��{���]�ޗ����f�A\�t�["a	)�2q	 �3=�b�1���ޞz�_H�hc�����&H��������j���*���~M�%`AX�	����P^s[R�-UI�J�Zc��E+�}~�A�r���J�N�g�q�,�s�릳 ���|��_�i@"q�;�����r���z�:0�zNZ~p��@������q����R�G���02Z��oh����q�q���[��^&�W���pp����JN�$��d&����J>t�����0�yzirm[|�E2����BL��4���t|�Dp��b���n�Q6/AM"�2�nAA�%����v��p�	�����]�mq�rh �X`�!�P�DE�RO=�u�k]k��ý{ �z�]�S������q`�ڮg��r�4Ah ��^���/��1?��~�hA�+�lB��Jw��0q<3Kw�呷 � zK�dЅ��X�r�:���G�;Yhr���!]8ۓ~"� +~��b"$�=��T 2 Ǆ�l�m��<�<��b������Md@q���$��\�5�"��!<�� �U8��$0�a��������å�L�A�����x� <��z�AZ���[�%�J��H��9|m�|� <�B�2(St"�x��)�s��Q4 �I�fs��C�@�2f� �K)��)��t�	+�����^�bH��e�B����#��*Y� ���_��,t�e�`�d(�QvP�)a���聭�Di{C"X��=-m�S���O6�dA0��Nw��/\$���#N���H6�?��^�Y�� �Ѡ�m �HCB���<t�eG[�1Rt+��d�&O*E�+�̛H9���M��	Ns��*�ʥ"-��J������t3�|�D5�����U�X�C�M���a%j֐������p��\������xͫ^��׾�u��l�_K�����͊@��&�����d�*Q4V �ͬf7�.`V����9K�Қ�"�$�b?{+󴰍-d��Z�O�V���nw{W��u���������3��H+�(����m�@Tk���6��խI�[��r7��5-A���w��=�z�Kֿ ;�PNG

   IHDR   u   U   ��<�   sRGB ���   gAMA  ���a    cHRM  z&  ��  �   ��  u0  �`  :�  p��Q<  �IDATx^�\TU��w޼D@�

�2��ef��)�j�"�����-Y>2EfxEK������E{j�����j�u��i{m����f����e������\�g>0̽s��?��?�s��b�O---���Ϟ;w��E�R�3z�������}�� ��7Szz��J#�a�hX6VL ?�}�P�5᝾�b��V���D�O��f�<�V�MS�,m�U3\��Ѓ���_��W���Ps�ė��NVA�����#�}�/I��XS����j+|�ʾ��˕���E6���c���[����x�R�&_l���_��>W�n��|�����>߬�=�ˆ�5���O��%t����.��Ji��֤�E��.�O6č��^1d��%��XLp�F�(fNLF}���^�|���vϬ�O7��0���ȏ�|	\����^*W��`t/����9��ܹ�]U�FaA����l��ee�2#��/�����/�27\EZ��1��g���Qyx�D�lOWÇk��=�-���M8l��J������/�7.G9Q�7�w���-T�L�Tù�7�B!�	�W6��`����f8Z����˫�Z.����BCԷ�U�4��z��+5�[k��<yS;�O�u=ԝ�*�����dE,߸�����ؙ�h1� �����i�W�y���&���g��F�ߋ��� :���a�th���#����k����>���@6Kթ*EWEoc7A~`}�b���^��^�Nm"|������o����fxuu��z��2�BX77�02b�<(�9�v��W��g��Y#�]��0��
f�� �uF�U�8V�+�S>��/������3�����E�/��PqN�l�y��y�[9��'����cV�1-���H�%F�=R����b�'�)����(#J/X���دcJ��qw�NE>۳4,0(�~����]�;Fٴ ��nJ�fo������a+D��v�e`s��!<��{�3_w �y�0
��m�;�����r�0u��Z6P+�N�����K/�ԚM��ř7?|��i� ���- ��'��o��mgph��������6��C�t��1��6��0]�j����	�/V��#A��U�RQ�/��Vk�&�;�����Ԑf��{vv�^)�Od��U��2zxA�P]�|�@�o����Lz�)�%� ����oT��)�E"3�y��
]/�2_kR�e��K�����j�V+^�A5�|��g�ĿoPSu�gv������'�D1��)�{o�粴JD�`W10�&܍�a֓Z��uyy��,�^i��ժE�x�(^���bQ����FJ�i����]�'-��=C�2�W����D+���1c��3�			��ld�1r�1��{��+r���a��鋄�B}�D�Z/V����������;V�~q�C�j[����N��t�?7_��F����4MN���N�dS�>ܾ�~����G�E�<}����3�FcꚘ����/q��,���>��{�����n!� I�۷�o	��4��J��F�ב�"�g�YUU���bu���_=vh��V�Gf>����z�䃫AǫU:����$''O�6�͇��3�`����eWL٤P(t~�O�
F�Q��!%����_�B��$��> ǤR�2���qղ	��Bw�lH�#�j��C���7�Z܅M�$�pF~SV8w?JG�����T�|'ܙڈfS�Kw�/6Ҷ��?�5ÉJņ[{:�U+�"�N��W�Y�@w�(�2\��2%-����7�(:p�3�׍�n�f���^7�o��'·���_���1��iNVª�5*���R�Z��{��n����W-Yv����Z����^S��7(;��.):��5��9��Q�g��4�ԓZ��uVV�>\�wѺ*�̵i33[����sG��vW�3�f�=9#�QQ�-��r��D������~���F%��'����C�o��дS��W��INN5�����!B���"�X��U;��qɈ��<��@�Lr��/�T�#�x'_h�wN��c���]X0aܘ��Y"�1��Ç�W�R�#XtU�m"O��_e������f憤�$����/��I	�3arFh�C�[���ӿ�7G�-�_����o��L�<D�6��:[���y�&F}ɔ�ua��	A���-y&|�BCC�/]��Zo��������K%1��D�=��q���n�� ���T��e�4�2��KB�����R(e���7���l�ٿcs>Z/�a��&�8�㤀��� �5I~<x��y�F4/�:������/� �?Z7��ZȾ��j}9U�N�><�vn���� Ɖ�ԛ�T�e��z::w����{|��aE
�K2��k5��?��/��ɚ��Z=Ny�*���^
A�dy")靃uo�<U�W;3j��a��(`}^���m\��.@֒��s,R�-�{�Q�:U��Á��I��;23��&=Ρq����r��_l/�K򝋓��ՄI�uܿ�������̊�����!K�ZΆ�0����%�)`�a�L�`븴�1�x,˝3@x���KV����8���Z�ZH�U\��p��_+e�7�Ħ����S�#���&`��ps癱�2���&%gaXVee���qJ	�.��^7��'�9��¥�N!�Q>��j�j�*��ݕ7�SGV������i�����[�/�0�Y4*>{,K~�r��'��p��<Ɇ�G��%7%�M8,,l��[�nC����|K���za|sj!6�`��_�����3ƞ�4������<��ޘ�8tk�М�蕧���H��������%�gWBllϒ%�0*kܹ:�#˭�s`JII�n����#��P��@��xƳv��V%�'����:u�{f	/���W; O,�����@�����+w��;������n�at���Q������J��Nx�X-���*�PU�5��J�r�
G?t��c�c�md���OC�|��.����ɧ��s�C���4ܶo�rFyl"ܘ
3�&?��!)�g��J��ٯX{JJ�q�cjj��`�����ٲ}�����-h������ _�{x���k��ס�<�����b���}�l�g�c���{�/�G�._.BH�:�u�D� y�'|��9~._���`�'�P<�%����i�5_k��|���g�&_FF��Y_Z�ܴ�K�\�[��=�*Q�NYK�������P?�Z�!_
��%rv��V�&?s'�r���	�ӟz��k���|m�9�G��F'M��s� �wPirl�؃q,׊�GY��Qw\>j��ĩ����`E̝n���
�1��M�PO�b�3f̐61A��[q��W�BY��L7;e.ݷ$Z��~9q�?[���I���ip�K=˄�ȝ�������ŗ����+j-ئ8�Z*�c��]p���/�:w�]Z�$:�y/�N����ۺT1i������'���.���]����JN�d�ܟ(j����єܱPNL���17~Gq��I�;P��Ū��3�Y�i��UZ��^^�X7>b��[��J�X������>|�,�D��_�x��[}���c�X�|��=4��]<�uq�׏�?�5��A�    IEND�B`�BM6      6   (                    �  �          ������������������������������������������������������������������������������������������������������������_r�Zl�[n�\o�\o�]p�]o�]p�]o�]p�]p�\o�Zn�Zn�Yn�Xm�Xl�Wl�Vl�Vk�Uk�Uj�Ui�[o�������������������Kc�	*�.�1�4�6�7�8�8�7�7�7�6�6�5�4�3�2�
1�/�.�,�*�)� &� $�  �F[�������������	-�3�8�;�@� B�"C�#D�"D�!C� B� C�B�A�B�@�?�>�<�:�8�6�2�0� .� *� %�  ����������Ys�5�;�B�"F�(K�+M�-P�.P�-O�,O�+O�+P�(P�&O�#N�!M�K�J�G�E�B�@�;�7�4� 0� *� $�Uh�������Zv�:�A�#H�(L�.Q�1T�4V�4W�3W�2U�Oo�u�ꚮ����k��>i�M�J�G�E�	@�<�8�4� -� &�Ui�������\x�>� F�)N�/R�4W�9Z�;]�Ab�o�������������������������������V�Q�I�E�A�<�7�0�(�Uj�������]y�@�%J�/R�4W�:\�>_�Kj拠���������������������������������r�� V�G�
C�?�9�1�)�Uj�������_z�D�+O�5X�:\�Aa�Om������������j��Ei�=d�:c�6b�2`�2b�V~������������T�F�	@�;�3�+�Uk�������a{�!G�/S�:[�?`�Jh口����������Ts�Dg�Bf�?f�<e�7c�3a�._�)\�3d�r��������o��M�C�	=�6�-�Vk�������c~�'L�5W�?_�Dc�y�����������Kk�Ji�Fh�Dh�Uw�|��y��Jr�._�)[�%X�!V�p��������Qz�D�A�9�	/�Wl�������e�+O�:[�Cb�Hf���������\x�Ml�Kk�Hi�Eh瀙�������v��/^�*[�&Y�"V�._ꧽ�������G�C�;�1�Xm�������g��0S�>_�Hf�e�������w��Qn�Nm�Ll�Jj�Fi恙�������w��/^�*[�%W�!U�R�Kv�������8c�E�>�4�Zo�������i��3U�Cb�Li劝�������Ws�Ro�Pm�Ml�Ii�Fh恙�������v��/\�*Z�%U�!S�P�!T�������f��H�@�6�[o�������k��9Z�Hf�Pm欺�������Up�So�Pn�Mk�Ii�Fg怘�������v��.Z�)W�%T�!Q�O�N朲�������J�B�8�\p�������n��=]�Mj�Sp���������Vp�Sn�Pl�Mj�Ih�Ef���������u��.X�)V�%R�!P�N�M��������� L�D�9�^q�������p��Aa�Pl�Wr���������Wq�Tn�Pl�Mj�Ig�Ee���������u��.W�)T�%Q�"O�M�L䀚�������$M� E�:�_q�������r��Ed�Tp�[u谽�������Xq�To�Qm�Nj�Ig�Ed���������u��.V�*S�%P�"N� M�L㝱�������&N�"G�<�`r�������t��Jh�Zt�`z蕧�������^v�Uo�Rm�Nj�If�Ec���������u��.T�*R�&O�#M�"K�'P�������p��(O�%H�=�as�������v��Mk�^y�d}�z��������}��Vo�Rl�Ni�Ie�Eb���������u��.S�*Q�'N�%L�#K�Qr�������Hi�*O�'I�>�at�������w��Rn�c}�j��i�����������d{�Tm�Pk�Kg�Gd䀕�������v��1U�-R�*P�(N�6Z䬻�������+P�,P�(I�>�bt�������y��Uq�h��n��m�꒤����������Vo�Rl�Mh�Ie�Ys���{��Mk�3V�0T�,Q�*P�x��������d�-Q�-P�)J�!?�at�������z��Yt�n��t��r��q�룳����������ax�Oj�Kg�Gc�Ca�>]�:[�6X�3U�?`�{�����������4W�.R�.P�*J�!?�bt�������{��\w�r��{��x��q��t�������������w��Tn�Jf�Fc�B`�>]�?^�a{谿����������<]�/S�/R�/Q�*J�!>�as���������c~�|�쇛턙�|��t��t�룳�����������������ﭼ����������������Dd�7Y�4W�2T�/Q�)I�=�`r����������k�ꆛ����{��q��q�둤�������������������������������z��Ji�Ab�=^�9[�4V�/Q�%G�:�^p����������t�됤���x��s��o��l��~�왫���������������r��Vs�Sp�Ol�Ki�Dd�>_�6X�/Q�#D�7�\o����������u�딧�������z��u��q��n��k��i��f�d~�d~�c}�`z�]x�Yu�Vr�Qo�Mk�Fe�?`�5W�-P�!C�5�[n����������b|脚����z��q��m��j��g��c|�b|�^y�\w�\v�Zu�Ws�Uq�Ro�Nl�Ji�Gf�?`�9[�0S�(L�>�2�������������{��b}�t��s��j��b|�\v�Zu�Wr�So�Pm�Pm�Lj�Jh�Jh�Hf�Fd�Cb�?`�=^�;\�8Z�2T�,P�%J�C�8�Qh�������������������탗큖�|��z��z��x��w��v��w��u��u��r��q��q��o��m��m��m��k��h��f��c}�gᨵ����������������������������������������������������������������������������������������������������������0	$   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _1PC0NFKPY 877020253)       4   *       1       -   �               (   +           
               COMMENT RESERVED                        	                                                                    WINDOWS _1Q40K9H6C 877293344�   �   �   �             �  �          �   �   �           �   �            COMMENT RESERVED                        �                                                                    WINDOWS _1Q20UZXVD 878213316E   �   Q   P       �  ^   �  !          \   [   (          ]              COMMENT RESERVED                        `                                                                    WINDOWS _1Q210400D 878213337�   �   �   �       y       �  �	          �   �               �     O        COMMENT RESERVED                        L                                                                    WINDOWS _1PQ0P76WP 878213455   �   "          i    J  �
                W                        COMMENT RESERVED                        !                                                                    WINDOWS _1530WWJY4 8804324949   �   5   8       �  /  �  C+          <   ;   �          h   �   F        COMMENT RESERVED                        I                                                                    WINDOWS _1L50OW0FK 880432495�       �   N       G  �   2  �%          {   �   *          �   �   �        WINDOWS _1L50TVYFO 880432495�       �   �   �   !                                                           WINDOWS _1L50TX61Q 880432495�       �   �   D                                                              WINDOWS _1L50UUD6E 880432495H       J   K   M                                                              COMMENT RESERVED                        �       �                                                            WINDOWS _16E19GTD6 894986849@   �   �   g            {  �$          ?   >   <          �   �   �        COMMENT RESERVED                        x                                                                    WINDOWS _14110GV5X 894986900}   G   �   ~       E  o   �  �          s   u   �           p   q   n        COMMENT RESERVED                        d                                                                    WINDOWS _13E0OB2YR 914842098   C             M  :  �  �!          �   �   A          =   R   :        COMMENT RESERVED                        7                                                                    WINDOWS _19G1CFR95 914864803�   6   �   �       �  U   X  �          c   �   �          b   v   T        COMMENT RESERVED                        S                                                                    WINDOWS _13T0OHG0F 914899996�   %   �   �         �   �  �          �   �   �          �   A   �        COMMENT RESERVED                        �                                                                    WINDOWS _1QM0BUK5J 923837222�   $   �   �       4  �   O  t          �   �   �           �   �   |        COMMENT RESERVED                        z                                                                    WINDOWS _13T0MHHPZ 924270456l       t   m       [
  �   k'  �          j   k   �	          i   �   a        COMMENT RESERVED                        '                                                                    WINDOWS _1L50LCL98 924359586�      �   �       y  �   V)  P          �   �   �             W   f        COMMENT RESERVED                        e                                                                    WINDOWS _2220SN8V0 924994991       &   #         $  �&  �                �                       COMMENT RESERVED                                                                                           samples\ animatedgif.scx animatedgif.sct animatedtransformations.scx animatedtransformations.sct bezier.scx bezier.sct brushes.scx brushes.sct canvasdrawing.scx canvasdrawing.sct capture.scx capture.sct capturecontrols.scx capturecontrols.sct charts.scx charts.sct chessboard.scx chessboard.sct colorchannel.scx colorchannel.sct colorkey.scx colorkey.sct colormatricesadvanced.scx colormatricesadvanced.sct colormatricesbasic.scx colormatricesbasic.sct colorpalette.scx colorpalette.sct samples\demo.prg c:\docume~1\bdurban\locals~1\temp\ demo.fxp extracticons.scx extracticons.sct fillshapes.scx fillshapes.sct fontfamilies.scx fontfamilies.sct foxhead.scx foxhead.sct fulljustified.scx fulljustified.sct gammathreshold.scx gammathreshold.sct gradient2.scx gradient2.sct gradient3.scx gradient3.sct gradient4.scx gradient4.sct gradients.scx gradients.sct imagecodecinfo.scx imagecodecinfo.sct imageprops.scx imageprops.sct imagerotate.scx imagerotate.sct imgview.frx imgview.frt imgview.scx imgview.sct samples\imgviewhtml.prg imgviewhtml.fxp lines.scx lines.sct lockbits.scx lockbits.sct pens.scx pens.sct piechart.scx piechart.sct playwithlogos.scx playwithlogos.sct randomfills.scx randomfills.sct remapcolors.scx remapcolors.sct report_fulljustify.frx report_fulljustify.frt samples\report_fulljustify.prg report_fulljustify.fxp samples\report_logowatermark_cool.prg report_logowatermark_cool.fxp samples\report_logowatermark_greyscale.prg report_logowatermark_greyscale.fxp samples\report_rotatedtext.prg report_rotatedtext.fxp resourcecanvas.scx resourcecanvas.sct rotation.scx rotation.sct samples.scx samples.sct shapesandsmoothing.scx shapesandsmoothing.sct splitter.vcx splitter.vct streamtest.scx streamtest.sct stringpath.scx stringpath.sct systemdemo.scx systemdemo.sct text.scx text.sct textblockshadow.scx textblockshadow.sct textembossedengraved.scx textembossedengraved.sct texthalo.scx texthalo.sct textreflectedsheared.scx textreflectedsheared.sct textscaledsheared.scx textscaledsheared.sct textwithborder.scx textwithborder.sct textwithbrushes.scx textwithbrushes.sct themecontrols.vcx themecontrols.vct themecontrolsdemo.scx themecontrolsdemo.sct themesample.scx themesample.sct transition_testperformance.scx transition_testperformance.sct transpgifs.scx transpgifs.sct vfpthemeexplorer.scx vfpthemeexplorer.sct source\ gdiplusx.vcx gdiplusx.vct samples\image\ vfpxpoweredby_alternative.gif transpvfpxlogosmall.gif foxprologo2.png exit.bmp _reportlistener.vcx 	)         	             y$                 	y$  +      )           +  z:      E           	z:  A      a           A  �^      l           	�^  ie      w           ie  �v      �           	�v  �|      �           �|  �      �           	�  ��      �           ��  ��      �           	��  ��      �           ��  �!     �           	�! �1     �           �1 A�     �           	A� k�     	          k� �               	� ��     '          �� ��     8          	�� %�     I          %� ,/     V          	,/ =D     c          =D ��     }          	�� l     �          l �2     �          	�2 �:     �          �: ga     �           ga hb �            	hb �j     $          �j �     5          	� 6�     F          6� ��     U          	�� �     d          � ͭ     u          	ͭ ��     �          �� �     �          	� -�     �          -� �     �          	� �     �          � SQ     �          	SQ �Z     �          �Z 1n     �          	1n L}               L} ��               	�� �                � j�     .          	j� �     <          �      J          	      X           Y#     k          	Y# �*     ~          �* i�     �          	i� G�     �          G� ��     �          
�� h�     �          h� (     �          	( H     �          H 1F     �           1F �M �            	�M �S               �S �^               	�^ �j     (          �j ��     5          	�� <�     B          <� <�     K          	<� ��     T          �� �     a          	� �      n          �  �o     �          	�o �u     �          �u B�     �          	B� �     �          � �     �          
� ��     �          �� ��     �           �� � �             � d� �  \           d�   �  �             �	 �  �          	�	 L     �          L .               	. X     $          X �&     1          	�& '0     >          '0 �[     J          	�[ b     V          b �s     m          �s �z     �          �z ~-	     �          	~-	 ,<	     �          ,<	 i�	     �          	i�	 ��	     �          ��	 @�	     �          	@�	 j�	     �          j�	 h�	     �          	h�	 ��	     �          ��	 ��	               	��	 ��	     
          ��	 �
               	�
 �
     2          �
 �K
     K          	�K
 eV
     d          eV
 B�
     q          	B�
 ό
     ~          ό
 ��
     �          	��
 ��
     �          ��
 �     �          	�      �           �6     �          	�6 �E               �E �               � Z�     *          Z�       <          	  �     N          � �"     d          	�" �)     z          �) �9     �          	�9 �K     1           �K ć     M           	ć V�     �          V� y�     �          	y� ��     �          �� �     �          	� <     �          < ��     	          �� .�  	  (	          .� �e  	  5	          �e �g B	  Q	          �g _q B	  o	          _q �� B	  �	          �� Ì B	  �	          Ì �     �	          