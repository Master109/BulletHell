class EnemyMoveTowardsPredicted extends Enemy
{
  EnemyMoveTowardsPredicted(PVector[] wayPoints, PVector vel, PVector loc, int currentWayPoint, int enemySize, int hp, int shootTimeCurrent, int shootTimeDeadline, int xpValue, float speed, float bulletSpeed, boolean facingRight, boolean destroyAfterDestination)
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
    if (isTimeToShoot() && age >= shootTimeDeadline)
    {
      PVector direction;
      if (facingRight)
        direction = new PVector(999999999, 0);
      else
        direction = new PVector(-99999999, 0);
      shootBulletStraightTowards(copy(direction), bulletSpeed, 20);
    }

    final int EXPECTED_PLAYER_SPEED = 20;
    moveTowardsYLoc(PVector.add(p.loc, PVector.mult(p.vel, EXPECTED_PLAYER_SPEED)));

    return super.run();
  }
}

