//your variable declarations here
Star[] stars = new Star[500];
Spaceship ship = new Spaceship();
ArrayList <Asteroid> asteroid = new ArrayList <Asteroid>();
Stats statistics = new Stats();
boolean leftR = false;
boolean rightR = false;
boolean bothR = false;
int timeOver = 0;
double startTimer = 0;
public void setup() 
{
  frameRate(60);
  size(1000,800);
  background(0);
  for(int i = 0; i<stars.length;i++){
  stars[i] = new Star();
  }
  for(int i = 0; i<20;i++){
   Asteroid asteroids = new Asteroid();
   asteroid.add(asteroids);
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<stars.length; i++){
   stars[i].show(); 
  }
  for(Asteroid asteroids : asteroid){
    asteroids.show();
    asteroids.move();
  }
  ship.show();
  ship.move();
  statistics.show();
  
  for(int i = 0;i<asteroid.size(); i++){
   Asteroid check = asteroid.get(i); 
   float collision = dist((float)ship.getCenterX(),(float)ship.getCenterY(),(float)check.getCenterX(),(float)check.getCenterY());
   if(collision < 50){
    statistics.removeHp((int)(Math.random()*7+3));
    asteroid.remove(i);
    Asteroid asteroids = new Asteroid((int)(Math.random()*800),-5,(int)(Math.random()*2+1));
    asteroid.add(asteroids);
   }
  }
  //Checks health and overtime bar
  if(statistics.getHp() <= 0){
    statistics.setHp(0);
    if(timeOver == 0){
    statistics.removeOver(1);
    }
    timeOver++;
    if(timeOver > 15){
     timeOver = 0;
    }
    if(statistics.getOver() <= 0){
     statistics.setOver(0);
     textSize(30);
     textAlign(CENTER);
     fill(255);
     text("Lmao skill issue",500,400); //temporary
     frameRate(0);
    }
    }
  
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
  
  void mouseClicked(){
   System.out.print(mouseX); 
   System.out.print(" , ");
   System.out.println(mouseY);
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

