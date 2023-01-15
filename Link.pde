public class Link{
  Node node1;
  Node node2;
  String aiText;
  public Link(Node node1,Node node2,String aiText){
    this.node1 = node1;
    this.node2 = node2;
    this.aiText = aiText;
  }
  public void display(){
    stroke(0);
    strokeWeight(2);
    line(node1.x,node1.y,node2.x,node2.y);
    node1.display();
    node2.display();
  }
}
