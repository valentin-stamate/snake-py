public class Score{
  private int score = 0;
  private int scorePlus = 0;
  private int maxScore = 0;
  private int lifes = 3;

  public void update(){

    if( this.scorePlus != 0 ){
      this.score++;
      this.scorePlus--;
    }

    this.show();
  }

  public void show(){
  
    textSize(11);
    fill(255);
    text( "Score : " + this.score, 5, 14);

    //textSize(11);
    //fill(255);
    //text( "MaxScore : " + this.maxScore, 80, 14);
  
    //textSize(11);
    //fill(255);
    //text( "Lifes : ", 170, 14);

    //for(int i = 0; i < this.lifes; i++){
    //  strokeWeight(0);
    //  fill( 255 );
    //  rect( 205 + i * 13, 6, 9, 9 );
    //}
  }

  public void addScore(int n){
    this.scorePlus += n;
  }

  public int getScore(){
    return this.score;
  }

  public void resetScore(){
    this.getMaxScore();
    this.score = 0;
    this.scorePlus = 0;
    
    this.takeLife();
  }

  private void getMaxScore(){
    if( this.score > this.maxScore )
      this.maxScore = this.score;
  }

  private void takeLife(){
    this.lifes--;
  }

}
