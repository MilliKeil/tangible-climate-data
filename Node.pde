class Node{
  int id;
  String word;
  float x;
  float y;
  int refs;
  public Node(int id,String word,float x, float y){
    this.id = id;
    this.word = word;
    this.x = x;
    this.y = y;
  }
  public void set(float x, float y){
    this.x = x;
    this.y = y;
  }
  public void refUp(){
    this.refs++;
  }
  public void display(){
    stroke(0);
    fill(255);
    ellipse(x,y,50+20*refs,50+20*refs);
    fill(0);
    textSize(20);
    text(word,x,y);
  }
  public void update(){
  }
}
