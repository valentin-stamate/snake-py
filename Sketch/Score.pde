class Score{
  private int score, scorePlus, maxScore, lifes;
  Score(){
    this.score = 0; this.scorePlus = 0;
    this.maxScore = 0; this.lifes = 3;
  }

  public void Update(){
    if(this.scorePlus != 0){
      this.score++;
      this.scorePlus--;
    }
    this.Show();
  }

  private void Show(){
    textSize(11);
    fill(255);

    text( "Score : " + this.score, 5, 14);
    text( "MaxScore : " + this.maxScore, 80, 14);
    text( "Lifes : ", 170, 14);

    strokeWeight(0);
    for(int i = 0; i < this.lifes; i++){
     rect( 205 + i * 13, 6, 9, 9 );
    }
  }

  public void addScore(int n){
    this.scorePlus += n;
  }

  public int getScore(){
    return this.score;
  }

  public void resetScore(){
    if(this.score > this.maxScore)
      this.maxScore = this.score;
    this.score = 0;
    this.scorePlus = 0;

    this.takeLife();
  }

  private void takeLife(){
    this.lifes--;
  }

}
