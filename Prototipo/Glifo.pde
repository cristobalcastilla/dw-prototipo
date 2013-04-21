class Glifo { 

  // VARIABLES


  // FUNCION DE CONFIGURACION
  Glifo (char caracter, int index) {
    fill(0);
    // create a PVector array with 4 random coordinates
    PVector[] points = new PVector[4];

    points[0] = new PVector(0, 0);  // lower left corner. y coordinates go up in ttf!
    points[1] = new PVector(random(512), 0);
    points[2] = new PVector(random(512), random(1024));
    points[3] = new PVector(0, random(1024));

    f.addGlyph(caracter).addContour(points);

    PVector[] pointsLc = new PVector[points.length];

    // and to the same for lowercase characters. The contour gets scaled down by 50% in y.
    for (int i=0; i<pointsLc.length; i++) {
      pointsLc[i] = new PVector();
      pointsLc[i].x = points[i].x;
      pointsLc[i].y = points[i].y * 0.5;
    }

    f.addGlyph(Character.toLowerCase(caracter)).addContour(pointsLc);
  }
  
} 

