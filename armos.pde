PVector target=new PVector();
PVector tip=new PVector();

void setup(){
  size(1400, 1300);
  
  target.x=500;
  target.y=700;
  
  plank1 = 400;
  plank2 = 600;
  plank3 = 100;
  //noLoop();
}


//PVector controlRot;


float[] rotors = new float[3];
int plank1;
int plank2;
int plank3;



void draw(){
  
  
  background(0);
  refrence();
  
  //findbest();
  
  if(Manual){
  rotors[0] = map(mouseX, 0, width, 0, 360);
  rotors[1] = map(mouseY, 0, height, 0, 360);
  }
  if(AUTO){
    target.set(mouseX, mouseY);
    findbest();
  }
  
  
  text(rotors[0], 200, 100); 
  text(rotors[1], 200, 200);
  text(rotors[2], 200, 300);
  text(score(), 200, 400);
  
  pushMatrix();
    translate(width/50, height/2);
    ARM();
  popMatrix();
  
  ellipse(tip.x, tip.y, 20, 20);
  ellipse(target.x, target.y, 20, 20);
}

void ARM2(){
  pushMatrix();
    translate(width/50, height/2);
  rotate(radians(rotors[0]));
  translate(plank1, 0);
  rotate(radians(rotors[1]));
  translate(plank2, 0);
  rotate(radians(rotors[2]));
  translate(plank3, 0);
  tip.set(screenX(0,0),screenY(0,0));
  popMatrix();
}

int ARMRange(){
  return plank1 + plank2;
}



void ARM(){
  strokeWeight(8);

  rect(0, -100, -50, 100);
  rotate(radians(rotors[0]));
  stroke(255,0,0);
  line(0, 0, plank1, 0);
  translate(plank1, 0);
  rotate(radians(rotors[1]));
  stroke(0,255,0);
  line(0, 0, plank2, 0);
  translate(plank2, 0);
  rotate(radians(rotors[2]));
  stroke(0,0,255);
  line(0, 0, plank3, 0);
  translate(plank3, 0);
  tip.set(screenX(0,0),screenY(0,0));
}

int score(){
  return int(dist(tip.x, tip.y, target.x, target.y));
}

boolean Manual = false;
boolean AUTO = false;

void keyPressed(){
  if( key == 'w')findbest();
  if( key == 'e')Manual=!Manual;
  if( key == 'r')AUTO=!AUTO;
  if( key == 't')target.set(mouseX, mouseY);
  
}


int loops= 0;
void findbest(){findbest(10);}

void findbest(float precission){
  int r=0;
  loops = 0;
  float BestScore = 3000;
  int BestAngle=0;
  
  while(BestScore>precission){
    for(int a = 0; a<360; a++){
      loops++;
      if(loops>1080)break;
      rotors[r]=a;
      ARM2();
      if(score()<BestScore){
        BestScore = score();
        BestAngle = a;
      }
      
    }
    if(loops>1080)break;
    
    rotors[r]=BestAngle;
    r++;
    if(r==rotors.length)r=0;
  }
  
  
}
  

//int 