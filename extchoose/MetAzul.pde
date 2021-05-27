

class MetAzul { 

  // PROPIEDADES = VARIABLES
  float x, y;      //posicion
  float w, h;
  float tama;      //tamaño
  float vel;       //velocidad
  PImage met1;

  boolean vivo;

  SoundFile uno;

  // CONSTRUCTOR
  MetAzul() {

    uno = new SoundFile (extchoose.this, "uno.mp3");

    met1 = loadImage ( "metazul.png");
    vivo = true;
    x =  -3000;
    w= met1.width;
    h= met1.height;
    y = int( random(0, 10) *50) ;
    vel = 10;
  }

  // METODOS = FUNCIONES (acciones)
  void mover() {
    if (vivo) {
      y = vel+y ;   //ejecuta el movimiento

      //VOLVER
      if (y >height ) {
        y = 0;
        x = int( random(0, 10) *50);
        vel = 10;
      }
    }
  }

  void volver() {

    if (y >height ) {
      y = 0;
      x = int( random(0, 10) *50);
      vel = 10;
    }
  }

  void dibujar() {

    if (vivo) {
      pushStyle();
      imageMode( CENTER );
      image( met1, x, y );
      popStyle();
    }
  }

  void morir() {
    vivo = false;
    uno.play();
  }
}
