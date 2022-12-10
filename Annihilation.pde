class Annihilation{
  private double barDed = 150;
  private int timer = 0;
  private int moveFunny = 0;
  Annihilation(){
    
  }
  
  public void show(){
   fill(#9B0303);
   rect(825,575,(int)barDed,30);
    if(barDed >= 150){
    barDed = 150;
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("READY!", 900,600); 
   }
  }
  
  public void annihilationYes(){
   gainDed(-0.33);
   if(timer <= 200){
   if(timeShootAnni == 0){
      for(int i = 0; i<360;i+=4){
      ship.turn(4);
      shoot.add(new Bullet(ship));
      }
    }
    timeShootAnni++;
    if(timeShootAnni > 20){
       timeShootAnni = 0; 
      } 
   }
    timer++;
    if(timer >= 300 && timer <= 400){
     shoot.add(new Bullet(ship));
     ship.turn(16);
     shoot.add(new Bullet(ship));
     ship.turn(16);
     shoot.add(new Bullet(ship));
     ship.turn(-48);
     shoot.add(new Bullet(ship));
     ship.turn(-16);
     shoot.add(new Bullet(ship));
     ship.turn(32);
     moveFunny++;
     if(moveFunny > 5){
       ship.turn(2); 
     } else {
       ship.turn(-2); 
     }
     if(moveFunny == 10){
      moveFunny = 0; 
     }
     
    }
    if(timer > 600){
     annihilationOn = false; 
    }
  }
  
  public void drawBubble(){
    fill(#00F4FF, 150);
    ellipse((float)ship.getCenterX(),(float)ship.getCenterY(), 125,125);
  }
  
  public void setTimer(int x){
   timer = x; 
  }
  
  public void gainDed(double x){
    barDed+=(0.75*x);
    System.out.println(barDed);
  }
  
  public double getBarDed(){
   return barDed; 
  }
}
