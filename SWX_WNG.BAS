 ' "Star Wars: X-Wing: Rogue Squadron" -by Courtney A. Ficker
 ' Copyright 1997 Kowakian Software

        'Here's the DECLARE statements...
 DECLARE SUB Alderaan ()      'A place to raise your skills
 DECLARE SUB AstromechBeep () 'Produces a random sequence of beeps
 DECLARE SUB BayCalc ()       'Calculates a random landing bay
 DECLARE SUB Bespin ()        'Just a fun planet
 DECLARE SUB CalcLuck ()      'Calculates luck. Very important
 DECLARE SUB Center ()        'Centers sentences on the screen
 DECLARE SUB charchoose ()    'Where the player chooses their character
 DECLARE SUB CharCorran ()    'The stats for Corran Horn
 DECLARE SUB CharDllr ()      'The stats for Dllr Nep
 DECLARE SUB CharHobbie ()    'The stats for Derek "Hobbie" Klivan
 DECLARE SUB CharPlourr ()    'The stats for Plourr Isoplourrdacartha (Ilo)
 DECLARE SUB CharTycho ()     'The stats for Tycho Celchu
 DECLARE SUB CharWedge ()     'The stats for Wedge Antilles
 DECLARE SUB CharWes ()       'The stats for Wes Janson
 DECLARE SUB clearlist ()     'Clears the list1= "...", etc.
 DECLARE SUB continue ()      'Just pauses the game until a key is pressed
 DECLARE SUB cor.menu ()      'The menu for the Cantina on Coruscant
 DECLARE SUB cor.cantina ()   'The cantina on Coruscant
 DECLARE SUB CorPrep ()       'Just tells the player's bay # and stuff
 DECLARE SUB Coruscant ()     'Planet where the player gets his/her mission
 DECLARE SUB Dagobah ()       'A planet with hardly anything to do
 DECLARE SUB death ()         'Informs the player of their untimely demise
 DECLARE SUB distances ()     'Just for use with HYPERSPACE. Pay it no mind.
 DECLARE SUB endingcredits () 'The ending credits (Duh!)
 DECLARE SUB Endor ()         'This planet has hardly anything to do on it
 DECLARE SUB endprog ()       'Shows a multi-color "The End"
 DECLARE SUB ErrorMessage ()  'Informs the player that their choice is invalid
 DECLARE SUB Explode ()       'A nifty little explosion
 DECLARE SUB Hoth ()          'Hardly anything to do here, too
 DECLARE SUB hyper ()         'An OK representation of hyperspace
 DECLARE SUB hyperspace ()    'Lets the player travel to other planets
 DECLARE SUB Invntry ()       'Shows what the character is carrying
 DECLARE SUB Kashyyyk ()      'A cool planet, but pointless
 DECLARE SUB Kessel ()        'A great adventure planet
 DECLARE SUB Kowak ()         'Home of the Kowakian Monkey-Lizard of Destiny!
 DECLARE SUB ListOptions ()   'Lists possible actions
 DECLARE SUB maxgnnry ()      'Tells a player that they've maxed out this skill
 DECLARE SUB maxpilot ()      'Tells a player that they've maxed out this skill
 DECLARE SUB NumToLet ()      'Converts a number from 1-26 to a letter
 DECLARE SUB PlanetCalc ()    'Calulates a random starting planet
 DECLARE SUB secretplanet ()  'Here's a secret planet, just for fun
 DECLARE SUB skywlkranch ()   'Yet another secret planet!
 DECLARE SUB SparklePause ()  'Makes moving border
 DECLARE SUB Tatooine ()      'A fun planet
 DECLARE SUB YavinIV ()       'An OK planet
         
         'Here's the DIM Commands...
 DIM SHARED list1 AS STRING
 DIM SHARED list2 AS STRING
 DIM SHARED list3 AS STRING
 DIM SHARED list4 AS STRING
 DIM SHARED list5 AS STRING
 DIM SHARED list6 AS STRING
 DIM SHARED list7 AS STRING
 DIM SHARED list8 AS STRING
 DIM SHARED list9 AS STRING
 DIM SHARED list10 AS STRING
 DIM SHARED w1 AS STRING
 DIM SHARED w2 AS STRING
 DIM SHARED e1 AS STRING
 DIM SHARED e2 AS STRING
 DIM SHARED centertext AS STRING
 DIM SHARED row AS INTEGER
 DIM SHARED fullname AS STRING
 DIM SHARED creds AS INTEGER
 DIM SHARED bay AS INTEGER
 DIM SHARED luck AS INTEGER
 DIM SHARED pilot AS INTEGER
 DIM SHARED fists AS INTEGER
 DIM SHARED melee AS INTEGER
 DIM SHARED blstr AS INTEGER
 DIM SHARED gnnry AS INTEGER
 DIM SHARED snd AS STRING
 DIM SHARED anotherchance AS STRING
 DIM SHARED genderpolite AS STRING
 DIM SHARED mad AS INTEGER
 DIM SHARED num AS INTEGER
 DIM SHARED letter AS STRING
 DIM SHARED currentplanet AS STRING
 DIM SHARED nextparsec AS INTEGER
 DIM SHARED curparsec AS INTEGER
 DIM SHARED distance AS INTEGER

 CONST band$ = "MFo3L8EEF+GEEF+GEEF+GL4E"
 CONST swthm$ = "MBo3L3C.GL9FED>L3C<GL9FED>L3C<GL9FEFL3D"
 CONST dead$ = "MBo2L2AAAL3F>L6C<L2AL3F>L6C<L2A"
 CONST kmlod2$ = "MBo4L8G+GL5FL8FL3FL9DFFDL5FDL9CCCCCDL5EFL8DL3F"
 CONST lsrfire$ = "MFo4L9GGGGGG"
 CONST tootfizzz$ = "MBo2L3C"
 CONST MaxCol = 78
         'These are other miscellaneous statements...
strt:
 anotherchance = ""
 clearlist
 CLS
 COLOR 15
 RANDOMIZE TIMER
        'This is the music and the bay and credit calculations
credcalc:
 creds = INT(RND * 500) + 1
 IF creds < 100 THEN GOTO credcalc:
 
        'Here's the intro to the program:
restrt:
 INPUT "Do you want sound?(Y/N)"; snd
 CLS
 snd = UCASE$(snd)
 IF snd = "Y" THEN GOTO intro:
 IF snd = "N" THEN GOTO intro:
 ErrorMessage
 GOTO restrt:
intro:
 COLOR 4
 centertext = "Welcome to Star Wars: X-wing: Rogue Squadron!"
 row = 5
 Center
 COLOR 15
 IF snd = "N" THEN GOTO nomusic:
 IF snd = "Y" THEN GOTO strtmusic:
strtmusic:
 PLAY swthm$
 SLEEP 8
nomusic:
 centertext = "For instructions, type `QUIT' at the next prompt, exit QBasic, and"
 row = 9
 Center
 centertext = "type `read' at the directory C:\KOWAK."
 row = 11
 Center
 PRINT
 SparklePause
 IF strt$ = "QUIT" THEN endingcredits
 CLS
 ending = 1
         'Here's where they choose their character...
 charchoose
 
         'Here's the calculations for the random starting planet...
 PlanetCalc
 
 IF anotherchance$ = "Y" THEN GOTO strt:
 END   'SWX_WNG.BAS

DEFINT A-Z
SUB Alderaan
 currentplanet = "ALDERAAN"
 CLS
 PRINT "You're name is "; fullname$; "."
 PRINT "You are now where Alderaan was SUPPOSED to be!"
 PRINT "There's nothing here but some small asteroids and micrometeors!"
a.whattodo:
 clearlist
 list1 = "SHOOT (the asteroids)"
 list2 = "FLY (in your X-Wing)"
 list3 = "(Enter) HYPERSPACE"
 INPUT "What do you want to do?", a.what$
 a.what$ = UCASE$(a.what$)
 IF a.what$ = "FLY" THEN GOTO a.fly:
 IF a.what$ = "SHOOT" THEN GOTO a.shoot:
 IF a.what$ = "HYPERSPACE" THEN hyperspace
 ListOptions
 GOTO a.whattodo:
 
a.fly:
 CLS
 CalcLuck
 PRINT "You decide to practice your flying skills."
 PRINT "Your R-2 Unit warbles."
 AstromechBeep
 SLEEP 1
 PRINT "You fly around, dodging asteroids...."
