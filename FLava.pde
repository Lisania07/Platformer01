class FLava extends FGameObject {
  int f=int(random(0,5));
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setStatic(true);
  }

  void act() {
    if (isTouching("player")) {
      player.setPosition(0, 0);
    }
    loadimage();
  }

  void loadimage() {
    gif[f]=loadImage("lava"+f+".png");
    if (frameCount %3==0)f=f+1;
    if (f==5)f=0;
    attachImage(gif[f]);
  }
}
