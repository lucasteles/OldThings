DECLARE INTEGER FindWindow IN "user32" STRING, STRING
DECLARE INTEGER GetWindowLong IN "user32" INTEGER, INTEGER
DECLARE INTEGER SetWindowLong IN "user32" INTEGER, INTEGER, INTEGER
DECLARE INTEGER SetLayeredWindowAttributes IN "user32" INTEGER, INTEGER, INTEGER, INTEGER
DECLARE Sleep IN kernel32 INTEGER dwMilliseconds
DECLARE SHORT PostMessage IN user32 INTEGER hWnd,INTEGER Msg,STRING @wParam,INTEGER lParam

LOCAL lnTRANS,XX AS INTEGER
lnTRANS=0

_SCREEN.WindowState = 2
&&_SCREEN.Visible = .F.

DO windowsierarq

*!*	SELE CS
*!*	GO TOP
*!*	DELETE FOR EMPTY(ALLTRIM(wintitle))
SELE CS
GO TOP

FOR lnTRANS= 5 TO 95 STEP 20
	TRANSP(lnTRANS)
ENDFOR

DO FORM MARIO 
READ EVENTS
*!*	DO WHILE FindWindow(Null, "<mario>hehe</mario>") <> 0
*!*	  INKEY(1,'H')
*!*	ENDDO


FOR lnTRANS= 95 TO 0 STEP -20
	TRANSP(lnTRANS)
ENDFOR


FUNC TRANSP(tnNIVEL)
	LOCAL LNLEVEL, LNOLDSTYLE, LNWNDSHELL_TRAYWND
	LNLEVEL = 255-MAX(0, MIN(INT(tnNIVEL*255/100), 255))
	SELE CS
	GO TOP
	SCAN WHILE NOT EOF()
		LNHWNDSHELL_TRAYWND =CS.winhandle 
		IF LNHWNDSHELL_TRAYWND<>0
			LNOLDSTYLE = GETWINDOWLONG(LNHWNDSHELL_TRAYWND, -20)
			SETWINDOWLONG(LNHWNDSHELL_TRAYWND, -20, BITOR(LNOLDSTYLE, 524288))
			SETLAYEREDWINDOWATTRIBUTES(LNHWNDSHELL_TRAYWND, 0, LNLEVEL, 02)
		ENDIF
	ENDSCAN