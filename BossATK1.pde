class BossATK1 extends Floater{
  public int myCenterX, myCenterY;
  public int moveDown;
  //remember to do BossFirstA = false when everything leaves off screen
  BossATK1(){
    myCenterX = (int)(Math.random()*780+10);
    myCenterY = 0;
    myYspeed = 2;
  }
  
  public void show(){
    if(myCenterY < 800){
    fill(255,0,0);
    rect(myCenterX,myCenterY,10,20);
    myCenterY+=myYspeed;
    }
    fill(255);
  }
  
  public int getCenterX(){
   return myCenterX; 
  }
  public int getCenterY(){
   return myCenterY; 
  }
  
}
