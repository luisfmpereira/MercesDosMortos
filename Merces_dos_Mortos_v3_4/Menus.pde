//buttons variables
PVector buttonsize, buttonsize2;
PVector mainb1pos, mainb2pos, mainb3pos, mainb4pos; //main menu button positions
PVector lsb1pos, lsb2pos, lsb3pos, lsb4pos, lsb5pos, lsb6pos, lsbretpos; //level selection menu button positions
PVector pauseb1pos, pauseb2pos, pauseb3pos, pauseb4pos; //pause menu button positions
PVector retryb1pos, retryb2pos; //retry screen button positions
PVector nextb1pos, nextb2pos, nextb3pos; //next level button positions
PVector instretpos, instnextpos, instbackpos; //instructions screen button positions
PVector credretpos; //credits screen button positions
PVector youwinretpos; //credits screen button positions

PVector pos0, screensize;

PVector pausemus, pausesfx;//music control variables

//counters for menus
int instructionCount; // change instructions page

// death indicators
int deathIndicator;
final int dENEMY = 1;
final int dTIME = 2;


//GAMESTATES
final int PLAYING = 0;
final int WELCOME = 1;
final int MAINMENU = 2;
final int LEVELSELECTION = 3;
final int PAUSEMENU = 4;
final int RETRYLEVEL = 5;
final int NEXTLEVEL = 6;
final int INSTRUCTIONS = 7;
final int CREDITS = 8;
final int READING = 9;
final int YOUDIED = 10;
final int TUTORIAL = 11;
final int YOUWIN = 12;

//global

int gameState;

//welcome screen
int alpha = 150, growth = 2;

void loadButtonSettings()
{
  
  //define buttons positions with PVectors
  
  pos0 = new PVector(0,0);
  screensize = new PVector(896,704);
  
  buttonsize = new PVector (256, 64);
  buttonsize2 = new PVector (64, 64);

  pauseb1pos = new PVector(320, 192);
  pauseb2pos = new PVector(320, 320);
  pauseb3pos = new PVector(320, 448);
  pauseb4pos = new PVector(320, 576);

  pausemus = new PVector(96, 64);
  pausesfx = new PVector(224, 64);

  mainb1pos = new PVector(64, 192);
  mainb2pos = new PVector(64, 320);
  mainb3pos = new PVector(64, 448);
  mainb4pos = new PVector(64, 576);

  lsb1pos = new PVector(64, 128);
  lsb2pos = new PVector(320, 128);
  lsb3pos = new PVector(576, 128);
  lsb4pos = new PVector(64, 320);
  lsb5pos = new PVector(320, 320);
  lsb6pos = new PVector(576, 320);
  lsbretpos = new PVector(64, 576);

  instretpos = new PVector(320, 576);
  instnextpos = new PVector(608, 64);
  instbackpos = new PVector(32, 64);

  credretpos = new PVector(576, 608);
  youwinretpos = new PVector(576, 576);

  nextb1pos = new PVector(320, 320);
  nextb2pos = new PVector(320, 448);
  nextb3pos = new PVector(320, 576);

  retryb1pos = new PVector(320, 320);
  retryb2pos = new PVector(320, 448);
}

/////WELCOME SCREEN/////
void welcome_screen()
{
  textFont(pixel);

  background(welcomeIm);

  if (alpha >= 255) {
    growth *=-1;
  } else if (alpha <= 50) {
    growth *=-1;
  }

  alpha += growth;

  fill(255, 255, 255, alpha);
  textSize(22);
  text("clique na tela para continuar", 150, 600);
 
}

/////MAIN MENU/////

void main_menu()
{
  background(mainmenuIm);
  drawButton("Jogar", buttonsize, mainb1pos, 40, 255);
  drawButton("Como Jogar", buttonsize, mainb2pos, 21, 255);
  drawButton("Créditos", buttonsize, mainb3pos, 25, 255);
  drawButton("Sair", buttonsize, mainb4pos, 30, 255);

  musicController();
}


/////LEVEL SELECTION/////

void level_selection()
{
  background(lvlselectionIm);
  drawButton("Level 1", buttonsize, lsb1pos, 30, 255);
  drawButton("Level 2", buttonsize, lsb2pos, 30, 255);
  drawButton("Level 3", buttonsize, lsb3pos, 30, 255);
  drawButton("Level 4", buttonsize, lsb4pos, 30, 255);
  drawButton("Level 5", buttonsize, lsb5pos, 30, 255);
  drawButton("Level 6", buttonsize, lsb6pos, 30, 255);
  drawButton("Menu Principal", buttonsize, lsbretpos, 20, 255);
}

/////INSTRUCTIONS/////


void instructions()
{
  imageMode(CORNER);
  //"Como Jogar" page
  if (instructionCount == 0) { 
    image(instructions, 0, 0);
    drawButton("Menu Principal", buttonsize, instbackpos, 20, 0);
    drawButton("Próxima página", buttonsize, instnextpos, 20, 0);
  }

  //"Interação" page
  if (instructionCount == 1) {

    interactionPage();

    drawButton("Página anterior", buttonsize, instbackpos, 20, 0);
    drawButton("Próxima página", buttonsize, instnextpos, 20, 0);
  }

  //"Objetos" page
  if (instructionCount == 2) {

    //image control
    objectPage();

    drawButton("Página anterior", buttonsize, instbackpos, 20, 0);
    drawButton("Menu Principal", buttonsize, instnextpos, 20, 0);
  }
}

/////CREDITS/////

void credits()
{
  background(creditsIm);
  drawButton("Menu Principal", buttonsize, credretpos, 20, 255);
}

/////PAUSE MENU/////

void pause_menu()
{
  background(0);
  drawButton("Retornar", buttonsize, pauseb1pos, 25, 255);
  drawButton("Recomeçar", buttonsize, pauseb2pos, 22, 255);
  drawButton("Seleção de Level", buttonsize, pauseb3pos, 20, 255);
  drawButton("Menu Principal", buttonsize, pauseb4pos, 20, 255); 

  musicController();
}

/////RETRY MENU/////

void retry_level()
{
  if (deathIndicator == dENEMY) background(retryEnemy);
  if (deathIndicator == dTIME) background(retryTime);

  drawButton("Recomeçar", buttonsize, retryb1pos, 22, 255);
  drawButton("Menu Principal", buttonsize, retryb2pos, 20, 255);
}

/////NEXT MENU/////

void next_level()
{
  background(0);
  drawButton("Próximo Level", buttonsize, nextb1pos, 20, 255);
  drawButton("Seleção de Level", buttonsize, nextb2pos, 20, 255);
  drawButton("Menu Principal", buttonsize, nextb3pos, 20, 255);
}

void youwin()
{
  background(youwinIm);
  drawButton("Menu Principal", buttonsize, youwinretpos, 20, 255);
}


/////BUTTON METHODS/////

void drawButton(String text, PVector buttonSize, PVector position, float textSize, color textColor)
{
  textFont(pixel);
  //hover mouse definition
  if (containsMouse(position, buttonsize)) textSize *= 1.2;

  //write text
  fill(textColor);
  textAlign(CENTER, CENTER);
  textSize(textSize);
  text(text, position.x, position.y, buttonSize.x, buttonSize.y);
}

//check collision with mouse
boolean containsMouse(PVector pos, PVector size)
{
  pos = new PVector (pos.x, pos.y);
  size = new PVector (size.x, size.y);

  if (mouseY > pos.y && mouseY < pos.y + size.y && mouseX > pos.x && mouseX < pos.x + size.x)
    return true;
  return false;
}