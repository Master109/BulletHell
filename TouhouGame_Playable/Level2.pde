class Level2 extends Level
{
  void createEnemies()
  {
    if (getEnemies().size() == 0 && tics < 500 && tics > 0)
      tics = 500;
    else if (getEnemies().size() == 0 && tics < 1000 && tics > 500)
      tics = 1000;
    else if (getEnemies().size() == 0 && tics < 3-00 && tics > 1000)
      tics = 3000;

    if (tics == 0)
    {
      Enemy e = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(width / 2 + 250, - 12.5), 10, 1, 35, 3, 25, 10, 40, 26, PI, 2.0, 7.5, HALF_PI, true);
      e.wayPoints[0] = new PVector(width / 2 - 250, height + 12.5);
      gameObjects.add(e);
    }
    if (tics == 500)
    {
      clearEnemies();
      Enemy e = new EnemyShootHeadOn(new PVector[4], new PVector(), new PVector(width + 12.5, height - 12.5), 25, 10, 25, 0, 0, 7.5, 6.5, false);
      e.wayPoints[0] = new PVector(12.5, height - 12.5);
      e.wayPoints[1] = new PVector(12.5, 12.5);
      e.wayPoints[2] = new PVector(width - 12.5, 12.5);
      e.wayPoints[3] = new PVector(width - 12.5, height - 12.5);
      gameObjects.add(e);
      Enemy e2 = new EnemyShootHeadOn(new PVector[4], new PVector(), new PVector(-12.5, 12.5), 25, 10, 25, 0, 0, 7.5, 6.5, false);
      e2.wayPoints[0] = new PVector(width - 12.5, 12.5);
      e2.wayPoints[1] = new PVector(width - 12.5, height - 12.5);
      e2.wayPoints[2] = new PVector(12.5, height - 12.5);
      e2.wayPoints[3] = new PVector(12.5, 12.5);
      gameObjects.add(e2);
    }
    if (tics == 1000)
    {
      clearEnemies();
      Enemy e = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(-12.5, height / 2), 10, 1, 35, 0, 25, 25, 75, 26, PI, 2.0, 2.5, -1, false);
      e.wayPoints[0] = new PVector(12.5, height / 2);
      gameObjects.add(e);
      Enemy e2 = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(width + 12.5, height / 2), 10, 1, 35, 0, 25, 25, 75, 26, PI, 2.0, 2.5, -1, false);
      e2.wayPoints[0] = new PVector(width - 12.5, height / 2);
      gameObjects.add(e2);
      Enemy e3 = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(width / 2, -12.5), 10, 1, 35, 0, 25, 25, 75, 26, PI, 2.0, 2.5, -1, false);
      e3.wayPoints[0] = new PVector(width / 2, 12.5);
      gameObjects.add(e3);
      Enemy e4 = new EnemyShootWigglyBulletSpread(new PVector[1], new PVector(), new PVector(width / 2, height + 12.5), 10, 1, 35, 0, 25, 25, 75, 26, PI, 2.0, 2.5, -1, false);
      e4.wayPoints[0] = new PVector(width / 2, height - 12.5);
      gameObjects.add(e4);
    }
    if (tics == 3000)
    {
      clearEnemies();
      showBoss = true;
    }
    super.createEnemies();
  }
}

