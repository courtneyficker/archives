'Komputer Keyboard! (ver.2.0)
'By Courtney A. Ficker

 
SCREEN 9
                'Here are all the music listings
intro$ = "MBo3l8FGAl5>Cl8<Al4>C"
qtune$ = "MFo3l7C"
wtune$ = "MFo3l7D"
etune$ = "MFo3l7E"
rtune$ = "MFo3l7F"
ttune$ = "MFo3l7G"
ytune$ = "MFo4l7A"
utune$ = "MFo4l7B"
itune$ = "MFo4l7C"

PRINT "    Welcome to Komputer Keyboard version 2.0!"
PRINT "To use K.K., Use QWERTYUI as the notes."
PRINT "To exit, just press X."
PRINT "(Press Enter to continue)"
INPUT enter$
SCREEN 0
CLS
PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
COLOR 4
PLAY intro$
PRINT "                                   Have Fun!"
SLEEP 3
SCREEN 9
            'Draw the Keyboard...
 
LINE (40, 50)-(100, 200), 7, BF
LINE (110, 50)-(170, 200), 7, BF
LINE (180, 50)-(240, 200), 7, BF
LINE (250, 50)-(310, 200), 7, BF
LINE (320, 50)-(380, 200), 7, BF
LINE (390, 50)-(450, 200), 7, BF
LINE (460, 50)-(520, 200), 7, BF
LINE (530, 50)-(590, 200), 7, BF
            'Draw the letter names...

LOCATE 10, 8, 0
Lrow = CSRLIN
LCol = POS(0)
PRINT "C(Q)"

LOCATE (Lrow), LCol + 9, 0
PRINT "D(W)"
LOCATE (Lrow), LCol + 19, 0
PRINT "E"
LOCATE (Lrow), LCol + 26, 0
PRINT "F(R)"
LOCATE (Lrow), LCol + 35, 0
PRINT "G(T)"
LOCATE (Lrow), LCol + 43, 0
PRINT "A(Y)"
LOCATE (Lrow), LCol + 52, 0
PRINT "B(U)"
LOCATE (Lrow), LCol + 61, 0
PRINT "C(I)"



'Core module

PGRM:
DO
playnote$ = UCASE$(INKEY$)
IF playnote$ = "Q" THEN
 note$ = "MFo3L4C"
 PLAY note$
END IF
IF playnote$ = "W" THEN
 note$ = "MFo3L4D"
 PLAY note$
END IF
IF playnote$ = "E" THEN
 note$ = "MFo3L4E"
 PLAY note$
END IF
IF playnote$ = "R" THEN
 note$ = "MFo3L4F"
 PLAY note$
END IF
IF playnote$ = "T" THEN
 note$ = "MFo3L4G"
 PLAY note$
END IF
IF playnote$ = "Y" THEN
 note$ = "MFo3L4A"
 PLAY note$
END IF
IF playnote$ = "U" THEN
 note$ = "MFo3L4B"
 PLAY note$
END IF
IF playnote$ = "I" THEN
 note$ = "MFo4L4C"
 PLAY note$
END IF
IF playnote$ = "X" THEN GOTO ending:

playnote$ = ""
note$ = ""

LOOP
ending:
 CLS
 PRINT "That's all, folks!"
 SLEEP 1
END     'KKEY.BAS

GOTO PGRM:

