class Star //note that this class does NOT extend Floater
{
  private int myX, myY, mySize, myC1, myC2, myC3;
  public Star(){
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    mySize = (int)(Math.random()*1+2);
    myC1 = (int)(Math.random()*255);
    myC2 = (int)(Math.random()*255);
    myC3 = (int)(Math.random()*255);
  }
  public void show(){
  fill(myC1,myC2,myC3);
 
  noStroke();
  ellipse(myX,myY,mySize,mySize);
  }
}
