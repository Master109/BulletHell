class EnemyMoveTowardsPlayer extends Enemy
{
  EnemyMoveTowardsPlayer(PVector[] wayPoints, PVector vel, PVector loc, int currentWayPoint, int enemySize, int hp, int shootTimeCurrent, int shootTimeDeadline, int xpValue, float speed, float bulletSpeed, boolean facingRight)
  {
    super(wayPoints, vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);
  }

  void show()
  {
    fill(ENEMY_COLOR);
    
    super.show();
  }

  boolean run()
  {
    if (isTimeToShoot())
    {
      Bullet b = new BulletSplit(PVector.sub(new PVector(p.loc.x - p.radius, p.loc.y), loc), copy(loc), 20, -1, -1, -1, 60, 20, 7.0, -1.0, false);
      gameObjects.add(b);

      shootTimeCurrent = 0;
    }

    moveTowardsYLoc(new PVector(p.loc.x - p.radius, p.loc.y));
    
    return super.run();
  }
}

