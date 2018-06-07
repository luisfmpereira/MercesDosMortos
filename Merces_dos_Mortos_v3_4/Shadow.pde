void shadow(int posX, int posY, int radius)
{
  float distanceP;
  loadPixels();


  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {
      int loc = x + y * width;

      float r = red  (pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue (pixels[loc]);

      distanceP = dist(x, y, (posX*1.0 + 0.5) * 64, (posY*1.0 + 0.5) * 64); //personagem

      float intense = 1; 
      float adjustBrightness;

      adjustBrightness = map(distanceP, 0, radius, intense, 0.2);

      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
}


int shadowClamp(int value, int type)
{
  int result = 0;
  if (type == 0) {
    if (value > 800)
      result= (800 + 240)/3;
    else
      result= (value + 240)/3;
  } else if (type == 1) {
    if (value > 200)
      result= (200 + 240)/3;
    else
      result= (value + 240)/3;
  }
  return result;
}