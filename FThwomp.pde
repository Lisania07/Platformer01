class FThwomp extends FGameObject {

  float x;
  float y;

  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("thwomp");
    setStatic(true);
    this.x=x;
    this.y=y;
    println("y: "+y);
  }

  void act() {
    move();
    animate();
  }
  void animate() {
    attachImage(thwomp[0]);
    if (getX()-player.getX()<=gridSize) {
      attachImage(thwomp[1]);
    }
    if (isTouching("player")) {
      player.setPosition(0, 0);
      setStatic(true);
      setPosition(x, y);
      //println("y re: "+y);
      //println("getY: "+getY());
    }
  }
  void move() {
   
    if (getY()<player.getY()&&player.getY()<400&&getX()-player.getX()<=gridSize&&getX()+25>player.getX()) {
      setStatic(false);
    }
  }
}
