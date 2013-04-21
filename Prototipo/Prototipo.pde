// incluye el codigo de la libreria para poder usarlo en nuestro sketch
import fontastic.*;

// VARIABLES
Fontastic f;
Fuente fuente;
int version = 0;

// FUNCION DE CONFIGURACION
void setup() {
  size(1024, 768);  
  saveFontToFile(); // comienzo generando y grabando para poder mostrar la fuente en el lienzo
}



// FUNCION DE DIBUJO (REPETICION)
void draw() {
  background(255);
  drawFont();
}


void drawFont () {
  PFont myFont = createFont(f.getTTFfilename(), 120); // reading the font that has just been created

  textFont(myFont);
  textAlign(CENTER, CENTER);
  text(Fontastic.alphabet, 0, Fontastic.alphabet.length/2, width/2, height/5);
  text(Fontastic.alphabet, Fontastic.alphabet.length/2, Fontastic.alphabet.length, width/2, height/5*2);

  text(Fontastic.alphabetLc, 0, Fontastic.alphabet.length/2, width/2, height/5*3);
  text(Fontastic.alphabetLc, Fontastic.alphabet.length/2, Fontastic.alphabet.length, width/2, height/5*4);
}


void makeFont() {
  f = new Fontastic(this, "PrototipoFont"+ nf(version, 4));
  fuente = new Fuente(); // configuracion de la fuente

  // go through alphabet and create contours for each glyph
  int index = 0;
  for (char caracter : Fontastic.alphabet) {
    Glifo g = new Glifo(caracter, index++);
  }
}


void saveFontToFile() {
  if (f != null) { 
    f.cleanup();
  }
  
  version++;
  makeFont();

  f.buildFont();
  f.cleanup();
}


void keyPressed() {
  if (key == 'b') {
    saveFontToFile();
  }

  if (key == ' ') {
    //    createFont();
    //    loop();
  }
}

