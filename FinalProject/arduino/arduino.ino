void setup() {
   Serial.begin(9600);
}

void loop() {
 int sensorValue = analogRead(A0);
 delay(200);
 Serial.write(sensorValue/4);


}
