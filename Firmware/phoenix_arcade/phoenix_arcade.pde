
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
#define BUTTON_COIN      22

#define RGB_R            9
#define RGB_G            10
#define RGB_B            11

#define COR_VERDE 200
#define COR_AZUL 160



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
 * 0x03: high score (input)
 * 0x04: score changed (input)
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





int buttons[] = {BUTTON_N, BUTTON_S, BUTTON_W, BUTTON_E, BUTTON_1, BUTTON_2};
String button_names[] = {"UP", "DOWN", "LEFT", "RIGHT", "SHIELD", "FIRE"};
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
  
  init_coin();
  init_buttons();
  init_rgb();
  init_display();
  
  acc.powerOn();
  Serial.println("ADK INITIALIZED.");
}

void loop()
{
  
  if (is_connected != acc.isConnected()) {
    is_connected = acc.isConnected();
    if (is_connected)
      cor = COR_VERDE;
    
  }
  
  
  //TODO: receber dados 0x03, 0x04, 0x05
  byte msg[4];

  if (is_connected) {
    int len = acc.read(msg, sizeof(msg), 1);
    if (len > 0) {
      switch(msg[0]) {
        case 0x3:
          Serial.println("HIGH SCORE");
          break;
        case 0x4:
          Serial.println("SCORE CHANGED");
          break;
        case 0x5:
          Serial.println("COLOR CHANGED");
          break;
        default:
          Serial.println("COMMAND ERROR.");
      }
    }
  }
  
  verify_coin();
  verify_buttons();
  change_color();
  
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
  //Serial.print(r); Serial.print("\t");
  //Serial.print(g); Serial.print("\t");
  //Serial.print(b); Serial.print("\t");
  //Serial.println();
  
  if (!is_connected) {
    cor++;
    if (cor>255) cor=0;
  }

}




void verify_coin() {
  byte b;
  b = digitalRead(BUTTON_COIN);
  if (b != bCoin) {
    bCoin = b;
    if (!bCoin) {
      Serial.print("COIN INSERTED");
      send_coin_message();
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