flymin:
 alderaancrash = INT(RND * 12) + 1
 IF alderaancrash <= 11 THEN GOTO flymin:
 SLEEP 1
 IF pilot + luck <= alderaancrash THEN
  Explode
  death
 END IF
 IF anotherchance = "Y" THEN EXIT SUB
 pilot = pilot + 1
 SLEEP 3
 PRINT "You've successfully made it through!"
 IF pilot > 10 THEN pilot = 10: maxpilot
 GOTO a.whattodo:
 
a.shoot:
 CLS
 PRINT "You decide to do some target practicing. "
a.whichcourse:
 clearlist
 list1 = "THROUGH (the asteroids)"
 list2 = "(On a) SAFE (course)"
 list3 = "CANCEL"
 INPUT "Where do you want to fly?", a.shootcourse$
 a.shootcourse$ = UCASE$(a.shootcourse$)
 IF a.shootcourse$ = "THROUGH" THEN GOTO shootthrough:
 IF a.shootcourse$ = "SAFE" THEN GOTO shootsafe:
 IF a.shootcourse$ = "CANCEL" THEN GOTO a.whattodo:
 ListOptions
 GOTO a.whichcourse:
         'Here's if they choose to fly safely AROUND the asteroids
         'while practicing...
shootsafe:
 CLS
 PRINT "You decide to take a safe course."
 PRINT "You fire again and again, hitting many asteroids."
 PRINT "It's pretty boring though..."
 SLEEP 1
 GOTO a.whattodo:
 
         'Here's if they choose to fly THROUGH the asteroids
         'while practicing...
 
shootthrough:
 CLS
 PRINT "You decide to go directly through the asteroids."
 SLEEP 2
 PRINT ""; CHR$(34); "Set 2-7-1"; CHR$(34); " you mutter to yourself."
 SLEEP 2
 PRINT "Your R-2 unit beeps in alarm."
 AstromechBeep
 SLEEP 2
 PRINT ""; CHR$(34); "Don't worry"; CHR$(34); " you say."
 SLEEP 1
 PRINT ""; CHR$(34); "I know what I'm doing."; CHR$(34); ""
 SLEEP 2
 PRINT "You hit the accelerator."
 SLEEP 2
 PRINT "You twist and dive and fly with your best efforts..."
 SLEEP 1
shootthroughmin:
 alderaancrash = INT(RND * 20) + 1
 IF alderaancrash <= 18 THEN GOTO shootthroughmin:
 CalcLuck
 IF pilot + gnnry + luck <= alderaancrash THEN
 Explode
 death
 IF anotherchance = "Y" THEN EXIT SUB
 END IF
 SLEEP 2
 
 pilot = pilot + 1
 gnnry = gnnry + 1
 PRINT "You've successfully made it through!"
 SLEEP 4
 IF pilot > 10 THEN pilot = 10: maxpilot
 IF gnnry > 10 THEN gnnry = 10: maxgnnry
 GOTO a.whattodo:
 
 END SUB

SUB AstromechBeep
 IF snd = "N" THEN GOTO nobeep:
  FOR BeepNote = 1 TO 8
   Note = INT(RND * 56) + 1
   PLAY "L18"
   PLAY "N" + STR$(Note)
   NEXT BeepNote
nobeep:
END SUB

DEFSNG A-Z
SUB BayCalc
 bay = INT(RND * 99) + 1
END SUB

DEFINT A-Z
SUB Bespin
 currentplanet = "BESPIN"
END SUB

SUB CalcLuck
 luck = INT(RND * 5) + 1
END SUB

SUB Center
 Col = MaxCol \ 2
 LOCATE row, Col - (LEN(centertext$) / 2 + .5)
 PRINT centertext$
 COLOR 15
END SUB

SUB charchoose
 CLS
charinput:
 clearlist
 list1 = "TYCHO (Celchu)"
 list2 = "WEDGE (Antilles)"
 list3 = "CORRAN (Horn)"
 list4 = "DLLR (Nep)"
 list5 = "WES (Janson)"
 list6 = "PLOURR (Ilo)"
 list7 = "HOBBIE (Klivan)"
 list8 = ""
 list9 = ""
 list10 = ""


 PRINT "Please choose your character: 께께께께께�"
 LOCATE 1, 31
 INPUT plyr$
 plyr$ = UCASE$(plyr$)
 IF plyr$ = "QUIT" THEN endprog
 IF plyr$ = "WEDGE" THEN
  CharWedge
  GOTO pasterror:
 END IF
 IF plyr$ = "TYCHO" THEN
  CharTycho
  GOTO pasterror:
 END IF
 IF plyr$ = "CORRAN" THEN
  CharCorran
  GOTO pasterror:
 END IF
 IF plyr$ = "DLLR" THEN
  CharDllr
  GOTO pasterror:
 END IF
 IF plyr$ = "WES" THEN
  CharWes
  GOTO pasterror:
 END IF
 IF plyr$ = "PLOURR" THEN
  CharPlourr
  GOTO pasterror:
 END IF
 IF plyr$ = "HOBBIE" THEN
  CharHobbie
  GOTO pasterror:
 END IF
 
 ListOptions    'This is if they didn't enter something in right...
 
 GOTO charinput:
 
pasterror:
 END SUB

DEFSNG A-Z
SUB CharCorran
                'Here's the stats for Corran Horn...

 fullname = "Corran Horn"
 firstname$ = "Corran"
 genderpolite = "Sir"
 formal$ = "suit"
 
 w1 = "A blaster"
 blstr = 7
 melee = 4
 fists = 8
 pilot = 8
 gnnry = 8
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""
END SUB

SUB CharDllr
                'Here's the stats for Dllr Nep...

 fullname = "Dllr Nep"
 firstname$ = "Dllr"
 genderpolite = "Sir"
 formal$ = "suit"
 w1 = "A blaster"
 
 blstr = 5
 fists = 9
 melee = 7
 pilot = 6
 gnnry = 10
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""
END SUB

SUB CharHobbie

 fullname = "Derek `Hobbie' Klivan"
 firstname$ = "Hobbie"
 genderpolite = "Sir"
 formal$ = "suit"
 w1 = "A blaster"

 blstr = 8
 fists = 7
 melee = 6
 pilot = 9
 gnnry = 7
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""
END SUB

SUB CharPlourr

 fullname = "Plourr Ilo"
 firstname$ = "Plourr"
 genderpolite = "Ma'am"
 formal$ = "dress"
 w1 = "A blaster"

 blstr = 6
 fists = 10
 melee = 6
 pilot = 8
 gnnry = 8
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""
END SUB

SUB CharTycho
                'Here's the stats for Tycho Celchu...

 fullname = "Tycho Celchu"
 firstname$ = "Tycho"
 genderpolite = "Sir"
 formal$ = "suit"
 w1 = "A blaster"
 
 blstr = 6
 melee = 4
 fists = 8
 pilot = 8
 gnnry = 8
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""

END SUB

DEFINT A-Z
SUB CharWedge

 fullname = "Wedge Antilles"
 firstname$ = "Wedge"
 genderpolite = "Sir"
 formal$ = "suit"
 w1 = "A blaster"

 blstr = 6          'From 1 to 10
 melee = 4          'From 1 to 10
 fists = 5          'From 1 to 10
 pilot = 9          'From 1 to 10
 gnnry = 7          'From 1 to 10
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""

END SUB

DEFSNG A-Z
SUB CharWes

 fullname = "Wes Janson"
 firstname$ = "Wes"
 genderpolite = "Sir"
 formal$ = "suit"
 w1 = "A blaster"
 
 blstr = 5       'From 1 to 10
 melee = 7       'From 1 to 10
 fists = 6       'From 1 to 10
 pilot = 8       'From 1 to 10
 gnnry = 8
 droid$ = "N"
 clothe$ = "flight suit"
 moreclothe$ = ""


END SUB

SUB clearlist



 list1 = ""
 list2 = ""
 list3 = ""
 list4 = ""
 list5 = ""
 list6 = ""
 list7 = ""
 list8 = ""
 list9 = ""
 list10 = ""



END SUB

SUB continue
 INPUT "(Press Enter)", pause$
END SUB

DEFINT A-Z
SUB cor.cantina

c.cantina:
 CLS
 PRINT "You enter the cantina, called Grogmin's Cantina."
 SLEEP 2
 PRINT "You see a lot of humans and non-humans at the bar and booths."
 SLEEP 2
 PRINT "There is a band playing on the stage."
 SLEEP 1
 IF snd$ = "N" THEN GOTO nosound:
 PLAY band$
nosound:
 SLEEP 2

