class Mist extends GameObject
{
  int a;
  boolean exists;

  Mist(PVector loc, int a)
  {
    super(new PVector(), loc, 10);
    
    this.loc = loc;
    this.a = a;
    this.exists = true;
  }

  void show()
  {
    stroke(255, 0, 0, a);
    point(loc);
    noStroke();
  }

  boolean run()
  {
    a -= int(random(5, 10));
      
    PVector locNew = PVector.random2D();
    locNew.setMag(3);
    loc.add(locNew);
    
    return a <= 0; //the mist dies when it becomes transparent
  }
}

