class Pac {
  private PVector position;
  final float speed = 0.1 * dotSpacing;
  private PVector move;
  private Dir travelDirection = Dir.EAST;
  public int diameter;

  // for testing purposes, don't start in the corner
  Pac() {
    position = new PVector(dotToPixel(5), dotToPixel(0));
    move = new PVector(0, 0);
  }

  // return a copy of the current position
  PVector getPosition() {
    return new PVector(0, 0);
  }

  // set a new movement direction
  void setDirection(Dir d) {
  }

  // Draw the Pac, as a circle
  void render(float angleStart, float angleEnd) {
    fill(255, 255, 0);
    arc(position.x, position.y, 15, 15, angleStart, angleEnd);
    updatePosition();
  }

  // If the given vector is off the screen, wrap it around to the other side
  // Modify the given vector.
  // If this were public, we probably woudn't modify the vector in place like this.
  private void wrapPosition(PVector vec) {
  }

  // reverse the movement direction
  private void reverseDirection() {
  }

  // Update the position, using the current speed & travel direction
  // If normal movement would hit a wall, find the position after bouncing off the wall.
  // The total distance travelled (before + after hitting the wall) should be the same.
  void updatePosition() {
    if (keyPressed ==true){
      keyPressed();
    } else{
      move.set(0,0);
    }
    //println(move);
    position.set(position.add(move));
  }

  void keyPressed() {
    //println("here");
    if (keyCode == LEFT) {
      move.set(-speed, 0);
    } else if (keyCode == RIGHT) {
      move.set(speed, 0);
    } else if (keyCode == UP) {
      move.set(0, -speed);
    } else if (keyCode == DOWN){
      move.set(0, speed);}
}

}