c.cantinasit:
 clearlist
 list1 = "(At the) BAR"
 list2 = "(At a) BOOTH"
 list3 = "(Just) LEAVE"
 INPUT "Where do you want to sit?", c.cantinasit$
 c.cantinasit$ = UCASE$(c.cantinasit$)
 IF c.cantinasit$ = "BAR" THEN GOTO c.bar:
 IF c.cantinasit$ = "BOOTH" THEN GOTO c.booth:
 IF c.cantinasit$ = "LEAVE" THEN x = 1: Coruscant
 ListOptions
 GOTO c.cantinasit:
 
c.booth:
 server$ = "droid"
 CLS
 PRINT "You take a seat at a booth."
 SLEEP 2
 PRINT "You are sitting by yourself."
 SLEEP 2
 GOTO c.CantinaWhatToDo:
 
c.bar:
 server$ = "bartender"
 CLS
 PRINT "You take a seat at the bar."
 SLEEP 2
 PRINT "You are sitting next to an Aqualish and a Duro."
 SLEEP 2
 GOTO c.CantinaWhatToDo:
 
 
c.order:
 IF c.cantinasit$ = "BAR" THEN PRINT "You tap the bartender's shoulder."
 IF c.cantinasit$ = "BOOTH" THEN PRINT "You call the waiter droid."
 SLEEP 2
 IF c.cantinasit$ = "BAR" THEN mad = mad + 1
 IF mad = 3 THEN GOTO c.bartendermad:
 IF c.cantinasit$ = "BAR" THEN PRINT ""; CHR$(34); "Whaddya want?"; CHR$(34); " he barks."
 IF c.cantinasit$ = "BOOTH" THEN PRINT ""; CHR$(34); "What will it be, sir?"; CHR$(34); " he says."
 SLEEP 2
 
cantinanswer:
 clearlist
 list1 = "ORDER (some food or a beverage)"
 list2 = "(Say) NEVERMIND"
 INPUT "What do you want to say?", c.barsay$
 c.barsay$ = UCASE$(c.barsay$)
 IF c.barsay$ = "ORDER" THEN GOTO c.cantinaorder:
 IF c.barsay$ = "NEVERMIND" THEN GOTO c.CantinaWhatToDo:
 ListOptions
 GOTO cantinanswer:

c.cantinaorder:
 PRINT "I'd like to order, please."
 SLEEP 2
reorder:
 IF c.cantinasit$ = "BAR" THEN INPUT "Whaddya want?", cantinaorder$
 IF c.cantinasit$ = "BOOTH" THEN INPUT "What will it be, sir?", cantinaorder$
 cantinaorder$ = UCASE$(cantinaorder$)
 IF cantinaorder$ = "L" THEN cor.menu
 IF cantinaorder$ = "L" THEN GOTO reorder:
 IF cantinaorder$ = "NEVERMIND" THEN SLEEP 2: GOTO c.CantinaWhatToDo:
 IF cantinaorder$ = "BANTHA" THEN order$ = "Bantha Burger": price = 15: GOTO getorder:
 IF cantinaorder$ = "L'LAHSH" THEN order$ = "L'lahsh": price = 13: GOTO getorder:
 IF cantinaorder$ = "DIANOGA" THEN order$ = "Dianoga Pie": price = 10: GOTO getorder:
 IF cantinaorder$ = "RATION" THEN order$ = "ration bar": price = 2: GOTO getorder:
 IF cantinaorder$ = "FLAMEOUT" THEN order$ = "Flameout": price = 10: GOTO getorder:
 IF cantinaorder$ = "GROG" THEN order$ = "Norvanian Grog": price = 10: GOTO getorder:
 IF cantinaorder$ = "JURI" THEN order$ = "Juri Juice": price = 8: GOTO getorder:
 IF cantinaorder$ = "ELBA" THEN order$ = "Elba Beer": price = 7: GOTO getorder:
 IF cantinaorder$ = "LOMIN" THEN order$ = "Lomin-ale": price = 5: GOTO getorder:
 IF cantinaorder$ = "BLUE" THEN order$ = "Blue Milk": price = 4: GOTO getorder:
 IF cantinaorder$ = "MINERAL" THEN order$ = "mineral water": price = 3: GOTO getorder:
 IF cantinaorder$ = "WATER" THEN order$ = "water": price = 1: GOTO getorder:
 CLS
 IF c.cantinasit$ = "BAR" THEN PRINT "We don't serve that here!"
 IF c.cantinasit$ = "BOOTH" THEN PRINT "I'm terribly sorry. We seem to be devoid of that type of consumable."
 SLEEP 2
 IF c.cantinasit$ = "BAR" THEN PRINT "Try something else!"
 IF c.cantinasit$ = "BOOTH" THEN PRINT "Perhaps you will be pleased with our other selections."
 GOTO reorder:
 


getorder:
 creds = creds - price
 IF creds < 0 THEN creds = creds + price: GOTO broke:
 IF c.cantinasit$ = "BAR" THEN pronoun$ = "him"
 IF c.cantinasit$ = "BOOTH" THEN pronoun$ = "it"
 CLS
 PRINT "The "; server$; " brings you your "; order$; "."
 SLEEP 2
 PRINT "You give "; pronoun$; " the required amount of credits."
 SLEEP 5
 PRINT "You finish your "; order$; "."
 SLEEP 2
 PRINT "Yum! Tasty!"
 SLEEP 2
 CLS
 GOTO c.CantinaWhatToDo:

broke:
 CLS
 IF c.sit$ = "BOOTH" THEN PRINT "You do not have enough money."
 IF c.sit$ = "BAR" THEN PRINT "You don't pay, you don't eat!":
 PRINT : PRINT "You can't order this."
 PRINT : continue
 


c.CantinaWhatToDo:
 clearlist
 list1 = "TALK (to someone/something)"
 list2 = "ORDER (some food or a drink)"
 list3 = "EXIT (the Cantina)"
 INPUT "What do you want to do?", cantina.what$
 cantina.what$ = UCASE$(cantina.what$)
 IF cantina.what$ = "EXIT" THEN clearlist: x = 1: Coruscant
 IF cantina.what$ = "ORDER" THEN clearlist: GOTO c.order:
 IF cantina.what$ = "TALK" THEN clearlist: GOTO c.cantinatalk:
 ListOptions
 GOTO c.CantinaWhatToDo:
 
c.bartendermad:
 CLS
 PRINT ""; CHR$(34); "That's it!"; CHR$(34); " he screams."
 SLEEP 1
 PRINT ""; CHR$(34); "You've bugged me too much!"; CHR$(34); ""
 SLEEP 2
 PRINT "He lunges at you across the counter with a vibroaxe."
 PRINT "The vibroaxe goes straight through you!"
 continue
 death
 IF anotherchance = "Y" THEN EXIT SUB
 

c.cantinatalk:
 clearlist
 list1 = "(An) AQUALISH"
 list2 = "(A) DUROS"
 list3 = "(A) JAWA"
 list4 = "(A) BITH"
 list5 = "(An) ORTOLAN"
talkwho:
 CLS
 INPUT "Who do you want to talk to?", c.CantinaWho$
 c.CantinaWho$ = UCASE$(c.CantinaWho$)
 IF c.CantinaWho$ = "AQUALISH" THEN GOTO c.CantAqua:
 IF c.CantinaWho$ = "DUROS" THEN GOTO c.CantDuros:
 IF c.CantinaWho$ = "JAWA" THEN GOTO c.CantJawa:
 IF c.CantinaWho$ = "BITH" THEN GOTO c.CantBith:
 IF c.CantinaWho$ = "ORTOLAN" THEN GOTO c.cantOrto:
 ListOptions
 GOTO talkwho:

c.CantJawa:
 CLS
 PRINT "You go over to the little Jawa."
 SLEEP 2
 PRINT "Hello.";
 SLEEP 1
 PRINT " you say."
 SLEEP 2
 PRINT "The Jawa jabbers at you in his native tongue."
 SLEEP 1
 PRINT "You can make out a little bit, something like"
 SLEEP 1
 PRINT ""; CHR$(34); "stranded"; CHR$(34); ",";
 SLEEP 1
 PRINT ""; CHR$(34); "get back"; CHR$(34); ",";
 SLEEP 1
 PRINT ""; CHR$(34); "Tatooine"; CHR$(34); ",";
 SLEEP 1
 PRINT ""; CHR$(34); "Het Nkik"; CHR$(34); "..."
 SLEEP 2
 PRINT "Oh well. Maybe it'll find its way to Tatooine."
 continue
 GOTO c.CantinaWhatToDo:

