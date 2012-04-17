/**
 * A Slider for handling linear and exponential scales
 *
 *
 */
 
class Escala {
  int lowValue = 0;  //min value of scale
  int highValue = 10000;  //max value of scale
  int expmin = -2;  //min exponantial value
  int expmax;  //max exponantial value, calculated from highValue
  int tsize = 20;  //size of triangle for marking line position
  int tarea = 50;  //mouse over area of triangle
  int x1, x2, y;
  int thisx;  //actual position of triangle
  int linRepeat;
  color col = 0;

  // Constructor
  // x1 int: x-coordinate of the beginning of the slider
  // y int: y-coordinate of the slider
  Escala(int x1, int y) {
    this.x1 = x1;
    this.y = y;
    this.x2 = width-x1;
    thisx = x1;
  }

  // Calculates the base-10 logarithm of a number
  float log10 (float x) {
    return (log(x) / log(10));
  }
  
  // Sets position on Scale to mouse position and returns actual decimal value
  int drag(){
    thisx = constrain(mouseX,x1,x2);
    return int(getValue());
  }
  
  // Changes position on Scale and returns actual decimal value
  int changePosition(int val){
    thisx = constrain(thisx+val,x1,x2);
    return int(getValue());
  }

  // Returns actual exponential value (=log10)
  float getValueLog10(){
    return log10(getValue());
  }
  
  // Overwritten by child classes
  float getValue(){
    return 0;
  }
}
