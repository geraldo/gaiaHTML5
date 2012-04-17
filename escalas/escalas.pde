/**
 * Base class for Lineal contra exponencial.  
 *
 *   Basado en estudio e.0: lineal contra exponencial
 *   http://banquete.org/gaia/escalas/conversion.html
 *
 * del Microcosmos a Gaia 
 * un viaje a través del tiempo y las escalas [ estudios y prototipos ]
 * Lynn Margulis, Santiago Ortiz, Luis Rico (2005)
 *
 */

EscalaExp escala;    // activate for testing exponential scale
//EscalaLin escala;  // activate for testing linear scale

int x = 50;
int y = 200;
boolean mouseActive = false;

void setup() {
  size(900, 600);
  frameRate(10);
  escala = new EscalaExp(x, y, -12, 13);
  //escala = new EscalaLin(x,y,0,10000);
}

void draw() {
  background(255);
  escala.draw();

  // Draw value
  fill(0);
  textSize(25);
  String info = round(escala.getValue()*100)/100+" = 10";
  text(info, width/2, y+50);
  float tw = textWidth(info) ;
  float th = textAscent();
  textSize(18);
  text(nf(escala.getValueLog10(),0,2), width/2+tw, y+50-(th/2));  

  if (escala.mouseOver()) 
    cursor(HAND);
  else 
    cursor(ARROW);
}

void mousePressed() {
  if (escala.mouseOver()) 
    mouseActive = true;
}

void mouseDragged() {
  if (mouseActive) {
    escala.col = color(255, 0, 0);
    escala.drag();
  }
}

void mouseReleased() {
  mouseActive = false;
  escala.col = 0;
}

void keyPressed() {
  if (keyCode == LEFT)
    escala.changePosition(-10);
  else if (keyCode == RIGHT)
    escala.changePosition(10);
}

