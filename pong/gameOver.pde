void gameOver() {
  textAlign(CENTER, CENTER);
  textSize(400);
  text(p1Score, width/3 - 75, height/2 - 52);
  text(p2Score, 2*width/3 + 75, height/2 - 52);

  textSize(95);
  if (p1wins) {
    text("Player One Wins!", width/2, 75);
  } else {
    text("Player Two Wins!", width/2, 75);
  }

  fill(0);
  stroke(255);
  strokeWeight(3);
  rect(129, 468, 540, 100);
  fill(255);
  text("Play Again?", width/2, 500);



  println(mouseX, mouseY);
}

void mouseReleased() {
  if (mouseX<669 && mouseX > 129 && mouseY < 568 && mouseY > 468 && mode == 3) {
    mode = 0;
    p1y = 300;
    p2y = 300;
    x=400;
    y = 300;
    vx = 4;
    vy = 0;
    p1m = 0;
    p2m = 0;
    p1r = 1;
    p2r = 1;
    p1Score = 0;
    p2Score = 0;

    playAgain.rewind();
    playAgain.play();
  }
}