c.CantBith:
 CLS
 PRINT "You walk up to a Bith, who is playing a song on his fizzz."
 IF snd = "N" THEN GOTO noBithplay:
 PLAY band$
noBithplay:
 PRINT "He turns to you."
 SLEEP 1
 PRINT ""; CHR$(34); "Yes?"; CHR$(34); " he asks."
 SLEEP 2
saybith:
 clearlist
 list1 = "(What is your) NAME"
 list2 = "(Can I) TRY (your fizzz)"
 list3 = "NEVERMIND"
 INPUT "What do you want to say?", c.sayBith$
 c.sayBith$ = UCASE$(c.sayBith$)
 IF c.sayBith$ = "NAME" THEN
  PRINT ""; CHR$(34); "My name is Eatch Gro'ots"; CHR$(34); " he says."
  PRINT "He asks: "; CHR$(34); "What's yours?"; CHR$(34); ""
  SLEEP 1
  PRINT ""; CHR$(34); ""; fullname$; ""; CHR$(34); " you tell him."
  PRINT ""; CHR$(34); "Anything else?"; CHR$(34); " he asks."
  GOTO saybith:
 END IF
 IF c.sayBith$ = "TRY" THEN
  PRINT ""; CHR$(34); "Sure you can!"; CHR$(34); ""
  PRINT ""; CHR$(34); "Here you go."; CHR$(34); ""
  SLEEP 1
  PRINT "You blow on it."
  IF snd = "N" THEN GOTO notoot:
  PLAY tootfizzz$
  SLEEP 1
notoot:
  PRINT "That was fun, except for the drool."
  PRINT ""; CHR$(34); "Anything else?"; CHR$(34); ""
  GOTO saybith:
 END IF
 IF c.sayBith$ = "NEVERMIND" THEN
  PRINT ""; CHR$(34); "Very well."; CHR$(34); " he says."
  GOTO c.CantinaWhatToDo:
 END IF
 ListOptions
 GOTO saybith:
 
c.cantOrto:
 CLS
 clearlist
 PRINT "You walk over to the Ortolan's booth."
 SLEEP 1
 PRINT "He looks at you."
 SLEEP 1
 PRINT ""; CHR$(34); "Yes?"; CHR$(34); " he asks."
Orto:
 clearlist
 list1 = "(What is your) NAME?"
 list2 = "WHERE (do you come from?)"
 list3 = "CANCEL"
 INPUT "What do you want to say?", sayOrto$
 sayOrto$ = UCASE$(sayOrto$)
 IF sayOrto$ = "NAME" THEN
  PRINT ""; CHR$(34); "My name is my own business. Why don't you go bug someone else?"; CHR$(34); " he says."
 GOTO Orto
 END IF
 IF sayOrto$ = "WHERE" THEN
  PRINT ""; CHR$(34); "Go away."; CHR$(34); ""
  GOTO Orto:
 END IF
 IF sayOrto$ = "CANCEL" THEN CLS : GOTO c.CantinaWhatToDo:
 ListOptions
 GOTO Orto:
 
c.CantDuros:
 CLS
 IF sit$ = "BAR" THEN
  PRINT "You turn to the Duros."
 END IF
 IF sit$ = "BOOTH" THEN
  PRINT "You walk up to the Duros."
 END IF
 PRINT ""; CHR$(34); "Hi there"; CHR$(34); " you say."
 PRINT "He simply ignores you."
 GOTO c.CantinaWhatToDo:
 
c.CantAqua:
 CLS
 IF sit$ = "BOOTH" THEN
  PRINT "You go up to the Aqualish, who is sitting at the bar."
 END IF
 IF sit$ = "BAR" THEN
  PRINT "You turn to the Aqualish."
 END IF
 PRINT ""; CHR$(34); "Hello"; CHR$(34); " you say."
 PRINT "He just ignores you."
 aquamad = aquamad + 1
 SLEEP 1
 IF aquamad = 3 THEN GOTO Aqualishmad:
 IF sit$ = "BOOTH" THEN PRINT "You walk back to the booth.": GOTO c.CantinaWhatToDo
 IF sit$ = "BAR" THEN PRINT "You turn back around.": GOTO c.CantinaWhatToDo:
Aqualishmad:
 CLS
 PRINT "He turns to you."
 SLEEP 1
 PRINT ""; CHR$(34); "Shut up or I'll shut you up!"; CHR$(34); " he yells, standing up."
 SLEEP 1
 PRINT "You stand up."
 SLEEP 1
 PRINT ""; CHR$(34); "I'd like to see you try"; CHR$(34); " you retort."
 SLEEP 1
 PRINT ""; CHR$(34); "Alright, I'll give it my best shot!"; CHR$(34); ""
 SLEEP 1
 PRINT "He pulls out a blaster, and fires it into your face."
 PRINT "you die instantly."
 SLEEP 2
 death
 IF anotherchance = "Y" THEN EXIT SUB
 
 
 
 



END SUB

DEFSNG A-Z
SUB cor.menu
 CLS
 COLOR 15
 PRINT "Here is the menu:"
 PRINT : PRINT
 PRINT "FOOD:"
 PRINT "BANTHA Burgers                    15 credits"
 PRINT "L'LAHSH                           13 credits"
 PRINT "DIANOGA Pie                       10 credits"
 PRINT "RATION Bar                        2 credits"
 PRINT
 PRINT "BEVERAGES:"
 PRINT "FLAMEOUT                          10 credits"
 PRINT "Norvanian GROG                    10 credits"
 PRINT "JURI Juice                        8 credits"
 PRINT "ELBA Beer                         7 credits"
 PRINT "LOMIN-ale                         5 credits"
 PRINT "BLUE Milk                         4 credits"
 PRINT "MINERAL Water                     3 credits"
 PRINT "WATER                             1 credit"
 continue
END SUB

SUB CorPrep
 BayCalc
 PRINT "Your name is "; fullname; ". You have"; creds; "credits."
 PRINT "Your X-Wing is docked at Docking Bay"; bay; "on Coruscant."

END SUB

DEFINT A-Z
SUB Coruscant
 currentplanet = "CORUSCANT"
 IF x = 1 THEN GOTO cor.market:
 CLS
 CorPrep


StandOutsideBay:
 PRINT "You're standing outside the bay."

OutsideBay.cor:
 clearlist
 list1 = "(Go to the) MARKET"
 list2 = "FLY (In your X-Wing)"
 INPUT "What do you want to do"; ob.cor$
 ob.cor$ = UCASE$(ob.cor$)
 IF ob.cor$ = "MARKET" THEN GOTO cor.market:
 IF ob.cor$ = "FLY" THEN GOTO cor.takeoff:
 IF ob.cor$ = "I" THEN Invntry
 IF ob.cor$ = "I" THEN GOTO OutsideBay.cor
 ListOptions
 CLS : GOTO OutsideBay.cor
        
        
 
 
cor.market:
 IF x = 1 THEN x = 0
 CLS
 PRINT "You are standing in the market on Coruscant. There are"
 PRINT "many different people and aliens walking around."
 PRINT "You can see some stores and a Cantina."
 
 
 
market:
 clearlist
 list1 = "(Go to the) CANTINA"
 list2 = "(Go to the Docking) BAY"
 list3 = "(Go) SHOP(ping)"
 list4 = "(Go to the) MAIN (building)"
 list5 = "TALK (to someone)"
 INPUT "What do you want to do"; c.mrktdo$
 c.mrktdo$ = UCASE$(c.mrktdo$)
 IF c.mrktdo$ = "CANTINA" THEN cor.cantina
 IF c.mrktdo$ = "BAY" THEN GOTO StandOutsideBay:
 IF c.mrktdo$ = "I" THEN Invntry
 IF c.mrktdo$ = "I" THEN GOTO market:
 IF c.mrktdo$ = "SHOP" THEN GOTO c.shop:         'NOT READY!
 'IF c.mrktdo$ = "MAIN" THEN GOTO cor.main:  '***NOT READY!***
 IF c.mrktdo$ = "TALK" THEN GOTO c.mkt.talk:
 ListOptions
 GOTO market:
 
 
 
 
