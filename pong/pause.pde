void pause() {
  stroke(255);
  strokeWeight(2);
  fill(0);
  rect(50, 50, 150, 50);
  rect(600, 50, 150, 50);
  
  fill(0, 255, 0);
  rect(50, 50, p1m, 50);
  rect(750 - p2m, 50, p2m, 50);
  
  fill(255);

  ellipse(x, y, 2*rx, 2*rx);

  fill(p1c);
  ellipse(-20, p1y, p1size*2, p1size*2);
  fill(p2c);
  ellipse(width+20, p2y, p2size*2, p2size*2);
  
  fill(255);
  textSize(60);
  text(p1Score, 250, 68);
  text(p2Score, 550, 68);
  
  textSize(50);
  text("*paused*", 400, 68);
  fill(0);
}