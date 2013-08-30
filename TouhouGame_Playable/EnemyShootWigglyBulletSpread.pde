class EnemyShootWigglyBulletSpread extends Enemy
{
  float bulletSpreadRange;
  int bulletWiggleChangeDeadline;
  float bulletWiggleAmount;
  int bulletSize, bulletNum;

  EnemyShootWigglyBulletSpread(PVector[] wayPoints, PVector vel, PVector loc, int bulletWiggleChangeDeadline, float bulletWiggleAmount, int bulletSize, int bulletNum, int enemySize, int hp, int shootTimeDeadline, int xpValue, float rotateAmount, float speed, float bulletSpeed, float bulletSpreadRange, boolean destroyAfterDestination)
  {
    super(wayPoints, vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);

    this.bulletSpreadRange = bulletSpreadRange;
    this.bulletWiggleChangeDeadline = bulletWiggleChangeDeadline;
    this.bulletWiggleAmount = bulletWiggleAmount;
    this.bulletSize = bulletSize;
    this.bulletNum = bulletNum;
  }

  void show()
  {
    fill(ENEMY_COLOR);
    super.show();
  }

  boolean run()
  {
    if (isTimeToShoot() && age >= shootTimeDeadline)
      shootBulletWiggleTowards(PVector.sub(p.loc, loc), bulletSpreadRange, bulletSpeed, bulletWiggleChangeDeadline, bulletWiggleAmount, bulletSize, bulletNum);

    moveTowardsLoc(new PVector(p.loc.x - p.radius, p.loc.y), 999999999);
    return super.run();
  }
}

