import java.util.ArrayList;
import java.util.List;
import processing.sound.*;

Snake snake;
Food food;
static int scale = 20;
boolean snakeChangeDir = false;

void setup(){
  size(640, 480);
  frameRate(15);
  background( 20 );

  snake = new Snake(120, 40, scale);
  snake.add( 100, 40 );
  snake.add( 80, 40 );
  snake.add( 60, 40 );
  snake.add( 40, 40 );
  snake.add( 20, 40 );
  snake.add( 0, 40 );
  food = new Food( scale );
  food.put();
}

void draw(){
  background( 20 );
  
  snake.Update();
  food.Show();
}

void keyPressed(){
  if( !snakeChangeDir ){
    if(keyCode == LEFT && snake.getDirX() != 1){
      snakeChangeDir = true;
      snake.direction("LEFT");
    }
    else if(keyCode == UP && snake.getDirY() != 1){
      snakeChangeDir = true;  
      snake.direction("UP");
    }
    else if(keyCode == RIGHT && snake.getDirX() != -1){
      snakeChangeDir = true;
      snake.direction("RIGHT");
    }
    else if(keyCode == DOWN && snake.getDirY() != -1){
      snakeChangeDir = true;  
      snake.direction("DOWN");
    }
  }
}
