class Bullet extends GameObject
{
  int radius;
  boolean madeByPlayer;

  Bullet(PVector vel, PVector loc, int radius, float speed, boolean madeByPlayer)
  {
    super(vel, loc, radius, speed);

    this.radius = radius;
    this.madeByPlayer = madeByPlayer;
  }

  void show()
  {
    strokeWeight(5);
    stroke(0, 0, 100);
    fill(0);
    ellipse(loc, radius * 2 + 50);
    
    stroke(0, 0, 100);
    if (madeByPlayer)
      fill(0, 255, 0);
    else
      fill(0, 200, 200);
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

    //TODO: This doesn't belong here. This should be in the boss1 class
    if (b1.hp <= 0)
    {
      l1.showBoss = false;
      level1Complete = true;
      kills ++;
      textAlign(CENTER, CENTER);
      text("Congratz!", width / 2, height / 2);
      perkPoints += 3;
      if (inAutoSaveMode)
        saveGame();
    }


    return super.run();
  }
}

