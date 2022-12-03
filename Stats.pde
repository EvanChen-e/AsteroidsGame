class Stats{
  private int bc1, bc2, bc3, bCounter;
  private int color1, color2, color3, cCounter;
  private int hp, overT;
  private boolean overtime;
  Stats(){
    bc1 = 0;
    bc2 = 0;
    bc3 = 255;
    bCounter = 0;
    color1 = 255;
    color2 = 0;
    color3 = 0;
    cCounter = 0;
    hp = 150;
    overT = 150;
    overtime = false;
  }
  
  public void show(){
    if(statistics.getHp() > 0){
    fill(bc1,bc2,bc3);
    } else {
    fill(color1, color2, color3);
    }
    rect(800,0,200,800);
    
    if(bCounter == 0){
     bc2++;
     if(bc2 >= 255)
     bCounter++;
    }
    
    if(bCounter == 1){
     bc2--;
     if(bc2 <= 0)
     bCounter = 0;
    }
    
    if(cCounter == 0){
     color1+=4; 
     if(color1 >= 255)
     cCounter++;
    }
    if(cCounter == 1){
      color2+=4;
      if(color2 >= 255)
      cCounter++;
    }
    if(cCounter == 2){
      color1-=4;
      if(color1 <= 0)
      cCounter++;
    }
    if(cCounter == 3){
      color3+=4;
      if(color3 >= 255)
      cCounter++;
    }
    if(cCounter == 4){
      color2-=4;
      if(color2 <= 0)
      cCounter++;
    }
    if(cCounter == 5){
      color1+=4;
      if(color1 >= 255)
      cCounter++;
    }
    if(cCounter == 6){
      color3-=4;
      if(color3 <= 0)
      cCounter = 0;
    }
    
    fill(20);
    textAlign(CENTER);
    textSize(20);
    //hp bar
    text("Health",900,650);
    fill(0);
    rect(825,665,150,30);
    if(overtime == false)
    fill(255,0,0);
    else
    fill(#4FDAF5);
    rect(825,665,hp,30);
    //Overtime bar, duration lasts 40 seconds
    if(overtime == true){
    fill(0);
    text("! Overtime !",900,725);
    fill(0);
    rect(825,750,150,30);
    fill(color1,color2,color3);
    rect(825,750,overT,30);
    }
    
    
  }
  //setters
  public void setHp(int x){
      hp = x;
    }
  public void removeHp(int x){
      hp-=x;
    }
  public void removeOver(int x){
   overT-=x; 
  }
  public void setOver(int x){
   overT = x; 
  }
  public void setOvertime(boolean x){
   overtime = x; 
  }
  //getters
  public int getHp(){
      return hp;
  }
  public int getOver(){
   return overT;
  }
  public boolean getOvertime(){
   return overtime;
  }

  
}// end
