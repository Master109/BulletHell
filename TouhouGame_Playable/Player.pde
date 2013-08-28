class Player extends GameObject
{
  PVector nextLoc;
  int hp, shootTime, shootState;
  float shootAngle;
  boolean facingRight;

  Player(PVector vel, PVector loc, PVector nextLoc, int radius, int hp, int shootTime, float speed, boolean facingRight)
  {
    super(vel, loc, radius, speed);

    this.nextLoc = nextLoc;
    this.hp = hp;
    this.shootTime = shootTime;
    this.facingRight = facingRight;

    shootState = 1;
  }

  void show()
  {
    fill(127.5);
    stroke(0, 255, 0);

    pushMatrix();
    if (!facingRight)
    {
      translate(new PVector(loc.x - p.radius, loc.y));
      triangle(-p.radius, 0, p.radius, p.radius, p.radius, -p.radius);
    }
    else
    {
      translate(new PVector(loc.x - p.radius, loc.y));
      rotate(PI);
      triangle(-p.radius, 0, p.radius, p.radius, p.radius, -p.radius);
    }
    popMatrix();

    stroke(255, 0, 0);
    strokeWeight(10);
    point(new PVector(loc.x - p.radius, loc.y));
    noStroke();
    strokeWeight(5);
  }

  boolean run()
  {
    //calculate the player's current reload speed
    int reloadSpeed = 1;
    if (perkEquiped[0] == 1)
      reloadSpeed = reloadSpeedCost;

    if (shootTime >= 6 - (reloadSpeed - 1) && (mousePressed || autoFire))
    {
      final int BULLET_SPEED = 999999999;
      PVector direction;
      if (facingRight)
        direction = new PVector(BULLET_SPEED, 0);
      else
        direction = new PVector(-BULLET_SPEED, 0);

      if (perkEquiped[12] == 1)
        bulletSprayRange = PI / 10;
      else if (perkEquiped[12] == -1)
        bulletSprayRange = 0;

      float m = direction.mag();
      float a = direction.heading2D();
      if (perkEquiped[12] == 1)
      {
        if (shootAngle > bulletSprayRange)
          shootState = 1;
        else if (shootAngle < -bulletSprayRange)
          shootState = -1;
        if (shootState == -1)
          shootAngle += bulletSprayRange / 7.5;
        if (shootState == 1)
          shootAngle -= bulletSprayRange / 7.5;
      }
      a += shootAngle;
      direction.x = m * cos(a);
      direction.y = m * sin(a);

      gameObjects.add(new Bullet(copy(direction), new PVector(loc.x - p.radius, loc.y), 3, 8.0, true));

      shootTime = 0;
    }
    shootTime ++;

    if (keyCode == LEFT)
      facingRight = false; 
    else if (keyCode == RIGHT)
      facingRight = true;

    move();
    super.run();

    //Now let's check if the player has been killed
    for (Bullet obj: getBullets())
    {
      if (loc.dist(obj.loc) < obj.radius && !obj.madeByPlayer)
        shouldRestart = true;
    }

    return true;
  }

  void move()
  {
    if (keys[4])
      speed = 2;
    else
      speed = 5.0;

    if (keys[0] || keys[1] || keys[2] || keys[3])
    {
      if (keys[0])
        vel.x = -speed;
      if (keys[1])
        vel.x = speed;
      if (keys[2])
        vel.y = -speed;
      if (keys[3])
        vel.y = speed;
      vel.setMag(speed);
    }
    nextLoc.set(PVector.add(loc, vel));

    boolean onMap = nextLoc.x - p.radius > 0 && nextLoc.x - p.radius < width && nextLoc.y > 0 && nextLoc.y < height;
    if (onMap)
      loc.set(nextLoc);
    vel.set(0, 0, 0);
  }
}

