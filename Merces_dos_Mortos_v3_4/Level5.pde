void level5()
{
  //DIALOGUE
  if (readingFlag && delayTime(textboxDelay, 500))
  {
    dialogueCount = 12;
    setReading(1500, false);
  }

  //name 1
  if (currentLevel[5][3] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 28;
        setReading(1000, false);
      }
    }
  }

  //name 2
  if (currentLevel[5][5] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 29;
        setReading(1000, false);
      }
    }
  }

  //name 3
  if (currentLevel[7][7] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 30;
        setReading(1000, false);
      }
    }
  }

  //name 4
  if (currentLevel[9][7] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 31;
        setReading(1000, false);
      }
    }
  }

  //name 5
  if (currentLevel[9][9] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 32;
        setReading(1000, false);
      }
    }
  }

  //name 6
  if (currentLevel[9][11] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 33;
        setReading(1000, false);
      }
    }
  }

  //name 7
  if (currentLevel[7][11] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 34;
        setReading(1000, false);
      }
    }
  }

  //easter egg
  if (currentLevel[3][9] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 35;
        setReading(1000, false);
      }
    }
  }


  //END OF DIALOGUE
  
  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl5)
  {

    //timer reset
    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }

    if (currentLevel[playerY][playerX] == 14 || currentLevel[playerY][playerX] == 15 || currentLevel[playerY][playerX] == 16|| 
      currentLevel[round(enemy1l5.y)][round(enemy1l5.x)] == 2 || currentLevel[round(enemy2l5.y)][round(enemy2l5.x)] == 2 || currentLevel[round(enemy3l5.y)][round(enemy3l5.x)] == 2) {           
      deathIndicator = dENEMY;
      gameState = RETRYLEVEL;
    }

    //exit level
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        loadLevel(6);
        gameState = NEXTLEVEL;
      }
    }
  }
}