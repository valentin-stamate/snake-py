public class Food{
  private int x = 1, y = 1;
  public boolean bonus = false;
  private int bonusCount = 0;

  public void put(){
    a[ this.y ][ this.x ] = '0';

    if( this.bonus ){
      this.bonus = false;
      a[ this.y + 1 ][ this.x ] = '0';
      a[ this.y + 1 ][ this.x + 1 ] = '0';
      a[ this.y ][ this.x + 1 ] = '0';
    }

    this.bonusCount ++;
    
    if(this.bonusCount == 9){
      this.bonus = true;
      this.bonusCount = 1;
    }

    int i = (int)random(0, 31);
    int j = (int)random(1, 24);
    /// inneficient way but works
    while( a[ j ][ i ] == 'X' ){
      i = (int)random(0, 31);
      j = (int)random(1, 24);
    }

    this.x = i;
    this.y = j;

    a[ j ][ i ] = 'O';
    if( this.bonus ) {
      a[ j + 1 ][ i ] = 'O';
      a[ j + 1 ][ i + 1 ] = 'O';
      a[ j ][ i + 1 ] = 'O';
    }
  }

  public void update(){
    this.show();
  }
 
  public void show(){
    stroke(20);
    strokeWeight(1);
    fill(250, 90, 90);
    if( !this.bonus )
      rect(this.x * sc, this.y * sc, sc, sc);
    else
      rect(this.x * sc, this.y * sc, sc * 2, sc * 2);
  }

}
