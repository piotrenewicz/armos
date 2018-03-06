import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PVector target=new PVector();
PVector tip=new PVector();
PeasyCam cam;

void settings(){
  size(1400, 1300, P3D);
}


void setup(){
  cam = new PeasyCam(this, 400);
  
  target.x=500;
  target.y=700;
  
  plank1 = 400;
  plank2 = 600;
  plank3 = 100;
  //noLoop();
}


//PVector controlRot;


float[] rotors = new float[4];
int plank1;
int plank2;
int plank3;



void draw(){
  
  
  background(0);
  fill(255);
  box(10000);
  refrence();
  motion();
  lights();
  
  //findbest();
  
  if(Manual){
  rotors[0] = map(mouseX, 0, width, 0, 360);
  rotors[1] = map(mouseY, 0, height, 0, 360);
  }
  if(AUTO){
    target.set(x, y, z);
    findbest();
  }
  if(HOVER){
    target.set(x, y, z);
  }
  
  cam.beginHUD();
  fill(0);
  text(rotors[0], 200, 100); 
  text(rotors[1], 200, 120);
  text(rotors[2], 200, 140);
  text(rotors[3], 200, 160);
  text(score(), 200, 200);
  text(BestScore, 200, 220);
  text(x+"  "+y+"  "+z, 200, 270);
  cam.endHUD();
  
  pushMatrix();
    translate(0, 500, 0);
    //if(BestScore<2)
    ARM();
  popMatrix();
  pushMatrix();
  translate(tip.x, tip.y, tip.z);
  box(30);
  popMatrix();
  pushMatrix();
  translate(target.x, target.y, target.z);
  box(30);
  popMatrix();
}

void ARM2(){
  pushMatrix();
    translate(0, 500, 0);
    
  rotateY(radians(rotors[0]));
  rotateZ(radians(rotors[1]));
  translate(plank1, 0);
  rotateZ(radians(rotors[2]));
  translate(plank2, 0);
  rotateZ(radians(rotors[3]));
  translate(plank3, 0);
  tip.set(modelX(0,0,0),modelY(0,0,0), modelZ(0,0,0));
  popMatrix();
}

int ARMRange(){
  return plank1 + plank2;
}



void ARM(){
  strokeWeight(8);
  
  pushMatrix();
  translate(0, 25, 0);
  box(200, 50, 100);
  popMatrix();
  rotateY(radians(rotors[0]));
  rotateZ(radians(rotors[1]));
  stroke(255,0,0);
  line(0, 0, plank1, 0);
  box(10);
  translate(plank1, 0);
  rotateZ(radians(rotors[2]));
  stroke(0,255,0);
  line(0, 0, plank2, 0);
  box(10);
  translate(plank2, 0);
  rotateZ(radians(rotors[3]));
  stroke(0,0,255);
  line(0, 0, plank3, 0);
  translate(plank3, 0);
  tip.set(modelX(0,0,0),modelY(0,0,0), modelZ(0,0,0));
}

float score(){
  return dist(tip.x, tip.y, tip.z, target.x, target.y, target.z);
}

boolean Manual = false;
boolean AUTO = false;
boolean HOVER = false;
int x = 0;
int y = 0;
int z = 0;
byte xV=0;
byte yV=0;
byte zV=0;

void keyPressed(){
  if( key == 'r')findbest();
  if( key == 'e')Manual=!Manual;
  if( key == 'g')AUTO=!AUTO;
  if( key == 'h')HOVER=!HOVER;
  if( key == 't')target.set(x, y, z);
  if( key == 'y')BestScore=3000;
  
  
  if( key == 'f')yV=-1;
  if( key == 'c')yV=1;
  if( key == 'w')zV=-1;
  if( key == 's')zV=1;
  if( key == 'a')xV=-1;
  if( key == 'd')xV=1;
  
}

void keyReleased(){
  if( key == 'f')yV=0;
  if( key == 'c')yV=0;
  if( key == 'w')zV=0;
  if( key == 's')zV=0;
  if( key == 'a')xV=0;
  if( key == 'd')xV=0;
}

void motion(){
  x+=xV;
  y+=yV;
  z+=zV;
}



/*void mouseWheel(MouseEvent e){
  float ev = e.getCount();
  scrool+=ev;
}*/