class EnemyShootBulletStraightTowardsPredicted extends Enemy
{
  int bulletSize;

  EnemyShootBulletStraightTowardsPredicted(PVector[] wayPoints, PVector vel, PVector loc, int enemySize, int hp, int shootTimeDeadline, int xpValue, int bulletSize, float speed, float bulletSpeed, boolean destroyAfterDestination)
  {
    super(wayPoints, vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);
    this.bulletSize = bulletSize;
  }

  void show()
  {
    fill(ENEMY_COLOR);
    super.show();
  }

  boolean run()
  {
    PVector vec = copy(PVector.add(p.nextLoc, PVector.mult(p.vel, PVector.dist(loc, p.nextLoc) / bulletSpeed)));

    if (isTimeToShoot())
      shootBulletStraightTowards(vec, bulletSpeed, bulletSize);

    return super.run();
  }
}

