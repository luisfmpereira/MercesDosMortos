void setup()
{
  //screen
  size(896, 704);
  frameRate(30);

  //initialize variables
  up = false;
  down = false;
  left = false;
  right = false;
  hold = false;
  pauseMenu = false;

  enemyCooldown = 5 * cooldown;
  mouseCooldown = 3 * cooldown;

  candleText = true; //set trigger for candle text
  interFlag = true; //set trigger for tutorial
  objFlag = true; //set trigger for tutorial


  //load
  loadImages();
  loadSounds();
  loadButtonSettings();

  //load welcome
  gameState = WELCOME;
}

void draw()
{
  cooldown = round(frameRate/3);
  mouseCooldown--;
  playSounds();

  //GAME STATE SWITCH

  switch (gameState)
  {

    //WELCOME SCREEN

    case(WELCOME):
    {
      welcome_screen();
      break;
    }

    //MAIN MENU    

    case(MAINMENU):
    {
      main_menu();
      break;
    }

    //INSTRUCTIONS MENU

    case(INSTRUCTIONS):
    {
      instructions();
      break;
    }

    //credits

    case(CREDITS):
    {
      credits();
      break;
    }

    //LEVEL SELECTION MENU

    case(LEVELSELECTION):
    {
      level_selection();
      break;
    }

    //PAUSE MENU

    case(PAUSEMENU):
    {
      pause_menu();

      break;
    }

    //RETRY LEVEL

    case (RETRYLEVEL):
    {
      retry_level();
      break;
    }

    //RETRY LEVEL

    case (NEXTLEVEL):
    {
      next_level();
      break;
    }

    case (READING):
    {
      drawText();//writes text onscreen
      textControl();//controls pressing and timing of dialogue 

      break;
    }

    case (TUTORIAL):
    {
      tutorial(tutString);//draw  tutorial screen
      break;
    }

    case (YOUWIN):
    {
      youwin();
      break;
    }

    //INGAME

    case(PLAYING):
    {

      drawLevel(); // draw current level assets
      callEnemy(); // calls enemy animation and movement
      animation(); // calls animations

      textInteraction(); // calls interaction with readable objects
      candleTextInfo();//shows info for candle text

      movePlayer(); //all player movement
      enemyMove--; //refresh enemy cooldown
      move--; //refresh player cooldown

      //cheatcode not activated
      if (!cheatcode) {
        timerMax--; //refresh timer

        if (levelState == 5) shadow(playerX, playerY, shadowClamp(timerMax, 1));//level 5 with smaller radius light 
        else shadow(playerX, playerY, shadowClamp(timerMax, 0));//draws shadow around player
      }

      //cheatcode activated locks timer and draws larger area around player
      else if (cheatcode) {
        shadow(playerX, playerY, 500);

        //indicator that cheat is on
        image(cheat, 384, 640);
      }


      //onscreen timer 
      //textSize(20);
      //fill(255);
      //text((timerMax+ 60)/60, width/2, 30);


      //pause menu call
      if (pauseMenu) {
        playMouse();
        gameState = PAUSEMENU;
        pauseMenu = false;
        mouseCooldown = cooldown;
      }
      break;
    }
  }
}