cor.takeoff:
 CLS
 PRINT "You get in your X-Wing. "
 SLEEP 2
 PRINT "You run the flight systems checks and you ";
 PRINT "strap yourself in. "
 SLEEP 2
 PRINT "You then start the X-Wing. "
 SLEEP 2
 PRINT "Your R2 Unit warbles, ";
 AstromechBeep
 SLEEP 2
 PRINT "clearing your flight with Flight Control."
 SLEEP 2
 PRINT "Soon, you're in orbit around Coruscant. "
 continue
 
takeofflist:
 clearlist
 list1 = "(Enter) HYPERSPACE"
 list2 = "SHOOT (Your Proton Torpedoes)"
 list3 = "FIRE (Your lasers)"
 list4 = "LAND (on Coruscant)"
 INPUT "What do you want to do?", cor.space$
 cor.space$ = UCASE$(cor.space$)
 IF cor.space$ = "HYPERSPACE" THEN hyperspace
 IF cor.space$ = "SHOOT" THEN GOTO cor.shoot:
 IF cor.space$ = "FIRE" THEN GOTO cor.fire:
 IF cor.space$ = "LAND" THEN CorPrep
 ListOptions
 GOTO takeofflist:
 
cor.fire:
 PRINT "You fire your lasers."
 IF snd = "N" THEN GOTO nofire:
 PLAY lsrfire$
nofire:
 PRINT "You almost hit a Coruscant Security Cruiser!"
 SLEEP 2
 PRINT "It fires a Proton Torpedo at you!"
 PRINT "You try to dodge it, but then-"
 SLEEP 1
 Explode
 death
 IF anotherchance = "Y" THEN EXIT SUB

cor.shoot:
 CLS
 PRINT "You shoot two Proton Torpedoes!"
 PRINT "You hit a passenger Cruise Vessel, destroying it!"
 PRINT "You are pulled by a tractor beam into a large"
 PRINT "cruiser, and undergo tremendous torture. You"
 PRINT "tell the location of the Rebel Base before they kill you."
 continue
 death
 IF anotherchance = "Y" THEN EXIT SUB
 
 
 
 
 
c.mkt.talk:
 clearlist
 list1 = "(A) SINITEEN"
 list2 = "(An) ITHORIAN"
 list3 = "(A) KOWAKIAN (Monkey-lizard)"
 CLS
 PRINT "You decide to talk to someone."
 INPUT "Who do you want to talk to?", c.whotalk$
 c.whotalk$ = UCASE$(c.whotalk$)
 IF c.whotalk$ = "SINITEEN" THEN GOTO siniteentlk:
 IF c.whotalk$ = "ITHORIAN" THEN GOTO ithoriantlk:
 IF c.whotalk$ = "KOWAKIAN" THEN GOTO monkeytalk:
 IF c.whotalk$ = "CANCEL" THEN GOTO cor.market:
 ListOptions
 GOTO c.mkt.talk:
 
 
siniteentlk:
 CLS
 PRINT "You approach the Siniteen."
 SLEEP 2
 PRINT ""; CHR$(34); "Hello, "; fullname$; ""; CHR$(34); " he says."
 SLEEP 2
 PRINT "(How did he know your name?)"
 SLEEP 2
 PRINT ""; CHR$(34); "Hello"; CHR$(34); " you reply."
 SLEEP 2
 PRINT ""; CHR$(34); "What do you inquire of me?"; CHR$(34); ""
 clearlist
 list1 = "HYPERSPACE (coordinates)"
 list2 = "WHAT (is the ratio of a circle's cicumference to it's diameter)"
 list3 = "NEVERMIND"
 SLEEP 2
 
siniteenask:
 INPUT "What do you want to ask?", ask.siniteen$
 ask.siniteen$ = UCASE$(ask.siniteen$)
 IF ask.siniteen$ = "HYPERSPACE" THEN GOTO s.answer.hyprspc:
 IF ask.siniteen$ = "WHAT" THEN GOTO siniteenpi:
 IF ask.siniteen$ = "NEVERMIND" THEN PRINT "Very well.": GOTO market:
 ListOptions
 GOTO siniteenask:
 
s.answer.hyprspc:
 CLS
redo:
 INPUT "Which planet do you wish to know the coordinates of?", siniteencoord$
 siniteencoord$ = UCASE$(siniteencoord$)
 IF siniteencoord$ = "ALDERAAN" THEN s.answer$ = "ALN.114": GOTO coranswer:
 IF siniteencoord$ = "BESPIN" THEN s.answer$ = "BEN.214": GOTO coranswer:
 IF siniteencoord$ = "CORUSCANT" THEN s.answer$ = "COT.320": GOTO coranswer:
 IF siniteencoord$ = "DAGOBAH" THEN s.answer$ = "DAH.408": GOTO coranswer:
 IF siniteencoord$ = "ENDOR" THEN s.answer$ = "ENR.518": GOTO coranswer:
 IF siniteencoord$ = "HOTH" THEN s.answer$ = "HOH.808": GOTO coranswer:
 IF siniteencoord$ = "KASHYYYK" THEN s.answer$ = "KAK.125": GOTO coranswer:
 IF siniteencoord$ = "KESSEL" THEN s.answer$ = "KEL.112": GOTO coranswer:
 IF siniteencoord$ = "KOWAK" THEN s.answer$ = "KOK.111": GOTO coranswer:
 IF siniteencoord$ = "SAL" THEN s.answer$ = "QVQ.840": GOTO coranswer:
 IF siniteencoord$ = "TATOOINE" THEN s.answer$ = "TAE.205": GOTO coranswer:
 IF siniteencoord$ = "YAVIN IV" THEN s.answer$ = "YAN.M4": GOTO coranswer:
 CLS
 IF siniteencoord$ = "" THEN GOTO nocool:
 siniteencoord$ = UCASE$(LEFT$(siniteencoord$, 1)) + LCASE$(RIGHT$(siniteencoord$, (LEN(siniteencoord$) - 1)))
 PRINT "I am unsure of the coordinates for the planet "; siniteencoord$; "."
 PRINT "Perhaps you are mistaken of the correct name."
 siniteencoord$ = UCASE$(siniteencoord$)
 SLEEP 2
nocool:
 GOTO redo:
 
coranswer:
 CLS
 PRINT "The coordinates you seek are "; s.answer$; "."
 SLEEP 2
 PRINT "Farewell, and may the Force be with you on your quest."
 SLEEP 2
 PRINT "You thank him, and leave."
 SLEEP 3
 GOTO cor.market:
 
siniteenpi:
 CLS
 PRINT ""; CHR$(34); "The ratio of a circle's diameter to it's circumference"
 PRINT "is approximately 3.14159265358979323846264338327950288..."; CHR$(34); ""
 PRINT "He continues to say more, but you get tired and drop off to sleep."
 SLEEP 1
 PRINT "Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z-Z"
 SLEEP 3
 PRINT ""; CHR$(34); "...4442031320719622936376777261. Actually, there's"
 PRINT "more. Hmmm. Let me think. Probably about ...1775654995."; CHR$(34); ""
 PRINT ""; CHR$(34); "."
 SLEEP 10
 GOTO siniteenask:
 
 
 
ithoriantlk:
 CLS
 PRINT "You approach the Ithorian."
 SLEEP 2
 PRINT ""; CHR$(34); "Can I help you?"; CHR$(34); " he asks."
 SLEEP 2
 PRINT ""; CHR$(34); "Yes you can."; CHR$(34); " you say."
 SLEEP 2
ithorian:
 PRINT "(What do you want to ask?)"
 PRINT "WHAT (is your name?)"
 PRINT "WHERE (can I find Leia Organa Skywalker-Solo?)"
 PRINT "(I) MUST (be going now)"
 INPUT askithorian$
 askithorian$ = UCASE$(askithorian$)
 IF askithorian$ = "WHAT" THEN
  CLS
  PRINT "My name is Leefrae Nadon."
  SLEEP 2
  PRINT "Perhaps you have heard of my brother, Momaw."
  SLEEP 2
  GOSUB ithormore:
 END IF
 IF askithorian$ = "WHERE" THEN
  CLS
  PRINT "You can find the Chief-of-State in the Main building on the top floor."
  SLEEP 2
  GOSUB ithormore:
 END IF
 IF askithorian$ = "MUST" THEN
  CLS
  PRINT ""; CHR$(34); "Very well."; CHR$(34); ""
  SLEEP 1
  PRINT "He turns away."
  SLEEP 2
  GOTO cor.market
 END IF
 CLS
 PRINT "Yes or no will do, "; genderpolite; "."
 continue
 GOTO ithorian:
 
