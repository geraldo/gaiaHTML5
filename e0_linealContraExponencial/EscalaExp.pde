/**
 * A Slider for handling exponential scales
 *
 *
 */

class EscalaExp extends Escala {
  
  // Constructor
  // x1 int: x-coordinate of the beginning of the slider
  // y int: y-coordinate of the slider
  EscalaExp(int x1, int y) {
    super(x1, y);
  }
  
  // Draw slider
  void draw() {
    int y2 = y-20;
    stroke(0);
    fill(0);
    line(x1,y2,x2,y2);
    for (int i=expmin; i<=expmax; i++){
      int x = int(map(i,expmin,expmax,x1,x2));
      textSize(12);
      int yt = y2+15;
      text(10,x,yt);
      float tw = textWidth("10") ;
      float th = textAscent();
      textSize(8);
      text(i,x+tw,yt-(th/2));
      line(x,y2-2,x,y2+2);
    }

    //linear scale
    line(x1,y,x2,y);
    for (int i=0; i<=linRepeat; i++){
      float val = log10(i*1000);
      int x = int(map(val,expmin,expmax,x1,x2));
      if (val <= 0.0001) x = x1;  //because of: log10(0) == -infinty
      textSize(12);
      text(i*1000,x,y+15+15*i);
      line(x,y-2,x,y+2);
    }

    //button for changing value of slider
    fill(col);
    triangle(thisx,y2,thisx-tsize/2,y2-tsize,thisx+tsize/2,y2-tsize);
  }

  // Mouse over button?
  boolean mouseOver(){
    return (mouseX > thisx-tarea && mouseX < thisx+tarea && mouseY > y-20-tarea && mouseY < y-20+tarea);
  }

  // Returns decimal value
  float getValue(){
    return pow(10,map(thisx,x1,x2,expmin,expmax));
  }

  // Sets decimal value
  void setValue(float val){
    thisx = constrain(int(map(log10(val),expmin,expmax,x1,x2)),x1,x2);
  }
}
