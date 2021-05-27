

class Dino {

  float x, y;
  float w, h;
  int vida= 4;


  PImage dino;
  PImage dino2;
  PImage dino3;
  PImage dinorojo;
  PImage dinoverde;
  PImage dinorojo2;
  PImage dinoverde2;
  PImage dinorojo3;
  PImage dinoverde3;
  PImage flecha;
  PImage flecharoja;
  PImage flecharoja2;

  boolean uno, dos, tres; 
  float q, p;
  float tam;

  SoundFile oof;
  SoundFile au;
  SoundFile au2;
  SoundFile au3;
  SoundFile vi;
  SoundFile movearrow;


  Dino ( ) {
    uno = true;

    oof = new SoundFile (extchoose.this, "oof.mp3");
    au = new SoundFile (extchoose.this, "au.mp3");
    au2 = new SoundFile (extchoose.this, "au2.wav");
    au3 = new SoundFile (extchoose.this, "au3.wav");
    vi = new SoundFile (extchoose.this, "vida.wav");
    movearrow = new SoundFile (extchoose.this, "movearrow.wav");

    dino = loadImage( "dino.png" );
    dino2 = loadImage( "dino2.png" );
    dino2.resize(117, 62);
    dino3 = loadImage( "dino3.png" );
    dino3.resize(134, 72);
    dinorojo = loadImage( "dinorojo.png" );
    dinoverde = loadImage( "dinoverde.png" );
    dinorojo2 = loadImage( "dinorojo2.png" );
    dinorojo2.resize(117, 62);
    dinoverde2 = loadImage( "dinoverde2.png" );
    dinoverde2.resize(117, 62);
    dinorojo3 = loadImage( "dinorojo3.png" );
    dinorojo3.resize(134, 72);
    dinoverde3 = loadImage( "dinoverde3.png" );
    dinoverde3.resize(134, 72);
    flecha = loadImage( "flecha.png" );
    flecharoja = loadImage( "flecharoja.png" );
    flecharoja2 = loadImage( "flecharoja2.png" );

    h = dino.height;
    w = dino.width;
    x = width / 2;
    y= height- h;

    q = width /4;
  }

  void mover() {

    if ( keyCode == RIGHT ) {
      if ( x<width-w ) {
        x += h/2;
      }
    } else if ( keyCode == LEFT ) {
      if ( x>w ) {
        x -= w/2;
      }
    }
  }

  void dibujar() {

    if ( q == 162 ) {
      pushStyle();
      imageMode( CENTER );
      image( dino, x, y );
      popStyle();
    } else if ( q == 362 ) {
      pushStyle();
      imageMode( CENTER );
      image( dino2, x, y );
      popStyle();
    } else if ( q == 562 ) {
      pushStyle();
      imageMode( CENTER );
      image( dino3, x, y );
      popStyle();
    }
  }

  void restarVida() {

    vida--;
    oof.play();
    if ( uno == true ) {
      pushStyle();
      imageMode( CENTER );
      image( dinorojo, x, y );
      popStyle();
      au.play();
    } else if ( dos == true ) {
      pushStyle();
      imageMode( CENTER );
      image( dinorojo2, x, y );
      popStyle();
      au2.play();
    } else if ( tres == true ) {
      pushStyle();
      imageMode( CENTER );
      image( dinorojo3, x, y );
      popStyle();
      au3.play();
    }
  }

  void sumarVida() {

    if ( vida < 4 ) {
      vida++;
      imageMode( CENTER );
      if ( q == 162 ) {
        image (dinoverde, x, y);
      } else if ( q == 362 ) {
        image (dinoverde2, x, y);
      } else if ( q == 562 ) {
        image (dinoverde3, x, y);
      }
      vi.play();
    }
  }

  void mm() {
    movearrow.play();
    if (keyPressed) {
      if ( keyCode == RIGHT ) {
        if ( q < 500) {
          q += 200;
          image(flecharoja2, width- 250, 450);
        }
      } else if ( keyCode == LEFT ) {
        if ( q > width/4 ) {
          q -= 200;
          image(flecharoja, width/3, 450);
        }
      }
    }
    //Verifica qué dino eligió
    if (q == 162) {
      uno = true;
      dos = false;
      tres = false;
    } else if (q == 362) {
      uno = false;
      dos = true;
      tres = false;
    } else if (q == 562) {
      uno = false;
      dos = false;
      tres = true;
    }
  }
  //------- Posicionamiento de los dinos ------
  void choose() {

    p = height/3.5;
    pushStyle();
    imageMode( CENTER );
    image (flecha, q, p);

    image (dino, width/4, height/1.95);
    image (dino2, 362, height/1.9);
    image (dino3, 562, height/1.92);

    popStyle();
  }
}
