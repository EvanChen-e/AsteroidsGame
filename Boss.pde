class Boss{
  private int hp;
  private int myCenterX, myCenterY;
  private int version;
 Boss(){
   hp = 2000;
   myCenterX = 400;
   myCenterY = -50;
   version = 1;
 }
 
 public void show(){
  fill(#B61CFA);
  ellipse(myCenterX,myCenterY,400,400); 
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("V", 400, 90);
  textSize(80);
  text("._.",400, 100);
  
  
 }
 public void removeHp(int x){
  hp-=x; 
 }
 public void shortenHp(int x){
   hp=x; 
 }
  public void setHp(int x){
  hp=x;
 }
  public void increaseVersion(int x){
  version+=x;
 }
 
 public int getVersion(){
  return version; 
 }
 public int getHp(){
  return hp; 
 }
 public int getCenterX(){
  return myCenterX; 
 }
 public int getCenterY(){
  return myCenterY; 
 }
  
  
}
