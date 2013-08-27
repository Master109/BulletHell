void shop()
{
  background(127.5);
  textAlign(CENTER, TOP);
  text("Perk points: " + perkPoints, width / 2, 0);
  text("Improve your survival mode score by " + int((highScores.get(highScores.size() - 1) - highScores.get(highScores.size() - 2))) + ", beat levels, or get", width / 2, FONT_SIZE);
  text("achievements to earn perk points", width / 2, FONT_SIZE * 2);
  buttons[0].isVisible = true;
  buttons[2].isVisible = true;
  buttons[4].isVisible = true;
  buttons[6].isVisible = true;
  buttons[8].isVisible = true;
  buttons[12].isVisible = true;

  if (reloadSpeedCost > 2)
    buttons[1].isVisible = true; 
  if (timeIntoScoreCost > 1)
    buttons[3].isVisible = true; 
  if (grazeIntoScoreCost > 1)
    buttons[5].isVisible = true;   
  if (killsIntoScoreCost > 1)
    buttons[7].isVisible = true;
  if (bombNumCost > 6)
    buttons[9].isVisible = true;
  if (bulletSprayCost > 3)
    buttons[13].isVisible = true;
  for (int i = 0; i < BUTTON_NUM; i ++)
  {
    if (buttons[i].isVisible)
    {
      if (buttons[i].pressed)
      {
        if (i == 0 && perkPoints >= reloadSpeedCost)
        {
          if (reloadSpeedCost <= 6)
          {
            if (perkEquiped[0] == 0)
              perkEquiped[0] = 1;
            perkPoints -= reloadSpeedCost;
            reloadSpeedCost ++;
            if (inAutoSaveMode)
              saveGame();
          }
        }
        else if (i == 12 && perkPoints >= bulletSprayCost)
        {
          if (bulletSprayCost <= 4)
          {
            if (perkEquiped[12] == 0)
              perkEquiped[12] = 1;
            perkPoints -= bulletSprayCost;
            bulletSprayCost ++;
            if (inAutoSaveMode)
              saveGame();
          }
        }
        else if (i == 2 && perkPoints >= timeIntoScoreCost)
        {
          if (perkEquiped[2] == 0)
            perkEquiped[2] = 1;
          perkPoints -= timeIntoScoreCost;
          timeIntoScoreCost ++;
          timeIntoScoreModifier += .09;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 4 && perkPoints >= grazeIntoScoreCost)
        {
          if (perkEquiped[4] == 0)
            perkEquiped[4] = 1;
          perkPoints -= grazeIntoScoreCost;
          grazeIntoScoreCost ++;
          grazeIntoScoreModifier += .11;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 6 && perkPoints >= killsIntoScoreCost)
        {
          if (perkEquiped[6] == 0)
            perkEquiped[6] = 1;
          perkPoints -= killsIntoScoreCost;
          killsIntoScoreCost ++;
          killsIntoScoreModifier += 2.5;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 8 && perkPoints >= bombNumCost)
        {
          if (perkEquiped[8] == 0)
            perkEquiped[8] = 1;
          perkPoints -= bombNumCost;
          bombNumCost ++;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 1)
        {
          if (perkEquiped[0] == 1)
            perkEquiped[0] = -1;
          else if (perkEquiped[0] == -1)
            perkEquiped[0] = 1;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 3)
        {
          if (perkEquiped[2] == 1)
            perkEquiped[2] = -1;
          else if (perkEquiped[2] == -1)
            perkEquiped[2] = 1;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 5)
        {
          if (perkEquiped[4] == 1)
            perkEquiped[4] = -1;
          else if (perkEquiped[4] == -1)
            perkEquiped[4] = 1;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 7)
        {
          if (perkEquiped[6] == 1)
            perkEquiped[6] = -1;
          else if (perkEquiped[6] == -1)
            perkEquiped[6] = 1;
          if (inAutoSaveMode)
            saveGame();
        }
        else if (i == 9)
        {
          if (perkEquiped[8] == 1)
          {
            perkEquiped[8] = -1;
            bombNum -= bombNumCost - 6;
            if (inAutoSaveMode)
              saveGame();
          }
          else if (perkEquiped[8] == -1)
          {
            perkEquiped[8] = 1;
            bombNum += bombNumCost - 6;
            if (inAutoSaveMode)
              saveGame();
          }
        }
        else if (i == 13)
        {
          if (perkEquiped[12] == 1)
          {
            perkEquiped[12] = -1;
            bulletSprayRange = 0;
            if (inAutoSaveMode)
              saveGame();
          }
          else if (perkEquiped[12] == -1)
          {
            perkEquiped[12] = 1;
            bulletSprayRange = HALF_PI;
            if (inAutoSaveMode)
              saveGame();
          }
        }
      }
      buttons[i].run();
      buttons[i].show();
      buttons[i].pressed = false;
    }
    buttons[0].text = "Reload Speed - $" + reloadSpeedCost;
    buttons[2].text = "Time Into Score - $" + timeIntoScoreCost;
    buttons[4].text = "Graze Into Score - $" + grazeIntoScoreCost;
    buttons[6].text = "Kills Into Score - $" + killsIntoScoreCost;
    buttons[8].text = "Bombs - $" + bombNumCost;
    buttons[12].text = "Bullet Spread - $" + bulletSprayCost;
    if (reloadSpeedCost == 7)
      buttons[0].text = "Reload Speed (MAX)";
    if (bulletSprayCost == 4)
      buttons[12].text = "Bullet Spread (MAX)";
    if (perkEquiped[0] == -1)
      buttons[1].text = "Equip";
    else if (perkEquiped[0] == 1)
      buttons[1].text = "Unequip";
    if (perkEquiped[2] == -1)
      buttons[3].text = "Equip";
    else if (perkEquiped[2] == 1)
      buttons[3].text = "Unequip";
    if (perkEquiped[4] == -1)
      buttons[5].text = "Equip";
    else if (perkEquiped[4] == 1)
      buttons[5].text = "Unequip";
    if (perkEquiped[6] == -1)
      buttons[7].text = "Equip";
    else if (perkEquiped[6] == 1)
      buttons[7].text = "Unequip";
    if (perkEquiped[8] == -1)
      buttons[9].text = "Equip";
    else if (perkEquiped[8] == 1)
      buttons[9].text = "Unequip";
    if (perkEquiped[12] == -1)
      buttons[13].text = "Equip [Up / Down]";
    else if (perkEquiped[12] == 1)
      buttons[13].text = "Unequip [Up / Down]";
  }
}

