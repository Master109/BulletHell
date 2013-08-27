class BulletSplit extends Bullet
{
  PVector wiggleVel;
  int wiggleAmount, splitTimeCurrent, splitTimeDeadline, splitNum, wiggleChangeTimer, wiggleChangeDeadline;
  float rotateAmount;
  boolean hasWiggled;

  BulletSplit(PVector vel, PVector loc, int bulletSize, int wiggleAmount, int wiggleChangeTimer, int wiggleChangeDeadline, int splitTimeDeadline, int splitNum, float speed, float rotateAmount, boolean madeByPlayer)
  {
    super(vel, loc, bulletSize, speed, madeByPlayer);

    this.splitTimeCurrent = 0;
    this.splitTimeCurrent = splitTimeCurrent;
    this.splitTimeDeadline = splitTimeDeadline;
    this.splitNum = splitNum;
  }

  void show()
  {
    if (madeByPlayer)
      fill(0, 255, 0);
    else
      fill(255, 0, 255);

    super.show();
  }

  boolean run()
  {
    super.run();

    if (splitTimeCurrent >= splitTimeDeadline)
    {
      PVector rotateAmount = PVector.sub(new PVector(p.loc.x - p.radius, p.loc.y), loc);
      float m = rotateAmount.mag();

      for (float a = rotateAmount.heading2D(); a <= PVector.sub(new PVector(p.loc.x - p.radius, p.loc.y), loc).heading2D() + TWO_PI; a += TWO_PI / splitNum)
      {
        rotateAmount.x = m * cos(a);
        rotateAmount.y = m * sin(a);
        gameObjects.add(new Bullet(copy(rotateAmount), copy(loc), bulletSize, 8.0, false));
      }
      splitTimeCurrent = 0;
      
      return false;
    }
    splitTimeCurrent ++;
    
    return true;
  }
}

