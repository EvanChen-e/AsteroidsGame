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
ArrayList <BossATK1> atk1 = new ArrayList <BossATK1>();
ArrayList <BossATK2> atk2 = new ArrayList <BossATK2>();

//Honestly anything initialization declaration below here is probably doable in classes but lazy

//Move animation + smoother movement
boolean leftR = false;
boolean rightR = false;
boolean bothR = false;

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;
boolean zPressed = false;
int qPress = 0;


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
boolean bossOn = false;
boolean bossFirst = false;
//Boss attack
boolean bossFirstA = false;
boolean bossSecondA = false;
int randomAtk = 0;
int timerZ = 0;
int timerLong = 0;
int timerWait = 0;
int secondTempTimer = 0;
boolean moveOn = false;

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
  for(BossATK1 Batk1 : atk1){
     Batk1.show();
  }
  for(BossATK2 Batk2 : atk2){
     Batk2.show();
     if(moveOn == true){
      Batk2.move(); 
     }
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
  
  //shows the boss attacks
  if(statistics.getattackCd() == 0 && bossFirstA == false && bossSecondA == false){
   randomAtk = (int)(Math.random()*2+1);
   if(randomAtk == 1){
     bossFirstA = true;
   }
   if(randomAtk == 2){
     bossSecondA = true;
   }
  }
  if(bossFirstA == true){
    if(timerZ == 0 && timerLong <= (20 + 10*blob.getVersion())){
    atk1.add(new BossATK1());
    timerLong++;
    }
    timerZ++;
    if(timerZ == 10){
      timerZ = 0;
    }
    if(timerLong > (20 + 10*blob.getVersion())){ //change number based on version
    timerWait++;
    if(timerWait > 400){
    bossFirstA = false;
    statistics.setattackCd(11);
    timerLong = 0;
    timerZ = 0;
    timerWait = 0;
    }
    }
  } else {
   for(int i = 0; i<atk1.size(); i++){
   atk1.remove(i);
   }
   timerZ = 0;
  }
  
  
  
  
  if(bossSecondA == true){
  if(secondTempTimer < 260){
  if(secondTempTimer == 1){
  for(int i = 0; i<(9+3*blob.getVersion()); i++){
  atk2.add(new BossATK2((int)(Math.random()*2),(int)(Math.random()*2)));
  }
  }
  secondTempTimer++;
  if(secondTempTimer > 180){
  moveOn = true;
  }
  } else {
   secondTempTimer = 0;
   bossSecondA = false;
   statistics.setattackCd(11);
   moveOn = false;
  }
  } else {
  for(int i = 0; i<atk2.size(); i++){
   atk2.remove(i);
   } 
    
  }
  //checks if boss stats whatever is shown, checks if boss hp falls below 0
  if(bossOn == true){
  blob.show();
  if(blob.getHp() <= 0){
      statistics.addScore(10000*(blob.getVersion()));
      blob.setHp(2000+250*(blob.getVersion()));
      blob.increaseVersion(1);
      statistics.setattackCd(11);
      bossOn = false;
    }
  }
  
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
       if(timeShoot > 1){
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
  shield.checkAsteroidCollision();
  shield.checkBulletCollision();
  shield.checkAtk2Collision();
  if(shield.getsCount() <= 0){
   shieldOn = false; 
  }
  }
  //check boss attack two and ship
  for(int i = 0; i<atk2.size(); i++){
   BossATK2 checking = atk2.get(i);
   float collision = dist((float)checking.getCenterX(),(float)checking.getCenterY(),(float)ship.getCenterX(),(float)ship.getCenterY());
    if(collision < 40){
     if(annihilationOn == false){
     statistics.removeHp(30);
     }
     atk2.remove(i);
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
  //Check boss bullets and ship
  for(int i = 0; i<atk1.size();i++){
   BossATK1 check4 = atk1.get(i);
   float BBship = dist((float)check4.getCenterX(),(float)check4.getCenterY(),(float)ship.getCenterX(),(float)ship.getCenterY());
   if(BBship < 60){
     
     if(annihilationOn == false){
     statistics.removeHp(5);
     annihilation.gainDed(5);
     }
     atk1.remove(i);
   }
  }
  
  if(bossOn == true){
  //Check bullet and boss
  for(int i = 0; i<shoot.size();i++){
    Bullet check3 = shoot.get(i);
    float bulletB = dist((float)blob.getCenterX(),(float)blob.getCenterY(),(float)check3.getCenterX(),(float)check3.getCenterY());
    if(bulletB < 200){
     blob.removeHp(1);
     statistics.addScore(1);
     shoot.remove(i);
     if(adrenalineOn == false){
      if(annihilationOn == false){
     adrenaline.gainA(1);
      }
     }
    }
  }
  float blobShip = dist((float)blob.getCenterX(),(float)blob.getCenterY(),(float)ship.getCenterX(),(float)ship.getCenterY());
  if(blobShip < 200){
      ship.setCenterX(400);
      ship.setCenterY(400);
    
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
     rectMode(CENTER);
     fill(255,255,255,170);
     rect(400,400,400,400);
     fill(0);
     text("Game Over",400,240);
     textAlign(LEFT);
     textSize(20);
     text("Time Played: " + statistics.getshowTime() +" seconds",230,290);
     text("Your Score: " + statistics.getScore(),230,330);
     text("Bosses Killed: " + (blob.getVersion()-1),230,370);
     //ratings based on score/hp/amount of bosses killed 
     textSize(35);
     text("Game Rating:", 230,550);
     if(statistics.getScore() < 1000){
       textAlign(CENTER);
       textSize(20);
       text("Either you ain't even trying or you",400,430);
       text("have no idea whats going on.", 400, 450);
       fill(#6C4544);
       textSize(60);
       text("F-",530,550);
     } else if (blob.getVersion() == 1){
       textAlign(CENTER);
       textSize(20);
       text("I know you can do better,",400,430);
       text("try again!", 400, 450);
       fill(#29AFFF);
       textSize(60);
       text("D+",530,550);
     } else if (blob.getVersion() == 2 && blob.getHp() > 1125){
       textAlign(CENTER);
       textSize(20);
       text("You killed the first boss though,",400,430);
       text("a passing grade.", 400, 450);
       fill(#3DC12D);
       textSize(60);
       text("C-",530,550);
     }  else if (blob.getVersion() == 2 && blob.getHp() <= 1125){
       textAlign(CENTER);
       textSize(20);
       text("You killed the first boss, almost",400,430);
       text("killed your second one.", 400, 450);
       fill(#00FF3D);
       textSize(60);
       text("C+",530,550);
     }  else if (blob.getVersion() == 3 && blob.getHp() > 1250){
       textAlign(CENTER);
       textSize(20);
       text("You fought well. Keep going.",400,430);
       fill(#FFBE5D);
       textSize(60);
       text("B",530,550);
     } else if (blob.getVersion() == 3 && blob.getHp() <= 1250){
       textAlign(CENTER);
       textSize(20);
       text("You fought well, you are improving.",400,430);
       fill(#FC6100);
       textSize(60);
       text("B+",530,550);
     }  else if (blob.getVersion() == 4 && blob.getHp() > 1375){
       textAlign(CENTER);
       textSize(20);
       text("You are a born boss killer, but",400,430);
       text("can you push yourself higher?", 400, 450);
       fill(#CF48F5);
       textSize(60);
       text("A",530,550);
     }  else if (blob.getVersion() == 4 && blob.getHp() <= 1375){
       textAlign(CENTER);
       textSize(20);
       text("You are a born boss killer,",400,430);
       text("close to a legendary one.",400,450);
       fill(#FC00E0);
       textSize(60);
       text("A+",530,550);
     }  else if (blob.getVersion() == 5 && blob.getHp() > 1500){
       textAlign(CENTER);
       textSize(20);
       text("What an accomplishment! You navigate",400,430);
       text("and survive skillfully.", 400, 450);
       fill(#F7EC93);
       textSize(60);
       text("S",530,550);
     }  else if (blob.getVersion() == 5 && blob.getHp() <= 1500){
       textAlign(CENTER);
       textSize(20);
       text("You are a master at utilizing your",400,430);
       text("advantages and know how to play.", 400, 450);
       fill(#EDD832);
       textSize(60);
       text("SS",530,550);
     }  else if (blob.getVersion() == 6){
       textAlign(CENTER);
       textSize(20);
       text("You have become a legend at this game,",400,430);
       text("almost nobody can reach your skill.",400,450);
       fill(#FFE30D);
       textSize(60);
       text("SSS",530,550);
     }  else if (blob.getVersion() >= 7){
       textAlign(CENTER);
       textSize(20);
       text("Well done... You... will ",400,430);
       text("be feared by the game.", 400, 450);
       fill(#FFE200);
       textSize(60);
       text("SSS+",530,550);
     }
     rectMode(CORNER);
     noLoop();
    }
    //if overtime and hp falls below 0 for the second time
    if(statistics.getHp() <= 0 && statistics.getOvertime() == true){
     statistics.setHp(0);
     textSize(30);
     textAlign(CENTER);
     rectMode(CENTER);
     fill(255,255,255,170);
     rect(400,400,400,400);
     fill(0);
     text("Game Over",400,240);
     textAlign(LEFT);
     textSize(20);
     text("Time Played: " + statistics.getshowTime() +" seconds",230,290);
     text("Your Score: " + statistics.getScore(),230,330);
     text("Bosses Killed: " + (blob.getVersion()-1),230,370);
     //ratings based on score/hp/amount of bosses killed 
     textSize(35);
     text("Game Rating:", 230,550);
     if(statistics.getScore() < 1000){
       textAlign(CENTER);
       textSize(20);
       text("Either you ain't even trying or you",400,430);
       text("have no idea whats going on.", 400, 450);
       fill(#6C4544);
       textSize(60);
       text("F-",530,550);
     } else if (blob.getVersion() == 1){
       textAlign(CENTER);
       textSize(20);
       text("I know you can do better,",400,430);
       text("try again!", 400, 450);
       fill(#29AFFF);
       textSize(60);
       text("D+",530,550);
     } else if (blob.getVersion() == 2 && blob.getHp() > 1125){
       textAlign(CENTER);
       textSize(20);
       text("You killed the first boss though,",400,430);
       text("a passing grade.", 400, 450);
       fill(#3DC12D);
       textSize(60);
       text("C-",530,550);
     }  else if (blob.getVersion() == 2 && blob.getHp() <= 1125){
       textAlign(CENTER);
       textSize(20);
       text("You killed the first boss, almost",400,430);
       text("killed your second one.", 400, 450);
       fill(#00FF3D);
       textSize(60);
       text("C+",530,550);
     }  else if (blob.getVersion() == 3 && blob.getHp() > 1250){
       textAlign(CENTER);
       textSize(20);
       text("You fought well. Keep going.",400,430);
       fill(#FFBE5D);
       textSize(60);
       text("B",530,550);
     } else if (blob.getVersion() == 3 && blob.getHp() <= 1250){
       textAlign(CENTER);
       textSize(20);
       text("You fought well, you are improving.",400,430);
       fill(#FC6100);
       textSize(60);
       text("B+",530,550);
     }  else if (blob.getVersion() == 4 && blob.getHp() > 1375){
       textAlign(CENTER);
       textSize(20);
       text("You are a born boss killer, but",400,430);
       text("can you push yourself higher?", 400, 450);
       fill(#CF48F5);
       textSize(60);
       text("A",530,550);
     }  else if (blob.getVersion() == 4 && blob.getHp() <= 1375){
       textAlign(CENTER);
       textSize(20);
       text("You are a born boss killer,",400,430);
       text("close to a legendary one.",400,450);
       fill(#FC00E0);
       textSize(60);
       text("A+",530,550);
     }  else if (blob.getVersion() == 5 && blob.getHp() > 1500){
       textAlign(CENTER);
       textSize(20);
       text("What an accomplishment! You navigate",400,430);
       text("and survive skillfully.", 400, 450);
       fill(#F7EC93);
       textSize(60);
       text("S",530,550);
     }  else if (blob.getVersion() == 5 && blob.getHp() <= 1500){
       textAlign(CENTER);
       textSize(20);
       text("You are a master at utilizing your",400,430);
       text("advantages and know how to play.", 400, 450);
       fill(#EDD832);
       textSize(60);
       text("SS",530,550);
     }  else if (blob.getVersion() == 6){
       textAlign(CENTER);
       textSize(20);
       text("You have become a legend at this game,",400,430);
       text("almost nobody can reach your skill.",400,450);
       fill(#FFE30D);
       textSize(60);
       text("SSS",530,550);
     }  else if (blob.getVersion() >= 7){
       textAlign(CENTER);
       textSize(20);
       text("Well done... You... will ",400,430);
       text("be feared by the game.", 400, 450);
       fill(#FFE200);
       textSize(60);
       text("SSS+",530,550);
     }
     endgame = true;
     rectMode(CORNER);
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
    
     if(key == 'q'){
      if(qPress %2 == 0){
      zPressed = true;
      }
      if(qPress %2 == 1){
      zPressed = false;
      }
      qPress++;
    }
 
    if(key == 'p'){
      statistics.shortenBossCountdown(1);
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
  
}
