void saveGame()
{
  data[0][0] = "" + perkPoints;
  data[0][1] = "" + reloadSpeedCost;
  data[0][2] = "" + timeIntoScoreCost;
  data[0][3] = "" + timeIntoScoreModifier;
  data[0][4] = "" + grazeIntoScoreCost;
  data[0][5] = "" + grazeIntoScoreModifier;
  data[0][6] = "" + killsIntoScoreCost;
  data[0][7] = "" + killsIntoScoreModifier;
  data[0][8] = "" + bombNumCost;
  data[0][9] = "" + level1KillsAchievementEarned;
  data[0][10] = "" + level1Score1AchievementEarned;

  //save if graze achievements have been earned
  for (int i = 0; i < NUM_ACHIEVEMENTS; i ++)
    data[0][11 + i] = "" + grazeAchievementEarned[i];

  //save which perks have been equipped
  data[0][14] = "" + perkEquiped[0];
  data[0][15] = "" + perkEquiped[2];
  data[0][16] = "" + perkEquiped[4];
  data[0][17] = "" + perkEquiped[6];
  data[0][18] = "" + perkEquiped[8];

  //save the highscores
  data[0][19] = "" + highScores.get(highScores.size() - 2);
  data[0][20] = "" + highScores.get(highScores.size() - 1);

  data[0][21] = "" + perkEquiped[12];
  data[0][22] = "" + level1Complete;
  data[0][23] = "" + shouldResetData[0];
  data[0][24] = "" + inAutoSaveMode;
  data[0][25] = "" + bulletSprayCost;

  //actually save the strings
  saveStrings("Save Data 1.txt", data[0]);
}

void saveMenu()
{
  background(127.5);

  buttons[10].isVisible = true;
  buttons[11].isVisible = true;
  buttons[14].isVisible = true;
  //buttons[17].isVisible = true;

  if (buttons[10].pressed)
  {
    shouldResetData[0] = false;
    saveGame();
  }
  else if (buttons[11].pressed)
  {
    shouldResetData[0] = true;
    saveGame();
  }
  else if (buttons[14].pressed)
  {
    if (buttons[14].text == "Turn autosave on")
    {
      shouldResetData[0] = true;
      buttons[14].text = "Turn autosave off";
      inAutoSaveMode = true;
    }
    else if (buttons[14].text == "Turn autosave off")
    {
      buttons[14].text = "Turn autosave on";
      inAutoSaveMode = false;
    }
  }
  buttons[10].run();
  buttons[10].show();
  buttons[11].run();
  buttons[11].show();
  buttons[14].run();
  buttons[14].show();
  //buttons[17].run();
  //buttons[17].show();
  buttons[10].pressed = false;
  buttons[11].pressed = false;
  buttons[14].pressed = false;
  //buttons[17].pressed = false;
}

