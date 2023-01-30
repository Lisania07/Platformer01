void intro() {
  background(0);
  fill(#33AD46);
  noStroke();
  rect(0, 450, 600, 150);


  fill(255);
  stroke(255);
  ellipse(cloud, 200, 80, 80);
  ellipse(cloud1, 200, 80, 80);
  ellipse(cloud2, 200, 80, 80);
  ellipse(cloud, 160, 80, 80);

  ellipse(cloud11, 70, 40, 40);
  ellipse(cloud22, 70, 40, 40);
  ellipse(cloud33, 70, 40, 40);
  ellipse(cloud22, 50, 40, 40);
  //move cloud
  cloud=cloud-2;
  cloud1=cloud1-2;
  cloud2=cloud2-2;
  cloud11=cloud11-2;
  cloud22=cloud22-2;
  cloud33=cloud33-2;
  if (cloud<=-60) {
    cloud=660;
  }

  if (cloud1<=-100) {
    cloud1=620;
  }
  if (cloud2<=-20) {
    cloud2=700;
  }
  //=================
  if (cloud11<-60) {
    cloud11=620;
  }
  if (cloud22<-40) {
    cloud22=640;
  }
  if (cloud33<-20) {
    cloud33=660;
  }


 

   image(run[introImage], width/2, 415, gridSize, gridSize);
     if (frameCount %7==0)introImage=introImage+1;
   if( introImage==2){
      introImage=0;
   }


}
