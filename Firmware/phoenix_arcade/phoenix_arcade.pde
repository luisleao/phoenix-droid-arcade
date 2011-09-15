
#include <Max3421e.h>
#include <Usb.h>
#include <AndroidAccessory.h>


#define BUTTONS 6

#define BUTTON_1         2
#define BUTTON_2         3
#define BUTTON_S         4
#define BUTTON_E         5
#define BUTTON_N         6
#define BUTTON_W         7
#define BUTTON_COIN      30

#define RGB_R            9
#define RGB_G            10
#define RGB_B            11

#define COR_VERDE 200
#define COR_AZUL 40



//TODO: comandos dos displays
#define INICIALIZA_COMANDO "@"
#define DESLIGA_DISPLAYS "D"
#define LIGA_DISPLAYS "L"
#define ZERA_DISPLAYS "Z"
#define ATUALIZA_DISPLAY_A "A"
#define ATUALIZA_DISPLAY_B "B"

//String INICIALIZA_COMANDO = "@";

AndroidAccessory acc("GTUGBH",
		     "PhoenixArcade",
		     "Phoenix Arcade",
		     "1.0",
		     "http://bh.gtugs.org",
		     "0000000012345678");


/*
 * Protocolo de Comunicacao
 *
 * 0x01: botoes pressionados ou liberados (output)
 * 0x02: coin inserted (output)
 
 * 0x00: high score (input)
 * 0x01: score player one (input)
 * 0x02: score player two (input)

 * 0x05: rgb color (input) //ainda precisa ver como fica isso
 *
*/

/*
 * TODOs:
 *
 * OK  - mudar pinos
 * - receber scores e alterar display
 * OK  - incluir tira de leds RGB
 * OK - simplificar o codigo
 *
*/




#define BUTTON_1       2
#define BUTTON_2       3
#define BUTTON_DOWN    4
#define BUTTON_LEFT    5
#define BUTTON_UP      6
#define BUTTON_RIGHT   7


/*
fire 0
shield 1

down 2
left 3
up 4
right 5

*/


