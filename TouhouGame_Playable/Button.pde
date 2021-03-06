class Button
{
  PVector loc, buttonSize;
  float fontSize;
  boolean beingPressed, pressed, isVisible;
  color buttonColor;
  String text;

  Button(PVector loc, float fontSize, String text)
  {
    this.loc = loc;
    this.fontSize = fontSize;
    this.text = text;
    buttonSize = new PVector(textWidth(text) + 50, fontSize + 50);
    buttonColor = color(100);
    beingPressed = false;
    pressed = false;
    isVisible = false;
  }

  void show()
  {
    if (!isVisible)
      return;

    fill(buttonColor);
    rect(loc, buttonSize);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, loc);
  }

  void run()
  {
    if (mousePressed && mouseX > loc.x - (buttonSize.x / 2) && mouseX < loc.x + (buttonSize.x / 2) && mouseY > loc.y - (buttonSize.y / 2) && mouseY < loc.y + (buttonSize.y / 2))
    {
      beingPressed = true;
      buttonColor = color(175);
    }
    else
      buttonColor = color(100);
  }
}

