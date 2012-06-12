int greenLedPin = 7;
int greenLedState = LOW;
int yellowLedPin = 5;
int yellowLedState = LOW;
int redLedPin = 3;
int redLedState = LOW;

int incomingByte = 0;
long interval = 1000;

void setup() {                
  pinMode(greenLedPin, OUTPUT);
  pinMode(yellowLedPin, OUTPUT);
  pinMode(redLedPin, OUTPUT);
  Serial.begin(9600);
}

/*
  49 -- turn on the green led
  50 -- turn off the green led
  51 -- turn on the red led
  52 -- turn off the red led
  53 -- turn on the yellow led
  54 -- turn off the yellow led
  55 -- turn off all leds
*/


void loop() {
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
  }
  
  Serial.println(incomingByte, DEC);
  
  if (incomingByte == 49)
  {
    greenLedState = HIGH;
  }
  else if (incomingByte == 50)
  {
    greenLedState = LOW;
  }
  else if (incomingByte == 51) 
  {
    redLedState = HIGH;
  }
  else if (incomingByte == 52) 
  {
    redLedState = LOW;
  }
  else if (incomingByte == 53) 
  {
    yellowLedState = HIGH;
  }
  else if (incomingByte == 54) 
  {
    yellowLedState = LOW;
  }
  else if (incomingByte == 55) 
  {
    greenLedState = LOW;
    redLedState = LOW;
    yellowLedState = LOW;
  }
  
  digitalWrite(greenLedPin, greenLedState);
  digitalWrite(redLedPin, redLedState);
  digitalWrite(yellowLedPin, yellowLedState);
  delay(interval);
}

