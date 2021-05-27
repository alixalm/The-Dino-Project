

class Juego {

  int cant = 8;
  int cantzul = 1;
  int cantan = 1;
  int p = 30;

  //------------------
  boolean bDisplayMessage;
  int startTime;
  final int DISPLAY_DURATION = 1000;
  //------------------

  MetAzul[] azu;
  Meteorito[] unos;
  Dino r;
  Tiempo t;
  Angel[] an;

  String estado;

  PImage ini;
  PImage menu;
  PImage lvl1;
  PImage lvl2;
  PImage gameover;
  PImage youwin;
  PImage youwin2;
  PImage youwin3;
  PImage flecha1;
  PImage flecha2;
  PFont font;

  SoundFile choose;
  SoundFile win;
  SoundFile lose;


  //CONSTRUCTOR
  Juego () {

    choose = new SoundFile (extchoose.this, "choose.wav");
    win = new SoundFile (extchoose.this, "win.wav");
    lose = new SoundFile (extchoose.this, "lose.wav");

    ini = loadImage ("ini.png");
    ini.resize(width, height);
    menu = loadImage ("menu.png");
    menu.resize(width, height);
    lvl1 = loadImage ("day3.png");
    lvl1.resize(width, height);
    lvl2 = loadImage ("fondo1.png");
    lvl2.resize(width, height);
    gameover = loadImage ("gameover.png");
    gameover.resize(width, height);
    youwin = loadImage ("youwin.png");
    youwin.resize(width, height);
    youwin2 = loadImage ("youwin2.png");
    youwin2.resize(width, height);
    youwin3 = loadImage ("youwin3.png");
    youwin3.resize(width, height);
    flecha1 = loadImage ("flecha1.png");
    flecha2 = loadImage ("flecha2.png");

    font = createFont ("Extrude.ttf", 20);
    textFont (font);

    t = new Tiempo();
    unos = new Meteorito[cant];
    azu = new MetAzul[cantzul];
    an = new Angel[cantan];
    r= new Dino ();

    //INICIALIZACIÓN DE OBJETOS
    for ( int i = 0; i<cant; i++ ) {
      unos[i] = new Meteorito();
    }

    for ( int i = 0; i<cantzul; i++ ) {
      azu[i] = new MetAzul();
    }

    for ( int i = 0; i<cantan; i++ ) {
      an[i] = new Angel();
    }

    estado = "inicio";
  }

