class Mist extends GameObject
{
  int opacity;

  Mist(PVector vel, PVector loc)
  {
    super(vel, loc, 10, 5);
    
    opacity = 255;
  }

  Mist(PVector loc)
  {
    this(PVector.mult(PVector.random2D(), 10), loc);
  }

  void show()
  {
    stroke(255, 0, 0, opacity);
    ellipse(loc, 10);
  }

  boolean run()
  {
    super.run();
    
    opacity -= random(10, 20);

    return opacity > 0; //the mist dies when it becomes transparent
  }
}

