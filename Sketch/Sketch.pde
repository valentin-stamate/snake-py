import java.util.ArrayList;
import java.util.List;

static int sc = 20;
static int GameUpdate = 6;
int rows, cols;

List< List<Cell> > array;

Snake snake;
Food food;

void setup(){
  size(640, 500);
  frameRate( 60 );
  background( 25 );

  initialize();

}

void draw(){
  background( 25 );
  topBar();
  food.Show();
  snake.Update();

  // here is checking for interractions
  if(frameCount % GameUpdate == 0){
    if( snake.checkFood( food.currentLocation ) ){
      snake.addTail();
      food.newFood();
    }
  }
}

void keyPressed(){
  if(keyCode == LEFT && snake.getDirX() != 1)
    snake.changeDirection( -1, 0 );
  else if(keyCode == UP && snake.getDirY() != 1)
    snake.changeDirection( 0, -1 );
  else if(keyCode == RIGHT && snake.getDirX() != -1)
    snake.changeDirection( 1, 0 );
  else if(keyCode == DOWN && snake.getDirY() != -1)
    snake.changeDirection( 0, 1 );
}

void topBar(){
  fill( 15 );
  rect(0, 0, width, 21);
}

void initialize(){
  rows = height / sc - 1;
  cols = width / sc;

  // initialize the array
  array = new ArrayList< List<Cell> >();
  for(int i = 0; i < rows; i ++){
    array.add( new ArrayList<Cell>() );
    for(int j = 0; j < cols; j ++){
      array.get(i).add( new Cell(i, j) );
    }
  }

  snake = new Snake();
  food = new Food();
}
