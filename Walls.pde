class Walls {
  // vertical walls.
  // This array is true for a given square if there is a wall to the right of that square
  private boolean[][] vertical;
  // horizontal - true if there is a wall below that square.
  private boolean[][] horizontal;
  boolean collision;

  // A new set of walls, for testing purposes
  // eventually, we'll want some particular levels
  Walls() {
    this.vertical = new boolean[boardHeight][boardWidth];
    this.horizontal = new boolean[boardHeight][boardWidth];
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardWidth; j++) {
        if (i == j) {
          vertical[i][j] = true;
          horizontal[i][j] = true;
        } else {
          vertical[i][j] = false;
          horizontal[i][j] = false;
        }
      }
    }
  }


  // Make a new Walls object from two arrays:
  // Horizontal & Vertical walls.
  // WISH check that dimensions are correct.
  Walls(boolean[][] h, boolean[][] v) {
    this.horizontal = h;
    this.vertical = v;
  }

  // If there is a wall between the two given positions, return the point of collision.
  // Otherwise, return some value that can never be a collision.
  // Input & Output are in pixel coordinates
  void collisionCheck(PVector fromPosition, PVector toPosition) {
    println("here");
    if (pixelToDot(fromPosition.x) - pixelToDot(toPosition.x) <= 0) {
      println("here 2");
      int newX = pixelToDot(toPosition.x);
      for ( int oldX = pixelToDot(fromPosition.x); oldX <= newX; oldX++) {
        println("here 3");
        if (pixelToDot(fromPosition.y) - pixelToDot(toPosition.y) <= 0) 
        {
          println("here 4");
          int newY = pixelToDot(toPosition.y);
          for (int oldY = pixelToDot(fromPosition.y); oldY <= newY; oldY++) {
            if (vertical [oldX][oldY] == true){
              collision = true;
            } else if (horizontal [oldX][oldY] == true){
              collision = true;
            } else{
              collision = false;
            }
          }
        } else {
          println("here 6");
          int newY = pixelToDot(toPosition.y);
          for (int oldY = pixelToDot(fromPosition.y); oldY > newY; oldY--) {
            if (vertical [oldX][oldY] == true){
              collision = true;
            } else if (horizontal [oldX][oldY] == true){
              collision = true;
            } else{
              collision = false;
            }
          }
        }
      }
    } else {
      int newY = pixelToDot(toPosition.x);
      for ( int oldX = pixelToDot(fromPosition.x); oldX > newY; oldX--) {
        if (pixelToDot(fromPosition.y) - pixelToDot(toPosition.y) <= 0) 
        {
          for (int oldY = pixelToDot(fromPosition.y); oldY <= pixelToDot(fromPosition.y); oldY++) {
            if (vertical [oldX][oldY] == true){
              collision = true;
            } else if (horizontal [oldX][oldY] == true){
              collision = true;
            } else{
              collision = false;
            }
          }
        } else {
          for (int oldY = pixelToDot(fromPosition.y); oldY >= pixelToDot(toPosition.y); oldY--) {
            if (vertical [oldX][oldY] == true){
              collision = true;
            } else if (horizontal [oldX][oldY] == true){
              collision = true;
            } else{
              collision = false;
            }
          }
        }
      }
    }
  }

  void render() {
    stroke(255);
    //rect(boardWidth/2, 0, boardWidth, 1);
    //rect(0, boardHeight/2, boardHeight, 1);
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardWidth; j++) {
        if (vertical[i][j] == true) {
          rect(dotToPixel(i)+(dotSpacing/2), dotToPixel(j)+(dotSpacing/2), 1,dotSpacing);
        }
        if (horizontal[i][j] == true) {
          rect(dotToPixel(i)+(dotSpacing/2), dotToPixel(j)+(dotSpacing/2), dotSpacing, 1);
        }
      }
    }
  }
}