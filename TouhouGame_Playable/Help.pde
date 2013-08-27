void helpScreen()
{
  background(127.5);
  fill(0);
  
  textAlign(CENTER, TOP);
  
  text("Graze bullets and kill enemies to gain score", width / 2, 0);
  text("W: Move up", width / 2, FONT_SIZE);
  text("A: Move left", width / 2, FONT_SIZE * 2);
  text("S: Move down", width / 2, FONT_SIZE * 3);
  text("D: Move right", width / 2, FONT_SIZE * 4);
  text("Left or right arrow key: Face left or right", width / 2, FONT_SIZE * 5);
  text("Shift: You move slower while pressing it", width / 2, FONT_SIZE * 6);
  text("Space: Destroy all bullets and enemies on screen for no score", width / 2, FONT_SIZE * 7);
  text("Hold R: Reset", width / 2, FONT_SIZE * 8);
  text("F: Toggle autofire", width / 2, FONT_SIZE * 9);
  text("N: Skip time until next enemy arrives", width / 2, FONT_SIZE * 10);
  text("T: Toggle faster game speed", width / 2, FONT_SIZE * 11);
  text("P: Toggle pause", width / 2, FONT_SIZE * 12);
  text("L: Toggle visual effects (lag)", width / 2, FONT_SIZE * 13);
  text("B: WTF?!", width / 2, FONT_SIZE * 14);
  text("Q: Visit shop", width / 2, FONT_SIZE * 15);
  text("V: View achievements", width / 2, FONT_SIZE * 16);
  text("Enter: Enter save and load menu", width / 2, FONT_SIZE * 17);
  buttons[15].isVisible = true;
  buttons[16].isVisible = true;
  buttons[15].run();
  buttons[15].show();
  buttons[16].run();
  buttons[16].show();
  goToLevel();
  buttons[15].pressed = false;
  buttons[16].pressed = false;

  if (currentHelpScreen == 0)
  {
    text("H: Toggle this boring screen (won't work now, and the puzzle)", width / 2, FONT_SIZE * 18 + 6);
    text("to make it work is too hard for u. MUHAHAHAHA!)", width / 2, FONT_SIZE * 19 + 6);
  }
  else if (currentHelpScreen == 1)
  {
    text("H: Toggle this screen", width / 2, FONT_SIZE * 18 + 6);
    text("It's touching that u returned to this exciting screen for", width / 2, FONT_SIZE * 19 + 6);
    text("another stupid joke... but too bad", width / 2, FONT_SIZE * 20 + 6);
  }
  else if (currentHelpScreen == 2)
  {
    text("H: Toggle this screen", width / 2, FONT_SIZE * 18 + 6);
    text("Ah, now I know alot about u. To come back here you are either", width / 2, FONT_SIZE * 19 + 6);
    text("thoughtful or careless. Or someone pressed the button for u. Or", width / 2, FONT_SIZE * 20 + 6);
    text("some combination of the three.", width / 2, FONT_SIZE * 21 + 6);
  }
  else if (currentHelpScreen == 3)
  {
    text("H: Toggle this screen", width / 2, FONT_SIZE * 18 + 6);
    text("Oh, u want to know about me, u ask? You can choose my", width / 2, FONT_SIZE * 19 + 6);
    text("name, and I am good at everthing: Video-games, writing,", width / 2, FONT_SIZE * 20 + 6);
    text("surfing, the opposite sex (u can decide if I am male or", width / 2, FONT_SIZE * 21 + 6);
    text("female), talking, self-control, driving vehicles, music, circus", width / 2, FONT_SIZE * 22 + 6);
    text("toys and sports. Oh yeah, and life.", width / 2, FONT_SIZE * 23 + 6);
  }
  else if (currentHelpScreen == 4)
  {
    text("H: Toggle this screen", width / 2, FONT_SIZE * 18 + 6);
    text("I'm especially good at music, though. Wanna hear me rap? I", width / 2, FONT_SIZE * 19 + 6);
    text("can rap so fast! {Insert name here takes in a huge breath}", width / 2, FONT_SIZE * 20 + 6);
  }
  else if (currentHelpScreen == 5)
    background(0); 
  else if (currentHelpScreen == 6)
  {
    text("H: Toggle this screen", width / 2, FONT_SIZE * 18 + 6);
    text("{Insert name here pants heavily} Did you even hear what I said?", width / 2, FONT_SIZE * 19 + 6);
    text("I crammed a lot of words together.", width / 2, FONT_SIZE * 20 + 6);
  }
}

