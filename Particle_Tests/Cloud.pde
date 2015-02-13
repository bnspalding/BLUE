class Cloud{
 float x;
 float y;
 PImage image;
 
 float windX, windY;
 Cloud(PImage image, float x, float y){
   this.image = image;
   this.x = x;
   this.y = y;
 }
  
  void update(){
    //move the cloud
    movement(); 
    //particles
    
    //draw it!
    image(image, x, y);
  }
  
  void movement(){
    //update x and y position based on wind
    x += windX;
    y += windY; 
  }
  
}
