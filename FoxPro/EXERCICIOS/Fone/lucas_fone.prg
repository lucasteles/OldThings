_screen.Visible= .F.
_screen.WindowState= 2
_screen.Visible= .T.
	CD 
 	DO FORM exerc7
	DO mnuFone.MPR
	READ EVENTS
	thisform.WindowState= 2
	



ON SHUTDOWN QUIT