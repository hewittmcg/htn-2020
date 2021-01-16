// General expected program flow:
// Trigger buzzer when MQTT message received
// Turn off buzzer + send MQTT packet to server 
// Continue (maybe log times, idk, look into using deepsleep to save power if desired)

#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// WiFi info
// DELETE BEFORE COMMITTING TO SOURCE CONTROL!!!
const char *ssid = "McGaughey";
const char *pass = "!Algonquin99";

// IP of MQTT server
const char *server_ip = "192.168.2.89";
const int server_port = 1883;

// MQTT topics used for tx/rx
// (todo)

WiFiClient wifi_client;
PubSubClient mqtt_client(wifi_client);

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
}

// Called when a MQTT message is received
void callback(char *topic, byte *payload, unsigned int length) {
  Serial.println("received message:");
  Serial.println((char*)payload);
}

void loop() {
  

}
