void level2()
{
  //DIALOGUE
  //entrance dialogue
  if (readingFlag && delayTime(textboxDelay, 500))
  {
    dialogueCount = 5;
    setReading(1000, true);
  }

  if (nexttext == 1 && continueReading)
  {
    dialogueCount = 6;
    setReading(1000, false);
  }

  //bookshelf text
  if (currentLevel[2][11] == 2 || currentLevel[2][12] == 2 )
  {
    showE = true; //text interaction indicator
    if (read && delayTime(textboxDelay, 500)) {
      showE = false;
      dialogueCount = 7;
      nexttext = 1;
      setReading(1000, true);
    }
  }
  //bookshelf text2
  if (nexttext == 2 && continueReading)
  {
    showE = false;
    dialogueCount = 8;
    setReading(1000, false);
  }

  //benches interaction
  if (currentLevel[6][5] == 2  || currentLevel[6][6] == 2 || currentLevel[6][7] == 2 || currentLevel[6][8] == 2 || currentLevel[6][9] == 2 || currentLevel[6][10] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 17;
        setReading(1000, false);
      }
    }
  }

  //messy table
  if (currentLevel[6][2] == 2  || currentLevel[7][2] == 2 || currentLevel[8][2] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 18;
        setReading(1000, false);
      }
    }
  }

  //exit table
  if (currentLevel[2][1] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 19;
        setReading(1000, false);
      }
    }
  }


  //END OF DIALOGUE

  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl2)
  {

    for (int i = 0; i < playerArea.length; i++)
    {
      //lever pull


      if (playerArea[i] == 4 && hold && move <=0 && lvl2lvr1 == false && currentLevel[4][9] != 3 && currentLevel[4][9] != 2)
      {
        playLever();
        playFence();
        currentLevel[4][9] = 0;
        currentLevel[8][12] = 5;
        move = cooldown;
        lvl2lvr1 = true;
      }
      if (currentLevel[4][9] == 3 || currentLevel[4][9] == 2)
      {
        if (playerArea[i] == 5 && hold && move <=0 && lvl2lvr1 == true) {
          playFenceFail();
          move = cooldown;
        }
      }
      if (playerArea[i] == 5 && hold && move <=0 && lvl2lvr1 == true  && currentLevel[4][9] != 3  && currentLevel[4][9] != 2)
      {
        playLever();
        playFence();
        currentLevel[4][9] = 7;
        currentLevel[8][12] = 4;
        move = cooldown;
        lvl2lvr1 = false;
      }
    }



    //button press 
    if (currentLevel[1][4] == 3 || currentLevel[1][4] == 2 ) 
    {
      if (lvl2b1 == false)
      {
        playDoor();
        currentLevel[0][3] = 11;
        lvl2b1 = true;
      }
    } else
    {

      currentLevel[0][3] = 6;
      lvl2b1 = false;
    }



    //timer reset
    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }

    if (currentLevel[playerY][playerX] == 14 || currentLevel[round(enemy1l2.y)][round(enemy1l2.x)] == 2)
    {           
      deathIndicator = dENEMY;
      gameState = RETRYLEVEL;
    }


    //exit level
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        loadLevel(3);
        gameState = NEXTLEVEL;
      }
    }
  }
}