class arrowParticle
{
  ArrayList<Particle> particleCollection = new ArrayList<Particle>();

  
  arrowParticle()
  {
  }
  
  void update()
  {
    for (int i = particleCollection.size ()-1; i > 0; i--) {
          Particle p = particleCollection.get(i);
          if (p.isDead == true) {
            particleCollection.remove(i);
          } else {
            p.update();
          }
        }
  }
  void draw()
  {
    for (int i = particleCollection.size () - 1; i > 0; i--) {
      Particle p = particleCollection.get(i);
      p.draw();
    }
  }
  
  void addParticles(int amt, PVector mousePos) {
    for (int i=0; i<amt; i++) {
      PVector rand = new PVector(random(10), random(10));
      particleCollection.add( new Particle(PVector.add(mousePos, rand)));
    }
  }
}
