class FPlayer extends FGameObject {
  int frame=0;
  int direction;
  final int L=-1;
  final int R=1;


  FPlayer() {
    super();
    setPosition(0, 0);
    direction=R;
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }


  void act() {
    handlePlayerInput();
    collision();
    animate();
  }


  void handlePlayerInput() {
    float vx=player.getVelocityX();
    if (wkey) {
      player.setVelocity(vx, -125);
    }
    if (skey) {
      player.setVelocity(vx, 125);
    }
    float vy=player.getVelocityY();
    if (vy==0) {
      action=idle;
    }
    if (akey) {
      player.setVelocity(-125*speedChange, vy);
      action=run;
      direction=L;
    }
    if (dkey) {
      player.setVelocity(125*speedChange, vy);
      action=run;
      direction=R;
    }
    if (abs(vy)>0.1) {
      action=jump;
    }
  }
  void collision() {
    if (isTouching("spike")) {
      setPosition(0, 0);
    }
    if (isTouching("hammer")) {
      setPosition(0, 0);
    }
  }

  void animate() {
    if (frame>=action.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) attachImage(action[frame]);
      if (direction==L) attachImage(reverseImage(action[frame]));

      frame++;
    }
  }
}
