/**
 * Lineal contra exponencial.  
 *
 *   Basado en estudio e.0: lineal contra exponencial
 *   http://banquete.org/gaia/escalas/conversion.html
 *
 * del Microcosmos a Gaia 
 * un viaje a través del tiempo y las escalas [ estudios y prototipos ]
 * Lynn Margulis, Santiago Ortiz, Luis Rico (2005)
 *
 */

int lx = 50;  //x position of line1
int l1y = 200;  //y position of line 1
int l2y = 300;  //y position of line 2
boolean mouseActiveL1 = false;
boolean mouseActiveL2 = false;
EscalaLin l1;
EscalaExp l2;

void setup(){
  size(900,600);
  frameRate(10);
  l1 = new EscalaLin(lx,l1y);
  l2 = new EscalaExp(lx,l2y);
  textAlign(CENTER);
}

void draw(){
  background(255);
  l1.draw();
  l2.draw();
  
  //draw scale
  fill(0);
  textSize(25);
  text("10", width/2, l2y+50);
  float tw = textWidth("10") ;
  float th = textAscent();
  textSize(18);
  if (l1.getValue() == 0) {
    //because of bug when float == "-infinity"
    text("-∞", width/2+tw, l2y+50-(th/2));
  }
  else {
    text(nf(l1.getValueLog10(),0,2), width/2+tw, l2y+50-(th/2));
  }
  
  if (l1.mouseOver() || l2.mouseOver()){
    cursor(HAND);
  } 
  else {
    cursor(ARROW);
  }
}

void mousePressed(){
  if (l1.mouseOver()) {
    mouseActiveL1 = true;
  }
  else if (l2.mouseOver()) {
    mouseActiveL2 = true;
  }
}

void mouseDragged(){
  if (mouseActiveL1) {
    l1.col = color(255,0,0);
    l2.setValue(l1.drag());
  }
  else if (mouseActiveL2) {
    l2.col = color(255,0,0);
    l1.setValue(l2.drag());
  }
}

void mouseReleased(){
  mouseActiveL1 = false;
  mouseActiveL2 = false;
  l1.col = 0;
  l2.col = 0;
}

void keyPressed(){
  if (keyCode == LEFT) {
    l2.setValue(l1.changePosition(-10));
  }
  else if (keyCode == RIGHT) {
    l2.setValue(l1.changePosition(10));
  }
}

