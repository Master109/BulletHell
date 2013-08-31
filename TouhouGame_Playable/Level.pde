class Level
{
  int tics;
  boolean showBoss;

  public Level()
  {
    showBoss = false;
    tics = 3000;
  }

  void createEnemies()
  {
    tics ++;
  }
}

