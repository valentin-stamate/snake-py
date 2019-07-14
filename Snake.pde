public class Snake{
  private List<Tail> tail = new ArrayList<Tail>();
  private int scale;
  private int directionX = 1;
  private int directionY = 0;
  private int oldX, oldY;
  private int tailPlus = 0;
  public Snake(int x, int y, int scale){
    this.add( x, y);
    this.scale = scale;
  }

  public void Update(){
    oldX = this.tail.get(0).x;
    oldY = this.tail.get(0).y;

    this.tail.get(0).x += this.directionX * this.scale;
    this.tail.get(0).y += this.directionY * this.scale;

    for(int i = 1; i < this.tail.size(); i++){
      int currentX = this.tail.get(i).x;
      int currentY = this.tail.get(i).y;
      this.tail.get(i).x = oldX;
      this.tail.get(i).y = oldY;
      oldX = currentX;
      oldY = currentY;
    }

    if( this.tailPlus != 0 ){
      this.add( this.oldX, this.oldY );
      this.tailPlus--;
    }

    if( snakeChangeDir )
      snakeChangeDir = false;
    this.teleport();
    this.checkFood();

    if( this.checkCollision() )
      print("Fuck");
    this.Show();
  }

  public void Show(){
    for(int i = 0; i < this.tail.size(); i++){
      stroke( 20 );
      strokeWeight(1);
      if(i == 0) fill( 0 );
      else fill( 7 );
      rect(this.tail.get(i).x, this.tail.get(i).y, this.scale, this.scale);
    }
  }

  private boolean checkCollision(){
    int headX = this.tail.get(0).x;
    int headY = this.tail.get(0).y;
    
    for(int i = 1; i < this.tail.size(); i++)
      if(headX == this.tail.get(i).x && headY == this.tail.get(i).y)
        this.tail.subList(i, this.tail.size()).clear();
    return false;
  }

  public void add(int x, int y){
    this.tail.add( new Tail(x, y) );
  }

  public int getDirX(){
    return this.directionX;
  }

  public int getDirY(){
    return this.directionY;
  }

  public void direction(String s){
    if(s == "LEFT"){
      this.directionX = -1;
      this.directionY = 0;
    } else if(s == "UP") {
      this.directionX = 0;
      this.directionY = -1;
    } else if(s == "RIGHT"){
      this.directionX = 1;
      this.directionY = 0;
    } else if(s == "DOWN"){
      this.directionX = 0;
      this.directionY = 1;
    }
    
  }
  
  public void teleport(){
    int x = this.tail.get(0).x;
    int y = this.tail.get(0).y;

    if(x >= width)
      this.tail.get(0).x = 0;
    else if(x < 0) 
      this.tail.get(0).x = width - 20;
    if(y >= height)
      this.tail.get(0).y = 0;
    else if(y < 0)
      this.tail.get(0).y = height - 20;

  }

  private boolean checkFood(){
    int x = this.tail.get(0).x;
    int y = this.tail.get(0).y;

    if( (x == food.x || x == food.x + 20 && food.bigFood) && (y == food.y || y == food.y + 20 && food.bigFood) ){
      this.tailPlus += 1;

      if( food.bigFood )
        this.tailPlus += 3;
      
      //this.add( this.oldX, this.oldY );
      food.put();
      return true;
    }
    return false;
  }

  public void reset(){
    this.tail.clear();
    add(20, 20);
  }
  

}




