// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids
  int deaths = 0;

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    //gather marked boids
    ArrayList<Boid> markedForDeath = new ArrayList<Boid>();
    for(Boid b : boids){
     if(b.dead == true){
       markedForDeath.add(b);
     } 
    }
    
    //cull boids marked for death
    for(Boid b : markedForDeath){
     boids.remove(b); 
     deaths++;
    }
    
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}

