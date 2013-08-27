class BackgroundSquare extends GameObject
{
  BackgroundSquare(PVector loc, int radius)
  {
    super(new PVector(), loc, radius);
  }

  void show()
  {
    fill(0, 0);
    stroke(0, 255);
    rect(loc, radius);
    noStroke();
  }
}

