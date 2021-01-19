' Sine Wave  -By David Ahl
' Modified by Courtney A. Ficker


DECLARE FUNCTION calcdelay! ()
DECLARE SUB rest (t#)
CONST SPEEDCONST = 1000
DIM SHARED machspeed AS SINGLE

 



CLS
PRINT "Hello! What message (up to 2 words) should I display?"
INPUT "Word 1: ", message1$
INPUT "Word 2: (just ENTER for 1 word): ", message2$



b = 0

' Start Long Loop...

DO

 FOR t = 0 TO 1000000 STEP .25
  a = INT(26 + 25 * SIN(t))
  PRINT TAB(a);
  IF b = 1 AND message2$ <> "" THEN GOTO msgtwo:
  PRINT message1$
  b = 1
  GOTO loopnow:

msgtwo:
  PRINT message2$
  b = 0
loopnow:
  rest (t#)
  NEXT t

LOOP UNTIL INKEY$ <> ""





 



END

FUNCTION calcdelay!
 
  s! = TIMER
  DO
    i! = i! + 1
  LOOP UNTIL TIMER - s! >= .5
  calcdelay! = i!


END FUNCTION

SUB rest (t#)

rest:
'  pauses the program
  s# = TIMER
  t2# = machspeed * t# / SPEEDCONST
  DO
  LOOP UNTIL TIMER - s# > t2#

END SUB

