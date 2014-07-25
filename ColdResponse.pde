HUD hud;

//images
PImage titlebackground;
PImage startButton;
PImage controlsButton;
//numbers
float startgamebuttonx, startgamebuttony;
float controlsbuttonx, controlsbuttony;
float s;
float movecontrolswitchx, movecontrolswitchy, moveswitchx;
//booleans
boolean isStarted;
boolean changetoControlsScene;
boolean wasd;
boolean spacebar;
boolean g;
boolean moveswitchright;
boolean dontmoveswitchright;
boolean moveswitchleft;
boolean dontmoveswitchleft;

ArrayList<PImage> img = new ArrayList<PImage>();

void setup() {
  size(1200, 800);
  //images
  img.add(loadImage("hpBar.png"));
  img.add(loadImage("infoWindow.png"));
  img.add(loadImage("railGun.png"));
  img.add(loadImage("radar.png"));
  img.add(loadImage("usaFlag.png"));
  img.add(loadImage("russiaFlag.png"));
  hud = new HUD(100, img, loadFont("Base02.vlw"), loadFont("Sans.vlw"));
  isStarted = false;
  titlebackground = loadImage("coldresponsebackground.png");
  startButton = loadImage("buttonStart.png");
  controlsButton = loadImage("buttonControls.png");
  //integer and float values
  s = 60;
  movecontrolswitchx = 350;
  movecontrolswitchy = 150;
  moveswitchx = 350;
  startgamebuttonx = width/2 - 445 - 70;
  startgamebuttony = height/2 - 125 - 70;
  controlsbuttonx = width/2 + 125 + 110;
  controlsbuttony = height/2 + 190 + 60;
  //boolean values (true or false)
  changetoControlsScene = false;
  wasd = true;
  spacebar = true;
  g = true;
}

void startgamebutton(float x, float y) 
{
  image(startButton, x, y, 300, 75);
}

void controlsbutton(float a, float b) {
  image(controlsButton, a, b, 300, 75);
}

void titlescreen() {
  background(255, 0, 0);
  image(titlebackground, 0, 0, width, height);
  startgamebutton(startgamebuttonx, startgamebuttony);
  controlsbutton(controlsbuttonx, controlsbuttony);
}

/////////////////////////////////////////////////

////////////////////////////////////////////////

///////////////////////////////////////////////

/* This is the controls scene. All the code below is
 different from the one above. The code above is all
 the code involved with the title screen. */

//move controls switch

void movecontrolswitch(float x, float y, float a) {
  noFill();
  stroke(255);
  rect(x, y, 500, 100);
  line(x + 250, y, 600, 250);
  textSize(30);
  fill(0, 255, 0);
  text("WASD controls", x + 20, y + 60);
  fill(255, 0, 0);
  text("Arrow Keys", x + 290, y + 60);
  fill(255, 150);
  rect(a, y, 250, 100);
  //making switch move whenever WASD or ARROW KEYS are selected
  if (mouseX >= 600 && mouseY <= 250 && mouseX <= 850 && mouseY >= 150 && mousePressed && !dontmoveswitchright) {
    moveswitchright = true;
  }
  if (mouseX >= 350 && mouseY <= 250 && mouseX <= 600 && mouseY >= 150 && mousePressed && !dontmoveswitchleft) {
    moveswitchleft = true;
  }
}

//shoot controls switch

void shootcontrolswitch() {
  noFill();
  stroke(255);
  rect(350, 300, 500, 100);
  line(600, 300, 600, 400);
  textSize(30);
  fill(0, 0, 255);
  text("Space Bar", 405, 360);
  fill(255, 0, 0);
  text("Mouse Click", 635, 360);
}

void grenadecontrolswitch() {
  noFill();
  stroke(255);
  rect(350, 450, 500, 100);
  line(600, 450, 600, 550);
  textSize(30);
  fill(0, 0, 255);
  text("G Key", 430, 510);
  fill(255, 0, 0);
  text("Enter Key", 655, 510);
}

void controlsscreen() {
  background(0);
  fill(#8688E5);
  textSize(40);
  text("Controls", width/2 - 95, height/2 - height/2.5);
  stroke(255);
  line(0, 100, width, 100);
  line(300, 100, 300, height);

  //move control switch attributes
  fill(#EDE651);
  textSize(50);
  text(("Move"), 80, 210);
  movecontrolswitch(movecontrolswitchx, movecontrolswitchy, moveswitchx);
  if (moveswitchright) 
    moveswitchx = moveswitchx + 10;

  if (moveswitchx >= 600) {
    moveswitchright = false;
    dontmoveswitchright = true;
    dontmoveswitchleft = false;
  }
  if (moveswitchleft) 
    moveswitchx = moveswitchx - 10;

  if (moveswitchx <= 350) {
    moveswitchleft = false;
    dontmoveswitchleft = true;
    dontmoveswitchright = false;
  }

  //shoot control switch attributes

  fill(#EDE651);
  textSize(50);
  text(("Shoot"), 75, 360);
  shootcontrolswitch();
  fill(#EDE651);
  textSize(50);
  text(("Grenade"), 50, 510);
  grenadecontrolswitch();
}

void draw() {
  //the change into the Control Scene
  clear();

  if (isStarted)
    hud.draw(98, false);   

  if (changetoControlsScene == false && isStarted == false)
    titlescreen();

  if (changetoControlsScene == true)
    controlsscreen();
}


public void mouseClicked()
{
  if (mouseX >= controlsbuttonx && mouseX <= controlsbuttonx + 300 && mouseY >= controlsbuttony && mouseY <= controlsbuttony + 75)
    changetoControlsScene = true;

  if (mouseX >= startgamebuttonx && mouseX <= startgamebuttonx + 300 && mouseY >= startgamebuttony && mouseY <= startgamebuttony + 75)
    isStarted = true;
}

