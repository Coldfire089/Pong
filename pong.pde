int Spieler1X = 100;
int Spieler1Y = 200;
int SpielerGroesse = 100;
int SpielerBreite = 20;
int Spieler2X = 1150;
int Spieler2Y = 200;
float BallrichtungX = 5;
float BallrichtungY = 10;
int BallpositionX = width/2;
int BallpositionY = height/2;
int Spielergeschwindigkeit = 13;
int Spieler1Punkte = 0;
int Spieler2Punkte = 0;
PImage bg;
int y;
int Spieler1Gewinnt;
int Spieler2Gewinnt;

boolean Spieler1Oben, Spieler2Oben, Spieler1Unten, Spieler2Unten; 
void setup() {


  size(1280, 720);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("/home/lucas/Pictures/mota_ru_2052815-ab1.jpg");
  BallpositionX = width/2;
  BallpositionY = height/2;
}

void draw() {
  background(bg); 
  line(1, 0, 1280, 0);
  line(1, 719, 1280, 719);
  Spieler1Bewegung();
  Spieler2Bewegung();
  BallpositionX = BallpositionX+(int)BallrichtungX;
  BallpositionY = BallpositionY+(int)BallrichtungY;
  Spieler1Verliert();
  Spieler2Verliert();
  Ballangrenzen();
  Spielertreffen();
  Spieler1Gewinnt();
  Spieler2Gewinnt();
  line(Spieler1X, Spieler1Y, Spieler1X, Spieler1Y+SpielerGroesse);
  line(Spieler2X, Spieler2Y, Spieler2X, Spieler2Y+SpielerGroesse);
  line(width/2, 0, width/2, height);
  fill (0, 0, 139);
  circle(BallpositionX, BallpositionY, 30); 
  stroke(255);
  Punkteanzeigen(Spieler1Punkte, Spieler2Punkte);
}
void keyPressed() {
  setMove(keyCode, true);
}

void keyReleased() {
  setMove(keyCode, false);
}

void setMove(int GedrueckteTaste, boolean Gedrueckt) {
  if (GedrueckteTaste==UP) {
    Spieler2Oben = Gedrueckt;
  }
  if (GedrueckteTaste==DOWN) {
    Spieler2Unten = Gedrueckt;
  }
  if (GedrueckteTaste==119) {
    Spieler1Oben = Gedrueckt;
  }
  if (GedrueckteTaste ==115) { 
    Spieler1Unten = Gedrueckt;
  }
  if (GedrueckteTaste==87) {
    Spieler1Oben = Gedrueckt;
  }
  if (GedrueckteTaste==83) {
    Spieler1Unten = Gedrueckt;
  }

  /*
  switch (Gedruecktetaste2) {
   case 'w':
   Spieler1Oben = Gedrueckt;
   case 's':
   Spieler1Unten = Gedrueckt;
   case 'W':
   Spieler1Oben = Gedrueckt;
   case 'S':
   Spieler1Unten = Gedrueckt;
   }*/
}

