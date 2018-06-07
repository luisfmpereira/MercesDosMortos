void level3()
{
  //DIALOGUE

  if (readingFlag && delayTime(textboxDelay, 500))
  {
    dialogueCount = 9;
    setReading(1000, false);
  }

  //oil stain
  if (currentLevel[8][5] == 2 || currentLevel[8][6] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 20;
        setReading(1000, false);
      }
    }
  } 
  
  //blueprints
  if (currentLevel[2][1] == 2 || currentLevel[2][2] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 24;
        setReading(1000, false);
      }
    }
  } 

  //totem button
  if (currentLevel[3][6] == 2 || currentLevel[2][5] == 2 || currentLevel[2][7] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        nexttext = 1;
        dialogueCount = 21;
        setReading(1000, true);
      }
    }
  }  
  //totem button2
  if (nexttext == 2 && continueReading)
  {
    showE = false;
    dialogueCount = 22;
    setReading(1000, false);
  }

  //painting
  if (currentLevel[5][1] == 2 || currentLevel[5][2] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 23;
        setReading(1000, false);
      }
    }
  }

  //END OF DIALOGUE

  //LEVEL

  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl3)
  {

    //button press 

    ////button 1

    if (currentLevel[2][6] == 8 ) 
    {
      if (lvl3b1 == false)
      {
        playFence();
        currentLevel[4][3] = 0;
        lvl3b1 = true;
      }
    } else if (lvl3b1 == true && currentLevel[4][3] != 3 && currentLevel[4][3] != 8 && currentLevel[4][3] != 9 && currentLevel[4][3] != 2)
    {
      playFence();
      currentLevel[4][3] = 7;
      lvl3b1 = false;
    }

    ////button 2

    if (currentLevel[8][10] == 9 ) 
    {
      if (lvl3b2 == false)
      {
        playFence();
        currentLevel[7][11] = 0;
        currentLevel[7][12] = 0;
        lvl3b2 = true;
      }
    } else if (lvl3b2 == true && currentLevel[7][11] != 3 && currentLevel[7][11] != 8 && 
      currentLevel[7][11] != 9  && currentLevel[7][12]  != 3 && currentLevel[7][12]  != 8 && currentLevel[7][12]  != 9 && currentLevel[4][3] != 2)
    {
      playFence();
      currentLevel[7][11] = 7;
      currentLevel[7][12] = 7;
      lvl3b2 = false;
    }

    ////button 3

    if (currentLevel[1][3] == 2 || currentLevel[1][3] == 3) 
    {
      if (lvl3b3 == false)
      {
        playDoor();
        currentLevel[0][11] = 11;
        lvl3b3 = true;
      }
    } else
    {
      currentLevel[0][11] = 6;
      lvl3b3 = false;
    }



    //timer reset

    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }

    if (currentLevel[playerY][playerX] == 14 || currentLevel[round(enemy1l3.y)][round(enemy1l3.x)] == 2)
    {           
      deathIndicator = dENEMY;
      gameState = RETRYLEVEL;
    }

    //exit level

    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        loadLevel(4);
        gameState = NEXTLEVEL;
      }
    }
  }
}