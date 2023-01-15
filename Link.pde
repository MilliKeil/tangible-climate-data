public class Link{
  int id;
  Node node1;
  Node node2;
  String aiText;
  HashMap<String,HashSet<String>> tokenizedText;
  public Link(int id,Node node1,Node node2,String aiText,HashMap<String,HashSet<String>> tokenizedText){
    this.node1 = node1;
    this.node2 = node2;
    this.aiText = aiText;
    this.id = id;
    this.tokenizedText = tokenizedText;
  }
  public void display(){
    stroke(0);
    strokeWeight(2);
    line(node1.x,node1.y,node2.x,node2.y);
    node1.display();
    node2.display();
  }
  public void wordCloud(){
    HashSet<String> words = tokenizedText.get("NN");
    float radian = TWO_PI / words.size();
    int i = 0;
    for(String word: words){
      float x = (width/2) + 150 * cos(i*radian);
      float y = (height/2) + 150 * sin(i*radian);
      text(word,x,y);
      i++;
    }
  }
}
