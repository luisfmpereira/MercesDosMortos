PImage level1Im, level2Im, level3Im, level4Im, level5Im, level6Im;//level images
PImage boxIm, leverOffIm, leverOnIm, doorClosedIm, doorClosed2Im, fenceClosedIm, fence2ClosedIm, key1Im, key2Im, key3Im; //interactables
PImage bookshelfTopIm, bookshelfBotIm;//bookshelf for level1
PImage welcomeIm, mainmenuIm, lvlselectionIm, creditsIm, youwinIm;//menus
PImage musicIcon, sfxIcon, nomusicIcon, nosfxIcon;//music control
PImage retryEnemy, retryTime;//death indicators
PImage dialogueboxIm, dialoguearrowIm;//dialogue
PImage instructions, inter1, inter2, obj1, obj2; //instructions menus
PImage readingE;//interaction indicator ('e' key on top of player's head)
PImage cheat;


//idle images
PImage idleImage; //player global
PImage [] enemyidleImage = new PImage [3]; //enemy global
PImage playerRight, playerDown, playerLeft, playerUp; //player idle sprites
PImage enemyRight, enemyDown, enemyLeft, enemyUp; //enemy idle sprites

//animation images
Animation animateRight, animateDown, animateLeft, animateUp;
Animation enemyanimateRight, enemyanimateDown, enemyanimateLeft, enemyanimateUp;
Animation fenceUp, fenceDown;

void loadImages()
{

  enemyanimateRight = new Animation("inimigo/right", 4);
  enemyanimateDown = new Animation("inimigo/down", 4);
  enemyanimateLeft = new Animation("inimigo/left", 4);
  enemyanimateUp = new Animation("inimigo/up", 4);

  //set all animation booleans as false
  animRight = animDown = animLeft = animUp = false;
  animRighttoLeft = animDowntoUp = animLefttoRight = animUptoDown = false;

  animateRight = new Animation("joaoleite/Right", 4);
  animateDown = new Animation("joaoleite/Down", 4);
  animateLeft = new Animation("joaoleite/Left", 4);
  animateUp = new Animation("joaoleite/Up", 4);

  //menus

  welcomeIm = loadImage("welcomescreen.png");
  mainmenuIm = loadImage("mainmenu.png");
  lvlselectionIm = loadImage("lvlselection.png");
  creditsIm = loadImage("credits.png");
  retryEnemy = loadImage("retryenemy.png");
  retryTime = loadImage("retrytime.png");
  youwinIm = loadImage("youwin.png");
  instructions = loadImage(dataPath("instrucoes/instrucoes.png"));
  inter1 = loadImage(dataPath("instrucoes/inter1.png"));
  inter2 = loadImage(dataPath("instrucoes/inter2.png"));
  obj1 = loadImage(dataPath("instrucoes/obj1.png"));
  obj2 = loadImage(dataPath("instrucoes/obj2.png"));

  //UI objects
  readingE = loadImage("reading2.png");
  musicIcon = loadImage("musicicon.png");
  sfxIcon = loadImage("sfxicon.png");
  nomusicIcon = loadImage("nomusicicon.png");
  nosfxIcon = loadImage("nosfxicon.png");

  //dialogue
  dialogueboxIm = loadImage("dialoguebox.png");
  dialoguearrowIm = loadImage("dialoguearrow.png");

  //// FONT ////
  pixel = loadFont("PressStart2P-30.vlw"); 

  //player and enemy idle images
  playerRight = loadImage(dataPath("joaoleite/Right0.png"));
  playerDown = loadImage(dataPath("joaoleite/Down0.png"));
  playerLeft = loadImage(dataPath("joaoleite/Left0.png"));
  playerUp = loadImage(dataPath("joaoleite/Up0.png"));

  enemyRight = loadImage(dataPath("inimigo/right0.png"));
  enemyDown = loadImage(dataPath("inimigo/down0.png"));
  enemyLeft = loadImage(dataPath("inimigo/left0.png"));
  enemyUp = loadImage(dataPath("inimigo/up0.png"));


  //levels
  level1Im = loadImage ("level1.png");
  level2Im = loadImage ("level2.png");
  level3Im = loadImage ("level3.png");
  level4Im = loadImage ("level4.png");
  level5Im = loadImage ("level5.png");
  level6Im = loadImage ("level6.png");

  //interactables
  leverOffIm = loadImage("leveroff.png");
  leverOnIm = loadImage("leveron.png");
  boxIm = loadImage("box.png");
  key1Im = loadImage("key1.png");
  key2Im = loadImage("key2.png");
  key3Im = loadImage("key3.png");

  //extra furniture
  doorClosedIm = loadImage("doorclosed.png");
  doorClosed2Im = loadImage("doorclosed2.png");
  fenceClosedIm = loadImage("fenceclosed.png");
  fence2ClosedIm = loadImage("fenceclosed2.png");  
  bookshelfTopIm = loadImage("bookshelf_top.png");
  bookshelfBotIm = loadImage("bookshelf_base.png");

  /////CHEAT CODE INDICATOR/////
  cheat = loadImage("cheat.png");
}