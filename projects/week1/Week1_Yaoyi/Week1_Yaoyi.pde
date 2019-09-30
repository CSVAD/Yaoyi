size(1024, 1024);

background(0,0,0);

rectMode(CENTER);

fill(249, 239, 202);

circle(width/2, height/2, 700);

fill(0,0,0,0);

stroke(17, 111, 64);

strokeWeight(5);

rect(width/2 - 180, height/2 - 100, 200, 150, 15);

rect(width/2 + 180, height/2 - 100, 200, 150, 15);

fill(17, 111, 64);

line(width/2 - 80, height/2 - 100, width/2 +80, height/2 -100);

fill(109,88,67);

stroke(0,0,0);

strokeWeight(3);

ellipse(width/2 - 180, height/2 -100, 180, 100);

ellipse(width/2 + 180, height/2 -100, 180, 100);

fill(0,0,0);

circle(width/2 - 150, height/2 -100, 60);

circle(width/2 + 210, height/2 -100, 60);

fill(255,255,255);

circle(width/2 - 140, height/2 - 110, 10);

circle(width/2 + 220, height/2 - 110, 10);

noFill();
stroke(0, 0, 0);
strokeWeight(10);

curve(width/2 - 200 - 10, height/2 + 150 - 800, width/2 - 200, height/2 + 150,
 width/2 + 200, height/2 + 150, width/2 + 200 + 10, height/2 + 150 - 800);
 
 save("E:/Courses/CS291I/Yaoyi_master/projects/week1/Week1_Yaoyi/myself.jpg");
