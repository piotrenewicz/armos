float BestScore = 3000;
int loops= 0;
void findbest(){findbest(2);}

void findbest(float precission){
  int r=0;
  loops = 0;
  BestScore=3000;
  float BestAngle=0;
  //float pos[] = rotors;
  while(BestScore>precission){
    for(float a = 0; a<360; a+=0.1){
      loops++;
      if(loops>10800)break;
      rotors[r]=a;
      ARM2();
      if(score()<BestScore){
        BestScore = score();
        BestAngle = a;
      }
      
    }
    if(loops>10800){
      //rotors=pos;
      break;
    }
    
    rotors[r]=BestAngle;
    r++;
    if(r==rotors.length)r=0;
  }
  
  
}
  

//int 