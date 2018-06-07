import ddf.minim.*;
Minim minim;
AudioPlayer mainmenu, playing, boxStone, walkStone, lever, fence, fencefail, door, mouse;

boolean musicControl, sfxControl;



void loadSounds()
{
  musicControl = true;
  sfxControl = true;

  minim = new Minim(this);

  //music
  mainmenu = minim.loadFile("m_menu.wav");
  playing = minim.loadFile("m_playing3.wav");


  //sfx
  lever = minim.loadFile("m_ lever.wav");
  walkStone = minim.loadFile("m_walkstone.wav");
  fence = minim.loadFile("m_fence.wav");
  fencefail = minim.loadFile("m_fencefail.wav");
  door = minim.loadFile("m_door.wav");
  mouse = minim.loadFile("m_mouse.wav");
}


void playSounds()
{
  //on off control

  if (musicControl) {

    playing.setGain(-5);
    mainmenu.setGain(-5);
  } else if (musicControl == false) {

    playing.setGain(-100);
    mainmenu.setGain(-100);
  }

  if (sfxControl) {
    walkStone.setGain(-5);
    lever.setGain(0);
    fence.setGain(-30);
    fencefail.setGain(0);
    door.setGain(30);
    mouse.setGain(0);
  } else if (!sfxControl) {
    walkStone.setGain(-80);
    lever.setGain(-80);
    fence.setGain(-80);
    fencefail.setGain(-80);
    door.setGain(-80);
    mouse.setGain(-80);
  }


  if (gameState == WELCOME || gameState == MAINMENU || gameState == LEVELSELECTION || gameState == INSTRUCTIONS || gameState == CREDITS) {

    playing.pause();
    playing.rewind();

    if (mainmenu.isPlaying() == false) {
      mainmenu.rewind();
      mainmenu.play();
    }
  }

  if (gameState == PLAYING || gameState == READING || gameState == YOUWIN || gameState == TUTORIAL) {

    mainmenu.pause();
    mainmenu.rewind();

    if (musicControl) playing.setGain(0);

    if (playing.isPlaying() == false) {
      playing.rewind();
      playing.play();
    }
  }

  if (gameState == PAUSEMENU || gameState == NEXTLEVEL || gameState == RETRYLEVEL) {

    if (musicControl) playing.setGain(-10);

    if (playing.isPlaying() == false) {
      playing.rewind();
      playing.play();
    }
  }
}

void playWalk()
{
  walkStone.play();
  walkStone.rewind();
}

void playLever()
{
  lever.rewind();
  lever.play();
}

void playFence()
{
  fence.rewind();
  fence.play();
}

void playFenceFail()
{
  fencefail.rewind();
  fencefail.play();
}

void playDoor()
{
  door.rewind();
  door.play();
}

void playMouse()
{
  mouse.rewind();
  mouse.play();
}



void musicController() {
  //music control
  imageMode(CENTER);
  //music
  if (musicControl) {
    if (containsMouse(pausemus, buttonsize2)) {
      musicIcon.resize(80, 80);
    } else musicIcon.resize(64, 64);

    image(musicIcon, pausemus.x+32, pausemus.y+32);
  }
  if (!musicControl) {
    if (containsMouse(pausemus, buttonsize2)) {
      nomusicIcon.resize(80, 80);
    } else nomusicIcon.resize(64, 64);

    image(nomusicIcon, pausemus.x+32, pausemus.y+32);
  }

  //sfx
  if (sfxControl) {
    if (containsMouse(pausesfx, buttonsize2)) {
      sfxIcon.resize(80, 80);
    } else sfxIcon.resize(64, 64);

    image(sfxIcon, pausesfx.x+32, pausesfx.y+32);
  }
  if (!sfxControl) {
    if (containsMouse(pausesfx, buttonsize2)) {
      nosfxIcon.resize(80, 80);
    } else nosfxIcon.resize(64, 64);

    image(nosfxIcon, pausesfx.x+32, pausesfx.y+32);
  }
}