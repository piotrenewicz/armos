float BestScore = 3000;
int loops= 0;
boolean goingdown = false;

short driver = 0;

void findbest(){findbest(2);}

void findbest(float precission){
  int r=0;
  loops = 0;
  BestScore=3000;
  float BestAngle=0;
  while(BestScore>precission){
    goingdown = false;
    for(float a = 0; a<360; a+=0.1){
      loops++;
      if(loops>10800)break;
      rotors[r]=a;
      ARM2();
      if(score()<BestScore){
        BestScore = score();
        BestAngle = a;
      }
      
      if(score()<BestScore){
        goingdown = true;
      }
      if(score()>BestScore && goingdown){
        if(driver == 1 || driver == 2)break;
      }
      
    }
    if(loops>10800){
      if(driver==2 || driver == 3)precission+=0.01;
      else break;
    }
    
    rotors[r]=BestAngle;
    r++;
    if(r==rotors.length)r=0;
  }
  
  
}
  

/*

ARMdrivers
   0 - no features most reliable
   1 - first solution  (i don't think this works as intended)
   2 - first solution && precission fatigue.
   3 - precission fatigue - this is buggy, but it can find solutions to deadlocking positions. And for some reason it forces the arm to use all joints.





*/