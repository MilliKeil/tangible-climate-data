class Link{
  Node node1;
  Node node2;
  void Link(Node node1,Node node2){
    this.node1 = node1;
    this.node2 = node2;
  }
  void display(){
    
    stroke(0);
    strokeWeight(2);
    line(node1.x,node1.y,node2.x,node2.y);
  }
  void update(){}
}
