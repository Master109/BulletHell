class Mist extends GameObject
{
  int opacity;

  Mist(PVector vel, PVector loc)
  {
    super(vel, loc, 10, 5, color(255));
    
    opacity = 255;
    
    loc.add(PVector.mult(vel, 3));
  }

  Mist(PVector loc)
  {
    this(PVector.mult(PVector.random2D(), 10), loc);
  }

  void show()
  {
    fill(0, 0);
    stroke(opacity, 255, 255, opacity);
    
    super.show();
  }

  boolean run()
  {
    super.run();
    
    opacity -= random(10, 20);

    return opacity > 0; //the mist dies when it becomes transparent
  }
}