void Spieler1Bewegung() {
  if (Spieler1Unten) {
    if (Spieler1Y <=height-SpielerGroesse) { 
      Spieler1Y=Spieler1Y+Spielergeschwindigkeit;
    }
  }
  if (Spieler1Oben) {
    if (Spieler1Y >=0)
      Spieler1Y=Spieler1Y-Spielergeschwindigkeit;
  }
}; 
void Spieler2Bewegung() {
  if (Spieler2Oben) {
    if (Spieler2Y >=0) { 
      Spieler2Y=Spieler2Y-Spielergeschwindigkeit;
    }
  }
  if (Spieler2Unten) {
    if (Spieler2Y <=height-SpielerGroesse) {
      Spieler2Y=Spieler2Y+Spielergeschwindigkeit;
    }
  }
};
void Ballangrenzen() {
  if (BallpositionY <= 0) {
    BallrichtungY = -1*BallrichtungY;
  }
  if (BallpositionY >= 783) {
    BallrichtungY = -1*BallrichtungY;
  }
};
void Spielertreffen() {
  float xMultiplier =0;
  float yMultiplier =0; 
  if (BallkollidiertmitSpieler1()) {
    BallrichtungX = -1*BallrichtungX;
    map(BallpositionY-Spieler1Y, -SpielerGroesse/2, SpielerGroesse/2, 15, 15);
  } else if (BallkollidiertmitSpieler2()) {
    BallrichtungX = -1*BallrichtungX;
    map(BallpositionY-Spieler2Y, -SpielerGroesse/2, SpielerGroesse/2, 15, 15);
  }
  /*
    xMultiplier = prozent( SpielerGroesse, BallpositionY-Spieler1Y)-50;
   yMultiplier = prozent( SpielerGroesse, BallpositionX-Spieler1X)+50;
   xMultiplier = abs(xMultiplier);
   if (yMultiplier <= 50 ) {
   yMultiplier = abs(yMultiplier);
   yMultiplier = prozent(100, yMultiplier);
   yMultiplier /= +50;
   } else if (yMultiplier >= 50 ) {
   yMultiplier = abs(yMultiplier);
   yMultiplier = prozent(100, yMultiplier);
   yMultiplier /= -50;
   } 
   
   xMultiplier = prozent(100, xMultiplier);
   
   xMultiplier /= -50; 
   System.out.println("xMultiplier:  "+xMultiplier);
   System.out.println("yMultiplier:  "+ yMultiplier);
   if (BallrichtungX < 0) {
   BallrichtungX = -5;
   } else if (BallrichtungX >0) {
   BallrichtungX = 5;
   } else {
   BallrichtungX = 5;
   }
   BallrichtungX = -1*(5*xMultiplier+BallrichtungX);
   BallrichtungY = yMultiplier*BallrichtungX;
   System.out.println( "BallrichtungX:  "+BallrichtungX);
   System.out.println( "BallrichtungY:  "+BallrichtungY);
   } 
   if (BallkollidiertmitSpieler2()) {
   
   BallrichtungX = -1*BallrichtungX;
   }*/
};
boolean BallkollidiertmitSpieler1() {
  if (BallpositionX <= Spieler1X && BallpositionX >= Spieler1X - SpielerBreite) {
    if (BallpositionY >= Spieler1Y) {
      if (BallpositionY <= Spieler1Y+SpielerGroesse) { 
        return true;
      }
    }
  }
  return false;
}
boolean BallkollidiertmitSpieler2() {
  if (BallpositionX >= Spieler2X && BallpositionX <= Spieler2X + SpielerBreite) {
    if (BallpositionY >= Spieler2Y) {
      if (BallpositionY <= Spieler2Y+SpielerGroesse) {
        return true;
      }
    }
  }
  return false;
}
void Punkteanzeigen (int PunktS1, int PunktS2) {
  fill(255);
  textSize(70); 
  text(PunktS1, 15, 70); 
  text(PunktS2, 1191, 70);
};
void Ballreset () {
  BallpositionX = width/2;
  BallpositionY = height/2;
}

void Spieler1Verliert () {
  if (BallpositionX <=0) {
    Spieler2Punkte = Spieler2Punkte+1;
    Ballreset ();
  }
}

void Spieler2Verliert () {
  if (BallpositionX >=1280) {
    Spieler1Punkte = Spieler1Punkte+1;
    Ballreset ();
  }
}

float prozent(float Grundwert, float Prozentmenge) {
  float ergebnis = (100*Prozentmenge)/Grundwert; 

  return ergebnis;
}
void Spieler1Gewinnt () {
 if (Spieler1Punkte == 3){
 textSize(50);
 fill(0, 238, 0);
text("Spieler 1 hat Gewonnen ",width/2-580, height/2); 
   Ballreset();
 }
}
void Spieler2Gewinnt (){
if (Spieler2Punkte == 2){
textSize(50);
 fill(0, 238, 0);
text("Spieler 2 hat Gewonnen ",width/2+1, height/2); 
   Ballreset();
}
}
/*Rückgabewert (int, void, boolean, String,...) Mothodenname (Typ Parametername,...){
 Befehle(); 
 evtl. return Rückgabewert; 
 }
 int BeispielAddiere(int zahl1, int zahl2){
 int Ergebnis = zahl1 + zahl2; 
 return Ergebnis; 
 }
 
 */
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
