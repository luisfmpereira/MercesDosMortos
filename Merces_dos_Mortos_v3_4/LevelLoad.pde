
//////GLOBAL LEVEL VARIABLES//////

int timerMax;

//level1
boolean lvl1b1, lvl1lvr1;//buttons levers

//level2
boolean lvl2b1, lvl2lvr1;
PVector enemy1l2;

//level3
boolean lvl3b1, lvl3b2, lvl3b3, lvl3b4;
PVector enemy1l3;

//level 4
boolean lvl4b1, lvl4b2, lvl4lvr1;
PVector enemy1l4, enemy2l4;

//level 5
PVector enemy1l5, enemy2l5, enemy3l5;

//level 6
boolean lvl6b1, lvl6b2, lvl6b3, lvl6b4, lvl6lvr1; 

void loadLevel(int i)
{
  cheatcode = false;
  if (i == 1) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerDown;


    //set map
    currentLevel = copyArray(level1);
    levelState = lvl1;

    //set player position
    playerY = 1;
    playerX = 9;
    currentLevel[playerY][playerX] = 2;

    //set timer and buttons
    timerMax = 1200;
    lvl1b1 = false;
    lvl1lvr1 = false;
  }

  if (i == 2) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerUp;
    enemyidleImage[0] = enemyUp;

    //set map
    currentLevel = copyArray(level2);
    levelState = lvl2;

    //set player position
    playerY = 9;
    playerX = 2;
    currentLevel[playerY][playerX] = 2;

    //set enemy position
    enemyCooldown = 5 * cooldown;
    resetEnemy();
    enemy1l2 = new PVector(2, 5);
    currentLevel[round(enemy1l2.y)][round(enemy1l2.x)] = 14;

    //set timer and buttons
    timerMax = 2100;
    lvl2b1 = false;
    lvl2lvr1 = false;
  }

  if (i == 3) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerUp;
    enemyidleImage[0] = enemyUp;

    //set map
    currentLevel = copyArray(level3);
    levelState = lvl3;

    //set player position
    playerY = 9;
    playerX = 3;
    currentLevel[playerY][playerX] = 2;

    //set enemy position
    enemyCooldown = 5 * cooldown;
    resetEnemy();
    enemy1l3 = new PVector(2, 6);
    currentLevel[round(enemy1l3.y)][round(enemy1l3.x)] = 14;

    //set timer and buttons
    timerMax = 3000;
    lvl3b1 = false;
    lvl3b2 = false;
    lvl3b3 = false;
    lvl3b4 = false;
  }

  if (i == 4) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerDown;
    enemyidleImage[0] = enemyUp;
    enemyidleImage[1] = enemyDown;

    //set map
    currentLevel = copyArray(level4);
    levelState = lvl4;

    //set player position
    playerY = 1;
    playerX = 1;
    currentLevel[playerY][playerX] = 2;

    //set enemy position
    enemyCooldown = 4 * cooldown;
    resetEnemy();
    enemy1l4 = new PVector(1, 5);
    currentLevel[round(enemy1l4.y)][round(enemy1l4.x)] = 14;
    enemy2l4 = new PVector(10, 9);
    currentLevel[round(enemy2l4.y)][round(enemy2l4.x)] = 15;

    //set timer and buttons
    timerMax = 3000;
    lvl4b1 = false;
    lvl4b2 = false;
    lvl4lvr1  = false;
  }

  if (i == 5) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerDown;
    enemyidleImage[0] = enemyUp;
    enemyidleImage[1] = enemyDown;
    enemyidleImage[2] = enemyLeft;

    //set map
    currentLevel = copyArray(level5);
    levelState = lvl5;

    //set player position
    playerY = 1;
    playerX = 1;
    currentLevel[playerY][playerX] = 2;

    //set enemy position

    /////DIFFERENT ENEMY COOLDOWN/////
    enemyCooldown = 33;

    resetEnemy();
    enemy1l5 = new PVector(1, 9);
    enemy2l5 = new PVector(3, 5);
    enemy3l5 = new PVector(12, 4);
    currentLevel[round(enemy1l5.y)][round(enemy1l5.x)] = 14;
    currentLevel[round(enemy2l5.y)][round(enemy2l5.x)] = 15;
    currentLevel[round(enemy3l5.y)][round(enemy3l5.x)] = 16;

    //set timer and buttons
    timerMax = 2100;
  }

  if (i == 6) 
  {
    //set reading;
    readingFlag = true;
    textboxDelay = millis(); 
    nexttext = 0;

    //set idle
    idleImage = playerRight;

    //set map
    currentLevel = copyArray(level6);
    levelState = lvl6;

    //set player position
    playerY = 5;
    playerX = 1;
    currentLevel[playerY][playerX] = 2;

    //set enemy position
    resetEnemy();

    //set timer and buttons
    timerMax = 3900;
    lvl6lvr1 = false;
    lvl6b1 = false;
    lvl6b2 = false;
    lvl6b3 = false;
    lvl6b4 = false;
  }
}


void resetLevel()
{
  //reload current level
  
  if (levelState == lvl1) 
    loadLevel(1);

  if (levelState == lvl2) 
    loadLevel(2);

  if (levelState == lvl3)         
    loadLevel(3); 

  if (levelState == lvl4)       
    loadLevel(4); 

  if (levelState == lvl5)       
    loadLevel(5); 

  if (levelState == lvl6)       
    loadLevel(6);
}