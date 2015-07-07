DO "C:\GDI\CARREGARGDI.PRG"
DECLARE Sleep IN kernel32 INTEGER dwMilliseconds

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

LOCAL loBmp as XfcBitmap
LOCAL loGfx AS XfcGraphics
LOCAL loPen as XfcPen
LOCAL loBrush as XfcBrush
LOCAL loMatrix AS xfcMatrix
LOCAL loPointF AS xfcPointF
LOCAL loRect as XfcRectangle

*CLEAR
IF TYPE('_Screen.Image1') <> 'O'
	_Screen.AddObject('Image1','Image')
	_Screen.Image1.Width 	= 500
	_Screen.Image1.Height 	= 500
	_Screen.Image1.Visible 	= .T.
ENDIF

LOCAL lnXShear, lnYShear as Integer
STORE 0 TO lnXShear, lnYShear

LOCAL lnXScale, lnYScale as Integer
STORE 0 TO lnXScale, lnYScale

	loBmp 	= _Screen.System.Drawing.Bitmap.FromFile('1.jpg')
	loBmp2 	= _Screen.System.Drawing.Bitmap.FromFile('2.jpg')
	loBrush = _Screen.System.Drawing.Brushes.Black
	loPen 	= _Screen.System.Drawing.Pen.New(loBrush)
	loRect	= _Screen.System.Drawing.Rectangle.New(100, 100, 320, 320)
	loRect2	= _Screen.System.Drawing.Rectangle.New(200, 100, 320, 320)

lnTESTE = 1

loBmpB	= _Screen.System.Drawing.Bitmap.New(500, 500)
			
FOR lnxi = 0 to 0.9 step .01

	IF lnTESTE = 2
		loBmpB = BMPNEW.CLONE()
	ELSE
		loBmpB	= _Screen.System.Drawing.Bitmap.New(400, 400)
	ENDIF

	loGfx 	= _Screen.System.Drawing.Graphics.FromImage(loBmpB)
	loGfx2 	= _Screen.System.Drawing.Graphics.FromImage(loBmpB)

	*lnXI = .1
	*lnXShear = lnXI
	lnYShear = -(1)*lnXI
	lnXScale = -(1)*lnXI
	
	WITH _SCREEN.System.Drawing as XfcDrawing
		loMatrix = .Drawing2D.Matrix.New()
		loMatrix.Shear(lnXShear, lnYShear)
		loMatrix.Scale(lnXScale + 1, lnYScale + 1)

	IF lnTESTE = 1
		loGfx.MultiplyTransform(loMatrix)
		loGfx.DrawImage(loBmp, loRect )
	ELSE
		loGfx2.MultiplyTransform(loMatrix)
		loGfx2.DrawImage(loBmp2, loRect2 )
		IF lnXI >= .7
			EXIT
		ENDIF
	ENDIF

	IF lnTESTE = 1 AND lnxi < .8
		loGfx2.DrawImage(loBmp2, loRect2 )
	ENDIF

	ENDWITH
	_Screen.Image1.PictureVal = loBmpB.GetPictureValfromHBitmap()

	IF lnXI = .8 AND lnTESTE = 1
		lnXI = 0
		lnTESTE = 2
		BMPNEW = loBMPB.CLONE()
	ENDIF
ENDFOR