ithormore:
 INPUT "Anything else?", ithorianmore$
 ithorianmore$ = UCASE$(ithorianmore$)
 IF LEFT$(ithorianmore$, 1) = "Y" THEN GOTO ithorian:
 IF LEFT$(ithorianmore$, 1) = "N" THEN GOTO cor.market:
 RETURN
 
 
 
 
monkeytalk:
 CLS
 PRINT "You walk up to the Monkey-lizard."
 PRINT ""; CHR$(34); "Hello"; CHR$(34); " you say."
 SLEEP 2
 PRINT ""; CHR$(34); "Hello! ";
 SLEEP 1
 PRINT "Hello! ";
 SLEEP 1
 PRINT "Hahahahahaaa!"; CHR$(34); ""
 SLEEP 2
 PRINT "You decide that talking to him won't help you very much."
 SLEEP 3
 GOTO cor.market:
 
 
 
 
 

c.shop:
 CLS
 clearlist
 list1 = "(A) DROID (store)"
 list2 = "(A) WEAPONS (store)"
 list3 = "(A) CLOTHING (store)"
 INPUT "Where do you want to shop at?", c.shopwhere$
 c.shopwhere$ = UCASE$(c.shopwhere$)
 IF c.shopwhere$ = "DROID" THEN clearlist: GOTO c.shopdroid:
 'IF c.shopwhere$ = "WEAPONS" THEN clearlist:GOTO c.shopweapon:    'FIX THIS!
 IF c.shopwhere$ = "CLOTHING" THEN clearlist: GOTO c.shopclothes: 'FIXING THIS
 ListOptions
 GOTO c.shop:
 
c.shopdroid:
 clearlist
 list1 = "(I'm just) BROWSING"
 list2 = "(I'd like to) BUY (a droid)"
 CLS
 PRINT "You walk over to the droid store."
 SLEEP 2
 PRINT "An alien salesman (saleswoman? salesthing?) of a species"
 PRINT "you've never seen before approaches."
 SLEEP 2
 PRINT "Good day, "; genderpolite$; "."
answer:
 INPUT "How can I help you?", c.droidwhat$
 c.droidwhat$ = UCASE$(c.droidwhat$)
 IF c.droidwhat$ = "BROWSING" THEN clearlist: GOTO c.droidbrowse:
 IF c.droidwhat$ = "BUY" THEN clearlist: GOTO c.droidbuy:
 ListOptions
 GOTO answer:
 
c.droidbrowse:
 CLS
 PRINT "Just browsing, thanks."
 SLEEP 1
 PRINT "Of course."
 SLEEP 1
 PRINT "You look around."
 SLEEP 2
 PRINT "You see many different types of droids.": SLEEP 1
 PRINT "There are R units: 1, 2, 3, and 4.": SLEEP 1
 PRINT "There are 3PO units and a K-4 security droid.": SLEEP 1
 PRINT "There's a DeepSpace 9G explorer droid, and many others."
 COLOR 5: SLEEP 2
 PRINT "(NOTE: "; CHR$(34); "Your"; CHR$(34); " R-2 unit aboard your X-Wing isn't really yours,"
 PRINT "  it's the New Republic's)"
 COLOR 15: SLEEP 3
 PRINT "You then exit the shop."
 GOTO cor.market:
 
c.droidbuy:
 clearlist
 list1 = "(An) R (Unit)"
 list2 = "(A) 3PO (Unit)"
 CLS
 PRINT "I want to buy a droid."
 SLEEP 2
 PRINT "Certainly, ", genderpolite$; "."
c.whattype:
 INPUT "Which type?", c.droidtype$
 c.droidtype$ = UCASE$(c.droidtype$)
 IF c.droidtype$ = "R" THEN clearlist: GOTO c.rbuy:                'Not ready!
 IF c.droidtype$ = "3PO" THEN clearlist: GOTO c.3PObuy:
 ListOptions
 GOTO c.whattype:
 
c.3PObuy:
 cost = 1000
 clearlist
 list1 = "Y(es)"
 list2 = "N(o)"
 CLS
 NumToLet
 PRINT ""; CHR$(34); "Yes, "; genderpolite$; "."; CHR$(34); ""
 SLEEP 2
 PRINT ""; CHR$(34); "Here is a great one. It is ", letter; "-3PO."; CHR$(34); ""
buy3po:
 INPUT "It is 1000 credits. Do you want to buy it?", c.wanttoby$
 c.wanttobuy$ = UCASE$(c.wanttobuy$)
 IF c.wanttobuy$ = "Y" THEN credits = credits - cost
 IF credits < 0 THEN
  PRINT "I'm sorry, you don't have enough money."
  credits = credits + cost
  END IF
 IF c.wanttobuy$ = "N" THEN
  PRINT "Very well."
  PRINT "He\she\it turns away."
  SLEEP 1
  PRINT "You exit the shop."
  GOTO cor.market
 END IF
 
c.rbuy:
 cost = 1100
 clearlist
 list1 = "Y(es)"
 list2 = "N(o)"
 CLS
 NumToLet
 PRINT ""; CHR$(34); "Yes, "; genderpolite$; "."; CHR$(34); ""
 SLEEP 2
 PRINT ""; CHR$(34); "Here's one of our finest models in stock."; CHR$(34); "; "; ""
 SLEEP 1
 PRINT ""; CHR$(34); "It is designated R2-"; letter; "2."; CHR$(34); ""
 SLEEP 1
 PRINT ""; CHR$(34); "It is only 1100 credits!"; CHR$(34); ""
 SLEEP 1
Wannabuyr2:
 INPUT "Do you want it?", wantr2$
 wantr2$ = UCASE$(LEFT$(wantr2$, 1))
 IF wantr2$ = "Y" THEN
  creds = creds - cost
  IF creds < 0 THEN
   creds = creds + cost
   PRINT ""; CHR$(34); "I'm terribly sorry. You don't have enough money!"; CHR$(34); ""
   SLEEP 1
putawaydroid:
   PRINT "He puts it away and goes to bother someone else."
   SLEEP 1
   PRINT "You leave."
   SLEEP 1
   GOTO cor.market:
  END IF
  IF droid$ <> "N" THEN
   PRINT "You can't have more than one droid!"
   SLEEP 1
   creds = creds + cost
   PRINT "You put the droid back, and leave."
   SLEEP 1
   GOTO cor.market:
  END IF
 END IF
 
 IF droid$ <> "N" THEN
  creds = creds + cost
  PRINT "You can't have more than one droid!"
  SLEEP 1
  PRINT "You end up not buying the droid."
  SLEEP 1
  PRINT "You leave."
  SLEEP 1
  GOTO cor.market:
 END IF
 
 droid$ = "R2 Unit"
 IF wantr2$ = "N" THEN
  PRINT ""; CHR$(34); "Very well."; CHR$(34); " he says."
  GOTO putawaydroid:
 END IF
 ListOptions
 GOTO Wannabuyr2:
 
 
c.shopclothes:
 clearlist
 list1 = "WHAT (do you have)"
 list2 = "(I) KNOW (what I need)"
 list3 = "(Just) BROWSING"
 CLS
 PRINT "You enter the clothing store."
 PRINT "A human walks up to you."
 SLEEP 1
 PRINT ""; CHR$(34); "Welcome! How can I help you?"; CHR$(34); " he asks."
WhatClothes:
 INPUT "What do you wish to say?", clothesSay$
 clothesSay$ = UCASE$(clothesSay$)
 IF clothesSay$ = "WHAT" THEN
  CLS
  PRINT ""; CHR$(34); "We have everything!"; CHR$(34); " he says."
  PRINT ""; CHR$(34); "There's armor, hats, and helmets."
  PRINT ""; CHR$(34); "And that's not counting our formal- and casualwear!"; CHR$(34); ""
  PRINT ""; CHR$(34); "Is there anything else?"
  GOTO WhatClothes:
 END IF
 IF clothesSay$ = "BROWSING" THEN
  PRINT "You look around for a while, then leave."
  SLEEP 1
  GOTO cor.market:
 END IF
 IF clothesSay$ = "KNOW" THEN
  clearlist
  list1 = "(Body) ARMOR"
  list2 = "(Some) FATIGUES"
  list3 = "(A) HAT"
  list4 = "(Some) FORMAL (clothing)"
  CLS
  PRINT ""; CHR$(34); "Of course."; CHR$(34); ""
  SLEEP 1
  PRINT "He walks off to greet another potential customer."
  SLEEP 1
