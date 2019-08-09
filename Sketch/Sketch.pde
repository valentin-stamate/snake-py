import java.util.ArrayList;
import java.util.List;

static int sc = 20;
static int GameUpdate = 6;
int rows, cols;

List< List<Cell> > array;
List<Cell> walls;

Snake snake;
Food food;
Score score;

void setup(){
  size(640, 500);
  frameRate( 60 );
  background( 25 );

  initialize();

}

void draw(){
  background( 25 );
  topBar();

  // draw the walls
  for(Cell c : walls){
    c.Show(0, 70, 90);
  }

  food.Update();
  snake.Update();
  score.Update();

  // here is checking for interractions
  if(frameCount % GameUpdate == 0){
    if( snake.checkFood( food.currentLocation ) ){
      // check what type of food snake is eating
      if(food.normalFood){
        snake.addTail(1);
        score.addScore(7);
      }
      else if(food.greenFood){
        snake.addTail(4);
        score.addScore(21);
      }
      else if(food.purpleFood){
        snake.makeInvincible();
        score.addScore(9);
      }

      food.newFood();
    }

    if( snake.isDead ){
      score.resetScore();
      snake = new Snake();
      food = new Food();
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

  walls = new ArrayList<Cell>();

  // TODO make an array for walls
  for(int j = 0; j < cols; j++){
    walls.add(array.get(0).get(j));
  }
  for(int j = 0; j < cols; j++){
    walls.add(array.get(rows - 1).get(j));
  }
  for(int i = 1; i < rows; i++){
    walls.add(array.get(i).get(0));
  }
  for(int i = 1; i < rows; i++){
    walls.add(array.get(i).get(cols - 1));
  }
  for(Cell c : walls)
    c.isWall = true;

  snake = new Snake();
  food = new Food();
  score = new Score();
}
