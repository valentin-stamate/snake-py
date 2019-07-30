public class Snake{
  private List<Tail> tail;
  private int directionX, directionY;
  public boolean dirIsChanged = false;
  private int tailPlus = 0;

  Snake(){
    tail = new ArrayList<Tail>();
    tail.add( new Tail( 4, 6 ) );
    tail.add( new Tail( 3, 6 ) );
    tail.add( new Tail( 2, 6 ) );
    
    for(int i = 0; i < this.tail.size(); i++)
      a[ this.tail.get(i).y ][ this.tail.get(i).x ] = 'X';
    
    this.directionX = 1;
    this.directionY = 0;
  }

  public void update(){
    if( frameCount % 5 == 0 ){

      int newX = this.tail.get(0).x + this.directionX;
      int newY = this.tail.get(0).y + this.directionY;

      this.tail.add( 0, new Tail(newX, newY) );

      int tailX = this.tail.get( this.tail.size() - 1 ).x; 
      int tailY = this.tail.get( this.tail.size() - 1 ).y; 

      if( this.tailPlus != 0 )
        this.tailPlus--;
      else {
        this.tail.remove( this.tail.size() - 1 );
        a[ tailY ][ tailX ] = '0';
      }
    
      if( this.checkCollizion() ){
        score.resetScore();
        showMatrix();
        return;
      }

      a[ newY ][ newX ] = 'X';

      this.checkFood();

      this.dirIsChanged = false;

    }
    
    this.show();
  }

  public void show(){
    for(int i = 0; i < this.tail.size(); i++ ){
      stroke( 20 );
      strokeWeight(1);
      if(i == 0)
        fill( 0 );
      else
        fill( 7 );
      rect( this.tail.get(i).x * sc , this.tail.get(i).y * sc, sc, sc );
    }
  }
  
  private boolean checkCollizion(){
    int headX = this.tail.get(0).x;
    int headY = this.tail.get(0).y;

    if( headX > 31 || headX < 0 || headY < 1 || headY > 24)
      return true;

    for(int i = 1; i < this.tail.size(); i++)
      if( headX == this.tail.get(i).x && headY == this.tail.get(i).y )
        return true;
    return false;
  }

  private void changeDirection(int dirX, int dirY){
    if( !this.dirIsChanged ){
      this.directionX = dirX;
      this.directionY = dirY;
      this.dirIsChanged = true;
    }
  }

  private void checkFood(){
    int headX = this.tail.get(0).x;
    int headY = this.tail.get(0).y;
    
  
    if( !food.bonus ){
      if( headX == food.x && headY == food.y ){
        this.tailPlus += 1;
        food.put();
        score.addScore( 7 );
        a[ headY ][ headX ] = 'X';
        // gap solved
        
      }
    } else {
      if( ( headX == food.x || headX == food.x + 1 ) && ( headY == food.y || headY == food.y + 1 ) ){
        this.tailPlus += 3;
        food.put();
        score.addScore( 11 );
        a[ headY ][ headX ] = 'X';
      }
    }
    
  }

  public int getDirX(){
    return this.directionX;
  }

  public int getDirY(){
    return this.directionY;
  }

}
