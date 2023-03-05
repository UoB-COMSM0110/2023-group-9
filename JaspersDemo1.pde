float stickmanX, stickmanY;
float stickmanSpeed = 5;
float stickmanJumpSpeed = -20;
float stickmanGravity = 1;
boolean isJumping = false;
boolean isFalling = false;

float crosshairX, crosshairY;
int crosshairDelay = 10;
int crosshairDelayCounter = 0;

void setup() {
size(400, 400);
stickmanX = width/2;
stickmanY = height/2;

crosshairX = stickmanX;
crosshairY = stickmanY;
}

void draw() {
background(255);

// Draw the stickman
strokeWeight(3);
line(stickmanX, stickmanY-50, stickmanX, stickmanY); // Head is now at the top
line(stickmanX, stickmanY-30, stickmanX-20, stickmanY-10); // Left arm
line(stickmanX, stickmanY-30, stickmanX+20, stickmanY-10); // Right arm
line(stickmanX, stickmanY-50, stickmanX-20, stickmanY-70); // Left leg
line(stickmanX, stickmanY-50, stickmanX+20, stickmanY-70); // Right leg

// Draw the crosshair
strokeWeight(1);
ellipse(crosshairX, crosshairY, 25, 25); // Perimeter circle
line(crosshairX-10, crosshairY, crosshairX+10, crosshairY); // Horizontal line
line(crosshairX, crosshairY-10, crosshairX, crosshairY+10); // Vertical line

// Move the stickman with arrow keys
if (keyPressed) {
if (keyCode == LEFT) {
stickmanX -= stickmanSpeed;
} else if (keyCode == RIGHT) {
stickmanX += stickmanSpeed;
} else if (keyCode == UP) {
if (!isJumping && !isFalling) {
isJumping = true;
if (keyPressed && keyCode == LEFT) {
stickmanSpeed = -5;
stickmanJumpSpeed = -15;
} else if (keyPressed && keyCode == RIGHT) {
stickmanSpeed = 5;
stickmanJumpSpeed = -15;
} else {
stickmanJumpSpeed = -20;
}
}
}
}

// Implement gravity and jumping
if (isJumping) {
stickmanY += stickmanJumpSpeed;
stickmanJumpSpeed += stickmanGravity;
if (stickmanJumpSpeed >= 0) {
isJumping = false;
isFalling = true;
}
} else if (isFalling) {
stickmanY += stickmanJumpSpeed;
stickmanJumpSpeed += stickmanGravity;
if (stickmanY >= height-50) {
isFalling = false;
stickmanY = height-50;
stickmanSpeed = 5;
}
}

// Move the crosshair with a delay
crosshairDelayCounter++;
if (crosshairDelayCounter > crosshairDelay) {
crosshairX = lerp(crosshairX, stickmanX, 0.2);
crosshairY = lerp(crosshairY, stickmanY-50, 0.2);
crosshairDelayCounter = 0;
}
}
