/*
Looking Up
Sean McGowen, Ben Spalding, Adrian Phillips


refrences:
 http://processing.org/learning/topics/directorylist.html

To Do
    -load in PNG
        -search for # of files in folder            DONE
        -load into array                            DONE
    -greadient backgound 
    -particals
    -movement
    -how to fullscreen?
   
*/
//------------------------------------------Imports----------------------------
import java.io.File;


//--------------------------------------------Global----------------------------

   PImage[] pics; //array or pics




//-----------------------------------------End Global--------------------------
void setup() {
  size(1200,900);
  background(60,187,250);
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
    
}

