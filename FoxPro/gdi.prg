LOCAL loGfx as XfcGraphics
LOCAL loBrushMain, loBrushWhite as XfcBrush
DO '\\nbteles\Info\Programacao\FOX\exemplos\gdi\System.app'


&&DO LOCFILE("system.APP")
loBrushWhite = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.FromaRgb(250,255,255,255))

loGfx = _Screen.System.Drawing.Graphics.FromHwnd(_Screen.Hwnd)

CLEAR

lobmp = _Screen.System.Drawing.Bitmap.New(101,101)
logfx = _Screen.System.Drawing.Graphics.FromImage(lobmp)
loGfxs= _Screen.System.Drawing.Graphics.FromHwnd(_Screen.Hwnd)
loFont= _SCREEN.SYSTEM.Drawing.Font.New('Calibri',9,3)
loRECTF = _SCREEN.SYSTEM.Drawing.RectangleF.New(0,100/2-10,101,101)
loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Gray
loALIGN = _SCREEN.SYSTEM.Drawing.StringFormat.GenericTypographic.Clone()
loALIGN.Alignment = 1 && Center
loPENBLACK = _Screen.System.Drawing.Pen.New(_Screen.System.Drawing.Brushes.Gray)

FOR lnXI = 1 TO 360 STEP 1
	IF INKEY(.000000001) = 27
		EXIT
	ENDIF
	
	loGfx.Clear(_Screen.System.Drawing.Color.White)
	
	loBrushMain = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.FromARgb(100 ,255,0,0))

*	loBGLinearGrad = _Screen.System.Drawing.Drawing2D.LinearGradientBrush.New(loNEWRECT, _Screen.System.Drawing.Color.Green, _Screen.System.Drawing.Color.White, 90)
*	loBGLinearGrad.SetBlendTriangularShape(1, .3)

	loBrushMain = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.FromARgb(INT(lnXI/360*100 *255/100) ,255,0,0))
	
	loGfx.DrawPie(loPENBLACK,0,0,100,100,0,360)
	loGfx.DrawPie(loPENBLACK,100/4,100/4,100/2,100/2,0,360)
	loGfx.FillPie(loBrushMain, 0, 0, 100, 100, 0, lnXI)
*!*		loGfx.FillPie(loBGLinearGrad, 0, 0, 100, 100, 0, lnXI)
	loGfx.FillPie(loBrushWhite, 100/4, 100/4, 100/2, 100/2, 0, lnXI)

	loGfx.DrawString(TRANSFORM(lnXI/360*100,"@RZ 999.99 %"),loFont, lobrush, lorectf, loALIGN)
	loGfxs.drawimage(lobmp,0,0,101,101)
ENDFOR


FOR lnXI2 = lnXI TO 1 STEP -1
	loGfx.Clear(_Screen.System.Drawing.Color.White)
	
	loBrushMain = _Screen.System.Drawing.SolidBrush.New(_Screen.System.Drawing.Color.FromARgb(INT(lnXI/360*100 *255/100) ,255,0,0))
	
	loGfx.DrawPie(loPENBLACK,0,0,100,100,0,360)
	loGfx.DrawPie(loPENBLACK,100/4,100/4,100/2,100/2,0,360)
	loGfx.FillPie(loBrushMain, 0, 0, 100, 100, 0, lnXI2)
	loGfx.FillPie(loBrushWhite, 100/4, 100/4, 100/2, 100/2, 0, lnXI2)
	
	loGfx.DrawString(TRANSFORM(lnXI2/360*100,"@RZ 999.99 %"),loFont, lobrush, lorectf, loALIGN)
	loGfxs.drawimage(lobmp,0,0,101,101)
ENDFOR



