boolean up, down, left, right, hold, pauseMenu;
boolean  pulling, read;
int playerX, playerY, move, cooldown;
int mouseCooldown;

boolean cheatcode;


void keyPressed()
{ 
  if (key == 'w' || key == 'W') {
    up = true;
    if (!pulling && move<=0) idleImage = playerUp;
  }
  if (key == 's' || key == 'S') { 
    down = true;
    if (!pulling && move<=0) idleImage = playerDown;
  }
  if (key == 'a' || key == 'A') { 
    left = true;
    if (!pulling && move<=0) idleImage = playerLeft;
  }
  if (key == 'd' || key == 'D') { 
    right = true;
    if (!pulling && move<=0) idleImage = playerRight;
  }
  if (key == 'e' || key == 'E') {
    read = true;
  }

  if (key == 'x' || key == 'X') {
    if (mouseCooldown <= 0 && gameState == PLAYING) {
      cheatcode = !cheatcode;
      mouseCooldown = cooldown;
    }
  }

  if (key == ' ') {
    hold = true;
  }

  if (key == 'm' || key == 'M')
  {
    if (gameState == PLAYING) pauseMenu = true;
    if (gameState == PAUSEMENU && mouseCooldown<=0) {
      playMouse();
      gameState=PLAYING;
      mouseCooldown = cooldown;
    }
  }

  if (keyCode == 27)
  {
    key = 0;
    if (gameState == PLAYING) pauseMenu = true;
    if (gameState == PAUSEMENU && mouseCooldown<=0) {
      playMouse();
      gameState=PLAYING;
      mouseCooldown = cooldown;
    }
  }


  if (key == CODED)
  {
    if (keyCode == UP) {
      up = true;
      if (!pulling && move<=0) idleImage = playerUp;
    }
    if (keyCode == DOWN) {
      down = true;
      if (!pulling && move<=0) idleImage = playerDown;
    }
    if (keyCode == LEFT) {
      left = true;
      if (!pulling && move<=0) idleImage = playerLeft;
    }
    if (keyCode == RIGHT) {
      right = true;
      if (!pulling && move<=0) idleImage = playerRight;
    }
  }
}
void keyReleased()
{
  if (key == 'w' ||key == 'W')
    up = false;
  if (key == 's'||key == 'S')
    down = false;
  if (key == 'a'||key == 'A')
    left = false;
  if (key == 'd'||key == 'D')
    right = false;
  if (key == ' ')
    hold = false;
  if (key == 'e' || key == 'E')
    read = false;


  if (key == CODED)
  {
    if (keyCode == UP) 
      up = false;

    if (keyCode == DOWN) 
      down = false;

    if (keyCode == LEFT) 
      left = false;

    if (keyCode == RIGHT) 
      right = false;
  }
}