whichclothes:
  CLS
  INPUT "What do you want to buy?", buywhatclothes$
  buywhatclothes$ = UCASE$(buywhatclothes$)
  IF buywhatclothes$ = "ARMOR" THEN GOTO buyarmor:
  IF buywhatclothes$ = "HAT" THEN GOTO buyhat:
  IF buywhatclothes$ = "FORMAL" THEN GOTO buyformal:
  IF buywhatclothes$ = "CANCEL" THEN GOTO cor.market:
  ListOptions
  GOTO whichclothes:
 END IF
 ListOptions
 GOTO WhatClothes:
 
buyformal:
 clothing$ = formal$
 cost = 500
 CLS
 PRINT "You go to the Formalwear section."
 SLEEP 1
 PRINT "You pick out a nice"; formal$; "."
 SLEEP 1
 PRINT "You take it up to the cashier."
 SLEEP 1
 GOTO WantClothes:
 
 
buyhat:
 clearlist
 list1 = "(A) HAT"
 list2 = "(A) HELMET"
 CLS
 PRINT "You go over to the Hats & Helmets section."
 SLEEP 1
WantHat:
 INPUT "Do you want to buy a hat or a helmet?", HatOrHelmet$
 HatOrHelmet$ = UCASE$(HatOrHelmet$)
 IF HatOrHelmet$ = "HAT" THEN
  cost = 50
  PRINT "You pick out a nice hat."
  SLEEP 1
  PRINT "You take it to the cashier."
  GOTO WantClothes:
 END IF
 IF HatOrHelmet$ = "HELMET" THEN
  cost = 100
  PRINT "You pick out a cool helmet."
  SLEEP 1
  PRINT "You take it up to the cashier."
  GOTO WantClothes:
 END IF
 ListOptions
 GOTO WantHat:
 
 
WantClothes:
 clearlist
 list1 = "Y(es)"
 list2 = "N(o)"
 CLS
 INPUT "Do you wish to buy this?", WantClothes$
 WantClothes$ = UCASE$(LEFT$(WantClothes$, 1))
 IF WantClothes$ = "Y" THEN
  CLS
  creds = creds - cost
  IF moreclothe$ = "" THEN
   moreclothe$ = clothing$
  END IF
 END IF
 IF moreclothe$ <> "" THEN
  CLS
  PRINT "You're already carrying too much clothing!"
  SLEEP 1
  creds = creds + cost
  PRINT "You put it back, and leave."
  SLEEP 1
  GOTO cor.market
 END IF
 
 
buyarmor:
 list1 = "BODY (Armor)"
 list2 = "(Camouflage) SUIT"
 CLS
 PRINT "You go over to the Armor section."
 SLEEP 1
 INPUT "What do you want to buy?", whatarmor$
 IF whatarmor$ = "BODY" THEN
  cost = 500
  clothing$ = "armor"
  CLS
  PRINT "You pick up a suit of armor."
  SLEEP 1
  PRINT "You take it up to the cashier."
  GOTO WantClothes:
 END IF
 IF whatarmor$ = "SUIT" THEN
  cost = 50
  clothing$ = "camouflage suit"
  CLS
  PRINT "You pick a suit that is your size."
  GOTO WantClothes:
 END IF
 
 
 
END SUB  'Coruscant

SUB Dagobah
 currentplanet = "DAGOBAH"
END SUB

SUB death
 COLOR 15
 IF snd = "N" THEN GOTO silentdeath:
 PLAY dead$
 SLEEP 4
silentdeath:
 CLS
 PRINT "You are dead."
 SLEEP 2
 PRINT "You have failed in your mission to defeat the Empire."
 SLEEP 2
 PRINT "However, you can have another chance."
 SLEEP 2
tryagain:
 clearlist
 list1 = "Y(es)"
 list2 = "N(o)"
 INPUT "Do you want it?", anotherchance
 anotherchance = LEFT$(UCASE$(anotherchance), 1)
 IF anotherchance = "N" THEN endingcredits
 IF anotherchance = "Y" THEN EXIT SUB
 ListOptions
 GOTO tryagain:

END SUB

SUB distances

 IF inputhyper$ = "ALN.114" THEN
  nextparsec = 2
 END IF
 IF inputhyper$ = "BEN.214" THEN
  nextparsec = 0                        'Get this parsec!
 END IF
 IF inputhyper$ = "COT.320" THEN
  nextparsec = 1                        'Get this parsec!
 END IF
 IF inputhyper$ = "DAH.480" THEN
  nextparsec = 0                        'Get this parsec!
 END IF
 IF inputhyper$ = "ENR.518" THEN
  nextparsec = 0                        'Get this parsec!
 END IF
 IF inputhyper$ = "HOH.880" THEN
  nextparsec = 5
 END IF
 IF inputhyper$ = "KAK.111" THEN
  nextparsec = 6
 END IF
 IF inputhyper$ = "KEL.112" THEN
  nextparsec = 8
 END IF
 IF inputhyper$ = "KOK.111" THEN
  nextparsec = 2
 END IF
 IF inputhyper$ = "TAE.205" THEN
  nextparsec = 7
 END IF
 IF inputhyper$ = "YAN.M4" THEN
  nextparsec = 4
 END IF
 IF inputhyper$ = "THX.138" THEN
  nextparsec = 28
 END IF
 IF inputhyper$ = "QVQ.840" THEN
  nextparsec = 21
 END IF


 IF currentplanet = "ALDERAAN" THEN
  curparsec = 2
 END IF
 IF currentplanet = "BESPIN" THEN
  curparsec = 0
 END IF
 IF currentplanet = "CORUSCANT" THEN
  curparsec = 1
 END IF
 IF currentplanet = "DAGOBAH" THEN
  curparsec = 0
 END IF
 IF currentplanet = "ENDOR" THEN
  curparsec = 0
 END IF
 IF currentplanet = "HOTH" THEN
  curparsec = 5
 END IF
 IF currentplanet = "KASHYYYK" THEN
  curparsec = 6
 END IF
 IF currentplanet = "KESSEL" THEN
  curparsec = 8
 END IF
 IF currentplanet = "KOWAK" THEN
  curparsec = 2
 END IF
 IF currentplanet = "TATOOINE" THEN
  curparsec = 7
 END IF
 IF currentplanet = "YAVIN4" THEN
  curparsec = 4
 END IF
 IF currentplanet = "SKYWALKER RANCH" THEN
  curparsec = 28
 END IF
 IF currentplanet = "SECRET PLANET" THEN
  curparsec = 21
 END IF

 distance = SQR((curparsec - nextparsec) ^ 2)

 IF currentplanet = "SKYWALKER RANCH" OR currentplanet = "SECRET PLANET" THEN
  distance = 1
 END IF

END SUB

SUB endingcredits
 CLS
 IF snd$ = "N" THEN GOTO silentcredits:
 PLAY swthm$
silentcredits:
 COLOR 1
 centertext = "CREDITS"
 row = 2
 Center
 COLOR 5
 centertext = "Main Programmers"
 row = 5
 Center
 COLOR 15
 centertext = "Courtney A. Ficker"
 row = 7
 Center
 centertext = "Travis J. Willse"
 row = 8
 Center
 COLOR 5
 centertext = "Programmer's Parents"
 row = 10
 Center
 COLOR 15
 centertext = "Ed and Caryn Ficker"
 row = 12
 Center
 centertext = "George and Brigitte Willse"
 row = 13
 Center
 COLOR 4
 SLEEP 7
 centertext = "Supreme Ruler of the Universe"
 row = 20
 Center
 PRINT TAB(24); STRING$(LEN(centertext), "-")
 centertext = "Salacious Crumb, Kowakian Monkey-Lizard of Destiny!"
 row = 23
 SLEEP 1
 Center
 COLOR 15
 IF snd = "N" THEN SLEEP 3: endprog
 PLAY kmlod2$
 SLEEP 10
 endprog

END SUB

SUB Endor
 currentplanet = "ENDOR"
END SUB

SUB endprog
 CLS
 clr = 1
 
 DO WHILE INKEY$ = ""
  COLOR clr
  centertext$ = "The End"
  row = 12
  Center
  clr = clr + 1
  IF clr > 15 THEN clr = 1
  SLEEP 1
 LOOP
  
 
 CLS
 END

END SUB

SUB ErrorMessage
 CLS
 PRINT "I'm sorry, that option isn't available at the moment."
 PRINT "Please try again."
 PRINT "Actually, do. Or do not. There is no try."
 continue
 CLS
END SUB

