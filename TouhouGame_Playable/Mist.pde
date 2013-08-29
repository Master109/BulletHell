class Mist extends GameObject
{
  int opacity;

  Mist(PVector loc)
  {
    super(PVector.mult(PVector.random2D(), 10), loc, 10, 5);
    
    opacity = 255;
  }

  void show()
  {
    stroke(255, 0, 0, opacity);
    ellipse(loc, 10);
    
    print(loc);
  }

  boolean run()
  {
    super.run();
    
    opacity -= random(5, 10);

    return opacity > 0; //the mist dies when it becomes transparent
  }
}

