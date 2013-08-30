class Level1 extends Level
{
  Level1()
  {
  }

  void createEnemies()
  {
    if (getEnemies().size() == 0 && tics < 870 && tics > 0)
      tics = 870;
    else if (getEnemies().size() == 0 && tics < 1440 && tics > 870)
      tics = 1440;
    else if (getEnemies().size() == 0 && tics < 3300 && tics > 1440)
      tics = 3300;

    if (showBoss)
    {
      b1.run();
      b1.show();
    }

    if (tics == 0)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[2], new PVector(), new PVector(12.5, height + 12.5), 25, 10, 60, 50, 999999999, 4.0, 5.0, false);
      e.wayPoints[0] = new PVector(12.5, 12.5);
      e.wayPoints[1] = new PVector(12.5, height - 12.5);
      gameObjects.add(e);
    }
    else if (tics == 30)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[2], new PVector(), new PVector(width - 12.5, -12.5), 25, 10, 60, 50, 999999999, 4.0, 5.0, false);
      e.wayPoints[0] = new PVector(width - 12.5, height - 12.5);
      e.wayPoints[1] = new PVector(width - 12.5, 12.5);
      gameObjects.add(e);
    }
    else if (tics == 870)
    {
      clearEnemies();
      Enemy e = new EnemyShootHeadOn(new PVector[0], new PVector(), new PVector(width / 2, height - 12.5), 25, 60, 999999999, 999999999, 999999999.0, 4.0, 5.0, false);
      gameObjects.add(e);
    }
    else if (tics == 1440)
    {
      clearEnemies();
      Enemy e = new EnemyShootHeadOn(new PVector[1], new PVector(), new PVector(width + 12.5, 100), 25, 10, 120, 0, 0, 1, 5.0, true);
      e.wayPoints[0] = new PVector(720, height + 12.5);
      gameObjects.add(e);
    }
    else if (tics == 1700)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[1], new PVector(), new PVector(width + 12.5, 495), 25, 10, 120, 0, 0, 1.0, 5.0, true);
      e.wayPoints[0] = new PVector(-12.5, 760);
      gameObjects.add(e);
    }
    else if (tics == 1775)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[1], new PVector(), new PVector(-12.5, 550), 25, 10, 120, 0, 0.0, 1.0, 5.0, true);
      e.wayPoints[0] = new PVector(width + 12.5, 185);
      gameObjects.add(e);
    }
    else if (tics == 1825)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[0], new PVector(), new PVector(width / 2 - 170, -12.5), 25, 30, 999999999, 0, .3, 5.5, 0.0, false);
      gameObjects.add(e);
    }
    else if (tics == 1880)
    {
      Enemy e = new EnemyShootHeadOn(new PVector[1], new PVector(), new PVector(165, -12.5), 25, 10, 120, 0, 0, .3, 5.0, true);
      e.wayPoints[0] = new PVector(-12.5, 250);
      gameObjects.add(e);
    }
    else if (tics == 3300)
    {
      gameObjects.clear();
      showBoss = true;
    }

    super.createEnemies();
  }
}

