void makeEnemies()
{
  for (int i = 0; i <= NUM_OF_ENEMY_TYPES - 1; i ++)
  {
    if (enemyAppearTimes[i] >= enemyAppearDeadlines[i])
    {
      enemyAppearDeadlines[0] = 2000 / timesToRun;
      enemyAppearDeadlines[1] = 1250 / timesToRun;
      enemyAppearDeadlines[2] = 475 / timesToRun;
      enemyAppearDeadlines[3] = 2750 / timesToRun;
      if (i == 0)
      {
        Enemy e = new EnemyMoveTowardsPlayer(new PVector[0], new PVector(), new PVector(random(width), random(height)), 0, 30, 10, 0, 60, 19, 7.0, 7.0, true);
        gameObjects.add(e);
        while (e.loc.dist (new PVector (p.loc.x - p.radius, p.loc.y)) <= 450)
          e.loc.set(random(width), random(height), 0);
      } 
      else if (i == 1)
      {
        Enemy e = new EnemyShootHeadOn(new PVector[0], new PVector(), new PVector(random(width), random(height)), 25, 30, 10, 14, .3, 7.0, 2.0, false);
        gameObjects.add(e);
        while (e.loc.dist (new PVector (p.loc.x - p.radius, p.loc.y)) <= 450)
          e.loc.set(random(width), random(height), 0);
      } 
      else if (i == 2)
      {
        Enemy e = new EnemyShootBulletStraightTowardsPredicted(new PVector[0], new PVector(), new PVector(random(width), random(height)), 25, 15, 65, 4, 160, 7.0, 8.5, false);
        gameObjects.add(e);
        while (e.loc.dist (new PVector (p.loc.x - p.radius, p.loc.y)) <= 450)
          e.loc.set(random(width), random(height), 0);
      } 
      else if (i == 3)
      {
        Enemy e = new EnemyShootWigglyBulletSpread(new PVector[0], new PVector(), new PVector(random(width), random(height)), 17, 7, 30, 15, 25, 25, 30, 26, PI, 2.0, 7.5, TWO_PI, false);
        gameObjects.add(e);
        while (e.loc.dist (new PVector (p.loc.x - p.radius, p.loc.y)) <= 450)
          e.loc.set(random(width), random(height), 0);
      }
      enemyAppearTimes[i] = 0;
      enemyAppearDeadlines[i] *= .925;
    }
  }
}

