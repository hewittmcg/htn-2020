// General expected program flow:
// Trigger buzzer when MQTT message received
// Turn off buzzer + send MQTT packet to server 
// Continue (maybe log times, idk, look into using deepsleep to save power if desired)

#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// WiFi info
// DELETE BEFORE COMMITTING TO SOURCE CONTROL!!!
const char *ssid = "";
const char *pass = "";

// IP of MQTT server
const char *server_ip = "192.168.2.89";
const int server_port = 1883;

// MQTT topics used for tx/rx
// (todo)

// todo replace these with bytecodes later to make simpler
// message sent to turn on buzzer
const char *ALARM_ON_MSG = "alarmon";

// message sent to turn off alarm on app
const char *ALARM_OFF_MSG = "alarmoff";

WiFiClient wifi_client;
PubSubClient mqtt_client(wifi_client);

// IO
const int LED_PIN = 13;
const int BUTTON_PIN = 14;

void setup() {
  Serial.begin(115200);

  Serial.println("Connecting to WiFi.");
  WiFi.begin(ssid, pass);

  // wait while ESP connects to WiFi
  while(WiFi.status() != WL_CONNECTED) {
    delay(100);
  }

  Serial.println("WiFi connected.");

  mqtt_client.setServer(server_ip, server_port);
  mqtt_client.setCallback(callback);

  Serial.println("Connecting to MQTT.");
  while(!mqtt_client.connected()) {
    mqtt_client.connect("test");
    delay(100);
  }
  Serial.println("Connected to MQTT.");

  mqtt_client.subscribe("test_rx/");

  // Configure IO
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);
}

// Called when a MQTT message is received
// used to turn on alarm
void callback(char *topic, byte *payload, unsigned int length) {
  Serial.println("received message:");

  // print this way to deal with weird overflow errors
  for(int i = 0; i < length; i++) {
    Serial.print(char(payload[i]));
  }
  Serial.println("");

  Serial.println(length);
  if(memcmp((char*)payload, ALARM_ON_MSG, length) == 0) {
    Serial.println("Alarm on, waiting for button press");
    //todo
    // turn on LED/buzzer
    digitalWrite(LED_PIN, HIGH);

    // wait in busy loop for button to be pressed
    while(digitalRead(BUTTON_PIN) == LOW) {
      delay(50);
    }
    digitalWrite(LED_PIN, LOW);
    Serial.println("Button press registered, alarm turned off");
  }
  
}

void loop() {
  mqtt_client.loop();
}
