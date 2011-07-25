
#include <Max3421e.h>
#include <Usb.h>
#include <AndroidAccessory.h>


#define BUTTON_1         2
#define BUTTON_2         3
#define BUTTON_S         4
#define BUTTON_E         5
#define BUTTON_N         6
#define BUTTON_W         7
#define BUTTON_COIN      8


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
 * 0x03: score changed (input)
 * 0x04: high score changed (input)
 * 0x05: rgb color (input) //ainda precisa ver como fica isso
 *
*/

/*
 * TODOs:
 *
 * - mudar pinos
 * - receber scores e alterar display
 * - incluir tira de leds RGB
 * OK - simplificar o codigo
 *
*/




#define BUTTONS 6

int buttons[] = {BUTTON_N, BUTTON_S, BUTTON_W, BUTTON_E, BUTTON_1, BUTTON_2};
String button_names[] = {"UP", "DOWN", "LEFT", "RIGHT", "SHIELD", "FIRE"};
byte button_states[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

byte bCoin;


void setup();
void loop();
void init_coin();
void init_buttons();

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


void setup()
{
  Serial.begin(115200);
  Serial.println("\r\nPhoenix Arcade by GTUG-BH");
  
  init_coin();
  init_buttons();
  
  acc.powerOn();
  Serial.println("ADK INITIALIZED.");
}

void loop()
{
  acc.isConnected();
  verify_coin();
  verify_buttons();
  
  //TODO: receber dados 0x03, 0x04, 0x05
  delay(10);
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
  if (!acc.isConnected())
    return;
  
  byte msg[1] = {0x2};
  acc.write(msg, 1);
}

void send_button_message(byte button_number, byte button_message) {
  if (!acc.isConnected())
    return;
  
  byte msg[3] = {0x1, button_number, button_message};
  //msg[0] = 0x1;
  //msg[1] = button_number;
  //msg[2] = button_message;
  acc.write(msg, 3);
}


