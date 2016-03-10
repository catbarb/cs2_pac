class Dots {
  private boolean[][] dots;
  private int count;

  // Create an initial board with every dot present
  Dots() {
    dots = new boolean [boardWidth][boardHeight];
    for ( int column = 0; column < boardWidth; column++) {  
      for (int row = 0; row < boardHeight; row++) {
        dots [column][row] = true;
      }
    }
    count = (boardWidth * boardHeight);
  }

  // remove any dots between the two positions
  // return the number of dots removed
  // Normally the input vectors will either be in the same row
  // or the same column.  It's fine to only handle these cases.
  // Write a comment explaining what your version does
  // if the inputs are not in the same row or column.
  void removed(PVector fromPosition, PVector toPosition) {
    println("here");
    if (pixelToDot(fromPosition.x) - pixelToDot(toPosition.x) <= 0) 
    {
      println("here 2");
      for ( int xs = pixelToDot(fromPosition.x); xs < pixelToDot(toPosition.x); xs++) {
        println("here 3");
        if (pixelToDot(fromPosition.y) - pixelToDot(toPosition.y) <= 0) 
        {
          println("here 4");
          for (int ys = pixelToDot(fromPosition.y); ys < pixelToDot(toPosition.y); ys++) {
            dots [xs][ys] = false;
            println("here 5");
          }
        } else {
          println("here 6");
          for (int ys = pixelToDot(fromPosition.y); ys > pixelToDot(toPosition.y); ys--) {
            dots [xs][ys] = false;
          }
        }
      }
    } else {
      for ( int xs = pixelToDot(fromPosition.x); xs > pixelToDot(toPosition.x); xs--) {
        if (pixelToDot(fromPosition.y) - pixelToDot(toPosition.y) <= 0) 
        {
          for (int ys = pixelToDot(fromPosition.y); ys < pixelToDot(fromPosition.y); ys++) {
            dots [xs][ys] = false;
          }
        } else {
          for (int ys = pixelToDot(fromPosition.y); ys > pixelToDot(toPosition.y); ys--) {
            dots [xs][ys] = false;
          }
        }
      }
    }
  }
  // return the number of dots remaining
  int remaining() {
    return count;
  }

  // Draw the dots.  Use `dotToPixel`
  void render() {
    for ( int column = 0; column < boardWidth; column++) {
      for (int row = 0; row < boardHeight; row++) {
        if (dots [column][row] == true) {
          fill(255);
          ellipse(dotToPixel(column), dotToPixel(row), 2 * dotRadius, 2 * dotRadius);
        }
      }
    }
  }
}