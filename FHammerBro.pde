class FHammerBro extends FGameObject{
  
 float counter=0;
  
 int direction=L;
  int speed=50;
  int frame=0;


  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }


  void act() {
    animate();
    move();
    hammer();
    collide();
  }

  void animate() {
    
    if (frame>=goomba.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) attachImage(hammerbro[frame]);
      if (direction==L) attachImage(reverseImage(hammerbro[frame]));
      frame++;
    }
    
  }

  void collide() {
    if (isTouching("wall")) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
    if (isTouching("player")) {
      if (player.getY()<getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        hammerbros.remove(this);
        player.setVelocity(player.getVelocityX(),-300);
      }else{
      player.setPosition(0,0);
      }
    }
  }
  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
  void hammer(){
    counter++;
    if(counter>=150){
    FBox hammer=new FBox(gridSize,gridSize);
    hammer.attachImage(hammer1);
    hammer.setVelocity(0,-200);
    hammer.setAngularVelocity(20);
    hammer.setPosition(getX(),getY());
    counter=0;
    hammer.setSensor(true);
    hammer.setName("hammer");
    world.add(hammer);
    //if hammer.isTouching(("brick")||isTouching("wall")){
    //  world.remove(this);
    //}
    }
  }
}
