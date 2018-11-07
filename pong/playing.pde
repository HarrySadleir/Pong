void playing() {

  //the thing for the background thing, see bottom of playing
  rect(-5, -5, 810, 610);

  //SUPER METERS BRUV


  stroke(255);
  strokeWeight(2);
  fill(0);
  rect(50, 50, 150, 50);
  rect(600, 50, 150, 50);

  if (p1m < 150) p1m = p1m + p1r;
  if (p2m < 150) p2m = p2m + p2r;


  fill(0, 255, 0);
  rect(50, 50, p1m, 50);
  rect(750 - p2m, 50, p2m, 50);

  if (d && p1m >= 150) {
    p1m = 0; 

    if (p1s == 1) {
      p1SPEED = true;
      p1r = .25;
      pup1.rewind();
      pup1.play();
      p1BOUNCE = false;
      p1CURVE = false;
    }
    if (p1s == 2) {
      p1BOUNCE = true;

      p1r = .45;
      pup2.rewind();
      pup2.play();
      p1CURVE = false;
      p1SPEED = false;
    }
    if (p1s == 3) {
      p1CURVE = true;
      vy = -vy/3;
      vx = vx*.7;
      p1r = .15;
      pup3.rewind();
      pup3.play();
      
      p1SPEED = false;
      p1BOUNCE = false;
    }
  }

  if (left && p2m >= 150) {
    p2m = 0;

    if (p2s == 1) {
      p2SPEED = true;
      p2r = .25;
      pup1.rewind();
      pup1.play();
      p2BOUNCE = false;
      p2CURVE = false;
    }
    if (p2s == 2) {
      p2BOUNCE = true;

      p2r = .45;
      pup2.rewind();
      pup2.play();
      p2CURVE = false;
      p2SPEED = false;
    }
    if (p2s == 3) {
      p2CURVE = true;
      vx = vx*.7;
      vy = -vy/3;
      p2r = .15;
      pup3.rewind();
      pup3.play();
      
      p2SPEED = false;
      p2BOUNCE = false;
    }
  }

  //paddles and balls and stuv
  fill(255);

  ellipse(x, y, 2*rx, 2*rx);

  fill(p1c);
  ellipse(-20, p1y, p1size*2, p1size*2);
  fill(p2c);
  ellipse(width+20, p2y, p2size*2, p2size*2);
  fill(255);

  if (w && p1y > 0 )        p1y= p1y - p1v;
  if (s && p1y < height)    p1y= p1y + p1v;
  if (up && p2y > 0)        p2y= p2y - p2v;
  if (down && p2y < height) p2y= p2y + p2v;


  if (respawnCount == 0) {
    x = x + vx;
    y = y + vy;
  } else {
    respawnCount = respawnCount - 1;
  }

  if (y+rx >= height|| y-rx <= 0) {
    vy = vy *-1;

    bounce.rewind();
    bounce.play();

    if (y + rx >= height) y = min(height-rx, y);
    if (y - rx <= 0)      y = max(rx, y);
  }

  // death collision
  if (x-rx <= 0) {
    x = width/2;
    y = width/3+50;
    respawnCount = 120;
    vx = -4;
    vy = 0;
    p2Score = p2Score +1;

    die.rewind();
    die.play();
  }

  if (x+rx >= width) {
    x = width/2;
    y = width/3+50;
    respawnCount = 120;
    vx = 4;
    vy = 0;
    p1Score = p1Score +1;

    die.rewind();
    die.play();
  }

  if (p1Score >= 5 && p1Score - p2Score > 1) {
    mode = 3;
    p1wins = true;
    end.rewind();
    end.play();
    
    music.pause();
  }

  if (p2Score >= 5 && p2Score - p1Score > 1) {
    mode = 3;
    p1wins = false;
    end.rewind();
    end.play();
    
    music.pause();
  }


  if (dist(x, y, width+20, p2y) < p2size+rx) {
    vx = (x-(width+20))/13;
    vy = (y-p2y)/13;

    if (up)   vy = vy - p2v/2;
    if (down) vy = vy + p2v/2;

    bounce.rewind();
    bounce.play();
  }

  if (dist(x, y, -20, p1y) < p1size+rx) {
    vx = (x+20)/13;
    vy = (y-p1y)/13;

    if (w) vy = vy - p1v/2;
    if (s) vy = vy + p1v/2;

    bounce.rewind();
    bounce.play();
  }

  textSize(60);
  text(p1Score, 250, 68);
  text(p2Score, 550, 68);

  if (p1Score >= 5 || p2Score >=5) {
    textSize(30);
    text("Win By Two!", width/2, 68);
  }

  if (p1SPEED) {    
    if (p1m >= 50) {
      p1v = 6; 
      p1c = color(255);
    } else {
      p1v = 12;
      p1c = color(0, 255, 0);
    }
  } 

  if (p2SPEED) {
    if (p2m >= 50) {
      p2v = 6; 
      p2c = color(255);
    } else {
      p2v = 12; 
      p2c = color(0, 255, 0);
    }
  } 

  if (p1m <2 && p1CURVE) {
    fill(224, 93, 172);
    notp1CURVE = false;
  } else {
    notp1CURVE = true;
  }

  if (p2m <2 && p2CURVE) {
    fill(224, 93, 172);
  } else if (notp1CURVE) {
    fill(0);
  } 

  if (p1m < 15 && p1BOUNCE) {
    if (p1size < 115) {
      p1size = p1size + 11;
    }
  } else {
    if (p1size > 75) {
      p1size = p1size - 11;
    }
  } 

  if (p2m < 15 && p2BOUNCE) {
    if (p2size < 115) {
      p2size = p2size + 11;
    }
  } else {
    if (p2size > 75) {
      p2size = p2size - 11;
    }
  }

  //if you put any fill stuff here it will break the background for curve
}