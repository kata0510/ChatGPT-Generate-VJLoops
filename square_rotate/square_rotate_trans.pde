final int objectSize = 180;
final int objectCount = 18;
final int rowCount = 3;
final int columnCount = objectCount / rowCount;
final int rectWidth = 15;
final int rectRadius = 5;

PShape[] rectangles = new PShape[objectCount];
int[] rotationSpeeds = new int[objectCount];
float[] currentRotations = new float[objectCount];

PGraphics pg;

void setup() {
  size(1920, 1080, P3D);
  pg = createGraphics(1920, 1080, P3D); // Create PGraphics object
  frameRate(60);
  colorMode(RGB, 255);

  // Create white rotating rectangles.
  for (int i = 0; i < objectCount; i++) {
    PShape rectangle = createShape(RECT, -objectSize / 2, -objectSize / 2, objectSize, objectSize, rectRadius);
    rectangle.setStroke(color(255));
    rectangle.setStrokeWeight(rectWidth);
    rectangle.setFill(false);
    rectangles[i] = rectangle;

    rotationSpeeds[i] = i / rowCount + 1; // Ensure rotation speed is an integer multiple of the minimum speed
  }
}

void draw() {
  pg.beginDraw();
  pg.clear(); // Clear PGraphics
  pg.translate(pg.width / 2, pg.height / 2); // Move to center of screen
  pg.translate(-objectSize * (columnCount - 1), -objectSize * (rowCount - 1)); // Shift to fit all rectangles on screen

  // Draw and rotate rectangles
  for (int i = 0; i < objectCount; i++) {
    pg.pushMatrix();
    pg.translate((i / rowCount) * objectSize * 2, (i % rowCount) * objectSize * 2, 0);
    pg.rotateY(currentRotations[i]);
    pg.shape(rectangles[i]);
    pg.popMatrix();

    // Increase rotation by rotation speed, reset if a full rotation is achieved
    currentRotations[i] += TWO_PI * rotationSpeeds[i] / frameRate / 60; // Convert to per frame
    if (currentRotations[i] >= TWO_PI) {
      currentRotations[i] -= TWO_PI;
    }
  }
  pg.endDraw();

  image(pg, 0, 0); // Draw PGraphics to screen

  String filename = "frame2-" + nf(frameCount, 5) + ".png";
  pg.save(filename); // Save PGraphics as PNG
}
