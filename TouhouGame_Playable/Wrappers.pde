PVector copy(PVector vec)
{
  return new PVector(vec.x, vec.y);
}

void translate(PVector vec)
{
  translate(vec.x, vec.y);
}

void rect(PVector loc, int w, int h)
{
  rect(loc.x, loc.y, w, h);
}
void rect(PVector loc, PVector dimensions)
{
  rect(loc.x, loc.y, dimensions.x, dimensions.y);
}
void rect(PVector dimensions)
{
  rect(new PVector(), dimensions);
}
void rect(int radius)
{
  rect(0, 0, radius * 2, radius * 2);
}

void rect(PVector loc, int radius)
{
  rect(loc, radius * 2, radius * 2);
}

void ellipse(PVector loc, int diameter)
{
  ellipse(loc.x, loc.y, diameter, diameter);
}

void point(PVector loc)
{
  point(loc.x, loc.y);
}
void point()
{
  point(0, 0);
}

void text(String message, PVector loc)
{
  text(message, loc.x, loc.y);
}

PVector randomPointOnScreen()
{
  return new PVector(random(width), random(height));
}
