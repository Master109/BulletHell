class Bullet extends GameObject
{
  int radius;
  boolean madeByPlayer;

  Bullet(PVector vel, PVector loc, int radius, float speed, boolean madeByPlayer, color c)
  {
    super(vel, loc, radius, speed, c);

    this.radius = radius;
    this.madeByPlayer = madeByPlayer;
  }

  Bullet(PVector vel, PVector loc, int radius, float speed, boolean madeByPlayer)
  {
    this(vel, loc, radius, speed, madeByPlayer, color(255, 127, 0));
  }

  void show()
  {
    //make the graze halo
    strokeWeight(0);
    stroke(0, 0, 100);
    fill(255, 75);
    ellipse(loc, radius * 2 + 50);

    //now draw the actual bullet
    strokeWeight(5);
    stroke(0, 127, 127);
    if (madeByPlayer)
      fill(0, 255, 0);
    else
      fill(c);
    ellipse(loc, radius * 2);
  }

  boolean run()
  {
    //If the bullet is from the player
    if (madeByPlayer)
    {
      for (Enemy e : getEnemies())
      {
        //check for collision between the two circles
        if (loc.dist(e.loc) <= radius + e.radius)
        {
          e.hp --;
          return false;
        }
      }
    }

    return super.run();
  }
}

