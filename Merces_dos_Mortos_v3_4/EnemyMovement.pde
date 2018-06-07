int enemyMove, enemyCooldown;
int [] enemyFlag = {0, 0, 0};


//calls animation to draw according to level state
void callEnemy()
{
  if (levelState == lvl2) {
    moveEnemy(enemy1l2, levelState, 0);
    enemyAnimation(enemy1l2, 0);
  }

  if (levelState == lvl3) {
    moveEnemy(enemy1l3, levelState, 0);
    enemyAnimation(enemy1l3, 0);
  }

  if (levelState == lvl4) {

    moveEnemy(enemy1l4, levelState, 0);
    enemyAnimation(enemy1l4, 0);

    moveEnemy(enemy2l4, levelState, 1);
    enemyAnimation(enemy2l4, 1);
  }

  if (levelState == lvl5) {

    moveEnemy(enemy1l5, levelState, 0);
    enemyAnimation(enemy1l5, 0);

    moveEnemy(enemy2l5, levelState, 1);
    enemyAnimation(enemy2l5, 1);

    moveEnemy(enemy3l5, levelState, 2);
    enemyAnimation(enemy3l5, 2);
  }
}

//////ENEMY MOVEMENT PATTERN ACCORDING TO LEVEL//////

void moveEnemy(PVector enemy, int levelState, int enemyNum)
{
  enemyMove--;

  ////LEVEL 2////

  if (levelState == lvl2 && enemyNum == 0 && enemyMove <= 0)
  {

    if (enemyFlag[0] <= 3) moveEnemyRight(enemy, enemyNum);
    if (enemyFlag[0] >= 4 && enemyFlag[0] <= 6) moveEnemyUp(enemy, enemyNum);
    if (enemyFlag[0] >= 7 && enemyFlag[0] <= 9) moveEnemyLeft(enemy, enemyNum);
    if (enemyFlag[0] == 10) moveEnemyDown(enemy, enemyNum);
    if (enemyFlag[0] == 11) moveEnemyLeft(enemy, enemyNum);
    if (enemyFlag[0] >= 12 && enemyFlag[0] <= 13) moveEnemyDown(enemy, enemyNum);

    enemyFlag[0]++;

    if (enemyFlag[0] == 14) 
      enemyFlag[0] = 0;
  }


  ////LEVEL 3////

  if (levelState == lvl3 && enemyNum == 0 && enemyMove <= 0)
  {

    if (enemyFlag[0] <= 1) moveEnemyRight(enemy, enemyNum);
    if (enemyFlag[0] == 2) moveEnemyUp(enemy, enemyNum);
    if (enemyFlag[0] >= 3 && enemyFlag[0] <= 4) moveEnemyRight(enemy, enemyNum);
    if (enemyFlag[0] == 5) moveEnemyDown(enemy, enemyNum);
    if (enemyFlag[0] >= 6 && enemyFlag[0] <= 7) moveEnemyRight(enemy, enemyNum);
    if (enemyFlag[0] >= 8 && enemyFlag[0] <= 9) moveEnemyDown(enemy, enemyNum);
    if (enemyFlag[0] == 10) moveEnemyLeft(enemy, enemyNum);
    if (enemyFlag[0] == 11) moveEnemyDown(enemy, enemyNum);
    if (enemyFlag[0] >= 12 && enemyFlag[0] <= 14) moveEnemyLeft(enemy, enemyNum);
    if (enemyFlag[0] == 15) moveEnemyUp(enemy, enemyNum);
    if (enemyFlag[0] >= 16 && enemyFlag[0] <= 17) moveEnemyLeft(enemy, enemyNum);
    if (enemyFlag[0] >= 18 && enemyFlag[0] <= 19) moveEnemyUp(enemy, enemyNum);

    enemyFlag[0]++;

    if (enemyFlag[0] == 20) 
      enemyFlag[0] = 0;
  }

  ////LEVEL 4////
  if (levelState == lvl4 && enemyMove <= 0) {

    //enemy 0
    if (enemyNum == 0) {
      if (enemyFlag[0] <= 4) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[0] == 5) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[0] == 6) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[0] >= 7 && enemyFlag[0] <= 8) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[0] >= 9 && enemyFlag[0] <= 14) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[0] >= 15 && enemyFlag[0] <= 17) moveEnemyUp(enemy, enemyNum);

      enemyFlag[0]++;
      if (enemyFlag[0] == 18) 
        enemyFlag[0] = 0;
    }

    //enemy1
    if (enemyNum == 1) {
      if (enemyFlag[1] <= 6) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[1] >= 7 && enemyFlag[1] <= 9) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[1] >= 10 && enemyFlag[1] <= 16) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[1] >= 17 && enemyFlag[1] <= 19) moveEnemyDown(enemy, enemyNum);

      enemyFlag[1]++;
      if (enemyFlag[1] == 20) 
        enemyFlag[1] = 0;
    }
  }

  ////LEVEL 5////
  if (levelState == lvl5 && enemyMove <= 0) {
    if (enemyNum == 0) {
      if (enemyFlag[0] <= 4) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[0] == 5) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[0] == 6) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[0] == 7) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[0] == 8) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[0] >= 9 && enemyFlag[0] <= 13) moveEnemyDown(enemy, enemyNum);
      
      enemyFlag[0]++;
      if (enemyFlag[0] == 14) 
        enemyFlag[0] = 0;
    }


    if (enemyNum == 1) {

      if (enemyFlag[1] <= 2) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[1] >= 3 && enemyFlag[1] <= 6) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[1] >= 7 && enemyFlag[1] <= 10) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[1] >= 11 && enemyFlag[1] <= 12) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[1] >= 13 && enemyFlag[1] <= 14) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[1] >= 15 && enemyFlag[1] <= 17) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[1] >= 18 && enemyFlag[1] <= 20) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[1] >= 21 && enemyFlag[1] <= 22) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[1] >= 23 && enemyFlag[1] <= 24) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[1] >= 25 && enemyFlag[1] <= 28) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[1] >= 29 && enemyFlag[1] <= 32) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[1] >= 33 && enemyFlag[1] <= 35) moveEnemyLeft(enemy, enemyNum);
      

      enemyFlag[1]++;
      if (enemyFlag[1] == 36) 
        enemyFlag[1] = 0;
    }

    if (enemyNum == 2) {

      if (enemyFlag[2] <= 4) moveEnemyDown(enemy, enemyNum);
      if (enemyFlag[2] >= 5 && enemyFlag[2] <= 6) moveEnemyLeft(enemy, enemyNum);
      if (enemyFlag[2] >= 7 && enemyFlag[2] <= 8) moveEnemyUp(enemy, enemyNum);
      if (enemyFlag[2] >= 9 && enemyFlag[2] <= 10) moveEnemyRight(enemy, enemyNum);
      if (enemyFlag[2] >= 11 && enemyFlag[2] <= 13) moveEnemyUp(enemy, enemyNum);
            
      enemyFlag[2]++;
      if (enemyFlag[2] == 14) 
        enemyFlag[2] = 0;
    }
  }
}



