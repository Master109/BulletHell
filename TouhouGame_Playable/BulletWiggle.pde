class BulletWiggle extends Bullet
{
  float wiggleAmount;
  int wiggleChangeDeadline;
  boolean hasWiggled;

  BulletWiggle(PVector vel, PVector loc, int bulletSize, float wiggleAmount, int wiggleChangeDeadline, float speed)
  {
    super(vel, loc, bulletSize, speed, false, color(0, 0, 255));

    this.wiggleAmount = wiggleAmount;
    this.wiggleChangeDeadline = wiggleChangeDeadline;
    this.hasWiggled = false;
  }

  void show()
  {
    if (!madeByPlayer)
      fill(BULLET_WIGGLE_COLOR);

    super.show();
  }

  boolean run()
  {
    PVector wiggleLocModifier = copy(vel);
    wiggleLocModifier.rotate(HALF_PI);
    wiggleLocModifier.mult(sin(age / wiggleChangeDeadline));
    wiggleLocModifier.mult(wiggleAmount);
    loc.add(wiggleLocModifier);
    
    return super.run();
  }
}

