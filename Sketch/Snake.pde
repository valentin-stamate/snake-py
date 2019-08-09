public class Snake{
  private List<Cell> tail;
  private int directionX, directionY, tailPlus;
  public boolean dirIsChanged;
  private boolean isDead, isInvincible;
  private int invincibleCountDown;

  Snake(){
    tail = new ArrayList<Cell>();
    tail.add( array.get(3).get(3) );
    tail.add( array.get(3).get(2) );
    tail.add( array.get(3).get(1) );

    // make those cells the tail
    // snake.tail.get(0) is always the head
    for(Cell c : this.tail)
      c.isTail = true;

    this.tailPlus = 0;
    this.dirIsChanged = false;
    this.directionX = 1;
    this.directionY = 0;
    this.isDead = false;
    this.isInvincible = false;
  }

  public void Update(){
    // every five frames do:
    if( frameCount % GameUpdate == 0 ){

      if(this.isInvincible){
        this.invincibleCountDown --;
        if(this.invincibleCountDown == 0){
          this.isInvincible = false;
        }
      }

      // get the first, last, next(head) cell
      Cell head = this.tail.get(0);
      Cell lastTailCell = this.tail.get( this.tail.size() - 1 );
      Cell nextCell = null;

      // when nullPointException occurs this mean that the next head is out of the array
      try{
        nextCell = array.get( head.i + this.directionY ).get( head.j + this.directionX );
      } catch(Exception e){
        // teleportation
        if( this.directionX != 0 ){
          if( this.directionX == -1 )
            nextCell = array.get( head.i ).get( cols - 1 );
          else nextCell = array.get( head.i ).get( 0 );
        }
        else if( this.directionY != 0 ){
          if( this.directionY == -1 )
            nextCell = array.get( rows - 1 ).get( head.j );
          else nextCell = array.get( 0 ).get( head.j );
        }
      }
      // check snake collizion when is not invincible
      if( !this.isInvincible && this.checkTailCollizion( nextCell ) ){
        this.isDead = true;
        return;
      }

      // add the next Cell after it can be add
      this.tail.add( 0, nextCell );
      nextCell.isTail = true;

      if( this.tailPlus != 0 )
        this.tailPlus--;
      else {
        this.tail.remove( lastTailCell );
        lastTailCell.isTail = false;
      }

      this.dirIsChanged = false;

    }

    this.Show();
  }

  private void Show(){
    for(Cell c : this.tail){
      stroke( 25 );
      strokeWeight(1);
      if(this.isInvincible){
        if( c == this.tail.get(0) )
          c.Show(0, 0, 0, 150);
        else
          c.Show(15, 15, 15, 150);
      }
      else {
        if( c == this.tail.get(0) )
          c.Show(0, 0, 0);
        else
          c.Show(15, 15, 15);
      }
    }
  }

  private boolean checkTailCollizion(Cell c){
    return this.tail.contains(c) || c.isWall ? true : false;
  }

  private void changeDirection(int dirX, int dirY){
    if( !this.dirIsChanged ){
      this.directionX = dirX;
      this.directionY = dirY;
      this.dirIsChanged = true;
    }
  }

  public boolean checkFood(Cell c){
    return c == this.tail.get(0) ? true : false;
  }

  public int getDirX(){
    return this.directionX;
  }

  public int getDirY(){
    return this.directionY;
  }

  public void addTail(int n){
    this.tailPlus += n;
  }

  public void makeInvincible(){
    this.invincibleCountDown = (60 / GameUpdate) * 12;// math stuff, 12 seconds
    this.isInvincible = true;
  }

}
