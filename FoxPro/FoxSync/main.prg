** INICIA O PROGRAMA 
_SCREEN.Visible = .F.
_SCREEN.WindowState = 2

ON SHUTDOWN SAIR() 
ON ERROR DO PROERRO WITH ERROR(),MESSAGE()

DO FORMATAR
DO FORM SYNC
READ EVENTS

QUIT
PROC MSG
	LPARAMETERS tcMSG
	=MESSAGEBOX(tcMSG,'Aten��o')
ENDPROC

PROCEDURE FORMATAR 
	SET DATE BRITISH
	SET DELETED ON
	SET CENTURY ON
	SET HOURS TO 24
	SET EXCLUSIVE OFF

PROCEDURE PROERRO()
	PARAMETERS errnum,message
	MESSAGEBOX('Ocorreu um erro e seu software sera fexado'+ CHR(13)+ '         Erro n�mero: ' + ALLTRIM(STR(ERRNUM)),64,'Problema Tecnico')
	CLEAR EVENTS

	
PROCEDURE SAIR()
	CLOSE ALL
	CLEAR ALL
	WAIT CLEAR
	SET SYSMENU TO DEFA
	ON SHUTDOWN QUIT
    QUIT


	