DEFSNG A-Z
SUB Explode
 SCREEN 9
 CLS
 FOR rad = 1 TO 400
  IF Count / 3 = INT(Count / 3) THEN COLOR 4
  IF (Count + 1) / 3 = INT((Count + 1) / 3) THEN COLOR 12
  IF (Count + 2) / 3 = INT((Count + 2) / 3) THEN COLOR 14
  CIRCLE (319, 174), rad
  Count = Count + 1
  NEXT rad
 FOR rad = 400 TO 1 STEP -1
  CIRCLE (319, 174), rad, 0
  NEXT rad
  SCREEN 0
END SUB

DEFINT A-Z
SUB Hoth
 currentplanet = "HOTH"
END SUB

DEFSNG A-Z
SUB hyper
 SCREEN 9
 CLS
 FOR rad = 1 TO 400
  IF Count / 3 = INT(Count / 3) THEN COLOR 3
  IF (Count + 1) / 3 = INT((Count + 1) / 3) THEN COLOR 9
  IF (Count + 2) / 3 = INT((Count + 2) / 3) THEN COLOR 15
  CIRCLE (319, 174), rad
  Count = Count + 1
 NEXT rad

 Count = 0
 SLEEP distance

 FOR rad = 1 TO 400
  IF Count / 3 = INT(Count / 3) THEN COLOR 0
  IF (Count + 1) / 3 = INT((Count + 1) / 3) THEN COLOR 0
  IF (Count + 2) / 3 = INT((Count + 2) / 3) THEN COLOR 0
  CIRCLE (319, 174), rad
  Count = Count + 1
 NEXT rad
  
 SCREEN 0
 COLOR 15
        
END SUB

DEFINT A-Z
SUB hyperspace

 clearlist
 list1 = "Alderaan (ALN.114)"
 list2 = "Bespin (BEN.214)"
 list3 = "Coruscant (COT.320)"
 list4 = "Dagobah (DAH.480)"
 list5 = "Endor (ENR.518)"
 list6 = "Hoth (HOH.880)"
 list7 = "Kessel (KEL.112)"
 list8 = "Kowak (KOK.111)"
 list9 = "Tatooine (TAE.205)"
 list10 = "Yavin IV (YAN.M4)"
 
 CLS
 PRINT "Your Astromech droid is asking for hyperspace coordinates."
 inputhyper$ = UCASE$(inputhyper$)
 
hyperspace:
 INPUT "What are the coordinates? (Type `NAV' for a list) ->", inputhyper$
 inputhyper$ = UCASE$(inputhyper$)
 IF inputhyper$ = "NAV" THEN
  ListOptions
 END IF
 IF inputhyper$ = "NAV" THEN
  GOTO hyperspace:
 END IF
 IF inputhyper$ = "ALN.114" THEN
  distances
  hyper
  Alderaan
 END IF
 IF inputhyper$ = "BEN.214" THEN
  distances
  hyper
  Bespin
 END IF
 IF inputhyper$ = "COT.320" THEN
  distances
  hyper
  Coruscant
 END IF
 IF inputhyper$ = "DAH.480" THEN
  distances
  hyper
  Dagobah
 END IF
 IF inputhyper$ = "ENR.518" THEN
  distances
  hyper
  Endor
 END IF
 IF inputhyper$ = "HOH.880" THEN
  distances
  hyper
  Hoth
 END IF
 IF inputhyper$ = "KEL.112" THEN
  distances
  hyper
  Kessel
 END IF
 IF inputhyper$ = "KAK.111" THEN
  distances
  hyper
  Kashyyyk
 END IF
 IF inputhyper$ = "KOK.111" THEN
  distances
  hyper
  Kowak
 END IF
 IF inputhyper$ = "TAE.205" THEN
  distances
  hyper
  Tatooine
 END IF
 IF inputhyper$ = "YAN.M4" THEN
  distances
  hyper
  YavinIV
 END IF
 IF inputhyper$ = "QVQ.840" THEN
  distances
  hyper
  secretplanet
 END IF
 IF inputhyper$ = "THX.138" THEN
  distances
  hyper
  skywlkranch
 END IF
 
 IF anotherchance = "Y" THEN EXIT SUB
 
 ListOptions
 GOTO hyperspace:
 
END SUB

DEFSNG A-Z
SUB Invntry
 CLS
 PRINT "You are carrying:"
 PRINT w1
 PRINT w2
 PRINT e1
 PRINT e2

 PRINT clothe$
 PRINT moreclothe$

 PRINT ""; creds; "credits."
 INPUT aaa$

END SUB

DEFINT A-Z
SUB Kashyyyk
 currentplanet = "KASHYYYK"
END SUB

SUB Kessel
 currentplanet = "KESSEL"
END SUB

SUB Kowak
 currentplanet = "KOWAK"
END SUB

SUB ListOptions
 CLS

 IF LEN(list1$) > LEN(list2$) THEN
  CurrentLongest$ = list1$
   ELSE
    CurrentLongest$ = list2$
  END IF

 IF LEN(CurrentLongest$) < LEN(list3$) THEN CurrentLongest$ = list3$
 IF LEN(CurrentLongest$) < LEN(list4$) THEN CurrentLongest$ = list4$
 IF LEN(CurrentLongest$) < LEN(list5$) THEN CurrentLongest$ = list5$
 IF LEN(CurrentLongest$) < LEN(list6$) THEN CurrentLongest$ = list6$
 IF LEN(CurrentLongest$) < LEN(list7$) THEN CurrentLongest$ = list7$
 IF LEN(CurrentLongest$) < LEN(list8$) THEN CurrentLongest$ = list8$
 IF LEN(CurrentLongest$) < LEN(list9$) THEN CurrentLongest$ = list9$
 IF LEN(CurrentLongest$) < LEN(list10$) THEN CurrentLongest$ = list10$

 LOCATE 2, 2
 PRINT STRING$(LEN(CurrentLongest$), "-")

 FOR Listing = 1 TO 10
  LOCATE (Listing + 2), 2
  IF Listing = 1 THEN
   PRINT list1$
   END IF
  IF Listing = 2 THEN
   PRINT list2$
   END IF
  IF Listing = 3 THEN
   PRINT list3$
   END IF
  IF Listing = 4 THEN
   PRINT list4$
   END IF
  IF Listing = 5 THEN
   PRINT list5$
   END IF
  IF Listing = 6 THEN
   PRINT list6$
   END IF
  IF Listing = 7 THEN
   PRINT list7$
   END IF
  IF Listing = 8 THEN
   PRINT list8$
   END IF
  IF Listing = 9 THEN
   PRINT list9$
   END IF
  IF Listing = 10 THEN
   PRINT list10$
   END IF
  NEXT Listing
  INPUT "(Press Enter)", enter$
  CLS

END SUB

SUB maxblstr
 CLS
 PRINT "You have reached the highest maximum ability for using a blaster."
 PRINT : PRINT "Sorry!"
 continue
END SUB

SUB maxgnnry
 CLS
 PRINT "I'm sorry, you are already at your maximum starship"
 PRINT "gunnery skill level. What a needless risk!"
 continue
END SUB

SUB maxpilot
 CLS
 PRINT "I'm sorry, you are already at the maximum pilot skill level."
 PRINT "That was a needless risk. You could've gotten yourself killed!"
 continue

END SUB

SUB NumToLet
 'This SUB is to convert a number into a letter of the alphabet.
 'It is primarily used for random 3PO units.

 letter = CHR$(INT(RND * 26 + 65))

END SUB

SUB PlanetCalc
 StrtPlnt = INT(RND * 10) + 1
 StrtPlnt = 1                           '******TEMPORARY!!!*******
 IF StrtPlnt = 1 THEN Alderaan
 IF StrtPlnt = 2 THEN Bespin
 IF StrtPlnt = 3 THEN Coruscant
 IF StrtPlnt = 4 THEN Dagobah
 IF StrtPlnt = 5 THEN Endor
 IF StrtPlnt = 6 THEN Hoth
 IF StrtPlnt = 7 THEN Kessel
 IF StrtPlnt = 8 THEN Kowak
 IF StrtPlnt = 9 THEN Tatooine
 IF StrtPlnt = 10 THEN YavinIV
END SUB

SUB secretplanet
 currentplanet = "SECRET PLANET"
END SUB

SUB skywlkranch
 currentplanet = "SKYWALKER RANCH"
END SUB

DEFSNG A-Z
SUB SparklePause

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

DEFINT A-Z
SUB Tatooine
 currentplanet = "TATOOINE"
END SUB

SUB YavinIV
 currentplanet = "YAVIN 4"
END SUB

