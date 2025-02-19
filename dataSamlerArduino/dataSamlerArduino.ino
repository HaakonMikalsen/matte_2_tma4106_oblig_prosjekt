unsigned long previusTimeMillis = 0;
const int timeInterval = 20;
int analogPin = A3;  

void setup() {
  Serial.begin(9600);
  

}

void loop() {
  unsigned long currentTimeMillis = millis();
  while ((currentTimeMillis - previusTimeMillis) < timeInterval) {
    currentTimeMillis = millis();
  }
  //Serial.println(String(analogRead(analogPin)));
  Serial.println(String(analogRead(analogPin))+";"+String((currentTimeMillis - previusTimeMillis))+";"+String(currentTimeMillis));
  previusTimeMillis =currentTimeMillis;
  
}
