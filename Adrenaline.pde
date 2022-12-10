class Adrenaline{
  private int barA;
  private int time;
  Adrenaline(){
    barA = 0;
    time = 0;
  } 
  
  public void show(){
   fill(#C72EFF);
   rect(825,475,barA,30);
   if(barA >= 150){
     fill(255);
     textAlign(CENTER);
     textSize(20);
    text("READY!", 900,500); 
   }
  }
  
  public void adrenalineYes(){
    if(time == 0){
    barA-=2;
    statistics.removeHp(-1);
    if(statistics.getHp() < 150){
      annihilation.gainDed(1);
      }
    }
    if(barA <= 0){
     adrenalineOn = false; 
    }
    time++;
    if(time > 15){
     time = 0; 
    }
  }
  
  public void gainA(int x){
    barA+=x;
    if(barA > 150){
      barA = 150;
    }
  }public void setA(int x){
    barA=x;
  }
  
  
  public int getA(){
    return barA;
  }
  
}
