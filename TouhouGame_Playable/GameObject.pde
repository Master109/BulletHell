class GameObject
{
  PVector vel, loc;
  int radius;
  float speed;
  color c;

  public GameObject(PVector vel, PVector loc, int radius, float speed, color c)
  {
    this.vel = vel;
    this.loc = loc;
    this.radius = radius;
    this.speed = speed;
    this.c = c;
  }

  void show()
  {
    fill(c);
    ellipse(loc, radius);
  }

  boolean run()
  {
    vel.limit(speed);
    loc.add(vel);

    //kill the object if it goes too far off of the screen
    return loc.dist(new PVector(width / 2, height / 2)) < width * 2;
  }
  
  void exciteMyCurrentBackgroundSquare(float amount)
  {
    exciteBackgroundSquare(loc.x / BACKGROUND_SQUARE_SPACING, loc.y / BACKGROUND_SQUARE_SPACING, amount);
  }
  void exciteMyCurrentBackgroundSquare()
  {
    exciteMyCurrentBackgroundSquare(1);
  }
}

