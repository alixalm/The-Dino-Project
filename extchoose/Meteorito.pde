
class Meteorito {  //SIN PARENTESIS

  // PROPIEDADES = VARIABLES
  float x, y;      //posicion
  float w, h;      //tamaño   
  float vel;       //velocidad
  PImage met;
  PImage coli;

  boolean vivo;
  


  // CONSTRUCTOR
  Meteorito() {
    

    met = loadImage ( "met.png");
    coli = loadImage ( "coli.png");

    vivo = true;
    x =  -3000;
    w = met.width;
    h = met.height;
    y = int( random(0, 10) *50) ;
    vel = random( 5, 9 );
  }

  // METODOS = FUNCIONES (acciones)
  void mover() {
    if (vivo) {
      y = vel+y ;   //ejecuta el movimiento

      //VOLVER
      if (y >height-80 ) {
        y = 0;
        x = int( random(0, 10) *80);
        vel = random( 5, 9 );
      }
    }
  }
  void volver() {
    if (y >height-80 || vivo == false) {
      y = 0;
      x = int( random(0, 10) *80);
      vel = random( 7, 12 );
    }
    vivo = true;
  }
    
  void dibujar() {

    if (vivo) {

      pushStyle();
      imageMode( CENTER );
      image( met, x, y );
      popStyle();
    }
  }

  void morir() {
    vivo = false;
  }

 /* void col() {
    if (!vivo) {
      imageMode( CENTER );
      image (coli, x, y);
    }
  }*/
}
