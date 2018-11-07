void intro() {
  textAlign(NORMAL, NORMAL);
  fill(255);
  textSize(200);
  text("PONG", 110, 200);

  fill(0);
  stroke(255);
  strokeWeight(5);
  rect(200, 400, 380, 110);
  fill(255);
  textSize(80);
  text("Game on!", 200, 500); 

  textAlign(CENTER, CENTER);
  textSize(40);
  text("choose super", width/4, 250);
  text("choose super", 3*width/4, 250);

  if (mousePressed && mouseX > 200 && mouseX < 580 && mouseY > 400 && mouseY < 510) {
    mode = 1;
    start.rewind();
    start.play();
    
    music.loop();
  }

  fill(0);
  strokeWeight(2);

  if (mousePressed && mouseX > 70 && mouseX < 145 && mouseY > 300 && mouseY < 375) {
    p1s = 1;
    pup1.rewind();
    pup1.play();
  }
  if (p1s == 1) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(70, 300, 75, 75);
  image(SPEED, 108, 338, 70, 70);

  if (mousePressed && mouseX > 165 && mouseX < 240 && mouseY > 300 && mouseY < 375) {
    p1s = 2;
    pup2.rewind();
    pup2.play();
  }
  if (p1s == 2) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(165, 300, 75, 75);
  image(BOUNCE, 203, 338, 70, 70);

  if (mousePressed && mouseX > 260 && mouseX < 335 && mouseY > 300 && mouseY < 375) {
    p1s = 3;
    pup3.rewind();
    pup3.play();
  }
  if (p1s == 3) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(260, 300, 75, 75);
  image(CURVE, 297, 340, 80, 80);

  if (mousePressed && mouseX > 470 && mouseX < 545 && mouseY > 300 && mouseY < 375) {
    p2s = 1;
    pup1.rewind();
    pup1.play();
  }
  if (p2s == 1) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(470, 300, 75, 75);
  image(SPEED, 508, 338, 70, 70);

  if (mousePressed && mouseX > 575 && mouseX < 640 && mouseY > 300 && mouseY < 375) {
    p2s = 2;
    pup2.rewind();
    pup2.play();
  }
  if (p2s == 2) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(565, 300, 75, 75);
  image(BOUNCE, 603, 338, 70, 70);

  if (mousePressed && mouseX > 660 && mouseX < 735 && mouseY > 300 && mouseY < 375) {
    p2s = 3;
    pup3.rewind();
    pup3.play();
  }
  if (p2s == 3) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

  rect(660, 300, 75, 75);
  image(CURVE, 697, 340, 80, 80);

  println(mouseX, mouseY);
}