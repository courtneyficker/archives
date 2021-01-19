 'Silicon Element Report by Courtney A. Ficker
 'Period 6  11-24-97

 DECLARE SUB compalloy ()       'Compunds/Alloys of chief importance
 DECLARE SUB geo ()             'Where the element is found
 DECLARE SUB historic ()        'Historical information
 DECLARE SUB propertiesc ()     'Chemical properties
 DECLARE SUB propertiesp ()     'Physical properties
 DECLARE SUB uses ()            'Uses of Silicon
 DECLARE SUB sources ()         'A list of sources of information
 DECLARE SUB sparklepause ()    'Makes a moving red border

 CLS
 COLOR 4
 PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
 PRINT "                      Courtney Ficker's Silicon Report!"
 PRINT "                             Period 6   11-24-97"
 PRINT "                                (version 1.0)"
 PRINT : PRINT : PRINT : PRINT
 PLAY "MBo3l8FGAl5>Cl8<Al4>C"
 sparklepause
 CLS
 PRINT : PRINT "Welcome to Courtney's Silicon Report!"
 SLEEP 3
inputarea:
 CLS
 PRINT "Please type the number of the"
 PRINT "area you wish to go to:"
 PRINT "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 PRINT
 PRINT "1. Historical Information"
 PRINT "2. Geographic Information"
 PRINT "3. Physical Properties"
 PRINT "4. Chemical Properties"
 PRINT "5. Compounds/Alloys"
 PRINT "6. Sources"
 PRINT "7. Exit"

 INPUT "What area? -->", area

 IF area = 1 THEN
  historic
  GOTO inputarea:
 END IF
 IF area = 2 THEN
  geo
  GOTO inputarea:
 END IF
 IF area = 3 THEN
  propertiesp
  GOTO inputarea:
 END IF
 IF area = 4 THEN
  propertiesc
  GOTO inputarea:
 END IF
 IF area = 5 THEN
  compalloy
  GOTO inputarea:
 END IF
 IF area = 6 THEN
  sources
  GOTO inputarea:
 END IF
 IF area = 7 THEN
  GOTO quit:
 END IF

 CLS
 PRINT "I'm sorry, I must have forgotten to put area"; area; "in my report!"
 SLEEP 2
 GOTO inputarea:

quit:
 END 'SILICON.BAS

SUB compalloy
 CLS
 PRINT "COMPUNDS/ALLOYS OF CHIEF IMPORTANCE"
 PRINT "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 PRINT "Sodium Silicate (Na2SiO3)-"
 PRINT "    Also called water glass, the aqueous form of"
 PRINT "Sodium Silicate is used for preserving eggs, as a substitute"
 PRINT "for glue in making containers, a binder in artificial gemstones,"
 PRINT "a fireproofing agent, and as a binder and filler in soaps and"
 PRINT "cleansers."
 PRINT
 PRINT "Carborundum (Silicon-Carbon compound)-"
 PRINT "    Carborundum is mainly used as an abraisive."
 PRINT
 PRINT "Silicon Monoxide (SiO)-"
 PRINT "    Silicon Monoxide is used as a coating to protect"
 PRINT "other materials. (The outer surface oxidizes to become"
 PRINT "Silicon Dioxide. (SiO2)"
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB geo
 CLS
 PRINT "GEOGRAPHIC INFORMATION"
 PRINT "~~~~~~~~~~~~~~~~~~~~~~"
 PRINT "Silicon is found everywhere. It is the second most"
 PRINT "common element on Earth, after Oxygen"
 PRINT : PRINT "The disk this program is included on is partially"
 PRINT "made of silicon. Silicon is used a lot in the computer"
 PRINT "industry."
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB historic
 CLS
 PRINT "HISTORICAL INFORMATION"
 PRINT "~~~~~~~~~~~~~~~~~~~~~~"
 PRINT
 PRINT "Discovered in: Sweden in 1824"
 PRINT "Discovered by: Jons Berzelius"
 PRINT "Name means: L. silex, silicis, flint"
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB propertiesc
 CLS
 PRINT "CHEMICAL PROPERTIES"
 PRINT "~~~~~~~~~~~~~~~~~~~"
 PRINT "    If siliceous dust is inhaled into the lungs, a disease"
 PRINT "known as silicosis can develop."
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB propertiesp
 CLS
 PRINT "PHYSICAL PROPERTIES"
 PRINT "~~~~~~~~~~~~~~~~~~~"
 PRINT
 PRINT "Symbol:           Si"
 PRINT "Atomic Weight:    28.0855"
 PRINT "Atomic Number:    14"
 PRINT "Melting Point:    1683"; CHR$(248); " Kelvin"
 PRINT "Boiling Point:    2628"; CHR$(248); " Kelvin"
 PRINT "Specific Gravity: 2.33"
 PRINT
 PRINT "    Silicon's natural state is solid. It is dark grey"
 PRINT "with a bluish tinge."
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB sources
 CLS
 PRINT "SOURCES"
 PRINT "~~~~~~~"
 PRINT
 PRINT "1. Microsoft Encarta '96"
 PRINT "    (C) 1996 Microsoft Corporation"
 PRINT
 PRINT "2. http://www.cchem.berkely.edu/Table/index.html"
 PRINT "     WebElements website"
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

SUB sparklepause

  COLOR 4, 0
  a$ = "*    *    *    *    *    *    *    *    *    *    *    *    *    *    *    *    *    "
  DO WHILE INKEY$ <> "": LOOP

  DO WHILE INKEY$ = ""
    FOR a = 1 TO 5
      LOCATE 1, 1
      PRINT MID$(a$, a, 80);
      LOCATE 25, 1
      PRINT MID$(a$, 6 - a, 80);

      FOR b = 2 TO 24
        c = (a + b) MOD 5
        IF c = 1 THEN
          LOCATE b, 80
          PRINT "*";
          LOCATE 26 - b, 1
          PRINT "*";
        ELSE
          LOCATE b, 80
          PRINT " ";
          LOCATE 26 - b, 1
          PRINT " ";
        END IF
      NEXT b
    NEXT a
  LOOP
 COLOR 15

END SUB

SUB uses
 CLS
 PRINT "Silicon is used a lot commercially in the computer industry."
 PRINT "Motherboards, disks, and more have some silicon in them."
 PRINT "Most households have at least one computer. Silicon is"
 PRINT "obviously very important. As far as I know, there aren't"
 PRINT "very many, if any at all, medical or nutritional uses for"
 PRINT "silicon. It's main use is in computers."
 PRINT : INPUT "Return to main menu? (Press Enter)", back$
END SUB

