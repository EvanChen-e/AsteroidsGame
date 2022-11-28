//your variable declarations here
Star[] stars = new Star[500];
Spaceship ship = new Spaceship();
boolean leftR = false;
boolean rightR = false;
boolean bothR = false;
double timer = 0;
public void setup() 
{
  frameRate(60);
  size(800,800);
  background(0);
  for(int i = 0; i<stars.length;i++){
  stars[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<stars.length; i++){
   stars[i].show(); 
  }
  ship.show();
  ship.move();
}

public void keyPressed(){
    if(keyCode == UP){
     ship.accelerate(0.1); 
     if(ship.getXspeed() > 7){
       ship.setXspeed(7);
     }
     if(ship.getYspeed() > 7){
       ship.setYspeed(7);
     }
     if(ship.myXspeed < -7){
       ship.setXspeed(-7);
     }
     if(ship.getYspeed() < -7){
       ship.setYspeed(-7);
     }
     bothR = true;
     if( (ship.getXspeed() == 7 && ship.getYspeed() == 7) || (ship.getXspeed() == -7 && ship.getYspeed() == 7) || (ship.getXspeed() == 7 && ship.getYspeed() == -7) || (ship.getXspeed() == -7 && ship.getYspeed() == -7)){
      bothR = false; 
     }
     
    }
    if(keyCode == DOWN){
     ship.accelerate(-0.1); 
     if(ship.getXspeed() > 7){
       ship.setXspeed(7);
     }
     if(ship.getYspeed() > 7){
       ship.setYspeed(7);
     }
     if(ship.myXspeed < -7){
       ship.setXspeed(-7);
     }
     if(ship.getYspeed() < -7){
       ship.setYspeed(-7);
     }
    }
    
    else if(keyCode == LEFT){
     ship.turn(-4); 
     leftR = true;
    }
    else if(keyCode == RIGHT ){
     ship.turn(4); 
     rightR = true;
    }
    
    if(key == 's'){
     ship.shift();
     leftR = false;
     rightR = false;
     bothR = false;
     
    }
  }
  
  
public void keyReleased(){
  if(keyCode == UP){
    bothR = false;
  }
  if(keyCode == LEFT){
    leftR = false;
  }
  if(keyCode == RIGHT){
    rightR = false;
  }
}
