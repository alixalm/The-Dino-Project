import processing.sound.*;


Juego rex;
Dino eldino;
Tiempo time;


void setup() {
  size( 650, 700 );
  noStroke();
  rex = new Juego();
  eldino = new Dino();
  time = new Tiempo();
}



void draw() {
  background( 200 );
  rex.jugar();
  rex.colision();
  rex.display();

}

void keyPressed() {
  rex.teclado ();
  rex.pausa();

}
