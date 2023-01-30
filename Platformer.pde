import fisica.*;
FWorld world;
final int INTRO=1;
final int GAME=2;
int mode;
int cloud;
int cloud1;
int cloud2;
int cloud11, cloud22,cloud33;
color black=   #000000;
color white=   #FFFFFF;
color blue   = color(29, 178, 242);
color green  = #00FF00;
color red    = color(224, 80, 61);
color brown= #FF9500;
color ice= #00c4ff;
//color trunk= #4a3004;
//color trunkup=#6e4f1c;
////color treeleft=#00ff04;
//color treemid=#02c702;
//color treeright=#038703;
color tramp=#ff7605;
color spike=#ffabab;
color lava=#990030;
color bridge=#9c5a3c;
color wall=#464646;
color enemy=#ffc30e;
color th=#99d9ea;
color hammercolor=#2f3699;
color energydrink=#8faae0;
PImage map;
int gridSize=32;
int numberOfFrames=6;
int gridSize2=50;
float speedChange;
int introImage=0;
//int counter;
boolean wkey, akey, skey, dkey;
ArrayList<FBox>FPlayer=new ArrayList<FBox>();
ArrayList<FBox>FGameObject=new ArrayList<FBox>();
ArrayList<FGameObject>terrain;
ArrayList<FGameObject>enemies;
ArrayList<FGameObject>thwomps;
ArrayList<FGameObject>hammerbros;
ArrayList<FGameObject>drinks;
//ArrayList<FGameObject>;
FPlayer player;
float vx, vy;
float zoom=1;
PImage ice1;
PImage brick1;
PImage trunkdown1;
PImage trunkup1;
PImage treeright1;
PImage treemid1;
PImage treeleft1;
PImage tramp1;
PImage spike1;
PImage bridge1;
PImage stone1;
PImage drink;
PImage[]gif;
PImage[]goomba;
PImage[]thwomp;
PImage[]hammerbro;
PImage[]idle;
PImage[]jump;
PImage[]run;
PImage[]action;
PImage hammer1;
boolean isFast;
//pallete
void setup() {
  mode=INTRO;
  isFast=false;
  size(600, 600);
  Fisica.init(this);
  map=loadImage("map.png");
  //mario==============================
  idle=new PImage[2];
  idle[0]=loadImage("idle0.png");
  idle[1]=loadImage("idle1.png");
  jump=new PImage[1];
  jump[0]=loadImage("jump0.png");
  run=new PImage[3];
  run[0]=loadImage("runright0.png");
  run[1]=loadImage("runright1.png");
  run[2]=loadImage("runright2.png");
  action=run;
  //terrain===============================
  ice1=loadImage("ice.png");
  brick1=loadImage("brick.png");
  trunkdown1=loadImage("brunchdown.png");
  treemid1=loadImage("treemid.png");
  treeleft1=loadImage("treeleft.png");
  treeright1=loadImage("treeright.png");
  trunkup1=loadImage("brunchup.png");
  tramp1=loadImage("tramp.png");
  spike1=loadImage("spike.png");
  bridge1=loadImage("bridge.png");
  stone1=loadImage("stone.png");
  drink=loadImage("drink.png");
  terrain=new ArrayList<FGameObject>();
  enemies= new ArrayList<FGameObject>();
  thwomps= new ArrayList<FGameObject>();
  hammerbros=new ArrayList<FGameObject>();
  drinks=new ArrayList<FGameObject>();
  gif=new PImage[numberOfFrames];
  goomba=new PImage[2];
  thwomp=new PImage[2];
  hammerbro=new PImage[2];
  hammer1=loadImage("hammer.png");
  loadWorld(map);
  loadPlayer();
  //counter=0;
  //enemies===============================
  goomba[0]=loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]=loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  thwomp[0]=loadImage("thwomp0.png");
  thwomp[0].resize(gridSize2, gridSize2);
  thwomp[1]=loadImage("thwomp1.png");
  thwomp[1].resize(gridSize2, gridSize2);
  hammerbro[0]=loadImage("hammerbro0.png");
  hammerbro[0].resize(gridSize, gridSize);
  hammerbro[1]=loadImage("hammerbro1.png");
  hammerbro[1].resize(gridSize, gridSize);
  speedChange=1;
  cloud=120;
  cloud1=80;
  cloud2=160;
  cloud11=240;
  cloud22=260;
  cloud33=280;
}

void loadWorld(PImage img) {
  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y);
      //color s=img.get(x, y+1);//color up current
      color w=img.get(x-1, y);//color west current
      color e=img.get(x+1, y);//color east current

      FBox b=new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);

      if (c==black) {
        b.attachImage(brick1);
        b.setFriction(4);
        b.setName("brick");
        world.add(b);
      }
      if (c==ice) {
        b.attachImage(ice1);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      if (c==brown) {
        b.attachImage(trunkdown1);
        b.setSensor(true);
        b.setName("trunkdown");
        world.add(b);
      }
      if (c==brown&&w==green&&e==green) {
        b.attachImage(trunkup1);
        b.setSensor(false);
        b.setFriction(4);
        b.setName("treetop");
        world.add(b);
      }
      if (c==green&&e!=green) {
        b.attachImage(treeright1);
        b.setFriction(3);
        b.setName("treetop");
        world.add(b);
      }
      if (c==green&&w==green) {
        b.attachImage(treemid1);
        b.setFriction(3);
        b.setName("treetop");
        world.add(b);
      }
      if (c==green&&w!=green&&e==green) {
        b.attachImage(treeleft1);
        b.setFriction(3);
        b.setName("treetop");
        world.add(b);
      } else if (c==tramp) {
        b.attachImage(tramp1);
        b.setFriction(4);
        b.setRestitution(2);
        b.setName("tramp");
        world.add(b);
      } else if (c==spike) {
        b.attachImage(spike1);
        b.setFriction(4);
        b.setName("spike");
        world.add(b);
      } else if (c==bridge) {
        FBridge br=new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c==lava) {
        FLava la=new FLava(x*gridSize, y*gridSize);
        terrain.add(la);
        world.add(la);
      } else if (c==wall) {
        b.attachImage(stone1);
        b.setName("wall");
        world.add(b);
      } else if (c==white) {

        FGoomba gmb=new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        gmb.setName("goomba");
        world.add(gmb);
      } else if (c==th) {
        FThwomp thw=new FThwomp(x*gridSize, y*gridSize);
        thwomps.add(thw);
        thw.setName("thwomp");
        world.add(thw);
      } else if (c==hammercolor) {
        FHammerBro ham=new FHammerBro(x*gridSize, y*gridSize);
        hammerbros.add(ham);
        ham.setName("hammerbro");
        world.add(ham);
      } else if (c==energydrink) {
        FDrink dr=new FDrink(x*gridSize, y*gridSize);
        hammerbros.add(dr);
        dr.setName("drink");
        world.add(dr);
      }
    }
  }
}

void loadPlayer() {
  player=new FPlayer();
  world.add(player);
}

void draw() {
  background(black);
  drawWorld();
  actWorld();
  if (mode==INTRO)  intro();
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}


void actWorld() {
  player.act();
  for (int i=0; i<terrain.size(); i++) {
    FGameObject t=terrain.get(i);
    t.act();
  }
  for (int i=0; i<enemies.size(); i++) {
    FGameObject e=enemies.get(i);
    e.act();
  }
  for (int i=0; i<thwomps.size(); i++) {
    FGameObject t=thwomps.get(i);
    t.act();
  }
  for (int i=0; i<hammerbros.size(); i++) {
    FGameObject h=hammerbros.get(i);
    h.act();
  }
}
