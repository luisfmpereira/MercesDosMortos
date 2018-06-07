void level1()
{

  //DIALOGUE
  //entrance
  if (readingFlag && delayTime(textboxDelay, 250))
  {
    dialogueCount = 0;
    setReading(1000, true);
  }

  if (nexttext == 1 && continueReading)
  {
    dialogueCount = 1;
    setReading(1000, true);
  }

  if (nexttext == 2 && continueReading)
  {
    dialogueCount = 2;
    setReading(1000, false);
  }

  //door interaction
  if (currentLevel[1][10] == 2 && delayTime(textboxDelay, 500))
  {
    showE = true; //text interaction indicator
    if (read) {
      showE = false;
      dialogueCount = 3;
      setReading(1000, false);
    }
  }

  //bed interaction
  if (currentLevel[5][7] == 2 || currentLevel[5][9] == 2 || currentLevel[4][6] == 2 || currentLevel[4][10] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 4;
        setReading(1000, false);
      }
    }
  }

  //button interaction
  if (currentLevel[6][3] == 2 || currentLevel[6][5] == 2 || currentLevel[5][4] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 14;
        setReading(1000, false);
      }
    }
  }

  //joao leite's bed interaction
  if (currentLevel[4][1] == 2 || currentLevel[5][2] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 15;
        setReading(1000, false);
      }
    }
  }

  //lever interaction
  if (currentLevel[2][6] == 2  || currentLevel[3][5] == 2)
  {
    if (delayTime(textboxDelay, 500)) {
      showE = true; //text interaction indicator
      if (read) {
        showE = false;
        dialogueCount = 16;
        setReading(1000, false);
      }
    }
  }

  //END OF DIALOGUE


  //TUTORIAL

  if (currentLevel[2][7] == 2 || currentLevel[3][7] == 2 || currentLevel[4][7] == 2) {
    if (interFlag) {
      waittime = 1500;
      starttime = millis();
      tutString = "interaction";
      gameState = TUTORIAL;
    }
  } 

  if (currentLevel[3][2] == 2 || currentLevel[3][3] == 2) {
    if (objFlag) {
      waittime = 2000;
      starttime = millis();
      tutString = "object";
      gameState = TUTORIAL;
    }
  } 

  //check player area on this order - right, down, left, up
  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};

  if (levelState == lvl1)
  {

    for (int i = 0; i < playerArea.length; i++)
    {
      //activate lever

      if (playerArea[i] == 4 && hold && move <=0 && lvl1lvr1 == false)
      {
        playLever();
        currentLevel[2][2] = 0;
        currentLevel[2][3] = 0;
        currentLevel[3][2] = 0;
        currentLevel[3][3] = 0;
        currentLevel[2][5] = 5;
        move = cooldown;
        lvl1lvr1 = true;
      }
      if (currentLevel[2][2] == 3 || currentLevel[2][3]  == 3 || currentLevel[3][2]  == 3  || currentLevel[3][3]  == 3) {
        if (playerArea[i] == 5 && hold && move <=0 && lvl1lvr1 == true) {
          playFenceFail();
          move = cooldown;
        }
      } else if (playerArea[i] == 5 && hold && move <=0 && lvl1lvr1 == true && currentLevel[2][2] != 3 && currentLevel[2][3]  != 3 && currentLevel[3][2]  != 3  && currentLevel[3][3]  != 3)
      {
        playLever();
        currentLevel[2][2] = 12;
        currentLevel[2][3] = 12;
        currentLevel[3][2] = 13;
        currentLevel[3][3] = 13;
        currentLevel[2][5] = 4;
        move = cooldown;
        lvl1lvr1 = false;
      }
    }

    //button press 
    if (currentLevel[6][4] == 3 || currentLevel[6][4] == 2 ) 
    {
      if (lvl1b1 == false)
      {
        playDoor();
        currentLevel[0][2] = 11;
        lvl1b1 = true;
      }
    } else
    {

      currentLevel[0][2] = 6;
      lvl1b1 = false;
    }




    //reset with timer
    if (timerMax == 0)
    {           
      deathIndicator = dTIME;
      gameState = RETRYLEVEL;
    }



    //exit level
    for (int i = 0; i < playerArea.length; i++)
    {
      if (playerArea[i] == 11 && hold && move<=0)
      {
        loadLevel(2);
        gameState = NEXTLEVEL;
      }
    }
  }
}