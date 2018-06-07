void level6()
{

  //DIALOGUE
  if (readingFlag && delayTime(textboxDelay, 500))
  {
    dialogueCount = 13;
    setReading(1500, false);
  }
  
  //windows 
  if (currentLevel[1][11] == 2 || currentLevel[1][2] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 36;
        setReading(1000, false);
      }
    }
  }
  
  //altar
  if (currentLevel[1][5] == 2 || currentLevel[1][6] == 2 || currentLevel[1][7] == 2|| currentLevel[1][8] == 2)
  {
    showE = true; //text interaction indicator
    if (read && delayTime(textboxDelay, 500)) {
      showE = false;
      dialogueCount = 37;
      setReading(1000, true);
    }
  }

  if (nexttext == 1 && continueReading)
  {
    showE = false;
    dialogueCount = 38;
    setReading(1000, false);
  }
  
  //END OF DIALOGUE

  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl6)
  {
    //lever activation
    for (int i = 0; i < playerArea.length; i++)
    {
      if (currentLevel[7][11] == 3 || currentLevel[7][11] == 2 || currentLevel[7][11] == 8 || currentLevel[7][11] == 9 || currentLevel[7][11] == 10) {
        if (playerArea[i] == 4 && hold && move <= 0 && lvl6lvr1 == false) {
          playFenceFail();
          move = cooldown;
        }
      } else if (playerArea[i] == 4 && hold && move <= 0 && lvl6lvr1 == false && currentLevel[7][11] != 3 
        && currentLevel[7][11] != 2 && currentLevel[7][11] != 8 && currentLevel[7][11] != 9 && currentLevel[7][11] != 10)
      {
        playLever();
        playFence();
        currentLevel[3][2] = 0;
        currentLevel[7][11] = 18;
        currentLevel[4][12] = 5;
        lvl6lvr1 = true;
        move = cooldown;
      }
      if (currentLevel[3][2] == 3 || currentLevel[3][2] == 2 || currentLevel[3][2] == 8 || currentLevel[3][2] == 9 || currentLevel[3][2] == 10) {
        if (playerArea[i] == 5 && hold && move <= 0 && lvl6lvr1 == true) {
          playFenceFail();
          move = cooldown;
        }
      } else 
      if (playerArea[i] == 5 && hold && move <=0 && lvl6lvr1 == true && currentLevel[3][2] != 3 
        && currentLevel[3][2] != 2 && currentLevel[3][2] != 8 && currentLevel[3][2] != 9 && currentLevel[3][2] != 10)
      {
        playLever();
        playFence();
        currentLevel[3][2] = 18;
        currentLevel[7][11] = 0;
        currentLevel[4][12] = 4;
        lvl6lvr1= false;
        move = cooldown;
      }
    }

    //button 1

    if (currentLevel[9][10] == 8) {
      if (lvl6b1 == false) {
        playFence();
        currentLevel[3][10] = 0;
        lvl6b1 = true;
      }
    } else if (lvl6b1 == true && currentLevel[3][10] != 3 && currentLevel[3][10] != 8 && currentLevel[3][10] != 9 && currentLevel[3][10] != 10 && currentLevel[3][10] != 2)
    {
      playFence();
      currentLevel[3][10] = 18;
      lvl6b1 = false;
    }


    //button 2
    if (currentLevel[6][3] == 2 || currentLevel[6][3] == 3) {
      if (lvl6b2 == false) {
        playFence();
        currentLevel[7][2] = 0;
        lvl6b2 = true;
      }
    } else if (lvl6b2 == true && currentLevel[7][2] != 3 && currentLevel[7][2] != 8 && currentLevel[7][2] != 9 && currentLevel[7][2] != 10 && currentLevel[7][2] != 2)
    {
      playFence();
      currentLevel[7][2] = 18;
      lvl6b2 = false;
    }

    //button 3 e 4
    if (currentLevel[5][5] == 8) {
      if (currentLevel[5][8] == 3 || currentLevel[4][8] == 2) {
        if (lvl6b3 == false) {
          playFence();
          currentLevel[4][6] = 0;
          currentLevel[4][7] = 0;
          lvl6b3 = true;
        }
      }
    } else if (lvl6b3 == true && currentLevel[4][6] != 3 && currentLevel[4][6] != 8 && currentLevel[4][6] != 9 && currentLevel[4][6] != 10 && currentLevel[4][6] != 2
      && currentLevel[4][7] != 3 && currentLevel[4][7] != 8 && currentLevel[4][7] != 9 && currentLevel[4][7] != 10 && currentLevel[4][7] != 2) {
      playFence();
      currentLevel[4][6] = 18;
      currentLevel[4][7] = 18;
      lvl6b3 = false;
    }

    //button 4 e 5
    if (currentLevel[2][5] == 9 && currentLevel[2][8] == 10) {
      if (lvl6b4 == false) {
        playDoor();
        currentLevel[10][6] = 11;
        currentLevel[10][7] = 11;
        lvl6b4 = true;
      }
    } else if (lvl6b4 == true)
    {
      playDoor();
      currentLevel[10][6] = 17;
      currentLevel[10][7] = 17;
      lvl6b4 = false;
    }



    //timer reset
    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }

    //if (currentLevel[playerY][playerX] == 14 || currentLevel[round(enemy1l6.y)][round(enemy1l6.x)] == 2)
    //{           
    //  deathIndicator = dENEMY;
    //  gameState = RETRYLEVEL;
    //}

    //exit level
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        gameState = YOUWIN;
      }
    }
  }
}