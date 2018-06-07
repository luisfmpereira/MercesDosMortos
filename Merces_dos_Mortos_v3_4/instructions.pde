int interCount = 0;
int objCount = 0;
String tutString;

boolean interFlag, objFlag;


//controls animation of the interaction page
void interactionPage()
{
  if (interCount <= 30) image(inter1, 0, 0);
  if (interCount > 30 && interCount <= 60) image(inter2, 0, 0);

  interCount++;
  if (interCount == 61) interCount = 0;
}

//controls animation of the object page
void objectPage()
{
  if (objCount <= 30) image(obj1, 0, 0);
  if (objCount > 30 && objCount < 60) image(obj2, 0, 0);

  objCount++;
  if (objCount == 61) objCount = 0;
}


//controls level 1 tutorial
void tutorial(String type)
{

  if (type.equals("interaction")) {
    interactionPage();
  }

  if (type.equals("object")) {
    objectPage();
  }

  if (delayTime(starttime, waittime)) {
    textSize(15);
    text("pressione 'e'", width/2, 640);
    if (read && type.equals("interaction")) {
      gameState = PLAYING;
      interFlag = false;
    }
    if (read && type.equals("object")) {
      gameState = PLAYING;
      objFlag = false;
    }
  }
}