/**
 * A Slider for handling linear scales
 *
 *
 */

class EscalaLin extends Escala {
  
  // Constructor
  // x1 int: x-coordinate of the beginning of the slider
  // y int: y-coordinate of the slider
  EscalaLin(int x1, int y) {
    super(x1, y);
  }
  
  // Draw slider
  void draw() {
    stroke(0);
    fill(0);
    //logoritmic scale
    int y2 = y-20;
    line(x1,y2,x2,y2);
    for (int i=expmin; i<=expmax; i++){
      int val = int(pow(10,i));
      int x = int(map(val,0,highValue,x1,x2));
      textSize(12);
      text(10,x,y2-20*(expmax-i)-5);
      textSize(8);
      text(i,x+10,y2-20*(expmax-i)-10);
      line(x,y2-20*(expmax-i),x,y2+2);
      line(x,y2-2,x,y2+2);
    }

    //linear scale
    line(x1,y,x2,y);
    for (int i=0; i<=linRepeat; i++){
      int x = int(map(i,0,linRepeat,x1,x2));
      textSize(12);
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

  // Returns decimal value */
  float getValue(){
    return map(thisx,x1,x2,lowValue,highValue);
  }

  // Sets decimal value
  void setValue(float val){
    thisx = constrain(int(map(val,lowValue,highValue,x1,x2)),x1,x2);
  }
}
