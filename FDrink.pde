class FDrink extends FGameObject {
  int counter=0;
  FDrink(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }
  void act() {

    if (isTouching("player")) {
      isFast=true;
      println("counter:"+counter);
      world.remove(this);
      drinks.remove(this);
    }
    attachImage(drink);
    if (counter<250&&isFast) {
      speedChange=2;
    }
    if (counter>=250) {
      speedChange=1;
      counter=0;
      isFast=false;
    }
    if(isFast) counter++;
  }
}
