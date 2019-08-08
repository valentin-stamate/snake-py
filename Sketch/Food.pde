class Food{
  private Cell currentLocation;

  Food(){
    this.newFood();
  }

  public void Show(){
    this.currentLocation.Show(250, 90, 90);
  }

  public void newFood(){
    if( this.currentLocation != null )
      this.currentLocation.isFood = false;
    int i, j;
    // picks a random cell form array that is not a tail
    i = (int)random(0, rows);
    j = (int)random(0, cols);
    Cell chosenOne = array.get(i).get(j);
    while( chosenOne.isTail ){
      i = (int)random(0, rows);
      j = (int)random(0, cols);
      chosenOne = array.get(i).get(j);
    }
    chosenOne.isFood = true;
    this.currentLocation = chosenOne;
  }

}
