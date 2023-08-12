int scanLineDistance = 5; // 走査線の間隔
float noiseValue;         // ノイズの値

void setup() {
  size(1920, 1080);
  frameRate(60);
  background(0); // 背景色を黒に設定
}

void draw() {
  background(0);

  for (int y = 0; y < height; y += scanLineDistance) {
    // ノイズを使って走査線の変動を作成
    noiseValue = map(noise(y * 0.1, frameCount * 0.05), 0, 1, 0, 255);
    stroke(noiseValue);
    line(0, y, width, y);
  }
}
