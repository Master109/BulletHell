class Boss1 extends Boss
{
  Boss1(PVector[] wayPoints, PVector vel, PVector loc, int enemySize, int timer2, int shootTimeDeadline2, int state, int state2, int currentWayPoint, int bossSize, int hp, int shootTimeCurrent, int shootTimeDeadline, int xpValue, int currentSection, int timer, float rotateAmount, float speed, float bulletSpeed, float shootAngleModifier)
  {
    super(wayPoints, vel, loc, enemySize, timer2, shootTimeDeadline2, state, state2, currentWayPoint, bossSize, hp, shootTimeCurrent, shootTimeDeadline, xpValue, currentSection, timer, rotateAmount, speed, bulletSpeed, shootAngleModifier);
  }
  
  boolean run()
  {
    if (hp <= 0)
    {
      level1Complete = true;
      textAlign(CENTER, CENTER);
      text("Congratz!", width / 2, height / 2);
      perkPoints += 3;
      if (inAutoSaveMode)
        saveGame();
      return false;
    }

    if (l1.tics == 4100)
      wayPoints[0] = new PVector(width + 100, height / 2 - 100);
    timer2 ++;

    if (hp < 200 || l1.tics == 4000)
      currentSection = 2;
    else if (currentWayPoint == wayPoints.length)
      currentSection = 1;

    if (loc.dist(wayPoints[wayPoints.length - 1]) <= speed)
      hp = 0;

    if (currentSection == 1)
    {
      shootAngleModifier += 1;
      shootTimeDeadline = 13;

      if (age % shootTimeDeadline == 0)
        shootBulletStraightTowards(new PVector(width / 2, height / 2), copy(loc), PI, TWO_PI, 7.5, 17, 0, 0, 30, 10);
    }
    else if (currentSection == 2)
    {
      int timerDeadline;
      if (timer == 0)
      {
        shootAngleModifier = 0;
        for (int x = 10; x <= width; x += 100)
        {
          gameObjects.add(new EnemyShootBulletStraightTowardsPredicted(new PVector[4], new PVector(), new PVector(x, -50), 100, 999999999, 999999999, 8, 160, 2.0, 8.5, true));
          gameObjects.add(new EnemyShootBulletStraightTowardsPredicted(new PVector[4], new PVector(), new PVector(x, height + 50), 100, 999999999, 999999999, 8, 160, 2.0, 8.5, true));
        }
      }
      timer ++;
      if (state2 == 1)
        timerDeadline = 91;
      else
        timerDeadline = 61;

      if (timer >= timerDeadline)
      {
        timer = 1;
        if (state >= 0)
        {
          state = -1;
        }
        else
        {
          state = 1;
          if (state2 == 1)
            state2 = -1;
          else
            state2 = 1;
        }
        if (state2 == -1 && state == 1)
          state2 = 1;
      }
      if (state == 1)
        shootAngleModifier += .007;
      else if (state == -1)
        shootAngleModifier -= .007;
      shootTimeDeadline = 3;

      shootTimeCurrent2 ++;
      if (timer2 >= 60)
      {
        if (age % shootTimeDeadline == 0)
        {
          PVector bulletVel = new PVector(-1, 0);
          float m = bulletVel.mag();
          float a = bulletVel.heading2D();
          a += shootAngleModifier;
          bulletVel.x = m * cos(a);
          bulletVel.y = m * sin(a);
          shootBulletStraightTowards(copy(bulletVel), copy(new PVector(loc.x, loc.y - radius)), 0, -1, 7.5, 17, 0, 0, 30, 1);
          shootBulletStraightTowards(copy(bulletVel), copy(new PVector(loc.x, loc.y + radius)), 0, -1, 7.5, 17, 0, 0, 30, 1);
        }
        if (shootTimeCurrent2 >= shootTimeDeadline2)
        {
          shootBulletStraightTowards(PVector.sub(p.loc, loc), copy(loc), 0, -1, 5.0, 17, 0, 0, 30, 1);
          shootTimeCurrent2 = 0;
        }
      }
    }

    return super.run();
  }
}

