/*
 // 0 - caminho
 // 1 - parede
 // 2 - jogador
 // 3 - caixa
 // 4 - alavanca
 // 5 - alavanca acionada
 // 6 - porta fechada
 // 7 - grade fechada
 // 8 - chave 1
 // 9 - chave 2
 // 10- chave 3
 // 11- level exit
 // 12- bookshelf top
 // 13- bookshelf bottom
 // 14- inimigo
 // 15- inimigo2
 // 16- inimigo3
 // 17- porta fechada2
 // 18- grade2
 */

//////LEVEL DEFINITION//////
int levelState;
final int lvl1 = 1;
final int lvl2 = 2;
final int lvl3 = 3;
final int lvl4 = 4;
final int lvl5 = 5;
final int lvl6 = 6;

///////MAPS///////
int [][] currentLevel;

int [][] level1 = 
  {    
  {1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 6, 1, 0, 0}, 
  {1, 0, 0, 3, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0}, 
  {1, 1,12,12, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0}, 
  {1, 1,13,13, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0}, 
  {1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0}, 
  {1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
};
int [][] level2 = 
  {    
  {1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 1, 7, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1}, 
  {1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1}, 
  {1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
};
int [][] level3 = 
  {    
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1}, 
  {1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1}, 
  {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
  {1, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
  {1, 1, 1, 7, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 1}, 
  {1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1, 7, 7, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
};
int [][] level4 = 
  {    
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 1, 1, 1, 9, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0,10, 0, 1}, 
  {1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 1, 1,18,18, 1, 1, 1,18,18, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
  {1, 1,17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
};
int [][] level5 = 
  {    
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11, 1}, 
  {1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1}, 
  {1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1}, 
  {1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1}, 
  {1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1}, 
  {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1}, 
  {1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
};
int [][] level6 = 
  {    
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 8, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3, 1}, 
  {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1}, 
  {1, 1,18, 1, 1, 0, 0, 0, 0, 1,18, 1, 1, 1}, 
  {1, 0, 0, 0, 1, 1,18,18, 1, 1, 0, 0, 4, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1,18, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1}, 
  {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1}, 
  {1,10, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 9, 1}, 
  {1, 1, 1, 1, 1, 1,17,17, 1, 1, 1, 1, 1, 1}, 
};

//draw assets according to number
void drawAsset(int type, int posY, int posX)
{
  if (type == 2 && animTime<=0) image(idleImage, posX*64, posY*64); // player
  if (type == 3) image(boxIm, posX*64, posY*64); // box
  if (type == 4) image(leverOffIm, posX*64, posY*64); // lever off
  if (type == 5) image(leverOnIm, posX*64, posY*64); // lever on
  if (type == 6) image(doorClosedIm, posX*64, posY*64); // door closed
  if (type == 7) image(fenceClosedIm, posX*64, posY*64); // door closed
  if (type == 8) image(key1Im, posX*64, posY*64); // key 1
  if (type == 9) image(key2Im, posX*64, posY*64); // key 2
  if (type == 10) image(key3Im, posX*64, posY*64); // key 3 
  if (type == 12) image(bookshelfTopIm, posX*64, posY*64); // bookshelf top
  if (type == 13) image(bookshelfBotIm, posX*64, posY*64); // bookshelf bottom
  if (type == 14 && enemyanimTime[0] <=0) image(enemyidleImage[0], posX*64, posY*64); // enemy
  if (type == 15 && enemyanimTime[1] <=0) image(enemyidleImage[1], posX*64, posY*64); // enemy
  if (type == 16 && enemyanimTime[2] <=0) image(enemyidleImage[2], posX*64, posY*64); // enemy
  if (type == 17) image(doorClosed2Im, posX*64, posY*64); // door closed 2
  if (type == 18) image(fence2ClosedIm, posX*64, posY*64); // fence closed 2
}


//draw level according to levelstate
void drawLevel()
{
  imageMode(CORNER);
  
  if (levelState == lvl1) {
    level1();
    image (level1Im, 0, 0);
  } 
  if (levelState == lvl2) { 
    level2();
    image (level2Im, 0, 0);
  }  
  if (levelState == lvl3) { 
    level3();
    image (level3Im, 0, 0);
  }
  if (levelState == lvl4) { 
    level4();
    image (level4Im, 0, 0);
  }
  if (levelState == lvl5) { 
    level5();
    image (level5Im, 0, 0);
  }
  if (levelState == lvl6) { 
    level6();
    image (level6Im, 0, 0);
  }

  //go through each position of the current level array and draw according to the number
  for (int i = 0; i < currentLevel.length; i++)
    for (int j = 0; j < currentLevel[i].length; j++)
      drawAsset(currentLevel[i][j], i, j);
}


//copy array method - not reference
int [][] copyArray (int [][] array)
{
  int [][] array2 = new int[array.length][array[0].length]; 

  for (int i = 0; i < array.length; i++)
    for (int j = 0; j < array[i].length; j++)
      array2[i][j] = array[i][j];

  return array2;
}