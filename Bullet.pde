class Bullet extends Floater{
 
  public Bullet(Spaceship ship){
   myCenterX = ship.getCenterX(); 
   myCenterY = ship.getCenterY(); 
   myXspeed = ship.getXspeed();
   myYspeed = ship.getYspeed();
   myPointDirection = ship.getPointDirection();
   accelerate(4);
  }
  
  public void show(){
   fill(255,0,0);
   if((myCenterX > 0 || myCenterX < 500 ) && (myCenterY > 0 && myCenterY < 800)){
   ellipse((float)myCenterX,(float)myCenterY,10,10);
   }
  }
  public void move(){
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
  }
  
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
}
