Player p;
Level1 l1;
Level2 l2;
Boss1 b1;

String[][] data;

ArrayList<GameObject> gameObjects, gameObjectsCopy;

ArrayList<Float> highScores;

Button[] buttons;
BackgroundSquare[][] backgroundSquares;

int[] perkEquiped;
int[] holdKeyTimers;
int currentHelpScreen;
int bombNum;
int currentLevel;
int graze, kills;
int timesToRun;
int grazeAchievementCounter, previousGrazeAchievementCounter;
int notificationShowTimer;

int reloadSpeedCost, timeIntoScoreCost, grazeIntoScoreCost, killsIntoScoreCost;
int bombNumCost, bulletSprayCost;
int perkPoints;

float[] enemyAppearDeadlines, enemyAppearTimes;
float score;
float timeIntoScoreModifier, grazeIntoScoreModifier, killsIntoScoreModifier;
float playTimer;
float bulletSprayRange;

boolean[] keys;
boolean autoFire;
boolean shouldRestart;
boolean paused;
boolean viewingHelpScreen;
boolean showEffects;

boolean level1KillsAchievementShow, level1Score1AchievementShow;
boolean level1Complete;

boolean[] grazeAchievementQueued, grazeAchievementEarned, grazeAchievementShow;
boolean level1KillsAchievementQueued, level1Score1AchievementQueued, level1KillsAchievementEarned, level1Score1AchievementEarned;
boolean viewingBlendMode;
boolean inShop;
boolean viewingAchievements;
boolean viewingSaveMenu;
boolean[] shouldResetData;
boolean inAutoSaveMode;

final color ENEMY_COLOR = color(255, 0, 0);
final color BULLET_WIGGLE_COLOR = color(0, 0, 255);
final color TERRAIN_COLOR = color(255);
final int NUM_OF_ENEMY_TYPES = 4;
final int BUTTON_NUM = 18;
final int NUM_ACHIEVEMENTS = 3;
final int BACKGROUND_SQUARE_SPACING = 25;
final int SAVE_FILE_NUM = 5;
final float FONT_SIZE = 27;
final PVector NO_WAYPOINT = new PVector(-1, -1);

