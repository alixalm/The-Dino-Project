
class Tiempo {

  int restar;
  int rest;


  int clickedFrame;
  boolean on = false;
  int duration = 60;

  Tiempo() {

    restar = 0;
    rest = 0;
  }

 

  //resetea el contador basicamente


  void resetear() {
    restar = millis();
  }

  void reset () {
    rest = millis();
  }

  int tiempoEnSeg() {
    int resul = ( millis() - rest ) / 1000;
    return resul;
  }

  //devuelve un contador de segundos descendente
  //el parametro "cantSeg" es el valor de donde empieza
  int tiempoEnSegDec( int cantSeg ) {
    int resultado = cantSeg - ( millis() - restar ) / 1000;
    return resultado;
  }
}
