class Stats{
  private int bc1, bc2, bc3, bCounter;
  private int color1, color2, color3, cCounter;
  private int hp, overT;
  private boolean overtime;
  private int showTime;
  private int score;
  private int showcount;
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
    showTime = -1;
    score = -1;
    showcount = 0;
  }
  
  public void show(){
    //score
    textAlign(RIGHT);
    fill(255);
    textSize(20);
    text("Score: " + score,780,20);
    //time
    textAlign(LEFT);
    fill(255);
    textSize(20);
    text("Time elapsed: " + showTime,20,20);
    if(showcount == 0){
    showTime++;
    }
    showcount++;
    if(showcount > 60){
     showcount = 0; 
    }
    if(statistics.getHp() > 0 && overtime == false){
    fill(bc1,bc2,bc3);
    } else {
    fill(color1, color2, color3);
    }
    rect(800,0,200,800);
    
    if(hp > 150){
     hp = 150; 
    }
    
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
    //Powerup settings
    fill(0);
    textSize(30);
    text("Powerups", 900,300);
    textSize(20);
    text("Shield", 900,350);
    text("Adrenaline", 900,450);
    text("Annihilation", 900, 550);
    fill(0);
    rect(825,375,150,30);
    if(shieldOn == false){
     fill(255);
     text("INACTIVE",900,400);
    } else {
     fill(255);
     shield.createCount();
    }
    fill(0);
    rect(825,475,150,30);
    rect(825,575,150,30);
    
    //Boss 
    if(firstBoss == false){ //turn it into true later
    strokeWeight(10);
    stroke(0);
    line(820,20,820,80);
    line(820,80,880,80);
    line(880,80,880,20);
    line(880,20,820,20);
    fill(#B61CFA);
    rect(820,20,60,60);
    strokeWeight(1);
    stroke(255);
    fill(0);
    textSize(30);
    text("._.",850,55);
    textSize(15);
    text("Boss: The Blob",940,40);
    text("Version: " + blob.getVersion(), 940,70);
    textSize(20);
    textAlign(LEFT);
    text("HP: " + blob.getHp(), 820,110);
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
  public void addScore(int x){
   score+=x; 
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
