LPARAMETERS tnQT,tnRAND
DO rmvimg
R=CEILING(RAND()*255)  &&R+1
G=CEILING(RAND()*255) &&G+2
B=CEILING(RAND()*255) &&B+3

RI=CEILING(RAND()*3)
GI=CEILING(RAND()*3)
Bi=CEILING(RAND()*3)


CLEAR
DO WHILE LASTKEY()<>27
	
	INKEY(1)
	
		IF tnRAND=1
			_SCREEN.CurrentX=_SCREEN.WIDTH/2
			_SCREEN.Currenty=_SCREEN.HEIGHT/2
		ENDIF
		IF tnRAND=2 OR tnRAND=3
			_SCREEN.CurrentX=CEILING(_SCREEN.WIDTH*RAND())
			_SCREEN.Currenty=CEILING(_SCREEN.HEIGHT*RAND())
		ENDIF
		
	
	FOR I=1 TO tnQT STEP 4

			IF R>250 THEN
				R=1
			ENDIF

			IF G>250 THEN
				G=1
			ENDIF
			
			IF B>250 THEN
				B=1
			ENDIF


			_SCREEN.FORECOLOR=RGB(R,G,B)
			R=R+RI
			G=G+GI
			B=B+BI

		

		IF tnRAND=4
			_SCREEN.CurrentX=CEILING(_SCREEN.WIDTH*RAND())
			_SCREEN.Currenty=CEILING(_SCREEN.HEIGHT*RAND())
		ENDIF
		
		_SCREEN.circle(I)
		
		
		INKEY(0.0001)
	NEXT
	
	R=CEILING(RAND()*255)  &&R+1
	G=CEILING(RAND()*255) &&G+2
	B=CEILING(RAND()*255) &&B+3
	
	RI=CEILING(RAND()*3)
	GI=CEILING(RAND()*3)
	Bi=CEILING(RAND()*3)

	IF tnRAND=3
		_SCREEN.CurrentX=CEILING(_SCREEN.WIDTH*RAND())
		_SCREEN.Currenty=CEILING(_SCREEN.HEIGHT*RAND())
	ENDIF

	FOR I=tnQT TO 0 STEP -2

			IF R>250 THEN
				R=1
			ENDIF

			IF G>250 THEN
				G=1
			ENDIF
			
			IF B>250 THEN
				B=1
			ENDIF


			_SCREEN.FORECOLOR=RGB(R,G,B)
			R=R+RI
			G=G+GI
			B=B+BI
		
		
		IF tnRAND=4
			_SCREEN.CurrentX=CEILING(_SCREEN.WIDTH*RAND())
			_SCREEN.Currenty=CEILING(_SCREEN.HEIGHT*RAND())
		ENDIF
		
		
		
		
		_SCREEN.Circle(I)
		
	
		
		INKEY(0.0001)
	NEXT
				

ENDDO