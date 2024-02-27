String str = "S";
float len;
float angle;
void setup(){
  size(800, 700);
  angle = 2.0/3.0*PI;
  len = 2*width;
  frameRate = 0.2;
}

void draw(){
  background(200);
  pushMatrix();
  translate(400, height);
  for (int i = 0; i < str.length(); i++){
    switch(str.charAt(i)){
      case 'F':
      case 'G':
        line(0,0,len,0);
        translate(len,0);
        break;
      case 'l':
        rotate(-angle);
        break;
      case 'r':
        rotate(angle);
        break;
    }
  }
  if(frameCount < 12){
    println(str);
    str = expand(str);
    len *= 0.6;
  }
  popMatrix();
}

String expand(String s){
  String newStr = "";
  for (int i = 0; i < s.length(); i++){
    switch(s.charAt(i)){
      case 'S': 
        newStr += "FlGlG";
        break;
       case 'F':
         newStr += "FlGrFrGlF"; 
         break;
       case 'G':
          newStr += "GFGr";
          break;
       default:
         newStr += s.charAt(i);
         break;
         
    }
  }
  return newStr;
}
