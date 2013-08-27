class Bullet extends GameObject
{
  int bulletSize;
  float speed;
  boolean madeByPlayer;

  Bullet(PVector vel, PVector loc, int radius, float speed, boolean madeByPlayer)
  {
    super(vel, loc, radius);

    this.speed = speed;
    this.madeByPlayer = madeByPlayer;
  }

  void show()
  {
    noStroke();
    ellipse(loc, bulletSize);
    fill(255, 70);
    ellipse(loc, bulletSize + 50);
  }

  boolean run()
  {
    //If the bullet is from the player
    if (madeByPlayer)
    {
      for (Enemy e : getEnemies())
      {
        if (loc.dist(e.loc) <= radius + e.radius)
        {
          e.hp --;
          return false;
        }
        if (loc.dist(b1.loc) <= radius + (b1.radius))
        {      
          b1.hp --;
          return false;
        }
      }
    }
    else //if it's made by an enemy
    {
      PVector playerCenter = new PVector(p.loc.x - p.radius, p.loc.y);
      float distance = loc.dist(playerCenter);
      
      if (distance <= bulletSize / 2)
      {
        paused = true;
        return false;
      }
      else if (distance <= bulletSize / 2 + 22.5)
      {
        float grazeIntoScoreModifier2 = 0;
        if (perkEquiped[4] == 1)
          grazeIntoScoreModifier2 = grazeIntoScoreModifier;
        score += .2 + grazeIntoScoreModifier2;
        graze ++;
        if (currentLevel == 0)
          grazeAchievementCounter ++;
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


    vel.setMag(speed);
    super.run();

    if (loc.dist(new PVector(width / 2, height / 2)) >= width * 2 + (bulletSize / 2))
      return false;

    return true;
  }
}

