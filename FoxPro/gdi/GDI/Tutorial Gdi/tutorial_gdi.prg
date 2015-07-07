* Carregando classe GDI++
DO ? 
*DO "G:\usuarios\reimberg\codigo_ barras\tiger\Fontes\GDI\GDI_CLASS\SYSTEM"

LOCAL loIMAGE AS XFCIMAGE
LOCAL loGFX AS XFCGRAPHICS
LOCAL loBRUSH AS XFCBRUSH
LOCAL loFONT AS XFCFONT
LOCAL loALIGN AS XFCSTRINGFORMAT
LOCAL loRECTF AS XFCRECTANGLEF

* Criando um objeto image par�metros
loIMAGE = _SCREEN.SYSTEM.Drawing.Bitmap.New(500, 500)

* Criando objeto para trabalhar no ambiente gr�fico
loGFX = _SCREEN.SYSTEM.Drawing.Graphics.FromImage(loIMAGE)

* Criando ret�ngulo ( RECTANGLE )
*********************************
	* Criando pincel						Cor do pincel
	loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Green

	* Desenhando ret�ngulo
					    && Pincel, X, Y, Width, Height
	loGFX.FillRectangle(loBRUSH, 25, 25, 450, 350)

* Criando um Polin�mio
***********************
	* Criando pincel						Cor do pincel
	loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Yellow

	* Definindo Matriz
	LOCAL ARRAY laPOLY[4,2]
	laPOLY[1,1]= 250
	laPOLY[1,2]= 50
	laPOLY[2,1]= 475
	laPOLY[2,2]= 200
	laPOLY[3,1]= 250
	laPOLY[3,2]= 350
	laPOLY[4,1]= 25
	laPOLY[4,2]= 200

	* Desenhando Polin�mio
					    && Pincel, X, Y, Width, Height
 	loGFX.FillPolygon(loBRUSH, @laPOLY)


* Criando um Elipse ( C�rculo )
*********************
	* Criando pincel						Cor do pincel
	loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Blue

	* Desenhando Elipse
					    && Pincel, X, Y, Width, Height
	loGFX.FillEllipse(loBRUSH, 165, 110, 175, 175)

* Criando pizza ( PIE )
*************************************

*!*		* Criando pincel						Cor do pincel
*!*		loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Green

*!*		* Desenhando parte do c�rculo VERDE
*!*	          	    && Pincel, X, Y, Width, Height, �ngulo de comeco, Qtd �ngulo para somar
*!*		loGFX.FillPie(loBRUSH, 100, 400, 100, 100, 0, 90)

*!*		* Criando pincel						Cor do pincel
*!*		loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Orange

*!*		* Desenhando parte do c�rculo LARANJA
*!*	          	    && Pincel, X, Y, Width, Height, �ngulo de comeco, Qtd �ngulo para somar
*!*		loGFX.FillPie(loBRUSH, 100, 400, 100, 100, 90, 90)


* Escrevendo uma string sem alinhamento
**************************************
	* Criando pincel						Cor do pincel
	loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.Black
	
	* Escolhendo fonte						 Nome fonte, Tamanho da Fonte
	loFONT = _SCREEN.SYSTEM.Drawing.Font.New('Comic Sans MS',15)

	* Desenhando string									Fonte, Pincel, X, Y
	loGFX.DrawString('Visual Foxpro is Rock !!!!!!!', loFONT, loBRUSH, 50, 350)
	
* Escrevendo uma string com alinhamento
**************************************
	* Criando pincel						Cor do pincel
	loBRUSH = _SCREEN.SYSTEM.Drawing.Brushes.White
	
	* Escolhendo fonte						 Nome fonte, Tamanho da Fonte
	loFONT = _SCREEN.SYSTEM.Drawing.Font.New('Arial',12,3)
	* 1 - Negrito
	* 2 - It�tico
	* 4 - Sublinhado
	* 8 - Tachado

	* Criando objeto de alinhamento da fonte
	loALIGN = _SCREEN.SYSTEM.Drawing.StringFormat.GenericTypographic.Clone()
	
	* Setando alinhamento Central
	loALIGN.Alignment = 1 && Center
	* loALIGN.Alignment = 0 && Left
	* loALIGN.Alignment = 2 && Right

	* Desenhando ret�ngulo para setar �rea de alinhamento do texto
													&& X, Y, Width, Height
	loRECTF = _SCREEN.SYSTEM.Drawing.RectangleF.New(0, 175, 500, 500)
	
	* Desenhando string									Fonte, Pincel, X, Y, Alinhamento
	loGFX.DrawString('Orderm e progresso', loFONT, loBRUSH, loRECTF, loALIGN)

* Salvando Imagem em V�rios Formatos
**************************************
	* Salvando imagem como PNG
	loIMAGE.Save('c:\imagem.png',_SCREEN.SYSTEM.Drawing.Imaging.ImageFormat.Png)
	
	* Salvando imagem como JPG
*	loIMAGE.Save('c:\imagem.jpg',_SCREEN.SYSTEM.Drawing.Imaging.ImageFormat.Jpeg)

	* Salvando imagem como GIF
*	loIMAGE.Save('c:\imagem.gif',_SCREEN.SYSTEM.Drawing.Imaging.ImageFormat.Gif)

* Eliminando objetos gr�ficos
********************************************
	loIMAGE.Dispose()
	loGFX.Dispose()

LOCAL loSHELL AS 'WSCRIPT.SHELL'
loSHELL = CREATEOBJECT('WSCRIPT.SHELL')
loSHELL.Run('c:\imagem.png')