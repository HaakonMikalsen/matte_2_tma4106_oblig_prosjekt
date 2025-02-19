import processing.serial.*; 
PrintWriter output;  
Serial myPort;  

void setup() {
  size(400, 200);
  String portName = Serial.list()[0]; // Change this if needed
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // Read line by line
  output = createWriter("serial_data.txt"); // Save data to this file
}

void draw() {
  background(0);
  fill(255);
  text("Saving Serial Data...", 20, 100);
}

void serialEvent(Serial myPort) {
  String inData = myPort.readStringUntil('\n'); 
  if (inData != null) {
    inData = inData.trim(); 
    println(inData); 
    output.println(inData); // Save to file
    output.flush(); // Ensure data is written
  }
}

void keyPressed() {
  output.close(); // Close file when a key is pressed
  exit(); // Quit Processing
}