////ENEMY MOVEMENT METHODS////

void moveEnemyRight(PVector enemy, int enemyNum)
{
  int [] enemyArea = enemyArea(enemy);
  setEnemyAnim("right", enemyNum);

  //check if box on right to push object
  if (enemyArea[0] == 3 || enemyArea[0] == 8 || enemyArea[0] == 9 || enemyArea[0] == 10) { 

    //if player on right
    if (currentLevel[round(enemy.y)+1][round(enemy.x)+1] == 3 || currentLevel[round(enemy.y)+1][round(enemy.x)+1] == 8 
      || currentLevel[round(enemy.y)+1][round(enemy.x)+1] == 9 || currentLevel[round(enemy.y)+1][round(enemy.x)+1] == 10 || currentLevel[round(enemy.y)+1][round(enemy.x)+1] == 2) {

      //push box straight
      currentLevel[round(enemy.y)][round(enemy.x)+2] = currentLevel[round(enemy.y)][round(enemy.x)+1];
      currentLevel[round(enemy.y)][round(enemy.x)+1] = 0;
    } else {

      //push box right
      currentLevel[round(enemy.y)+1][round(enemy.x)+1] = currentLevel[round(enemy.y)][round(enemy.x)+1];
      currentLevel[round(enemy.y)][round(enemy.x)+1] = 0;
    }
  } 
  //move enemy
  currentLevel[round(enemy.y)][round(enemy.x)] = 0;
  enemy.x++;

  if (enemyNum == 0) currentLevel[round(enemy.y)][round(enemy.x)] = 14;
  if (enemyNum == 1) currentLevel[round(enemy.y)][round(enemy.x)] = 15;
  if (enemyNum == 2) currentLevel[round(enemy.y)][round(enemy.x)] = 16;

  enemyMove = enemyCooldown;
}

