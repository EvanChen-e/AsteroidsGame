class Shield{
  private float angle;
  private int sCount;
  private int randomSpawning, increaseChance;
  private float Sx, Sy;
  Shield(){
    angle = 2;
    sCount = 30;
    randomSpawning = 0;
    Sx = (int)(Math.random()*750+25);
    Sy = -10;
    increaseChance = 2700;
  }
  public void show(double x, double y){
  fill(#52F7C4);
  //push();
    translate((float)x, (float)y);
    rotate(angle);
    angle+=0.03;
    for(int i = 0; i<22; i++){
    rotate(2);
    triangle(-20,70,20,70,0,90);
  }
  rotate(-angle);
  translate(-(float)x,-(float)y);
  //pop();
  }
  
  public void createCount(){
    fill(#4FDAF5);
    for(int i = 0; i<sCount;i++){
      rect(825+(i*5),375,5,30);
    }
  }
  public void checkAsteroidCollision(){
  for(int i = 0;i<asteroid.size(); i++){
   Asteroid check2 = asteroid.get(i); 
   float collision2 = dist((float)ship.getCenterX(),(float)ship.getCenterY(),(float)check2.getCenterX(),(float)check2.getCenterY());
   if(collision2 < 100){
    removesCount(1);
    asteroid.remove(i);
    Asteroid asteroids = new Asteroid((int)(Math.random()*800),-5,(int)(Math.random()*2+1));
    asteroid.add(asteroids);
    }
   }
  }
  public void randomSpawn(){
    int random = (int)(Math.random()*increaseChance);
    if(random == randomSpawning && increaseChance <= 900){
      shieldOnScreen = true;
      increaseChance = 2700;
    }
    increaseChance--;
    //System.out.println(increaseChance);
  }
  public void spawnMove(){
    fill(#52F7C4);
    //push();
    translate((float)Sx, (float)Sy);
    noStroke();
    for(int i = 0; i<22; i++){
    rotate(2);
    triangle(-20,40,20,40,0,60);
    }
    rotate(-44);
    translate(-(float)Sx,-(float)Sy);
    //pop();
    Sy++;
    float touch = dist(shield.getSx(),shield.getSy(),(float)ship.getCenterX(),(float)ship.getCenterY());
    if(touch < 75){
      shieldOn = true;
      shieldOnScreen = false;
      sCount = 30;
      Sy = -10;
      Sx = (int)(Math.random()*750+25);
    }
    if(Sy>800){
     shieldOnScreen = false;
     Sy = -10;
     Sx = (int)(Math.random()*750+25);
    }
  }
  //setters
  public void removesCount(int x){
    sCount-=x;
  }
  public void setsCount(int x){
    sCount=x;
  }
  //getters
  public int getsCount(){
   return sCount; 
  }
  public float getSx(){
   return Sx; 
  }
  public float getSy(){
   return Sy; 
  }
  
}
