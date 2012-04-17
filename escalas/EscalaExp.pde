/**
 * A Slider for handling exponential scales
 *
 *
 */
 
class EscalaExp extends Escala {
  
  // Constructor
  // x1 int: x-coordinate of the beginning of the slider
  // y int: y-coordinate of the slider
  // emin int: minimum exponential value
  // emax int: maximum exponential value
  EscalaExp(int x1, int y, int emin, int emax) {
    super(x1, y);
    this.expmin = emin;
    this.expmax = emax;
    this.lowValue = int(pow(10,emin));
    this.highValue = int(pow(10,emax));
    this.linRepeat = this.highValue/1000;
  }
  
  // Draw slider
  void draw() {
    int y2 = y-20;
    stroke(0);
    fill(0);
    line(x1,y2,x2,y2);
    for (int i=expmin; i<=expmax; i++){
      int x = int(map(i,expmin,expmax,x1,x2));
      textSize(9);
      int yt = y2+15+8;
      text(10,x,yt);
      float tw = textWidth("10") ;
      float th = textAscent();
      textSize(7);
      text(i,x+tw,yt-(th/2));
      line(x,y2-2,x,y2+2);
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