  //MÉTODOS
  void jugar() {

    //------------------------INICIO-----------------
    if ( estado.equals("inicio") ) {

      background (ini);
      fill(0);
      textSize(35);
      text( "Presiona espacio", width/3.8, height- 35); 
      pushStyle();
      textSize(20);
      text( "by Alicia", width/3, height- 10); 
      popStyle();
      r.vida = 4;

      if ( keyPressed && key == ' ' ) {
        estado = "choose";
        t.resetear();
      }
    }
    //------------------ CHOOSE CHARACTER ----------
    else if (estado.equals("choose") ) {

      background(menu);
      text("Selecciona tu personaje", width/5, height/6);
      image(flecha1, width/3, 450);
      image(flecha2, width- 250, 450);

      r.choose();

      if (keyPressed && key == ENTER) {
        estado = "nivel1";
        choose.play();
      }
    }
    //------------------------LVL1------------------

    else if ( estado.equals("nivel1") ) {

      background (lvl1);
      //------HUD----
      pushStyle();
      stroke(30);
      fill(0);
      rect (width/40, height/20, 200, 50); //tiempo
      rect (width/2.15, height/20, 90, 50); //lvl
      rect (width/1.37, height/20, 150, 50); //vidas
      textSize(30);
      fill(255);
      text ("Tiempo:  " + t.tiempoEnSegDec (p), width/20, height/9 );
      text ("lvl 1", width/2.06, height/9);
      text ("Vidas:  " + r.vida, width/1.33, height/9);
      popStyle();

      for ( int i = 0; i<cant; i++ ) {

        unos[i].mover();
        unos[i].dibujar();
      }
      // DIBUJO ANGEL
      if (r.vida < 4) {
        for ( int i = 0; i<cantan; i++) {

          an[i].mover();
          an[i].dibujar();
        }
      }

      r.dibujar();

      if ( r.vida <= 0 ) { 
        estado = "perdiste";
      }
      if (t.tiempoEnSegDec(p) == 0) {
        t.resetear();
        estado = "nivel2";
      }
    } 

    //--------------------LVL2-------------------

    else if ( estado.equals("nivel2") ) {

      background (lvl2);
      //------HUD----
      pushStyle();
      stroke(30);
      fill(0);
      rect (width/40, height/20, 200, 50); //tiempo
      rect (width/2.15, height/20, 90, 50); //lvl
      rect (width/1.37, height/20, 150, 50); //vidas
      textSize(30);
      fill(255);
      text ("Tiempo:  " + t.tiempoEnSegDec (p), width/20, height/9 );
      text ("lvl 2", width/2.06, height/9);
      text ("Vidas:  " + r.vida, width/1.33, height/9);
      popStyle();

      for ( int i = 0; i<cant; i++ ) {
        unos[i].mover();
        unos[i].dibujar();
      }

      for ( int i = 0; i<cantzul; i++) {
        azu[i].mover();
        azu[i].dibujar();
      }
      // DIBUJO ANGEL
      if (r.vida < 4) {
        for ( int i = 0; i<cantan; i++) {
          an[i].mover();
          an[i].dibujar();
        }
      }

      r.dibujar();

      if ( r.vida <= 0 ) 
        estado = "perdiste";

      if ( r.vida > 0 && t.tiempoEnSegDec(p)== 0) 
        estado = "ganaste";
    } 
    //----------------------WIN----------------------

    else if ( estado.equals("ganaste") ) {
      if (r.uno == true) {
        background (youwin);
      } else if (r.dos == true) {
        background (youwin2);
      } else if (r.tres == true) {
        background (youwin3);
      }
      text("Presiona f para volver a jugar", width/10, height- 30);
      win.play();
      win.stop();
    }
    //----------------------LOSE---------------------

    else if ( estado.equals("perdiste") ) {
      background (gameover);
      lose.play();
      lose.stop();
      bDisplayMessage = false;
      fill(0);
      textSize(35);
      text("Presiona f para volver a jugar", width/10, height- 30);
    }
  }

  //------------------------------------------------------
  void teclado() {
    if ( estado.equals("nivel1") || estado.equals("nivel2") ) {
      r.mover();
    }
    if (estado.equals("choose")) {
      r.mm();
    }
    if ( estado.equals("ganaste") || estado.equals("perdiste")) {
      if ( keyPressed && key == 'f' ) { 
        estado = "inicio";
      }
    }
  }

  //-------------------------------------------------------
  //-- Muestra mensajes que desaparecen después de unos segundos--
  void display() {
    if (bDisplayMessage) {
      pushStyle();
      textSize(60);
      fill(0);
      text("+5", width/2.06, height / 2);
      popStyle();
      if (millis() - startTime > DISPLAY_DURATION) {
        bDisplayMessage = false;
      }
    }
  }

  //-------------------------------------------------------

  void colision() {

    //--------- Meteorito ------------
    for ( int i = 0; i<cant; i++ ) {

      if ( dist(unos[i].x, unos[i].y, r.x, r.y )<50 && unos[i].vivo) {

        unos[i].morir();
        unos[i].volver();
        unos[i].dibujar();
        //unos[i].col();

        r.restarVida();

        p = p+5;
        bDisplayMessage = true;
        startTime = millis();
      }
    }
    //--------- Meteorito Azul ----------
    for ( int i = 0; i<cantzul; i++ ) {

      if ( dist(azu[i].x, azu[i].y, r.x, r.y )<50 && azu[i].vivo) {

        azu[i].morir();
        azu[i].volver();
        r.vida = 0;
      }
    }
    //---------- Angel ---------
    for ( int i = 0; i<cantan; i++ ) {

      if ( dist(an[i].x, an[i].y, r.x, r.y )<50 && an[i].vivo) {

        an[i].morir();
        an[i].volver();
        r.sumarVida();
      }
    }
  }

  void pausa() {

    if ( key == 'p' ) {
      noLoop();
      textSize(80);
      text("PAUSA", 200, 300);
      textSize(30);
      text("r para reanudar", 200, 400);
    }
    if ( keyPressed && key == 'r' )
      loop();
  }
}
