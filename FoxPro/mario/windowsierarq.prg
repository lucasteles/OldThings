DO decl
 
LOCAL hParent, hWindow, cTitle, cRect
hParent = GetDesktopWindow()
hWindow = 0
 
CREATE CURSOR cs (winhandle I,;
    x0 I, y0 I, x1 I, y1 I, wintitle C(200))
 
DO WHILE .T.
    STORE REPLICATE(CHR(0),255) TO cClass, cTitle
    hWindow = FindWindowEx(hParent, hWindow,;
        Null, Null)
 
    IF hWindow = 0
        EXIT
    ELSE
        cTitle = GetWinText(hWindow)
        IF !EMPTY(ALLTRIM(cTitle)) AND !UPPER(ALLTRIM(cTitle))=='INICIAR'
	        cRect = GetWinRect(hWindow)
	        INSERT INTO cs VALUES (hWindow,;
	            buf2dword(SUBSTR(cRect, 1,4)),;
	            buf2dword(SUBSTR(cRect, 5,4)),;
	            buf2dword(SUBSTR(cRect, 9,4)),;
	            buf2dword(SUBSTR(cRect, 13,4)),;
	            cTitle)
	    ENDIF
    ENDIF
ENDDO
SELE CS
APPEND BLANK 
REPLACE winhandle WITH FINDWINDOW("Shell_TrayWnd", 0),;
		wintitle  WITH 'MENU INI'
		

SELE cs
GO TOP
*BROWSE NORMAL NOWAIT

 
FUNCTION GetWinText(hWindow)
    LOCAL cBuffer
    cBuffer = REPLICATE(CHR(0), 255)
    = GetWindowText(hWindow, @cBuffer, LEN(cBuffer))
RETURN STRTRAN(cBuffer, CHR(0), "")
 
FUNCTION GetWinRect(hWindow)
    LOCAL cBuffer
    cBuffer = REPLICATE(CHR(0), 16)
    = GetWindowRect(hWindow, @cBuffer)
RETURN cBuffer
 
PROCEDURE decl
    DECLARE INTEGER GetLastError IN kernel32
    DECLARE INTEGER GetDesktopWindow IN user32
 
    DECLARE INTEGER FindWindowEx IN user32;
        INTEGER hwndParent, INTEGER hwndChildAfter,;
        STRING @lpszClass, STRING @lpszWindow
 
    DECLARE INTEGER GetWindowText IN user32;
        INTEGER hWnd, STRING @lpString, INTEGER nMaxCount
 
    DECLARE INTEGER GetWindowRect IN user32;
        INTEGER hWnd, STRING lpRect
        
	 DECLARE INTEGER FindWindow IN "user32" STRING, STRING

FUNCTION buf2dword(lcBuffer)
RETURN Asc(SUBSTR(lcBuffer, 1,1)) + ;
    BitLShift(Asc(SUBSTR(lcBuffer, 2,1)),  8) +;
    BitLShift(Asc(SUBSTR(lcBuffer, 3,1)), 16) +;
    BitLShift(Asc(SUBSTR(lcBuffer, 4,1)), 24)
