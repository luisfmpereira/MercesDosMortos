void level4()
{

  //DIALOGUE
  //entrance
  if (readingFlag && delayTime(textboxDelay, 500))
  {
    dialogueCount = 11;
    setReading(1500, false);
  }

  //cupcakes
  if (currentLevel[3][4] == 2 || currentLevel[3][5] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 25;
        setReading(1000, false);
      }
    }
  } 

  //one bread only
  if (currentLevel[2][9] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 26;
        setReading(1000, false);
      }
    }
  } 

  //trash can
  if (currentLevel[2][12] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 27;
        setReading(1000, false);
      }
    }
  } 





  //END OF DIALOGUE

  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl4)
  {

    //lever press
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 4 && hold && move <=0 && lvl4lvr1 == false)
      {
        playLever();
        playFence();
        currentLevel[4][11] = 0;
        currentLevel[4][10] = 0;
        currentLevel[8][12] = 5;
        lvl4lvr1= true;
        move = cooldown;
      }
      if (playerArea[i] == 5 && hold && move <=0 && lvl4lvr1 == true && currentLevel[4][11] != 3 && currentLevel[4][11] != 2 && currentLevel[4][11] != 8 && currentLevel[4][11] != 9 && currentLevel[4][11] != 10 &&
        currentLevel[4][10] != 3 && currentLevel[4][10] != 2 && currentLevel[4][10] != 8 && currentLevel[4][10] != 9 && currentLevel[4][10] != 10)
      {
        playLever();
        playFence();
        currentLevel[4][11] = 18;
        currentLevel[4][10] = 18;
        currentLevel[8][12] = 4;
        lvl4lvr1= false;
        move = cooldown;
      }
    }


    //buttons press
    //button1
    if (currentLevel[5][9] == 10) {
      if (lvl4b1 == false) {
        playFence();
        currentLevel[4][6] = 0;
        currentLevel[4][5] = 0;
        lvl4b1 = true;
      }
    } else if (lvl4b1 == true  && currentLevel[4][5] != 3 && currentLevel[4][5] != 2  && currentLevel[4][5] != 8 && currentLevel[4][5] != 9  && currentLevel[4][5] != 10
      && currentLevel[4][6] != 3 && currentLevel[4][6] != 2  && currentLevel[4][6] != 8 && currentLevel[4][6] != 9  && currentLevel[4][6] != 10) {
      playFence();
      currentLevel[4][6] = 18;
      currentLevel[4][5] = 18;
      lvl4b1 = false;
    }

    //button2
    if (currentLevel[3][7] == 8 && currentLevel[3][12] == 9) {
      if (lvl4b2 == false) {
        playDoor();
        currentLevel[10][2] = 11;
        lvl4b2 = true;
      }
    } else if (lvl4b2 == true) {
      playDoor();
      currentLevel[10][2] = 17;
      lvl4b2 = false;
    }




    //timer reset
    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }

    if (currentLevel[playerY][playerX] == 14 || currentLevel[playerY][playerX] == 15 || currentLevel[round(enemy1l4.y)][round(enemy1l4.x)] == 2 || currentLevel[round(enemy2l4.y)][round(enemy2l4.x)] == 2)
    {           
      deathIndicator = dENEMY;
      gameState = RETRYLEVEL;
    }

    //exit level
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        loadLevel(5);
        gameState = NEXTLEVEL;
      }
    }
  }
}