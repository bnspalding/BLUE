Flock flock;

/*
Looking Up
Sean McGowen, Ben Spalding, Adrian Phillips


refrences:
 http://processing.org/learning/topics/directorylist.html
 https://processing.org/examples/lineargradient.html
 https://processing.org/examples/flocking.html
  * Flocking 
  * by Daniel Shiffman. 

To Do
    -load in PNG
        -search for # of files in folder            DONE
        -load files into array                      DONE  i.e.     image(pics[1],0,0);
        -load pixels into array                     DONE
    -gredient backgound                             FIXME
        -maybe have this fin flux
    -boid
        -only load a couple random imgs to boid     DONE 5 random images
        -translate pixel array to boid              DONE
        -cohesion and seperation fixed              BEN
          -must hold shape consistantly
        
    -movement
        -wind variable? for direction               ADRIAN
          -variations in speed and accel
          -replace facing with speed changer
        -load offscreen                             ADRIAN
          -if offscreen, unload img, trigger new 
        -resize                                     BEN
          -using boids not img 
    -Assets
        -MORE pics !!                               SEAN
    -how to fullscreen?
   
   
*/
//------------------------------------------Imports----------------------------
import java.io.File;


//--------------------------------------------Global----------------------------

PImage[] pics; //array of pics                    i.e.     image(pics[1],0,0);

color c1,c2; // colors for background
float windX = 0;
float windY = 1;

float stretch = random(4,8);


//-----------------------------------------End Global--------------------------

void setup() {
  size(/*2*/1366, /*1*/768);
  frameRate(30);
  //background colors
  background(60,187,250);
  c1 = color(25, 156, 250);
  c2 = color(142, 194, 232);
  
  //load in PNG
  //check for # of files
  //String path = sketchPath+"/img/"; 
  String path = sketchPath+"/img/"; //second path Ben was using
  File[] files = listFiles(path); 
  print(path+"\n");   // total number of files
  println(files.length+"\n"); //how many files are here
  pics=new PImage[files.length];
  for(int i=0;i<files.length;i++) {
    println(files[i]);               //prints files
    pics[i]=loadImage(files[i].getAbsolutePath());
  }              
flock = new Flock();


for (int j = 0; j < 10; j++) {       //runs J times.. best at 10 or less with 20x20 images
  int rand = int(random(pics.length)); //chooses random images from pics array length
  spawnCloud();

}

//Old flocking do not use (see above code)
  //flock = new Flock(); 
  // Add an initial set of boids into the system
  //for (int i = 0; i < 600; i++) {
    //flock.addBoid(new Boid(width/2,height/2));
  //}
}


void draw() {
  setGradient(0, 0, height, width, c1,c2); //background gradient
  setGradient(600,0,height, width,c1,c2);
  flock.run();
  println(flock.boids.size());
  
  if(flock.boids.size() <= 1500){
   spawnCloud();
   //flock.deaths -= 100; 
  }
  
  fill(0);
  rect(width*.65, 0, width/2, height);
  noStroke();
  beginShape();
  vertex(0,7);
  vertex(0,height);
  vertex(184,height);
  endShape();
  beginShape();
  vertex(0,0);
  vertex(width, 0);
  vertex(0,40);
  endShape();
  
}

//------------------------------------------------------------------------functions below-------------------------------------------------------


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

void spawnCloud(){
  int rand = int(random(pics.length)); //chooses random images from pics array length
  
  pics[rand].loadPixels();
  //pics[rand].resize(0,int(random(20,50)));  //attempt to rezies the images fails and turns into squares
  int picWidth = pics[rand].width; //assume that images are square
  int x = int(random(30,width-100)); //randomly place the image somewhere
  int y = int(random(30,height-150)); //on the screen]
  //int x = 200;
  //int y = 200;
  float randSpeed = random(.5F, 1.5F);
  for(int i = 0; i < pics[rand].pixels.length; i += 1){
   //int posX = pics[1].pixels[i]/pics[1].height;
   //int posY = pics[1].pixels[i]/pics[1].width;
    if(pics[rand].pixels[i] != color(255, 255,255)){
       Boid b = new Boid(stretch*(i%picWidth-20)-picWidth/2, int((stretch*(i/picWidth)+y)-picWidth/2));
       //b.maxspeed = randSpeed;
       b.wind = new PVector(randSpeed+random(.05), 0);
       flock.addBoid(b);
    }
   
  }
  
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

