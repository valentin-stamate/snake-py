import java.util.ArrayList;
import java.util.List;
import processing.sound.*;

SoundFile backSound;

Snake snake;
Food food;
Score score;

static int scale = 20;
boolean snakeChangeDir = false;

void setup(){
  size(640, 500);// + 20 for topbar
  frameRate(15);
  background( 20 );

  //backSound = new SoundFile(this, "backgroundAudio.mp3");
  //backSound.loop();
  //backSound.rate(1);
  //backSound.amp(0.75);

  snake = new Snake(120, 40, scale);
  score = new Score();

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
  topBar();

  snake.Update();
  food.Update();
  score.Update();
  if( score.lifes == 0 ){
    gameOver();
    noLoop();
  }
}

void topBar(){
  fill( 15 );
  rect(0, 0, width, 21);
}

void gameOver(){
  textSize(60);
  fill(255);
  //translate( 25, 25 );
  text( "GAME OVER", 150, height / 2);
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
