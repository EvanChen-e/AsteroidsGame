class BossATK2{
  int randomHorVert;
  int randomLefRig;
  int myCenterX;
  int myCenterY;
  BossATK2(int x, int y){
    randomHorVert = x;
    randomLefRig = y;
    if(randomHorVert == 0){ //vertical 
      myCenterX = (int)(Math.random()*780+10);
      myCenterY = 780;
    }
    if(randomHorVert == 1){ //horizontal
      if(randomLefRig == 0){ //left
      myCenterX = 20;
      myCenterY = (int)(Math.random()*780+10);
      }
      if(randomLefRig == 1){ //right
      myCenterX = 780;
      myCenterY = (int)(Math.random()*780+10);
      }
    }
    
  }
  
  public void show(){
    stroke(255);
    if(randomHorVert == 0){ //vertical 
      fill(255,0,0,150);
      rect(myCenterX-5,-10,10,900);
      fill(#B4FFC1);
      triangle(myCenterX-10,myCenterY+20,myCenterX+10,myCenterY+20,myCenterX,myCenterY-20);
    }
    if(randomHorVert == 1){ //horizontal
      if(randomLefRig == 0){ //left
        fill(255,0,0,150);
        rect(-10,myCenterY-5,900,10);
        fill(#B4FFC1);
        triangle(myCenterX-20,myCenterY-10,myCenterX-20,myCenterY+10,myCenterX+20,myCenterY);
      }
      if(randomLefRig == 1){ //right
        fill(255,0,0,150);
        rect(-10,myCenterY-5,900,10);
        fill(#B4FFC1);
        triangle(myCenterX+20,myCenterY-10,myCenterX+20,myCenterY+10,myCenterX-20,myCenterY);
      }
    }
  }
  
  public void move(){
    if(randomHorVert == 0){ //vertical 
    myCenterY-=15;
    }
    if(randomHorVert == 1){ //horizontal
      if(randomLefRig == 0){ //left
      myCenterX+=15;
      }
      if(randomLefRig == 1){ //right
      myCenterX-=15;
      }
    }
    
  }
  
  public int getCenterX(){
    return myCenterX;
  }
  public int getCenterY(){
    return myCenterY;
  }
  
}
