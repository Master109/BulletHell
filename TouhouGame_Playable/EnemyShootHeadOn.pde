class EnemyShootHeadOn extends Enemy
{
  float curvatureLimit;
  boolean destroyAfterDestination;

  EnemyShootHeadOn(PVector[] wayPoints, PVector vel, PVector loc, int enemySize, int hp, int shootTimeDeadline, int xpValue, float curvatureLimit, float speed, float bulletSpeed, boolean destroyAfterDestination)
  {
    super(wayPoints, vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);
    this.curvatureLimit = curvatureLimit;
  }

  void show()
  {
    fill(ENEMY_COLOR);
    
    super.show();
  }

  boolean run()
  {
    if (isTimeToShoot() && age >= shootTimeDeadline)
      shootBulletStraightTowards(copy(new PVector(p.loc.x - p.radius, p.loc.y)), bulletSpeed, 20);

    moveTowardsLoc(new PVector(p.loc.x - p.radius, p.loc.y), curvatureLimit);
    
    return super.run();
  }
}

