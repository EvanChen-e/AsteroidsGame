//your variable declarations here
Star[] stars = new Star[500];
Spaceship ship = new Spaceship();
ArrayList <Asteroid> asteroid = new ArrayList <Asteroid>();
ArrayList <Bullet> shoot = new ArrayList <Bullet>();
Shield shield = new Shield();
Stats statistics = new Stats();
Adrenaline adrenaline = new Adrenaline();
Annihilation annihilation = new Annihilation();
Boss blob = new Boss();

//Move animation + smoother movement
boolean leftR = false;
boolean rightR = false;
boolean bothR = false;

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;
boolean zPressed = false;


//Bullet
int timeShoot = 0;

//Overtime
int timeOver = 0;
double startTimer = 0;
int overtime = 0;

//Shield
boolean shieldOn = false;
boolean shieldOnScreen = false;

//Adrenaline
boolean adrenalineOn = false;
int timeShootAnni = 0;

//Annihilation
boolean annihilationOn = false;

//Boss
boolean firstBoss = false;
boolean bossOn = false;

//Score
int timeElapse = 0;

//Ending the game
boolean endgame = false;


public void setup() 
{
  frameRate(60);
  size(1000,800);
  background(0);
  for(int i = 0; i<stars.length;i++){
  stars[i] = new Star();
  }
  for(int i = 0; i<25;i++){
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
  for(Bullet shooting : shoot){
    shooting.show();
    shooting.move();
  }
  if(annihilationOn == true){
   annihilation.drawBubble(); 
  }
  ship.show();
  if(annihilationOn == false){
  ship.move();
  }
  statistics.show();
  adrenaline.show();
  annihilation.show();
  blob.show();
  
  //Calls function that determines when boss spawns
  if(bossOn == false){
    
  }
  
  //add score for time elapsed
  if(timeElapse == 0){
  statistics.addScore(1);
  }
  timeElapse++;
  if(timeElapse > 60){
   timeElapse = 0; 
  }
  
  //Checks for key pressing
  if(upPressed == true){
  if(annihilationOn == false){
  ship.accelerate(0.05); 
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
  }
  
  if(downPressed == true){
    if(annihilationOn == false){
    ship.accelerate(-0.05); 
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
  }
  
  if(leftPressed == true){
    if(annihilationOn == false){
    ship.turn(-4); 
    leftR = true;
    }
  }
  
  if(rightPressed == true){
    if(annihilationOn == false){
     ship.turn(4); 
     rightR = true;
    }
  }
  
  if(zPressed == true){
    if(annihilationOn == false){
      if(timeShoot == 0){
      shoot.add(new Bullet(ship));
      }
      timeShoot++;
      if(adrenalineOn == false){
      if(timeShoot > 8){
       timeShoot = 0; 
      }
      } else {
       if(timeShoot > 2){
        timeShoot = 0; 
       }
      } 
    }
  }
  
  if(adrenalineOn == true){
  adrenaline.adrenalineYes();
  }
  if(annihilationOn == true){
   annihilation.annihilationYes(); 
  }
  //Shield functions, draw this last because of rotation issues
  if(shieldOnScreen == false){
  shield.randomSpawn();
  } else if (shieldOnScreen == true){
   shield.spawnMove();
   
  }
  if(shieldOn == true){
  shield.show(ship.getCenterX(),ship.getCenterY());
  //shield.createCount();
  shield.checkAsteroidCollision();
  if(shield.getsCount() <= 0){
   shieldOn = false; 
  }
  }
  //Asteroid and Bullet collision
  for(int i = 0;i<asteroid.size(); i++){
   Asteroid check = asteroid.get(i); 
   for(int j = 0; j<shoot.size(); j++){
     Bullet check2 = shoot.get(j);
     float bulletC = dist((float)check2.getCenterX(),(float)check2.getCenterY(),(float)check.getCenterX(),(float)check.getCenterY());
     if(bulletC < 10){
    statistics.addScore(5);
    asteroid.remove(i);
    shoot.remove(j);
    Asteroid asteroids = new Asteroid((int)(Math.random()*800),-5,(int)(Math.random()*2+1));
    asteroid.add(asteroids);
    if(annihilationOn == false){
    if(adrenalineOn == false){
    adrenaline.gainA(2);
    }
    }
    //add to score
   }
   }
   float collision = dist((float)ship.getCenterX(),(float)ship.getCenterY(),(float)check.getCenterX(),(float)check.getCenterY());
   if(collision < 50){
    if(annihilationOn == false){
    ship.setRandomLoseHpAsteroids();
    statistics.removeHp(ship.getloseHpAsteroids());
    annihilation.gainDed(ship.getloseHpAsteroids());
    }
    asteroid.remove(i);
    Asteroid asteroids = new Asteroid((int)(Math.random()*800),-5,(int)(Math.random()*2+1));
    asteroid.add(asteroids);
    }
  }
  
  //Check bullet and boss
  for(int i = 0; i<shoot.size();i++){
    Bullet check3 = shoot.get(i);
    float bulletB = dist((float)blob.getCenterX(),(float)blob.getCenterY(),(float)check3.getCenterX(),(float)check3.getCenterY());
    if(bulletB < 200){
     blob.removeHp(1);
     shoot.remove(i);
     if(adrenalineOn == false){
      if(annihilationOn == false){
     adrenaline.gainA(1);
      }
     }
    }
  }
  
  //Checks first health bar before overtime
  if(statistics.getHp() <= 0 && (statistics.getOvertime() == false)){
    statistics.setHp(75);
    statistics.setOvertime(true);
    shieldOn = true;
    shield.setsCount(30);
    adrenaline.setA(150);
    adrenalineOn = true;
    annihilation.setDed(150);
  }
  if(statistics.getOvertime() == true){
   timeOver++;
  }
  
  //Sets duration of overtime
    if(timeOver == 1){
    statistics.removeOver(1);
    }
    if(timeOver > 30){
     timeOver = 0;
    }
    //End game
    if(endgame == true){
      noLoop();
    }
    //if overtime has ended end game
    if(statistics.getOver() <= 0){
     textSize(30);
     textAlign(CENTER);
     fill(255);
     text("Lmao skill issue",500,400); //temporary
     noLoop();
    }
    //if overtime and hp falls below 0 for the second time
    if(statistics.getHp() <= 0 && statistics.getOvertime() == true){
     statistics.setHp(0);
     textSize(30);
     textAlign(CENTER);
     fill(255);
     text("Lmao skill issue",500,400); //temporary
     endgame = true;
    }
}

public void keyPressed(){
    if(keyCode == UP){
      upPressed = true;
     
    }
    if(keyCode == DOWN){
      downPressed = true;
      
    }
    
    if(keyCode == LEFT){
     leftPressed = true;
     
    }
    else if(keyCode == RIGHT ){
      rightPressed = true;
      
    }
    
    if(key == 's'){
     if(annihilationOn == false){
     ship.shift();
     leftR = false;
     rightR = false;
     bothR = false;
     }
    }
    
    if(key == 'z' && adrenaline.getA() == 150){
      adrenalineOn = true;
    }
    
    if(key == 'x' && annihilation.getBarDed() == 150){
     annihilation.setTimer(0);
     ship.setXspeed(0);
     ship.setYspeed(0);
     annihilationOn = true; 
    }
    
    if(key == ' '){
      zPressed = true;
      
    }
 
  }
  
  void mouseClicked(){
   //System.out.print(mouseX); 
   //System.out.print(" , ");
   //System.out.println(mouseY);
  }
  
  
public void keyReleased(){
  if(keyCode == UP){
    upPressed = false;
    bothR = false;
  }
  if(keyCode == LEFT){
    leftPressed = false;
    leftR = false;
  }
  if(keyCode == RIGHT){
    rightPressed = false;
    rightR = false;
  }
  if(keyCode == DOWN){
    downPressed = false;
    rightR = false;
  }
  
  if(key == ' '){
   zPressed = false; 
  }
}
