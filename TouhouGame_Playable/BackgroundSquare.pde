class BackgroundSquare extends GameObject
{
  float excitement;
  float excitementVel;

  BackgroundSquare(PVector loc, int radius)
  {
    super(new PVector(), loc, radius, 0, color(0));

    excitement = 0;
    excitementVel = 0;
  }

  void show()
  {
    fill(0, excitement * 40);
    stroke(0, 255);
    strokeWeight(0);
    translate(PVector.mult(loc, BACKGROUND_SQUARE_SPACING));
    rect(radius);
    noStroke();
  }

  boolean run()
  {
    super.run();
  
    //let's bleed some of our excitement to the four neighboring squares
    float excitementTransfer = excitement * .01;
    transferExcitementTo(loc.x + 1, loc.y, excitementTransfer);
    transferExcitementTo(loc.x - 1, loc.y, excitementTransfer);
    transferExcitementTo(loc.x, loc.y + 1, excitementTransfer);
    transferExcitementTo(loc.x, loc.y - 1, excitementTransfer);

    excitement *= .99;

    excitementVel += -excitement * .01;
    excitement += excitementVel;

    return true;
  }

  void excite(float amount)
  {
    excitement += amount;
  }

  void transferExcitementTo(float rawx, float rawy, float amount)
  {
    if(exciteBackgroundSquare(rawx, rawy, amount))
      excitement -= amount;
  }
}

boolean exciteBackgroundSquare(float rawx, float rawy, float amount)
{
  int x = int(rawx);
  int y = int(rawy);

  if (x >= 0 && y >= 0 && x < width/BACKGROUND_SQUARE_SPACING && y < height/BACKGROUND_SQUARE_SPACING)
  {
    backgroundSquares[x][y].excite(amount);
    return true;
  }
  
  return false;
}