void mousePressed()
{


  //WELCOME MENU
  if (gameState ==WELCOME && mouseCooldown <= 0) {
    if (containsMouse(pos0, screensize))
    {
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //MAIN MENU

  if (gameState == MAINMENU && mouseCooldown <= 0)
  {
    if (containsMouse(mainb1pos, buttonsize)) {
      playMouse();
      gameState = LEVELSELECTION;
      mouseCooldown = cooldown;
    }
    if (containsMouse(mainb2pos, buttonsize)) { 
      playMouse();
      //reset variables needed to control instructions menu
      instructionCount = 0;
      objCount = 0;
      interCount = 0;

      gameState = INSTRUCTIONS;  
      mouseCooldown = cooldown;
    }
    if (containsMouse(mainb3pos, buttonsize)) {
      playMouse();
      gameState = CREDITS;  
      mouseCooldown = cooldown;
    }
    if (containsMouse(mainb4pos, buttonsize)) {
      exit();
    }

    //music control
    if (containsMouse(pausemus, buttonsize2)) {
      playMouse();
      musicControl = !musicControl;
      mouseCooldown = cooldown;
    }
    if (containsMouse(pausesfx, buttonsize2)) {
      if (!sfxControl) playMouse();
      sfxControl = !sfxControl;
      mouseCooldown = cooldown;
    }
  }

  //INSTRUCTIONS

  if (gameState == INSTRUCTIONS)
  {

    if (containsMouse(instbackpos, buttonsize) && instructionCount == 0 && mouseCooldown <= 0) {
      playMouse();
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }

    if (containsMouse(instnextpos, buttonsize) && instructionCount == 0 && mouseCooldown <= 0) {
      playMouse();
      instructionCount++;
      mouseCooldown = cooldown;
    }

    if (containsMouse(instnextpos, buttonsize) && instructionCount == 1 && mouseCooldown <= 0) {
      playMouse();
      instructionCount++;
      mouseCooldown = cooldown;
    }

    if (containsMouse(instbackpos, buttonsize) && instructionCount == 1 && mouseCooldown <= 0) {
      playMouse();
      instructionCount--;
      mouseCooldown = cooldown;
    }

    if (containsMouse(instbackpos, buttonsize) && instructionCount == 2 && mouseCooldown <= 0) {
      playMouse();
      instructionCount--;
      mouseCooldown = cooldown;
    }

    if (containsMouse(instnextpos, buttonsize) && instructionCount == 2 && mouseCooldown <= 0) {
      playMouse();
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //CREDITS

  if (gameState == CREDITS && mouseCooldown <= 0)
  {
    if (containsMouse(credretpos, buttonsize)) {
      playMouse();
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //YOU WIN

  if (gameState == YOUWIN && mouseCooldown <= 0)
  {
    if (containsMouse(youwinretpos, buttonsize)) {
      playMouse();
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //LEVEL SELECTION

  if (gameState == LEVELSELECTION && mouseCooldown <= 0)
  {
    if (containsMouse(lsb1pos, buttonsize)) {
      playMouse();
      loadLevel(1);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsb2pos, buttonsize)) {
      playMouse();
      loadLevel(2);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsb3pos, buttonsize)) {
      playMouse();
      loadLevel(3);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsb4pos, buttonsize)) {
      playMouse();
      loadLevel(4);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsb5pos, buttonsize)) {
      playMouse();
      loadLevel(5);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsb6pos, buttonsize)) {
      playMouse();
      loadLevel(6);
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(lsbretpos, buttonsize)) {
      playMouse();
      gameState = MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //PAUSE MENU

  if (gameState == PAUSEMENU && mouseCooldown <= 0) {
    if (containsMouse(pauseb1pos, buttonsize)) {
      playMouse();
      gameState=PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(pauseb2pos, buttonsize)) {
      playMouse();
      resetLevel();
      gameState=PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(pauseb3pos, buttonsize)) {
      playMouse();
      gameState = LEVELSELECTION;
      mouseCooldown = cooldown;
    }
    if (containsMouse(pauseb4pos, buttonsize)) {
      playMouse();
      gameState=MAINMENU;
      mouseCooldown = cooldown;
    }

    //music control
    if (containsMouse(pausemus, buttonsize2)) {
      playMouse();
      musicControl = !musicControl;
      mouseCooldown = cooldown;
    }
    if (containsMouse(pausesfx, buttonsize2)) {
      if (!sfxControl) playMouse();
      sfxControl = !sfxControl;
      mouseCooldown = cooldown;
    }
  }

  //NEXT LEVEL

  if (gameState == NEXTLEVEL && mouseCooldown <=0)
  {

    if (containsMouse(nextb1pos, buttonsize)) {
      playMouse();
      gameState=PLAYING;
      mouseCooldown = cooldown;
    }

    if (containsMouse(nextb2pos, buttonsize)) {
      playMouse();
      gameState = LEVELSELECTION;
      mouseCooldown = cooldown;
    }

    if (containsMouse(nextb3pos, buttonsize)) {
      playMouse();
      gameState=MAINMENU;
      mouseCooldown = cooldown;
    }
  }

  //RETRY LEVEL

  if (gameState == RETRYLEVEL && mouseCooldown <=0)
  {
    if (containsMouse(retryb1pos, buttonsize))
    {
      playMouse();
      resetLevel();
      gameState = PLAYING;
      mouseCooldown = cooldown;
    }
    if (containsMouse(retryb2pos, buttonsize))
    {
      playMouse();
      gameState=MAINMENU;
      mouseCooldown = cooldown;
    }
  }
}



/////////MOVEMENT METHODS/////////

void movePlayerRight()
{
  playWalk(); //sound
  currentLevel[playerY][playerX] = 0; //free current position
  playerX++;
  currentLevel[playerY][playerX] = 2; //reposition player
  move = cooldown;
}

void movePlayerDown()
{
  playWalk(); //sound
  currentLevel[playerY][playerX] = 0;
  playerY++;
  currentLevel[playerY][playerX] = 2;
  move = cooldown;
}

void movePlayerLeft()
{
  playWalk(); //sound
  currentLevel[playerY][playerX] = 0;
  playerX--;
  currentLevel[playerY][playerX] = 2;
  move = cooldown;
}

void movePlayerUp()
{
  playWalk(); //sound
  currentLevel[playerY][playerX] = 0;
  playerY--;
  currentLevel[playerY][playerX] = 2;
  move = cooldown;
}

/////////PULL PUSH METHODS/////////


/////////PUSH/////////


void pushRight()
{
  //push right 
  currentLevel[playerY][playerX+2] = currentLevel[playerY][playerX+1];
  currentLevel[playerY][playerX+1] = 0;
  movePlayerRight();
}

void pushDown()
{
  //push down
  currentLevel[playerY+2][playerX] = currentLevel[playerY+1][playerX];
  currentLevel[playerY+1][playerX] = 0;
  movePlayerDown();
}

void pushLeft()
{
  //push left
  currentLevel[playerY][playerX-2] = currentLevel[playerY][playerX-1];
  currentLevel[playerY][playerX-1] = 0;
  movePlayerLeft();
}

void pushUp()
{
  //push up
  currentLevel[playerY-2][playerX] = currentLevel[playerY-1][playerX];
  currentLevel[playerY-1][playerX] = 0;
  movePlayerUp();
}


///////PULL///////


void pulltoLeft()
{
  movePlayerLeft();
  currentLevel[playerY][playerX+1] = currentLevel[playerY][playerX+2];
  currentLevel[playerY][playerX+2] = 0;
}


void pulltoDown()
{
  movePlayerDown();
  currentLevel[playerY-1][playerX] = currentLevel[playerY-2][playerX];
  currentLevel[playerY-2][playerX] = 0;
}


void pulltoRight()
{
  movePlayerRight();
  currentLevel[playerY][playerX-1] = currentLevel[playerY][playerX-2];
  currentLevel[playerY][playerX-2] = 0;
}


void pulltoUp()
{
  movePlayerUp();
  currentLevel[playerY+1][playerX] = currentLevel[playerY+2][playerX];
  currentLevel[playerY+2][playerX] = 0;
}


void movePlayer()
{
  int playerArea[] = {currentLevel[playerY][playerX+1], currentLevel[playerY+1][playerX], currentLevel[playerY][playerX-1], currentLevel[playerY-1][playerX]};
  //pulling 
  if (hold) 
  {
    if (playerArea[0] == 3 || playerArea[0] == 8 || playerArea[0] == 9 || playerArea[0] == 10) {
      pulling = true;
      if (left && move <=0 && currentLevel[playerY][playerX-1] == 0) {
        pulltoLeft();
        setAnim("animRighttoLeft");
      }
    }
    if (playerArea[1] == 3 || playerArea[1] == 8 || playerArea[1] == 9 || playerArea[1] == 10) {
      pulling = true;
      if (up && move <=0 && currentLevel[playerY-1][playerX] == 0) {
        pulltoUp();
        setAnim("animDowntoUp");
      }
    }

    if (playerArea[2] == 3 || playerArea[2] == 8 || playerArea[2] == 9 || playerArea[2] == 10) {
      pulling = true;
      if (right && move <=0 && currentLevel[playerY][playerX+1] == 0) 
      {
        pulltoRight();
        setAnim("animLefttoRight");
      }
    }

    if (playerArea[3] == 3 || playerArea[3] == 8 || playerArea[3] == 9 || playerArea[3] == 10) {
      pulling = true;
      if (down && move <=0 && currentLevel[playerY+1][playerX] == 0) { 
        pulltoDown();
        setAnim("animUptoDown");
      }
    }
  } else {

    //general movement


    if (right && move <=0)
      if (playerArea[0] == 0 || playerArea[0] == 14 || playerArea[0] == 15 || playerArea[0] == 16) {
        pulling = false;
        movePlayerRight();
        setAnim("animRight");
      }

    if (down && move <= 0)
      if (playerArea[1] == 0  || playerArea[1] == 14 || playerArea[1] == 15 || playerArea[1] == 16) {
        pulling = false;
        movePlayerDown();
        setAnim("animDown");
      }
    if (left && move <=0)
      if (playerArea[2] == 0 || playerArea[2] == 14 || playerArea[2] == 15 || playerArea[2] == 16) {
        pulling = false;
        movePlayerLeft();
        setAnim("animLeft");
      }
    if (up && move <=0)
      if (playerArea[3] == 0  || playerArea[3] == 14 || playerArea[3] == 15 || playerArea[3] == 16) {
        pulling = false;
        movePlayerUp();
        setAnim("animUp");
      }
  }
  //pushing

  if (playerArea[0] == 3 || playerArea[0] == 8 || playerArea[0] == 9 || playerArea[0] == 10) 
    if (right && move <=0 && currentLevel[playerY][playerX+2] == 0) {
      pulling = false;
      pushRight();
      setAnim("animRight");
    }

  if (playerArea[1] == 3 || playerArea[1] == 8 || playerArea[1] == 9 || playerArea[1] == 10)  
    if (down && move <=0 && currentLevel[playerY+2][playerX] == 0) { 
      pulling = false;
      pushDown();
      setAnim("animDown");
    }

  if (playerArea[2] == 3 || playerArea[2] == 8 || playerArea[2] == 9 || playerArea[2] == 10)
    if (left && move <=0 && currentLevel[playerY][playerX-2] == 0) {
      pulling = false;
      pushLeft();
      setAnim("animLeft");
    }

  if (playerArea[3] == 3 || playerArea[3] == 8 || playerArea[3] == 9 || playerArea[3] == 10)
    if (up && move <=0 && currentLevel[playerY-2][playerX] == 0) {
      pulling = false;
      pushUp();
      setAnim("animUp");
    }
}