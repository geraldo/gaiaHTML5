/**
 * Scale Shape.  
 * 
 * Move the mouse left and right to zoom the SVG file.
 * This shows how, unlike an imported image, the lines
 * remain smooth at any size.
 */

PShape s;

void setup() {
  size(400, 400);
  smooth();
  s = loadShape("humano.svg");
} 

void draw() {
  background(102);
  translate(width/2, height/2);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  shape(s, -s.width/2, -s.height/2);
}
