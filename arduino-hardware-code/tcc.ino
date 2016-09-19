int ByteReceived;

void setup(){
  
  pinMode(13, OUTPUT);
  Serial.begin(9600);  
  
}

void loop(){
  
  if (Serial.available() > 0){
    
    ByteReceived = Serial.read();
    
    if(ByteReceived == '1'){ //car: go-to-elevator
      
      digitalWrite(13, HIGH);
      Serial.print("car;{moving:true}");      
      Serial.write(255);
      
      
      //TODO the below code is for simulate the system, delete it after simulation phase
      delay(3000);
      Serial.print("sad;0.05");  //simulates that car/train arrived
      digitalWrite(13, LOW);   
      Serial.write(255);
      
    }
    
    delay(100);
        
  }
  
}