void moveEnemyDown(PVector enemy, int enemyNum)
{
  int [] enemyArea = enemyArea(enemy);
  setEnemyAnim("down", enemyNum);

  //if box
  if (enemyArea[1] == 3 || enemyArea[1] == 8 || enemyArea[1] == 9 || enemyArea[1] == 10) {

    //if player
    if (currentLevel[round(enemy.y)+1][round(enemy.x)-1] == 3 || currentLevel[round(enemy.y)+1][round(enemy.x)-1] == 8 
      || currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 9 || currentLevel[round(enemy.y)+1][round(enemy.x)-1] == 10 || currentLevel[round(enemy.y)+1][round(enemy.x)-1] == 2) {

      //push box straight
      currentLevel[round(enemy.y)+2][round(enemy.x)] = currentLevel[round(enemy.y)+1][round(enemy.x)];
      currentLevel[round(enemy.y)+1][round(enemy.x)] = 0;
    } else { 

      //push box right
      currentLevel[round(enemy.y)+1][round(enemy.x)-1] = currentLevel[round(enemy.y)+1][round(enemy.x)];
      currentLevel[round(enemy.y)+1][round(enemy.x)] = 0;
    }
  }
  //move enemy
  currentLevel[round(enemy.y)][round(enemy.x)] = 0;
  enemy.y++;

  if (enemyNum == 0) currentLevel[round(enemy.y)][round(enemy.x)] = 14;
  if (enemyNum == 1) currentLevel[round(enemy.y)][round(enemy.x)] = 15;
  if (enemyNum == 2) currentLevel[round(enemy.y)][round(enemy.x)] = 16;

  enemyMove = enemyCooldown;
}

void moveEnemyLeft(PVector enemy, int enemyNum)
{
  int [] enemyArea = enemyArea(enemy);
  setEnemyAnim("left", enemyNum);

  //if box
  if (enemyArea[2] == 3 || enemyArea[2] == 8 || enemyArea[2] == 9 || enemyArea[2] == 10) {

    //if player
    if (currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 3 || currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 8 
      || currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 9 || currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 10 || currentLevel[round(enemy.y)-1][round(enemy.x)-1] == 2) {

      //push box straight
      currentLevel[round(enemy.y)][round(enemy.x)-2] = currentLevel[round(enemy.y)][round(enemy.x)-1];
      currentLevel[round(enemy.y)][round(enemy.x)-1] = 0;
    } else {

      //push box right
      currentLevel[round(enemy.y)-1][round(enemy.x)-1] = currentLevel[round(enemy.y)][round(enemy.x)-1];
      currentLevel[round(enemy.y)][round(enemy.x)-1] = 0;
    }
  }
  //move enemy
  currentLevel[round(enemy.y)][round(enemy.x)] = 0;
  enemy.x--;

  if (enemyNum == 0) currentLevel[round(enemy.y)][round(enemy.x)] = 14;
  if (enemyNum == 1) currentLevel[round(enemy.y)][round(enemy.x)] = 15;
  if (enemyNum == 2) currentLevel[round(enemy.y)][round(enemy.x)] = 16;
  enemyMove = enemyCooldown;
}

void moveEnemyUp(PVector enemy, int enemyNum)
{
  int [] enemyArea = enemyArea(enemy);
  setEnemyAnim("up", enemyNum);

  //if box
  if (enemyArea[3] == 3 || enemyArea[3] == 8 || enemyArea[3] == 9 || enemyArea[3] == 10) {

    //if player
    if (currentLevel[round(enemy.y)-1][round(enemy.x)+1] == 3 || currentLevel[round(enemy.y)-1][round(enemy.x)+1] == 8 
      || currentLevel[round(enemy.y)-1][round(enemy.x)+1] == 9 || currentLevel[round(enemy.y)-1][round(enemy.x)+1] == 10 || currentLevel[round(enemy.y)-1][round(enemy.x)+1] == 2) {

      //push box straight
      currentLevel[round(enemy.y)-2][round(enemy.x)] = currentLevel[round(enemy.y)-1][round(enemy.x)];
      currentLevel[round(enemy.y)-1][round(enemy.x)] = 0;
    } else {

      //push box right
      currentLevel[round(enemy.y)-1][round(enemy.x)+1] = currentLevel[round(enemy.y)-1][round(enemy.x)];
      currentLevel[round(enemy.y)-1][round(enemy.x)] = 0;
    }
  }
  //move enemy
  currentLevel[round(enemy.y)][round(enemy.x)] = 0;
  enemy.y--;
  if (enemyNum == 0) currentLevel[round(enemy.y)][round(enemy.x)] = 14;
  if (enemyNum == 1) currentLevel[round(enemy.y)][round(enemy.x)] = 15;
  if (enemyNum == 2) currentLevel[round(enemy.y)][round(enemy.x)] = 16;
  enemyMove = enemyCooldown;
}

void resetEnemy()
{
  //used to reset all flags of the enemy 
  enemyFlag[0] = 0;
  enemyFlag[1] = 0;
  enemyFlag[2] = 0;
}

int [] enemyArea(PVector enemy)
{
  //check enemy area - right, down,left and up - on this order
  int enemyArea[] = {currentLevel[round(enemy.y)][round(enemy.x)+1], currentLevel[round(enemy.y)+1][round(enemy.x)], 
    currentLevel[round(enemy.y)][round(enemy.x)-1], currentLevel[round(enemy.y)-1][round(enemy.x)], 
  };

  return enemyArea;
}