void setup()
{
  size(925, 715, OPENGL);
  smooth();

  strokeWeight(5);
  noStroke();

  rectMode(CENTER);
  background(255);

  data = new String[SAVE_FILE_NUM][27];

  data[0] = loadStrings("Save Data 1.txt");
  if (data[0][23].equals("true"))
    data[0] = loadStrings("Initial Data.txt");
  shouldResetData = new boolean[SAVE_FILE_NUM];
  perkEquiped = new int[BUTTON_NUM];
  perkEquiped[0] = int(data[0][14]);
  perkEquiped[2] = int(data[0][15]);
  perkEquiped[4] = int(data[0][16]);
  perkEquiped[6] = int(data[0][17]);
  perkEquiped[8] = int(data[0][18]);
  perkEquiped[12] = int(data[0][21]);
  currentHelpScreen = 0;
  notificationShowTimer = 0;
  perkPoints = int(data[0][0]);

  keys = new boolean[17];
  autoFire = true;
  viewingHelpScreen = true;
  showEffects = true;
  grazeAchievementShow = new boolean[NUM_ACHIEVEMENTS];
  grazeAchievementQueued = new boolean[NUM_ACHIEVEMENTS];
  grazeAchievementEarned = new boolean[NUM_ACHIEVEMENTS];
  for (int i = 0; i < NUM_ACHIEVEMENTS; i ++)
    grazeAchievementEarned[i] = boolean(data[0][11 + i]);
  level1KillsAchievementShow = false;
  level1Score1AchievementShow = false;
  level1KillsAchievementQueued = false;
  level1Score1AchievementQueued = false;
  level1KillsAchievementEarned = boolean(data[0][9]);
  level1Score1AchievementEarned = boolean(data[0][10]);
  inAutoSaveMode = boolean(data[0][24]);
  viewingBlendMode = false;
  viewingAchievements = false;
  inShop = false;
  level1Complete = boolean(data[0][22]);
  currentLevel = -1;
  holdKeyTimers = new int[12];
  timesToRun = 1;
  reloadSpeedCost = int(data[0][1]);
  timeIntoScoreCost = int(data[0][2]);
  timeIntoScoreModifier = int(data[0][3]);
  grazeIntoScoreCost = int(data[0][4]);
  grazeIntoScoreModifier = int(data[0][5]);
  killsIntoScoreCost = int(data[0][6]);
  killsIntoScoreModifier = int(data[0][7]);
  bombNumCost = int(data[0][8]);
  bulletSprayCost = int(data[0][25]);

  textFont(createFont("Arial", FONT_SIZE));

  highScores = new ArrayList<Float>();
  highScores.add(float(data[0][19]));
  highScores.add(float(data[0][20]));
  backgroundSquares = new BackgroundSquare[999][999];
  buttons = new Button[BUTTON_NUM];
  buttons[0] = new Button(new PVector(250, 125), FONT_SIZE, "Reload Speed - $" + reloadSpeedCost);
  buttons[1] = new Button(new PVector(250, 225), FONT_SIZE, "Unequip");
  buttons[2] = new Button(new PVector(650, 125), FONT_SIZE, "Time Into Score - $" + timeIntoScoreCost);  
  buttons[3] = new Button(new PVector(650, 225), FONT_SIZE, "Unequip");
  buttons[4] = new Button(new PVector(650, 325), FONT_SIZE, "Graze Into Score - $" + grazeIntoScoreCost);  
  buttons[5] = new Button(new PVector(650, 425), FONT_SIZE, "Unequip");
  buttons[6] = new Button(new PVector(650, 525), FONT_SIZE, "Kills Into Score - $" + killsIntoScoreCost);  
  buttons[7] = new Button(new PVector(650, 625), FONT_SIZE, "Unequip");
  buttons[8] = new Button(new PVector(250, 325), FONT_SIZE, "Bombs - $" + bombNumCost);  
  buttons[9] = new Button(new PVector(250, 425), FONT_SIZE, "Unequip");
  buttons[10] = new Button(new PVector(width / 2 - 95, height / 2), FONT_SIZE, "Save");  
  buttons[11] = new Button(new PVector(width / 2 + 150, height / 2), FONT_SIZE, "Reset");
  buttons[12] = new Button(new PVector(250, 525), FONT_SIZE, "Bullet Spread - $" + bulletSprayCost);  
  buttons[13] = new Button(new PVector(250, 625), FONT_SIZE, "Unequip [Up or Down]");
  buttons[14] = new Button(new PVector(width / 2, height - 50), FONT_SIZE, "Turn autosave off");
  buttons[15] = new Button(new PVector(width / 2 + 200, height - 35), FONT_SIZE, "Play Survival Mode [Hold 0]");
  buttons[16] = new Button(new PVector(width / 2 - 200, height - 35), FONT_SIZE, "Play Level 1 [Hold 1]");
  buttons[17] = new Button(new PVector(width / 2 + 50, height - 35), FONT_SIZE, "Load");

  if (inAutoSaveMode)
    buttons[14].text = "Turn autosave off";
  else
    buttons[14].text = "Turn autosave on";

  reset();
}

void reset()
{
  gameObjects = new ArrayList<GameObject>();

  for (int x = BACKGROUND_SQUARE_SPACING / 2; x <= width; x += BACKGROUND_SQUARE_SPACING)
    for (int y = BACKGROUND_SQUARE_SPACING / 2; y <= height; y += BACKGROUND_SQUARE_SPACING)
      backgroundSquares[x][y] = new BackgroundSquare(new PVector(x, y, 10), BACKGROUND_SQUARE_SPACING, new int[1]);

  paused = false;
  shouldRestart = false;

  if (currentLevel == 0)
    bombNum = 3;
  else
    bombNum = 0;
  if (perkEquiped[8] == 1)
    bombNum += bombNumCost - 6;
  else if (perkEquiped[8] == -1)
    bombNum -= 3;

  playTimer = 0;
  score = 0;
  graze = 0;
  kills = 0;
  previousGrazeAchievementCounter = 0;
  grazeAchievementCounter = 0;
  enemyAppearTimes = new float[NUM_OF_ENEMY_TYPES];
  enemyAppearDeadlines = new float[NUM_OF_ENEMY_TYPES];
  enemyAppearDeadlines[0] = 2000 / timesToRun;
  enemyAppearDeadlines[1] = 1250 / timesToRun;
  enemyAppearDeadlines[2] = 475 / timesToRun;
  enemyAppearDeadlines[3] = 2750 / timesToRun;

  p = new Player(new PVector(), new PVector(width / 2, height / 2), new PVector(), 20, 1, 0, 5.0, true);
  gameObjects.add(p);

  if (currentLevel == 0)
  {
    Enemy e = new EnemyShootBulletStraightTowardsPredicted(new PVector[0], new PVector(), new PVector(random(width), random(height)), 25, 15, 70, 8, 160, 7.0, 8.5, false);
    gameObjects.add(e);
    while (e.loc.dist (new PVector (p.loc.x - p.radius, p.loc.y)) <= 450)
      e.loc.set(random(width), random(height), 01);
  }

  l1 = new Level1();
  l2 = new Level2();

  PVector[] wayPoints = new PVector[] {
    new PVector(width, height / 2), new PVector(width, height / 2)
    };
    b1 = new Boss1(wayPoints, new PVector(), new PVector(width + 100, height / 2), 0, 0, 25, 0, 0, 0, 200, 400, 0, 65, 8, 160, 0, 10, 1.0, 8.5, 0);
}

