import processing.serial.*;
Serial port;

int counter = 0, MAX = 100 * 30;
float s_input;

String SAVE_AS = "data.txt";
String[] data = new String[MAX];

void setup() {
  port = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  port.bufferUntil('\n');
  
  size(100, 30);
  textSize(20);
  
  println("START");
  counter = 0;
}

void draw() {
  background(0);
  
  text(int(s_input), 0, 25);
  text(counter, 45, 25);
  
  if (counter == MAX) {
    saveStrings(SAVE_AS, data);
    counter++;
  }
}

void serialEvent(Serial port) {
  s_input = float(port.readStringUntil('\n'));
  
  if (counter < MAX) {
    data[counter++] = Float.toString(s_input);
  }
}