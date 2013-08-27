class Boss extends Enemy
{
  int timer2, shootTimeCurrent2, shootTimeDeadline2, state, state2, currentSection, timer;
  float shootAngleModifier;

  Boss(PVector[] wayPoints, PVector vel, PVector loc, int enemySize, int timer2, int shootTimeDeadline2, int state, int state2, int currentWayPoint, int bossSize, int hp, int shootTimeCurrent, int shootTimeDeadline, int xpValue, int currentSection, int timer, float rotateAmount, float speed, float bulletSpeed, float shootAngleModifier)
  {
    super(new PVector[] {
    }
    , vel, loc, enemySize, hp, shootTimeDeadline, xpValue, speed, bulletSpeed);

    this.timer2 = timer2;
    this.shootTimeDeadline2 = shootTimeDeadline2;
    this.state = state;
    this.state2 = state2;
    this.hp = hp;
    this.shootTimeDeadline = shootTimeDeadline;
    this.xpValue = xpValue;
    this.currentSection = currentSection;
    this.timer = timer;
    this.speed = speed;
    this.bulletSpeed = bulletSpeed;
    this.facingRight = facingRight;
    this.shootAngleModifier = shootAngleModifier;

    //try to put more stuff down here. You'd be amazed at how many things you can just initialize to zero.
    this.shootTimeCurrent = 0;
    this.shootTimeCurrent2 = 0;
  }

  void shootBulletStraightTowards(PVector targetLoc, PVector shootLoc, float rotateAmount, float spreadRange, float bulletSpeed, int wiggleChangeDeadline, int wiggleChangeTimer, int wiggleAmount, int bulletSize, int bulletNum)
  {
    PVector spreadLoc = copy(targetLoc);
    float m = spreadLoc.mag();
    float a = spreadLoc.heading2D();
    a += shootAngleModifier;
    spreadLoc.x = m * cos(a);
    spreadLoc.y = m * sin(a);
    if (spreadRange != -1)
    {
      for (float a2 = spreadLoc.heading2D(); a2 <= spreadLoc.heading2D() + spreadRange * 2; a2 += spreadRange / bulletNum)
      {
        gameObjects.add(new Bullet(copy(spreadLoc), copy(shootLoc), bulletSize, bulletSpeed, false));
        spreadLoc.x = m * cos(a2);
        spreadLoc.y = m * sin(a2);
      }
    }
    else
      gameObjects.add(new Bullet(copy(targetLoc), copy(shootLoc), bulletSize, bulletSpeed, false));
  }

  void shootBulletWiggleTowards(PVector targetLoc, PVector wiggleVel, float rotateAmount, float spreadRange, float bulletSpeed, int wiggleChangeDeadline, int wiggleChangeTimer, int wiggleAmount, int bulletSize, int bulletNum)
  {
    PVector spreadLoc = copy(targetLoc);
    float m = spreadLoc.mag();
    for (float a = spreadLoc.heading2D(); a <= spreadLoc.heading2D() + spreadRange * 2; a += spreadRange / bulletNum)
    {
      gameObjects.add(new BulletWiggle(copy(spreadLoc), copy(loc), bulletSize, wiggleAmount, wiggleChangeTimer, wiggleChangeDeadline, -1, -1, bulletSpeed, rotateAmount, false));
      spreadLoc.x = m * cos(a);
      spreadLoc.y = m * sin(a);
    }
  }
}

