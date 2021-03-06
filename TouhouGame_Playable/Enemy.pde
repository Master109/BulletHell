class Enemy extends GameObject
{
  PVector[] wayPoints;
  int currentWayPoint, hp, shootTimeDeadline, xpValue;
  float bulletSpeed;
  boolean facingRight, destroyAfterDestination;

  Enemy(PVector[] wayPoints, PVector vel, PVector loc, int radius, int hp, int shootTimeDeadline, int xpValue, float speed, float bulletSpeed)
  {
    super(vel, loc, radius, speed, color(255, 0, 0));

    this.wayPoints = wayPoints;

    this.hp = hp;
    this.shootTimeDeadline = shootTimeDeadline;
    this.xpValue = xpValue;
    this.bulletSpeed = bulletSpeed;
    this.facingRight = facingRight;
    this.destroyAfterDestination = destroyAfterDestination;

    this.currentWayPoint = 0;
  }

  void show()
  {
    fill(255, 0, 0);
    noStroke();

    //radius += random(-1, 2);
    if (radius > 50)
      radius -= 1;
    else if (radius < 15)
      radius += 1;

    ellipse(loc, radius);
  }

  //Returns true when the enemy survives
  boolean run()
  {
    exciteMyCurrentBackgroundSquare();

    //If we're using waypoints
    if (wayPoints.length > 0)
    {
      if (currentWayPoint == wayPoints.length - 1 && loc.dist(wayPoints[wayPoints.length - 1]) <= speed && destroyAfterDestination)
        return false;
assert currentWayPoint < wayPoints.length :       
      "Error: currentWayPoint >= wayPoints.length. Talk with Rafi.";

      PVector wayPointWeAreGoingTowards = wayPoints[currentWayPoint];
      vel = PVector.sub(wayPointWeAreGoingTowards, loc);
      vel.setMag(speed);

      if (PVector.dist(wayPointWeAreGoingTowards, loc) <= speed) // if we're at the waypoint (or close enough)
        currentWayPoint = (currentWayPoint + 1) % wayPoints.length;
    }

    super.run();

    if (p.loc.x - p.radius > loc.x)
      facingRight = true;
    else
      facingRight = false;

    if (hp <= 0)
    {
      float killsIntoScoreModifier2 = 0;
      if (perkEquiped[6] == 1)
        killsIntoScoreModifier2 = killsIntoScoreModifier;
      if (currentLevel == 0)
        score += xpValue + killsIntoScoreModifier2;
      kills ++;
      return false;
    }

    if (showEffects)
    {
      for (int i = 0; i <= 20; i ++)
      {
        if (int(random(1, 10)) == 1)
        {
          PVector offset = PVector.random2D();
          offset.setMag(random(radius, radius + 10));

          gameObjects.add(new Mist(copy(loc)));
        }
      }
    }

    return true;
  }

  void shootBulletStraightTowards(PVector targetLoc, float bulletSpeed, int bulletSize)
  {
    gameObjects.add(new Bullet(copy(PVector.sub(targetLoc, loc)), copy(loc), bulletSize, bulletSpeed, false));
  }

  void shootBulletWiggleTowards(PVector targetLoc, float spreadRange, float bulletSpeed, int wiggleChangeDeadline, float wiggleAmount, int bulletSize, int bulletNum)
  {
    PVector spreadLoc = copy(targetLoc);
    float m = spreadLoc.mag();

    gameObjects.add(new BulletWiggle(targetLoc, copy(loc), bulletSize, wiggleAmount, wiggleChangeDeadline, bulletSpeed));

    if (spreadRange != -1)
    {
      for (float a = spreadLoc.heading2D() + (spreadRange / 2); a <= targetLoc.heading2D() + (spreadRange / 2); a += spreadRange / bulletNum / 2)
      {
        spreadLoc.x = m * cos(a);
        spreadLoc.y = m * sin(a);
        gameObjects.add(new BulletWiggle(copy(spreadLoc), copy(loc), bulletSize, wiggleAmount, wiggleChangeDeadline, bulletSpeed));
      }

      spreadLoc = copy(targetLoc);

      for (float a = spreadLoc.heading2D() - (spreadRange / 2); a >= targetLoc.heading2D() - (spreadRange / 2); a -= spreadRange / bulletNum / 2)
      {
        spreadLoc.x = m * cos(a);
        spreadLoc.y = m * sin(a);
        gameObjects.add(new BulletWiggle(copy(spreadLoc), copy(loc), bulletSize, wiggleAmount, wiggleChangeDeadline, bulletSpeed));
      }
    }
  }

  void moveTowardsYLoc(PVector targetLoc)
  {
    final float OCCILATION_MODIFIER = .05;
    vel.y += OCCILATION_MODIFIER * (targetLoc.y - loc.y);
  }

  void moveTowardsLoc(PVector targetLoc, float curvatureSetMag)
  {
    PVector velChange = PVector.sub(new PVector(p.loc.x - p.radius, p.loc.y), loc);
    velChange.setMag(curvatureSetMag);
    vel.add(velChange);
  }

  boolean isTimeToShoot()
  {
    return age % shootTimeDeadline == 0;
  }
}

