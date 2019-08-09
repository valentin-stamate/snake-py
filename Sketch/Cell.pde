class Cell{
  private int i, j;
  public boolean isWall, isTail, isFood;

  Cell(int i, int j){
    this.i = i; this.j = j;
    this.isWall = false; this.isTail = false; this.isFood = false;
  }

  public void Show(int r, int g, int b){
    stroke( 25 );
    strokeWeight(1);
    fill(r, g, b);
    rect( this.j * sc, (this.i + 1) * sc, sc, sc );
  }

  public void Show(int r, int g, int b, int alpha){
    stroke( 25 );
    strokeWeight(1);
    fill(r, g, b, alpha);
    rect( this.j * sc, (this.i + 1) * sc, sc, sc );
  }

}
