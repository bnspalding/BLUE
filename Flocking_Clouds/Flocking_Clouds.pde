/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

Flock flock;

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
    -boid
        -translate pixel array to boid
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
float y = 0; //attempt at movement                                    REMOVE ME 
float windX = 0;
float windY = 1;


//-----------------------------------------End Global--------------------------

void setup() {
  size(2500, 1440);
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
flock = new Flock();
pics[3].loadPixels();


for(int i = 0; i < pics[3].pixels.length; i += 1){
 //int posX = pics[1].pixels[i]/pics[1].height;
 //int posY = pics[1].pixels[i]/pics[1].width;
  if(pics[3].pixels[i] != color(255, 255,255)){
   flock.addBoid(new Boid(i%16+width/2,int((i/16)+height/2)));
  }
 //flock.addBoid(new Boid(width/2, height/2)); 
}

//flocking starts here
  //flock = new Flock(); 
  // Add an initial set of boids into the system
  for (int i = 0; i < 600; i++) {
    //flock.addBoid(new Boid(width/2,height/2));
  }
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

void draw() {
  background(c1);
    //setGradient(0, 0, height, width, c1, c2); //background gradientK
  flock.run();
  image(pics[3],width/2,height/2);
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
