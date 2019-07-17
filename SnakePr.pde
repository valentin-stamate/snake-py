import java.util.ArrayList;
import java.util.List;
import processing.sound.*;

static int sc = 20;

Snake snake;
Food food;

void setup(){
  size(640, 500);// + 21 for topbar
  frameRate( 60 );
  background( 20 );

  snake = new Snake();
  food = new Food();
  food.put();

}

void draw(){
  background( 20 );
  topBar();
  food.update();
  snake.update();
  
}

void representMatrix(){
  for(int i = 0; i < 25; i++){
    for(int j = 0; j < 32; j++){
      stroke( 20 );
      strokeWeight(1);
      if(a[i][j] != '0')
        fill( 7 );
      else
        fill( 255 );
      rect(j * sc, i * sc, sc, sc);
    }
  }
  noLoop();
}

void showMatrix(){
  for(int i = 0; i < 25; i++){
    for(int j = 0; j < 32; j++){
      print( a[i][j] + " " );
    }println();
  }
  noLoop();
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


