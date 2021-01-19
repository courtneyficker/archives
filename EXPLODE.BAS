
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

