DO LOCFILE("System.App")

WITH _SCREEN.System.Drawing as xfcDrawing

	LOCAL lcMainPict, lcBMP1, lcBMP2, lcBMP3 AS String
	LOCAL loMainBmp as xfcBitmap
	LOCAL loBMP1,loBMP2,loBMP3 as xfcBitmap
	LOCAL loGfx as xfcGraphics

	lcBMP1 	   = GETPICT()
	lcBMP2 	   = GETPICT()
	lcBMP3 	   = GETPICT()

	loMainBmp 	= .Bitmap.NEW(355,605)
	loBMP1		= .Bitmap.FromFile(lcBMP1)
	loBMP2 		= .Bitmap.FromFile(lcBMP2)
	loBMP3 		= .Bitmap.FromFile(lcBMP3)
	loFont		= .Font.New("Tahoma", 8)

	loGfx = .Graphics.FromImage(loMainBmp)
	loGfx.Clear(.Color.LIGHTGRAY)
	loGfx.DrawImage(loBMP1, 10, 20,loBmp1.WIDTH, loBmp1.Height-10)
	loGfx.DrawImage(loBMP2, 10, 230, loBmp2.WIDTH, loBmp2.Height-10)
	loGfx.DrawImage(loBMP3, 10, 420, loBmp2.WIDTH, loBmp2.Height-10)
	loGFX.DrawString('Distribui��o',loFont,.Brushes.Black,145,5)
	loGFX.DrawString('Atribui��o de perfomance carteira',loFont,.Brushes.Black,95,215)
	loGFX.DrawString('Desempenho carteira',loFont,.Brushes.Black,115,405)
	loMainBmp.Save("c:\lixo\logo1.EMF", .Imaging.ImageFormat.eMF)

	RUN /N explorer.exe c:\lixo\logo1.EMF
ENDWITH