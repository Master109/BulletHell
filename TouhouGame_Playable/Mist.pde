class Mist extends GameObject
{
  int a;

  Mist(PVector loc)
  {
    super(PVector.mult(PVector.random2D(), 10), loc, 10, 5);
    
    a = 255;
  }

  void show()
  {
    stroke(255, 0, 0, a);
    ellipse(loc, 10);
    
    print(loc);
  }

  boolean run()
  {
    super.run();
    
    a -= 10;

    return a > 0; //the mist dies when it becomes transparent
  }
}

