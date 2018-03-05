void refrence(){
  
  color f = g.fillColor;
  color s = g.strokeColor;
  
  pushMatrix();
    translate(width/100, height/100);
    fill(255,0,0);
    stroke(255,0,0);
    line(0,0,60,0);
    ellipse(65,0,15,15);
    fill(0,255,0);
    stroke(0,255,0);
    line(0,0,0,60);
    ellipse(0,65,15,15);
    fill(f);
    stroke(s);
    
  popMatrix();
}

//x,y,z
//r,g,b