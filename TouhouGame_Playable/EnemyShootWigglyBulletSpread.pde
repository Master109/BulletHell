class EnemyShootWigglyBulletSpread extends Enemy
{
  float bulletSpreadRange, rotateAmount;
  int bulletWiggleChangeDeadline, bulletWiggleAmount, bulletSize, bulletNum;

  EnemyShootWigglyBulletSpread(PVector[] wayPoints, PVector vel, PVector loc, int bulletWiggleChangeDeadline, int bulletWiggleAmount, int bulletSize, int bulletNum, int enemySize, int hp, int shootTimeDeadline, int xpValue, float rotateAmount, float speed, float bulletSpeed, float bulletSpreadRange, boolean destroyAfterDestination)
  {
    super(wayPoints, vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);
    this.bulletSpreadRange = bulletSpreadRange;
    this.rotateAmount = rotateAmount;
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
    if (isTimeToShoot())
    {
      shootBulletWiggleTowards(copy(PVector.sub(new PVector(p.loc.x - p.radius, p.loc.y), loc)), copy(loc), rotateAmount, bulletSpreadRange, bulletSpeed, bulletWiggleChangeDeadline, 0, bulletWiggleAmount, bulletSize, bulletNum);

      shootTimeCurrent = 0;
    }
    moveTowardsLoc(new PVector(p.loc.x - p.radius, p.loc.y), 999999999);
    return super.run();
  }
}

