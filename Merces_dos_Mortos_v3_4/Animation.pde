//animation variables
boolean animRight, animDown, animLeft, animUp;
boolean animRighttoLeft, animDowntoUp, animLefttoRight, animUptoDown;
float animationStep;
float animTime = 0;

//enemy animation
boolean [] enemyanimRight = {false, false, false};
boolean [] enemyanimDown = {false, false, false};
boolean [] enemyanimLeft = {false, false, false};
boolean [] enemyanimUp = {false, false, false};
float [] enemyStep  = {0, 0, 0};
float [] enemyanimTime = {0, 0, 0};

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int count;

  Animation(String filename, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {

      images[i] = loadImage(dataPath(filename+i+".png"));
    }
  }

  void display(float xpos, float ypos) {
    count++;
    if (count % 2 == 0)
    {
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos);
  }
}

///////ENEMY ANIMATION///////

//set enemy animation varibles

void setEnemyAnim(String type, int enemynumber)
{

  if (type.equals("right")) enemyanimRight[enemynumber] = true;
  if (type.equals("down")) enemyanimDown[enemynumber] = true;
  if (type.equals("left")) enemyanimLeft[enemynumber] = true;
  if (type.equals("up"))  enemyanimUp[enemynumber] = true;

  enemyanimTime[enemynumber] = 9;
  enemyStep[enemynumber] = 0.25;
}

//enemy animation movements

void enemyAnimation(PVector enemy, int enemynumber)
{
  //animation to the right
  if (enemyanimRight[enemynumber]) {
    enemyidleImage[enemynumber] = enemyRight;
    if (enemyanimTime[enemynumber] > 0) {
      enemyanimTime[enemynumber]-=4;
      enemyStep[enemynumber] += 0.25;
    } else
      enemyanimRight[enemynumber] = false;
    enemyanimateRight.display((round(enemy.x)-1+enemyStep[enemynumber])*64.0, (enemy.y)*64.0);
  }
//animation down
  if (enemyanimDown[enemynumber]) {
    enemyidleImage[enemynumber] = enemyDown;
    if (enemyanimTime[enemynumber] > 0) {
      enemyanimTime[enemynumber]-=4;
      enemyStep[enemynumber] += 0.25;
    } else
      enemyanimDown[enemynumber] = false;
    enemyanimateDown.display(round(enemy.x)*64.0, (round(enemy.y)-1+enemyStep[enemynumber])*64.0);
  }
//animation to the left
  if (enemyanimLeft[enemynumber]) {
    enemyidleImage[enemynumber] = enemyLeft;
    if (enemyanimTime[enemynumber] > 0) {
      enemyanimTime[enemynumber]-=4;
      enemyStep[enemynumber] += 0.25;
    } else
      enemyanimLeft[enemynumber] = false;
    enemyanimateLeft.display((round(enemy.x)+1-enemyStep[enemynumber])*64.0, (enemy.y)*64.0);
  }
  //animation up
  if (enemyanimUp[enemynumber]) {
    enemyidleImage[enemynumber] = enemyUp;
    if (enemyanimTime[enemynumber] > 0) {
      enemyanimTime[enemynumber]-=4;
      enemyStep[enemynumber] += 0.25;
    } else
      enemyanimUp[enemynumber] = false;
    enemyanimateUp.display(round(enemy.x)*64.0, (round(enemy.y)+1-enemyStep[enemynumber])*64.0);
  }
}

///////PLAYER ANIMATION///////

//set player animation varibles every time the animation is ready to play

void setAnim(String type)
{

  if (type.equals("animRight")) animRight = true;
  if (type.equals("animDown")) animDown = true;
  if (type.equals("animLeft")) animLeft = true;
  if (type.equals("animUp"))  animUp = true;

  if (type.equals("animRighttoLeft")) animRighttoLeft = true;
  if (type.equals("animDowntoUp")) animDowntoUp = true;
  if (type.equals("animLefttoRight")) animLefttoRight = true;
  if (type.equals("animUptoDown")) animUptoDown = true;

  animTime = 9;
  animationStep = 0.25;
}


//player animation movements

void animation()
{
  if (animRight) {
    idleImage = playerRight;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animRight = false;
    animateRight.display((playerX-1+animationStep)*64.0, playerY*64.0);
  }

  if (animDown) {
    idleImage = playerDown;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animDown = false;
    animateDown.display((playerX)*64.0, (playerY-1+animationStep)*64.0);
  }

  if (animLeft) {
    idleImage = playerLeft;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animLeft = false;
    animateLeft.display((playerX+1-animationStep)*64.0, (playerY)*64.0);
  }

  if (animUp) {
    idleImage = playerUp;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animUp = false;
    animateUp.display((playerX)*64.0, (playerY+1-animationStep)*64.0);
  }


  if (animRighttoLeft) {
    idleImage = playerRight;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animRighttoLeft = false;
    animateRight.display((playerX+1-animationStep)*64.0, playerY*64.0);
  }

  if (animDowntoUp) {
    idleImage = playerDown;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animDowntoUp = false;
    animateDown.display((playerX)*64.0, (playerY+1-animationStep)*64.0);
  }

  if (animLefttoRight) {
    idleImage = playerLeft;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animLefttoRight = false;
    animateLeft.display((playerX-1+animationStep)*64.0, (playerY)*64.0);
  }

  if (animUptoDown) {
    idleImage = playerUp;
    if (animTime > 0) {
      animTime-=4;
      animationStep += 0.25;
    } else
      animUptoDown = false;
    animateUp.display((playerX)*64.0, (playerY-1+animationStep)*64.0);
  }
}