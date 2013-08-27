class Level2 extends Level
{
  Level2()
  {
  }

  void createEnemies()
  {
    if (getEnemies().size() == 0 && tics < 840 && tics > 0)
      tics = 840;

    if (showBoss)
    {
      b1.run();
      b1.show();
    }
    if (tics == 0)
    {
      Enemy e = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(width / 2 + 250, - 12.5), 17, 7, 30, 3, 25, 25, 30, 26, PI, 2.0, 7.5, HALF_PI, true);
      e.wayPoints[0] = new PVector(width / 2 - 250, height + 12.5);
    }
    if (tics == 0)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[4], new PVector(), new PVector(width + 12.5, height - 12.5), 25, 10, 10, 0, 0, 26, 6.5, false);
      e.wayPoints[0] = new PVector(12.5, height - 12.5);
      e.wayPoints[1] = new PVector(12.5, 12.5);
      e.wayPoints[2] = new PVector(width - 12.5, 12.5);
      e.wayPoints[3] = new PVector(width - 12.5, height - 12.5);
    }
    if (tics == 340)
    {
    }
    if (tics == 3440)
    {
    }
    if (tics == 1700)
    {
    }
    if (tics == 1775)
    {
    }
    if (tics == 1825)
    {
    }
    if (tics == 1880)
    {
    }
    if (tics == 3300)
    {
      showBoss = true;
    }
    super.createEnemies();
  }
}
