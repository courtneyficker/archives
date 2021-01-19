'Computer Strobe Light (STROBE.BAS)
'     by: Courtney A. Ficker and Travis J. Willse
'  Of:  Sigma Software
 
 DIM SHARED strobe.speed
 
 DECLARE SUB configure ()
 DECLARE SUB strobe ()
 DECLARE SUB help ()
 DECLARE SUB needconfig ()

 CLS
 DEFINT A-Z
 SCREEN 9

 PRINT "                          Welcome to Infinity Software's"
 PRINT "                              Computer Strobe Light!"
 PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
 PRINT "      Press F2 to configure the program"
 PRINT "      Press F3 to get some help and tips"
 PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
 PRINT : PRINT : PRINT : PRINT : PRINT
 INPUT "(Press ENTER to go on)", pause$

 KEY(2) ON: ON KEY(2) GOSUB configure.gosub              'Configure
 KEY(3) ON: ON KEY(3) GOSUB help.gosub                   'Help

 strobe
 
 CLS
 SYSTEM




configure.gosub:
 configure
 RETURN

help.gosub:
 help
 RETURN

SUB configure
configure.input:
 CLS
 INPUT " Enter speed (0-2000):", strobe.speed
 IF strobe.speed < 0 OR strobe.speed > 2000 THEN
  GOTO configure.input
 END IF
 didconfig = 1138
END SUB

SUB help
 CLS
 PRINT "Tips"
 PRINT : PRINT : PRINT
 PRINT "-For maximum effectiveness, set the brightness and contrast"
 PRINT " on your monitor to the maximum level."
 INPUT enter$
 CLS
END SUB

SUB needconfig
 CLS
 PRINT "You must configure the file first!"
 SLEEP 2
 configure
END SUB

SUB strobe
 IF didconfig <> 1138 THEN needconfig


 DO
  PAINT (0, 0), 15
  FOR strobe.pause = 0 TO (2001 - strobe.speed)
  NEXT strobe.pause
  PAINT (0, 0), 0
  FOR strobe.pause = 0 TO (2001 - strobe.speed)
  NEXT strobe.pause
 LOOP WHILE INKEY$ = ""
 
END SUB

