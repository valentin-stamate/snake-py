class Food{
  private Cell currentLocation;
  public boolean normalFood, greenFood, purpleFood;
  private int extraFoodCountDown;
  private int foodCount;
  Food(){
    this.newFood();
    this.normalFood = true;
    this.greenFood = false;
    this.purpleFood = false;
    this.foodCount = 0;
    this.extraFoodCountDown = (60 / GameUpdate) * 8;// 5 sec
  }

  public void Update(){
    if(frameCount % GameUpdate == 0){

      if(this.greenFood || this.purpleFood){
        this.extraFoodCountDown--;
        if(this.extraFoodCountDown == 0){
          this.foodType(true, false, false);
          this.extraFoodCountDown = (60 / GameUpdate) * 8;// 5 sec
          this.newFood();
        }
      }

    }
    this.Show();
  }

  private void Show(){
    if(this.normalFood)
      this.currentLocation.Show(250, 90, 90);
    else if(this.greenFood)
      this.currentLocation.Show(53, 230, 195);
    else if(this.purpleFood)
      this.currentLocation.Show(104, 37, 175);
  }

  public void newFood(){
    this.foodCount++;

    if(this.greenFood || this.purpleFood){
      this.foodType(true, false, false);
      this.extraFoodCountDown = (60 / GameUpdate) * 8;
    }

    this.checkFoodType();

    if( this.currentLocation != null )
      this.currentLocation.isFood = false;
    int i, j;
    // picks a random cell form array that is not a tail
    i = (int)random(0, rows);
    j = (int)random(0, cols);
    Cell chosenOne = array.get(i).get(j);
    while( chosenOne.isTail || chosenOne.isWall ){
      i = (int)random(0, rows);
      j = (int)random(0, cols);
      chosenOne = array.get(i).get(j);
    }
    chosenOne.isFood = true;
    this.currentLocation = chosenOne;
  }

  private void foodType(boolean normal, boolean green, boolean purple){
    this.normalFood = normal;
    this.greenFood = green;
    this.purpleFood = purple;
  }

  private void checkFoodType(){
    // when foodCount == 7, then green food appear
    // same for the purpleFood when 14
    if(this.foodCount == 7){
      this.foodType(false, true, false);
    } else if(this.foodCount == 14){
      this.foodType(false, false, true);
    } else if(this.foodCount > 14){
      this.foodCount = 0;
      this.foodType(true, false, false);
    }
  }

}
