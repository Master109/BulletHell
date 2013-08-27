class GameObject
{
  PVector vel, loc;
  int radius;
  
  public GameObject(PVector vel, PVector loc, int radius)
  {
    this.vel = vel;
    this.loc = loc;
    this.radius = radius;
  }
  
  void show()
  {
  }
  
  boolean run()
  {
    loc.add(vel);
    
    return true;
  }
}
