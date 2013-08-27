/**
This method returns the enemies from the gameObjects list
*/
ArrayList<Enemy> getEnemies()
{
  ArrayList<Enemy> list = new ArrayList<Enemy>();
  
  for(GameObject obj : gameObjectsCopy)
  {
    if (obj instanceof Enemy)
      list.add((Enemy)obj);
  }
  
  return list;
}

ArrayList<Bullet> getBullets()
{
  ArrayList<Bullet> list = new ArrayList<Bullet>();
  
  for(GameObject obj : gameObjectsCopy)
  {
    if (obj instanceof Bullet)
      list.add((Bullet)obj);
  }
  
  return list;
}
