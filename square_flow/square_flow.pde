// グローバル変数
int numSquares = 100; // 四角形の数
Square[] squares = new Square[numSquares]; // 四角形の配列

// 四角形のクラス
class Square {
  float x, y, size, speed;

  Square() {
    x = random(width); // x位置をランダムに設定
    y = random(height); // y位置をランダムに設定
    size = random(10, 50); // サイズをランダムに設定
    speed = random(1, 5); // スピードをランダムに設定
  }

  // 四角形を描画
  void display() {
    rect(x, y, size, size);
  }

  // 四角形を動かす
  void move() {
    x = (x + speed) % width;
    y = (y + speed) % height;
  }
}

// 初期設定
void setup() {
  size(1920, 1080); // 解像度を設定
  background(0); // 背景色を黒に設定
  stroke(255); // 線の色を白に設定
  noFill(); // 塗りつぶしをなしに設定

  // 四角形の配列を初期化
  for (int i = 0; i < numSquares; i++) {
    squares[i] = new Square();
  }
}

// 描画ループ
void draw() {
  background(0); // 一度背景を黒で塗りつぶす

  // すべての四角形を動かして描画
  for (int i = 0; i < numSquares; i++) {
    squares[i].move();
    squares[i].display();
  }
}