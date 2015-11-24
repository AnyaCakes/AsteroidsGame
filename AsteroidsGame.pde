SpaceShip ship = new SpaceShip();
boolean up=false;
boolean left=false;
boolean right=false;
PImage img; 
PImage imag;
int num=200;
Asteroid[] aster = new Asteroid[100];
Star[] stars=new Star[num];
public void setup() 
{
  ship.setX(400);
  ship.setY(400);
  size(800,800);
  img = loadImage("Ship.png");
  imag = loadImage("asteroid.gif");

  for(int i=0; i<num; i++)
  {
    stars[i]=new Star((float)Math.random()*800,(float)Math.random()*800, (float)Math.random()*8);
  }
  for(int i=0; i<10; i++)
  {
    aster[i]=new Asteroid();
    aster[i].setX((int)(Math.random()*800));
    aster[i].setY((int)(Math.random()*800));
    aster[i].setPointDirection((int)(Math.random()*360));
    aster[i].setDirectionX(Math.random()*8-4);
    aster[i].setDirectionY(Math.random()*8-4);
  }
}

public void draw() 
{
  background(0,0,0);
  for(int i=0; i<num; i++)
  {
  stars[i].show();
  }
  for(int i=0; i<10; i++)
  {
    aster[i].show();
    aster[i].move();
  }
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
      ship.accelerate(0.05);
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
    if(keyCode==SHIFT){
      fill(255,255,255);
      rect(0,0,800,800);
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
  else if(keyCode==SHIFT){
    ship.setX((int)(Math.random()*800));
    ship.setY((int)(Math.random()*800));
    ship.setPointDirection((int)(Math.random()*360));
    ship.setDirectionX(0);
    ship.setDirectionY(0);

  }
}
class Star
{
  float sSize, sX, sY;
  Star(float x, float y, float w)
  {
    sX=x;
    sY=y;
    sSize=w;
  }
  void show()
  {
    ellipse(sX,sY,sSize, sSize);
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
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
        myDirectionX=x;
      }
      public double getDirectionX()
      {
        return myDirectionX;
      }
      public void setDirectionY(double y)
      {
        myDirectionY=y;
      }
      public double getDirectionY()
      {
        return myDirectionY;
      }
      public void setPointDirection(int degrees)
      {
        myPointDirection=(int)degrees;
      }
      public double getPointDirection()
      {
        return myPointDirection;
      }
      public void show()
      {
        float dRadians = (float)(myPointDirection*(Math.PI/180));
        translate(getX(), getY());
        rotate(dRadians);
        image(img, -25, -25, 50, 50);
        rotate(-dRadians);
        translate(-getX(), -getY());
      }
}
class Asteroid extends Floater
{
  public Asteroid()
  {
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
        myDirectionX=x;
      }
      public double getDirectionX()
      {
        return myDirectionX;
      }
      public void setDirectionY(double y)
      {
        myDirectionY=y;
      }
      public double getDirectionY()
      {
        return myDirectionY;
      }
      public void setPointDirection(int degrees)
      {
        myPointDirection=(int)degrees;
      }
      public double getPointDirection()
      {
        return myPointDirection;
      }
      public void show()
      {
        float dRadians = (float)(myPointDirection*(Math.PI/180));
        translate(getX(), getY());
        rotate(dRadians);
        image(imag, -25, -25, 50, 50);
        rotate(-dRadians);
        translate(-getX(), -getY());
      }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
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
     /**
     *  
     */  //convert degrees to radians for sin and cos         
     /**
     *  
     */  double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;  

    beginShape();         
 for(int nI = 0; nI < corners; nI++)    
   {     
      //rotate and translate the coordinates of the floater using current direction 
   xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
    yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
     vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  }   

} 
