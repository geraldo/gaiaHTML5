/**
 * A Slider for handling linear scales
 *
 *
 */

class EscalaLin extends Escala {
  
  // Constructor
  // x1 int: x-coordinate of the beginning of the slider
  // y int: y-coordinate of the slider
  // low int: minimum value of scale
  // high int: maximum value of scale
  EscalaLin(int x1, int y, int low, int high) {
    super(x1, y);
    this.lowValue = low;
    this.highValue = high;
    this.expmin = int(log10(this.lowValue));
    this.expmax = int(log10(this.highValue));
    this.linRepeat = this.highValue/1000;
  }
  
  // Draw slider
  void draw() {
    fill(0);
    line(x1,y,x2,y);
    for (int i=0; i<=linRepeat; i++){
      int x = int(map(i,0,linRepeat,x1,x2));
      text(i*1000,x,y-5);
      line(x,y-2,x,y+2);
    }

    //button for changing value of slider
    fill(col);
    triangle(thisx,y,thisx-tsize/2,y+tsize,thisx+tsize/2,y+tsize);
  }
  
  // Mouse over button?
  boolean mouseOver(){
    return (mouseX > thisx-tarea && mouseX < thisx+tarea && mouseY > y-tarea && mouseY < y+tarea);
  }

  // Returns decimal value
  float getValue(){
    return map(thisx,x1,x2,lowValue,highValue);
  }

  // Sets decimal value
  void setValue(float val){
    thisx = constrain(int(map(val,lowValue,highValue,x1,x2)),x1,x2);
  }
}
