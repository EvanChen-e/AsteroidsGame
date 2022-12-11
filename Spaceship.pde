class Spaceship extends Floater  
{   
  private int fireCount;
  private int loseHpAsteroids;
  Spaceship(){
  fireCount = 11;
  corners = 35;
  xCorners =  new int[]{-18*3,-20*3,-12*3,-7*3,-9*3,-12*3,-12*3,-9*3,-12*3,-1*3,1*3,5*3,12*3,20*3,12*3,7*3,12*3,20*3,12*3,7*3,12*3,20*3,12*3,5*3,1*3,-1*3,-12*3,-9*3,-12*3,-12*3,-9*3,-7*3,-12*3,-20*3,-18*3,
  //RightFire
  -12*3,-14*3,-13*3,-15*3,-14*3,-16*3,-14*3,-15*3,-13*3,-14*3,-12*3,
  //LeftFire
  -12*3,-14*3,-13*3,-15*3,-14*3,-16*3,-14*3,-15*3,-13*3,-14*3,-12*3
}; 
  yCorners =  new int[]{-2*3,-4*3,-2*3,-4*3,-6*3,-6*3,-8*3,-8*3,-13*3,-7*3,-2*3,-2*3,-6*3,-1*3,-4*3,-2*3,-2*3,0*3,2*3,2*3,4*3,1*3,6*3,2*3,2*3,7*3,13*3,8*3,8*3,6*3,6*3,4*3,2*3,4*3,2*3,
  //RightFire
  -9*3 +10,-7*3 +10,-9*3 +10,-8*3 +10,-9*3 +10,-10*3 +10,-11*3 +10,-12*3 +10,-11*3 +10,-14*3 +10,-11*3 +10,
  //LeftFire
  9*3 -10,7*3 -10,9*3 -10,8*3 -10,9*3 -10,10*3 -10,11*3 -10,12*3 -10,11*3 -10,14*3 -10,11*3 -10
};
  myColor = 255; 
  myCenterX = 400;
  myCenterY = 400;
  myXspeed = 0;
  myYspeed = 0;
  myPointDirection = 0;
  loseHpAsteroids = 0;
    }
    
  public void setXspeed(int x){
   myXspeed = x; 
  }
    
  public double getXspeed(){
    return myXspeed;
  }
  
  public void setYspeed(int y){
   myYspeed = y; 
  }
  
  public void setCenterX(int x){
    myCenterX=x;
  }
  public void setCenterY(int x){
    myCenterY=x;
  }
    
  public double getYspeed(){
    return myYspeed;
  }
  
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  
  public double getPointDirection(){
   return myPointDirection; 
  }
  public int getloseHpAsteroids(){
   return loseHpAsteroids;
  }
    
    public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >800)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = 800;    
    }    
    if(myCenterY >800)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = 800;    
    }   
  }
  
    public void show ()  //Draws the floater at the current position  
  {          
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    
    
    if(leftR == true){
      fill(#FF7D2C);
      stroke(#FF7D2C);
      beginShape();
      for(int L = 0; L<fireCount; L++){
        vertex(xCorners[corners+L+fireCount],yCorners[corners+L+fireCount]);
      }
      endShape(CLOSE);
    }
    else if(rightR == true){
      fill(#FF7D2C);
      stroke(#FF7D2C);
      beginShape();
      for(int L = 0; L<fireCount; L++){
        vertex(xCorners[corners+L],yCorners[corners+L]);
      }
      endShape(CLOSE);
    }
    else if(bothR == true){
      fill(#FF7D2C);
      stroke(#FF7D2C);
      beginShape();
      for(int L = 0; L<fireCount+fireCount; L++){
        vertex(xCorners[corners+L],yCorners[corners+L]);
      }
      endShape(CLOSE);
    }
    
    //draw the polygon
    fill(myColor);   
    stroke(myColor); 
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    
    
    
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
    
  public void shift(){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random()*700+50);
    myCenterY = (int)(Math.random()*700+50);
    myPointDirection = (int)(Math.random()*360);
  }
  
  public void setRandomLoseHpAsteroids(){
   loseHpAsteroids = (int)(Math.random()*7+3);
  }
}
