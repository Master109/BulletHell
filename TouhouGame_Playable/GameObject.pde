class GameObject
{
  PVector vel, loc;
  int radius;
  float speed;

  public GameObject(PVector vel, PVector loc, int radius, float speed)
  {
    this.vel = vel;
    this.loc = loc;
    this.radius = radius;
    this.speed = speed;
  }

  void show()
  {
  }

  boolean run()
  {
    vel.limit(speed);
    loc.add(vel);

    return true;
  }
}