int buttons[] = {BUTTON_1, BUTTON_2, BUTTON_DOWN, BUTTON_LEFT, BUTTON_UP, BUTTON_RIGHT};
String button_names[] = {"FIRE", "SHIELD", "DOWN", "LEFT", "UP", "RIGHT"};
byte button_states[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

unsigned int rgb[] = {0, 0, 0};
int cor = COR_VERDE; //160; //padrao azul

byte bCoin;
boolean is_connected = false;


void setup();
void loop();

void init_coin();
void init_buttons();
void init_rgb();
void init_display();

void change_color();
void verify_coin();
void verify_buttons();


void init_coin() {
  pinMode(BUTTON_COIN, INPUT);
  digitalWrite(BUTTON_COIN, HIGH);
  bCoin = digitalRead(BUTTON_COIN);
}

void init_buttons()
{
  for (int i=0; i<BUTTONS; i++) {
    pinMode(buttons[i], INPUT);
    digitalWrite(buttons[i], HIGH);
    button_states[i] = digitalRead(buttons[i]);
  }
}

void init_rgb() {

  pinMode(RGB_R, OUTPUT);
  pinMode(RGB_G, OUTPUT);
  pinMode(RGB_B, OUTPUT);

  digitalWrite(RGB_R, HIGH);
  digitalWrite(RGB_G, HIGH);
  digitalWrite(RGB_B, HIGH);

}

void init_display() 
{
  Serial1.begin(19200);
}


void setup()
{
  Serial.begin(115200);
  Serial.println("\r\nPhoenix Arcade by GTUG-BH");
  
  Serial1.begin(19200);
  Serial1.write(INICIALIZA_COMANDO);
  Serial1.write(DESLIGA_DISPLAYS);

  init_coin();
  init_buttons();
  init_rgb();
  init_display();
  
  acc.powerOn();
  Serial.println("ADK INITIALIZED.");
}

void loop()
{
  
  Serial1.write(INICIALIZA_COMANDO);
  Serial1.write(ATUALIZA_DISPLAY_A);
  Serial1.write(0x22);
  Serial1.write(0x33);
  Serial1.write(0x44);
  Serial1.write(0x55);

  
  if (is_connected != acc.isConnected()) {
    is_connected = acc.isConnected();
    if (is_connected) {
      //cor = COR_VERDE;
      Serial1.write(INICIALIZA_COMANDO);
      Serial1.write(ZERA_DISPLAYS);
      Serial1.write(LIGA_DISPLAYS);

    } else {
      Serial1.write(INICIALIZA_COMANDO);
      Serial1.write(DESLIGA_DISPLAYS);
    }
  }
  change_color();
  
  
  //TODO: receber dados 0x03, 0x04, 0x05
  byte msg[4];

  if (is_connected) {
    int len = acc.read(msg, sizeof(msg), 1);
    if (len > 0) {
      switch(msg[0]) {
        case 0x00: //HIGH SCORE
          Serial.println("HIGH SCORE");
          Serial1.write(INICIALIZA_COMANDO);
          Serial1.write(ATUALIZA_DISPLAY_A);
          Serial1.write(msg[1]);
          Serial1.write(msg[2]);
          Serial1.write(msg[3]);
          Serial1.write(msg[4]);
          
          break;

        case 0x01: //PLAYER ONE
          Serial.println("SCORE PLAYER ONE");
          
          Serial1.write(INICIALIZA_COMANDO);
          Serial1.write(ATUALIZA_DISPLAY_B);
          Serial1.write(msg[1]);
          Serial1.write(msg[2]);
          Serial1.write(msg[3]);
          Serial1.write(msg[4]);
          break;

        case 0x02: //PLAYER_TWO
          Serial.println("HIGH SCORE");

          Serial1.write(INICIALIZA_COMANDO);
          Serial1.write(ATUALIZA_DISPLAY_B);
          Serial1.write(msg[1]);
          Serial1.write(msg[2]);
          Serial1.write(msg[3]);
          Serial1.write(msg[4]);
          break;
          
        case 0x5:
          Serial.println("COLOR CHANGED");
          break;

        default:
          Serial.println("COMMAND ERROR.");
      }
    }
  } else {
  }

  cor++;
  if (cor>255) cor=0;
  
  verify_coin();
  verify_buttons();
  
  delay(10);
}


void change_color() {
  
  
  HSBToRGB(cor, 255, 255, &rgb[0], &rgb[1], &rgb[2]); 

  unsigned int r = rgb[0];
  unsigned int g = rgb[1];
  unsigned int b = rgb[2];

  analogWrite(RGB_R, 255-r);
  analogWrite(RGB_G, 255-g);
  analogWrite(RGB_B, 255-b);
  
  //Serial.print("COR\t");
  //Serial.print(cor); Serial.print("\t");
  //Serial.print(r); Serial.print("\t");
  //Serial.print(g); Serial.print("\t");
  //Serial.print(b); Serial.print("\t");
  //Serial.println();

}




void verify_coin() {
  byte b;
  b = digitalRead(BUTTON_COIN);
  if (b != bCoin) {
    bCoin = b;
    if (!bCoin) {
      Serial.println("COIN INSERTED");
      send_coin_message();
      
      cor = COR_AZUL;
      change_color();
      is_connected = false; //força troca de cor
      //delay(500);
    }
  }
}

void verify_buttons() {
  byte b;
  for (int i=0; i<BUTTONS; i++) {
    b = digitalRead(buttons[i]);
    if (b != button_states[i]) {
      send_button_message(i, b ? 0 : 1);
      button_states[i] = b;
      Serial.print(button_names[i]);
      Serial.println(b ? "RELEASED" : "PRESSED");
    }
  }
}


void send_coin_message() {
  if (!is_connected)
    return;
  
  byte msg[1] = {0x2};
  acc.write(msg, 1);
}

void send_button_message(byte button_number, byte button_message) {
  if (!is_connected)
    return;
  
  byte msg[3] = {0x1, button_number, button_message};
  //msg[0] = 0x1;
  //msg[1] = button_number;
  //msg[2] = button_message;
  acc.write(msg, 3);
}





void HSBToRGB( unsigned int inHue, unsigned int inSaturation, unsigned int inBrightness, unsigned int *oR, unsigned int *oG, unsigned int *oB )
{
  if( inSaturation == 0 ) {
    // achromatic (grey)
    *oR = *oG = *oB = inBrightness;
  } else {
    unsigned int scaledHue = (inHue * 6);
    unsigned int sector = scaledHue >> 8; // sector 0 to 5 around the color wheel
    unsigned int offsetInSector = scaledHue - (sector << 8);	// position within the sector
    unsigned int p = (inBrightness * ( 255 - inSaturation )) >> 8;
    unsigned int q = (inBrightness * ( 255 - ((inSaturation * offsetInSector) >> 8) )) >> 8;
    unsigned int t = (inBrightness * ( 255 - ((inSaturation * ( 255 - offsetInSector )) >> 8) )) >> 8;
 
    switch( sector ) {
    case 0:
      *oR = inBrightness; *oG = t; *oB = p; break;
    case 1:
      *oR = q; *oG = inBrightness; *oB = p; break;
    case 2:
      *oR = p; *oG = inBrightness; *oB = t; break;
    case 3:
      *oR = p; *oG = q; *oB = inBrightness; break;
    case 4:
      *oR = t; *oG = p; *oB = inBrightness; break;
    default:		// case 5:
      *oR = inBrightness; *oG = p; *oB = q; break;
    }
  }
}

