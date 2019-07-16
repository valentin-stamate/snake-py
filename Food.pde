public class Food{
 private int x, y;
 private int scale = 1;
 public boolean bigFood = false;
 private int smallFoodEaten = 0;
 private int countDown = 0;
 public Food(int size){
   this.scale = size;
 }
 
 public void put(){
   this.smallFoodEaten ++;
   if( this.smallFoodEaten == 10 ){
     this.bigFood = true;
     this.countDown = 15 * 6;
   }
   if( this.smallFoodEaten == 11 ){
    this.smallFoodEaten = 0;
    this.bigFood = false;
  }

   int i = ((int)random(0, width) / this.scale ) * this.scale;
   int j = ((int)random(0, height) / this.scale ) * this.scale;
   this.x = i;
   this.y = j;
 }
 
 public void put(int x, int y){
   this.x = x;
   this.y = y;
 }

 public void Update(){
   if( this.bigFood )
    this.countDown--;
   if( this.countDown == 0 && this.bigFood ){
    this.bigFood = false;
    this.smallFoodEaten = -1;
    this.put();
   }
   this.Show();
 }
 
 public void Show(){
   stroke(20);
   strokeWeight(1);
   fill(250, 90, 90);//#fa5a5a
   if( this.bigFood )
    rect(this.x , this.y, this.scale, this.scale);
   if( this.bigFood )  rect(this.x , this.y, 2 * this.scale, 2 * this.scale);
   else rect(this.x , this.y, this.scale, this.scale);
 }
 
}
