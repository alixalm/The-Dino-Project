class Angel {  //SIN PARENTESIS

  // PROPIEDADES = VARIABLES
  float x, y;      //posicion
  float w, h;
  float tama;  //tamaño
  float vel;       //velocidad
  PImage vida;

  boolean vivo;
  


  // CONSTRUCTOR
  Angel() {
    
    vida = loadImage ( "vida.png");
    vivo = true;
    x =  -3000;
    w = vida.width;
    h = vida.height;
    y = int( random(0, 10) *50) ;
    vel = 7;
  }

  // METODOS = FUNCIONES (acciones)
  void mover() {
    if (vivo) {
      y = vel+y ;   //ejecuta el movimiento

      //VOLVER
      if (y >height ) {
        y = 0;
        x = int( random(0, 10) *50);
        vel = 7;
      }
    }
  }
  void volver() {

    if (y >height || vivo == false) {
        y = 0;
        x = int( random(0, 10) *50);
        vel = 7;
      }
    vivo = true;
  }

  void dibujar() {

    if (vivo) {
     
      pushStyle();
      imageMode( CENTER );
      image( vida, x, y );
      popStyle();
    }
  }

  void morir() {

    vivo = false;
  }
  
}
