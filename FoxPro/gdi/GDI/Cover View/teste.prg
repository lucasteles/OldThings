DO 'C:\GDI\CARREGARGDI.PRG'

PUBLIC loMEUDESENHO AS XFCBITMAP
PUBLIC loIMAGEM AS XFCBITMAP
PUBLIC loGFXSCREEN AS XFCGRAPHICS
PUBLIC loGFX AS XFCGRAPHICS
PUBLIC loMATRIX AS XFCMATRIX
PUBLIC loPointF AS XFCPOINTF

* DEFININDO OBJETOS DE MANIPULA��O DE IMAGEM
loGFXSCREEN = _Screen.System.Drawing.Graphics.FromHwnd(_SCREEN.HWnd)
loMEUDESENHO = _Screen.System.Drawing.Bitmap.New(1000,1000)
loIMAGEM = _Screen.System.Drawing.Bitmap.FromFile('images\cover (1).jpg')
loIMAGEM2 = _Screen.System.Drawing.Bitmap.FromFile('images\cover (2).jpg')
loGFX = _Screen.System.Drawing.Graphics.FromImage(loMEUDESENHO)
loGFX2 = _Screen.System.Drawing.Graphics.FromImage(loMEUDESENHO)

* MANIPULANDO IMAGEM
loMATRIX = _Screen.System.Drawing.Drawing2D.MATRIX.New()
*loGFX.MultiplyTransform(loMATRIX)

loMATRIX.Reset()
loMATRIX.Scale(0.15 , 1)
loMATRIX.Shear(0,-.31)
DESENHAR()

loMATRIX.Reset()
loMATRIX.Scale(1.5 , 1)
loMATRIX.Shear(0,.075)

FOR I = 1 TO 10
	DESENHAR()
ENDFOR

loMATRIX.Reset()
loMATRIX.Scale(0.8,1)
loMATRIX.Shear(0,-.05)

FOR I = 1 TO 10
	DESENHAR()
ENDFOR

PROC DESENHAR
	=INKEY(.000001)
	IF LASTKEY()=27
		RETURN
	ENDIF
*	loMATRIX.Scale(1,1)
*	loMATRIX.Shear(0,.05)
	loGFX.MultiplyTransform(loMATRIX)

	* APLICANDO ALTERA��ES
	*loGFX2.CLEAR(_Screen.System.Drawing.Color.White)
	*loGFX2.DrawImage(loIMAGEM2,0, 0, loIMAGEM.Width, loIMAGEM.Height)
	loGFX.CLEAR(_Screen.System.Drawing.Color.White)
	loGFX.DrawImage(loIMAGEM,0, 0, loIMAGEM.Width, loIMAGEM.Height)
	
	* DESENHANDO RESULTADO FINAL
	*loGFXSCREEN.Clear(_Screen.System.Drawing.Color.White)
	loGFXSCREEN.DrawImage(loMEUDESENHO,20,20,loMEUDESENHO.Width, loMEUDESENHO.Height)

ENDPROC