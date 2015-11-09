SpaceShip ship = new SpaceShip();
boolean up=false;
boolean left=false;
boolean right=false;
PImage img; 
public void setup() 
{
  size(400,400);
  img = loadImage("Ship.png");
}
public void draw() 
{
  background(0,100,100);
  ship.show();
   ship.move();
   if(ship.myDirectionX>5){
    ship.myDirectionX=5;
   }
   if(ship.myDirectionX<-5){
    ship.myDirectionX=-5;
   }
   if(ship.myDirectionY>5){
    ship.myDirectionY=5;
   }
   if(ship.myDirectionY<-5){
    ship.myDirectionY=-5;
   }
    if(up){
      ship.accelerate(0.1);
    }
    if(left){
    ship.rotato(-5);
    }
    if(right){
    ship.rotato(5);
    }
 }
 public void keyPressed(){
    if(keyCode==UP){
      up=true;
    }
    else if(keyCode==LEFT){
      left=true;
    }
    else if(keyCode==RIGHT){
      right=true;
    }
 }
public void keyReleased(){
  if(keyCode==UP){
    up=false;
  }
  else if(keyCode==LEFT){
    left=false;
  }
  else if(keyCode==RIGHT){
    right=false;
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip(){
      /*corners=3;
      xCorners=new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      myColor=1;*/
    }
      public void setX(int x)
      {
        myCenterX=x;
      }
      public int getX()
      {
        return (int)myCenterX;
      }
      public void setY(int y)
      {
        myCenterY=y;
      }
      public int getY()
      {
        return (int)myCenterY;
      }
      public void setDirectionX(double x)
      {
        x=myDirectionX;
      }
      public double getDirectionX()
      {
        return myDirectionX;
      }
      public void setDirectionY(double y)
      {
        y=myDirectionY;
      }
      public double getDirectionY()
      {
        return myDirectionY;
      }
      public void setPointDirection(int degrees)
      {
        degrees = (int)myPointDirection;
      }
      public double getPointDirection()
      {
        return myPointDirection;
      }
      public void show()
      {
        double dRadians = myPointDirection*(Math.PI/180);
        translate(getX(), getY());
        rotate((float)dRadians);
        image(img, -25, -25, 50, 50);
      }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  /*protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   */
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotato (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees  
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY  
    myCenterX += myDirectionX;  
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    //fill(myColor);   
    //stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;  
   /* rotate(width/2, height/2);
    rotate(myPointDirection*Math.PI/360);
    translate(-img.width/2, -img.height/2);  */
    /*beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);*/  
  }   
} 