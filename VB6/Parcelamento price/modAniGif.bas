Attribute VB_Name = "modAniGif"
Option Explicit
Public NumRepeti��es As Long ' Ainda n�o foi implementado
Public TotalFrames As Long

Public Function CarregaGif(Arq As String, aImg As Variant) As Boolean
    CarregaGif = False
    If Dir$(Arq) = "" Or Arq = "" Then
       MsgBox "Arquivo " & Arq & " n�o encontrado", vbCritical
       Exit Function
    End If
    On Error GoTo ErrCabe�alho
    Dim ArqNum As Integer
    Dim Cabe�alhoImagem As String, Cabe�alhoArq As String
    Dim Buffer$, BufferFigura$
    Dim ContImagens As Integer
    Dim i&, j&, xOff&, yOff&, TempoEspera
    Dim FimGIF As String
    FimGIF = Chr(0) & Chr(33) & Chr(249)
    For i = 1 To aImg.Count - 1
        Unload aImg(i)
    Next i
    ArqNum = FreeFile
    Open Arq For Binary Access Read As ArqNum
        Buffer = String(LOF(ArqNum), Chr(0))
        Get #ArqNum, , Buffer 'Obt�m o arq. gif para o buffer
    Close ArqNum
    
    i = 1
    ContImagens = 0
    j = InStr(1, Buffer, FimGIF) + 1
    Cabe�alhoArq = Left(Buffer, j)
    If Left$(Cabe�alhoArq, 3) <> "GIF" Then
       MsgBox "Este arq. n�o � um *.gif arquivo", vbCritical
       Exit Function
    End If
    CarregaGif = True
    i = j + 2
    If Len(Cabe�alhoArq) >= 127 Then
        NumRepeti��es& = Asc(Mid(Cabe�alhoArq, 126, 1)) + (Asc(Mid(Cabe�alhoArq, 127, 1)) * 256&)
    Else
        NumRepeti��es = 0
    End If

    Do ' Divide os Gifs fo arq. em figuras separadas e carrega em um arraay de imagens
        ContImagens = ContImagens + 1
        j = InStr(i, Buffer, FimGIF) + 3
        If j > Len(FimGIF) Then
            ArqNum = FreeFile
            Open "temp.gif" For Binary As ArqNum
                BufferFigura = String(Len(Cabe�alhoArq) + j - i, Chr(0))
                BufferFigura = Cabe�alhoArq & Mid(Buffer, i - 1, j - i)
                Put #ArqNum, 1, BufferFigura
                Cabe�alhoImagem = Left(Mid(Buffer, i - 1, j - i), 16)
            Close ArqNum
            TempoEspera = ((Asc(Mid(Cabe�alhoImagem, 4, 1))) + (Asc(Mid(Cabe�alhoImagem, 5, 1)) * 256&)) * 10&
            If ContImagens > 1 Then
                xOff = Asc(Mid(Cabe�alhoImagem, 9, 1)) + (Asc(Mid(Cabe�alhoImagem, 10, 1)) * 256&)
                yOff = Asc(Mid(Cabe�alhoImagem, 11, 1)) + (Asc(Mid(Cabe�alhoImagem, 12, 1)) * 256&)
                Load aImg(ContImagens - 1)
                aImg(ContImagens - 1).Left = aImg(0).Left + (xOff * Screen.TwipsPerPixelX)
                aImg(ContImagens - 1).Top = aImg(0).Top + (yOff * Screen.TwipsPerPixelY)
            End If
            ' Use .Tag Property to save TimeWait interval for separate Image
            ' Usa a propriedade .Tag para salvar TempoEspera para separa��o das imagens
            aImg(ContImagens - 1).Tag = TempoEspera
            aImg(ContImagens - 1).Picture = LoadPicture("temp.gif")
            Kill ("temp.gif")
            i = j
        End If
        DoEvents
    Loop Until j = 3
' Se possuir mais de uma imagem
    If i < Len(Buffer) Then
        ArqNum = FreeFile
        Open "temp.gif" For Binary As ArqNum
            BufferFigura = String(Len(Cabe�alhoArq) + Len(Buffer) - i, Chr(0))
            BufferFigura = Cabe�alhoArq & Mid(Buffer, i - 1, Len(Buffer) - i)
            Put #ArqNum, 1, BufferFigura
            Cabe�alhoImagem = Left(Mid(Buffer, i - 1, Len(Buffer) - i), 16)
        Close ArqNum
        TempoEspera = ((Asc(Mid(Cabe�alhoImagem, 4, 1))) + (Asc(Mid(Cabe�alhoImagem, 5, 1)) * 256)) * 10
        If ContImagens > 1 Then
            xOff = Asc(Mid(Cabe�alhoImagem, 9, 1)) + (Asc(Mid(Cabe�alhoImagem, 10, 1)) * 256)
            yOff = Asc(Mid(Cabe�alhoImagem, 11, 1)) + (Asc(Mid(Cabe�alhoImagem, 12, 1)) * 256)
            Load aImg(ContImagens - 1)
            aImg(ContImagens - 1).Left = aImg(0).Left + (xOff * Screen.TwipsPerPixelX)
            aImg(ContImagens - 1).Top = aImg(0).Top + (yOff * Screen.TwipsPerPixelY)
        End If
        aImg(ContImagens - 1).Tag = TempoEspera
        aImg(ContImagens - 1).Picture = LoadPicture("temp.gif")
        Kill ("temp.gif")
    End If
    TotalFrames = aImg.Count - 1
    Exit Function
ErrCabe�alho:
    MsgBox "Erro N�. " & Err.Number & " enquanto lia o arquivo", vbCritical
    CarregaGif = False
    On Error GoTo 0
End Function
