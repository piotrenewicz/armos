void refrence(){
  
  color f = g.fillColor;
  color s = g.strokeColor;
  
  pushMatrix();
    translate(-1000, -1000, -1000);
    fill(255,0,0);
    stroke(255,0,0);
    line(0,0,0,-160,0,0);
    ellipse(-165,0,40,40);
    fill(0,255,0);
    stroke(0,255,0);
    line(0,0,0,0,-160,0);
    ellipse(0,-165,40,40);
     fill(0,0,255);
    stroke(0,0,255);
    line(0,0,0,0,0,-160);
    translate(0,0,-165);
    sphere(20);
    fill(f);
    stroke(s);
    
  popMatrix();
}

//x,y,z
//r,g,b