void draw()
{
  fill(127.5, 175);
  rect(width / 2, height / 2, width, height + 2);

  for (int i = 0; i < BUTTON_NUM; i ++)
    buttons[i].isVisible = false;

  if (viewingBlendMode)
    blendMode(SUBTRACT);

  keyTimerStuff();

  if (viewingHelpScreen)
  {
    helpScreen();
    return;
  }
  else if (inShop)
  {
    shop();
    return;
  }
  else if (viewingAchievements)
  {
    background(127.5);
    showAchievementList();
    return;
  }
  else if (viewingSaveMenu)
  {
    saveMenu();
    return;
  }

  if (score > highScores.get(highScores.size() - 1))
  {
    highScores.add(highScores.get(highScores.size() - 1) + 10);
    perkPoints ++;
    if (inAutoSaveMode)
      saveGame();
  }

  for (int i = 1; i <= timesToRun; i ++)
  {
    playTimer += 1 / frameRate;
    float timeIntScoreModifier2 = 0;
    if (perkEquiped[2] == 1)
      timeIntScoreModifier2 = timeIntoScoreModifier;
    score += (1 + timeIntScoreModifier2) / frameRate;
  }

  ArrayList<Enemy> survivingEnemies = new ArrayList<Enemy>();

  for (int i = 0; i <= NUM_OF_ENEMY_TYPES - 1; i ++)
    enemyAppearTimes[i] ++;

  //showGrid();

  makeEnemies();

  if (previousGrazeAchievementCounter == grazeAchievementCounter)
    grazeAchievementCounter = 0;

  previousGrazeAchievementCounter = grazeAchievementCounter;


  for (int index = 0; index < NUM_ACHIEVEMENTS; index ++)
  {
    if (grazeAchievementCounter >= (index + 1) * 10)
      grazeAchievementQueued[index] = true;

    if (!grazeAchievementEarned[index] && grazeAchievementQueued[index])
    {
      grazeAchievementEarned[index] = true;
      grazeAchievementShow[index] = true;
    }

    if (grazeAchievementShow[index])
      notificationShowTimer ++;
  }

  //show all of the game objects
  for (GameObject obj : gameObjects)
    obj.show();

  showStats();

  showAchievementsNotifications();

  if (shouldRestart)
  {
    print("restart");
    return;
  }

  if (paused)
  {
    print("paused");
    return;
  }

  //we're cloning the array to avoid incurring cuncurrent modification
  gameObjectsCopy = gameObjects;
  gameObjects = new ArrayList<GameObject>();

  for (GameObject obj : gameObjectsCopy)
    if (obj.run())
      gameObjects.add(obj);
}

void showGrid()
{
  for (int x = BACKGROUND_SQUARE_SPACING / 2; x <= width; x += BACKGROUND_SQUARE_SPACING)
    for (int y = BACKGROUND_SQUARE_SPACING / 2; y <= height; y += BACKGROUND_SQUARE_SPACING)
    {
      backgroundSquares[x][y].run();
      backgroundSquares[x][y].show();
    }
}

void clearEnemies()
{
assert false : 
  "NOT YET IMPLEMENTED. See void clearEnemies()";
}
void clearBullets()
{
assert false : 
  "NOT YET IMPLEMENTED. See void clearBullets()";
}

