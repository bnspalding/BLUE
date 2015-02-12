/*
Looking Up
Sean McGowen, Ben Spalding, Adrian Phillips


refrences:
 http://processing.org/learning/topics/directorylist.html
 https://processing.org/examples/lineargradient.html

To Do
    -load in PNG
        -search for # of files in folder            DONE
        -load files into array                      DONE  i.e.     image(pics[1],0,0);
        -load pixels into array        
    -gredient backgound                             DONE
        -maybe have this fin flux
    -particals
    -movement
        -x and y axis
        -resize
        -wind variable? for direction
    -how to fullscreen?
   
   
*/
//------------------------------------------Imports----------------------------
import java.io.File;


//--------------------------------------------Global----------------------------

PImage[] pics; //array of pics                    i.e.     image(pics[1],0,0);

color c1,c2; // colors for background
float y = 900; //attempt at movement                                    REMOVE ME 


//-----------------------------------------End Global--------------------------
void setup() {
  size(1200,1200);
  frameRate(30);
  //background colors
  background(60,187,250);
  c1 = color(25, 156, 250);
  c2 = color(202, 230, 250);
  
   //load in PNG
    //check for # of files
    String path = sketchPath+"/img/"; 
    File[] files = listFiles(path); 
    print(path+"\n");   // total number of files
    println(files.length+"\n"); //how many files are here
    pics=new PImage[files.length];
      for(int i=0;i<files.length;i++) {
      println(files[i]);               //prints files
      pics[i]=loadImage(files[i].getAbsolutePath());
      }
      
      //test area
      
      noLoop();
}
File[] listFiles(String dir) {
     File file = new File(dir);
     if (file.isDirectory()) {
       File[] files = file.listFiles();
       return files;
     } else {
       // If it's not a directory
       return null;
     }
    }
void draw(){
  setGradient(0, 0, height, width, c1, c2); //background gradient
  y = y + 4; //attempt at movement                                       REMOVE ME
  if (y<0) { y = 900;}// attempt at movement                             RMEOVE ME
  pics[1].resize(150,0);
   image(pics[1],0,y);
  
  
}


void movement(){

}

 //background gradient
void setGradient(int x, int y, float w, float h, color c1, color c2 ) {
  // setGradient(top left x value, top left y value, width, height, color top, color bottom)  
  noFill();
   // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
 
}
