class Node{
  int id;
  String word;
  int score;
  int x;
  int y;
  Node(int id,String word,int score,int x,int y){
    this.id = id;
    this.word = word;
    this.score = score;
    this.x = x;
    this.y = y;
  }
  void display(){
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(20);
    text(word,x,y,400,400);
  }
  void update(){
  }
}
