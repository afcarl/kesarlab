int ANALOG_PIN = A0, DIGITAL_PIN = 13, flag, counter;

void setup() {
  Serial.begin(9600);
  pinMode(DIGITAL_PIN, OUTPUT);
  
  counter = 500;
  flag = 0;
}

void loop() {
  if (counter > 0) {
    digitalWrite(DIGITAL_PIN, LOW);
    counter--;
  } else {
    digitalWrite(DIGITAL_PIN, HIGH);
    Serial.println(analogRead(ANALOG_PIN));
  }
  delay(30);
}
