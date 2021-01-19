'Cooler Circle Maker v.2.0!-By Courtney A Ficker
RANDOMIZE TIMER
SCREEN 9

PRINT "Do you want (L)ines, (S)quares, (B)oxes or (E)verything"
PRINT "with the circles?"
INPUT choice$
choice$ = UCASE$(choice$)
IF choice$ = "S" THEN GOTO circlesquares:
IF choice$ = "B" THEN GOTO circleboxes:
IF choice$ = "E" THEN GOTO everything:
circlelines:
PRINT "How many circles and lines do you want before it clears?"
PRINT "(0 for infinity!)"
inputnum:
INPUT num

PRINT "How long do you you want the delay? (0-none, 1-5 seconds)"
INPUT slp
CLS

DO
     IF slp = 0 THEN GOTO nosleep:
     SLEEP slp
nosleep:
     randomcolor% = INT(RND * 15) + 1
     rndcolor% = INT(RND * 15) + 1
     COLOR rndcolor%
     x = INT(RND * 639) + 1
     y = INT(RND * 328) + 1
     r = INT(RND * 100) + 1
     CIRCLE (x, y), r
     a1! = INT(RND * 639) + 1
     b1! = INT(RND * 328) + 1
     a2! = INT(RND * 639) + 1
     b2! = INT(RND * 328) + 1
     IF choice$ <> "L" THEN GOTO twofifty:
oneseventyfive:
     LINE (a1!, b1!)-(a2!, b2!), randomcolor%
     IF choice$ = "E" THEN GOTO twosixty:
     IF choice$ = "E" THEN GOTO twoseventy:
oneighty:
     IF slp = 0 THEN GOTO oneightytwo:
     SLEEP slp
oneightytwo:
     LET clr = clr + 1
     IF num = 0 THEN GOTO loop1:
     IF clr = num THEN CLS
     IF clr = num THEN clr = 0
loop1:
LOOP UNTIL INKEY$ <> ""
END

circlesquares:
PRINT "How many circles and squares do you want before it clears?"
GOTO inputnum:

circleboxes:
PRINT "How many circles and boxes do you want before it clears?"
GOTO inputnum:

everything:
PRINT "How many circles, lines, boxes, and squares do you want?"
GOTO inputnum:

twofifty:
IF choice$ = "E" THEN GOTO oneseventyfive:
IF choice$ = "B" THEN GOTO twosixty:
IF choice$ = "S" THEN GOTO twoseventy:

twosixty:
LINE (a1!, b1!)-(a2!, b2!), randomcolor%, BF
GOTO oneighty:

twoseventy:
LINE (a1!, b1!)-(a2!, b2!), randomcolor%, B
GOTO oneighty:

