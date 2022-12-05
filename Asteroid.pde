class Asteroid extends Floater{
  private double asteroidRotation;
  Asteroid(){
   asteroidRotation = (double)(Math.random()*5-3);
   corners = 12;
   xCorners = new int[]{1,-2 , -8, -6, -9, -7, -1, 4, 9, 5, 8, 7};
   yCorners = new int[]{-9, -12, -7, -3, 2, 8, 7, 9, 1, -2,-5, -13};
  myColor = 50; 
  myCenterX = (float)(Math.random()*800);
  myCenterY = (float)(Math.random()*800);
  myXspeed = (int)(Math.random()*5-3);
  myYspeed = (int)(Math.random()*5-3);
  myPointDirection = (int)(Math.random()*360);
  }
  
  Asteroid(float x, float y, int ySpeed){
   asteroidRotation = (double)(Math.random()*5-3);
   corners = 12;
   xCorners = new int[]{1,-2 , -8, -6, -9, -7, -1, 4, 9, 5, 8, 7};
   yCorners = new int[]{-9, -12, -7, -3, 2, 8, 7, 9, 1, -2,-5, -13};
  myColor = 50; 
  myCenterX = x;
  myCenterY = y;
  myXspeed = (int)(Math.random()*5-3);
  myYspeed = ySpeed;
  myPointDirection = 0;
  }
  
  
  public void move ()   //move the floater in the current direction of travel
  {      
    while(myXspeed == 0){
      myXspeed = (int)(Math.random()*5-3);
    }
    while(myYspeed == 0){
      myYspeed = (int)(Math.random()*5-3);
    }
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX > 850)
    {     
      myCenterX = -10;    
    }    
    else if (myCenterX<-50)
    {     
      myCenterX = 810;    
    }    
    if(myCenterY >850)
    {    
      myCenterY = -10;    
    } 
    
    else if (myCenterY < -50)
    {     
      myCenterY = 810;    
    }   
  }   
  
  
  
  public void show ()  //Draws the floater at the current position  
  {          
    fill(myColor);   
    stroke(255);
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    
    //rotation of the asteroid
    while(asteroidRotation == 0){
     asteroidRotation = (double)(Math.random()*5-3); 
    }  
    myPointDirection+=asteroidRotation;
    

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  
}
  
