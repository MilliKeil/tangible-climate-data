ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Link> links = new ArrayList<Link>();
boolean swit = false;
String a1 = "_";
String a2 = "_";
int id = 0;
void setup(){
size(1000,1000);
background(255);
}
void draw(){
  background(255);
  for(int i = 0; i < nodes.size(); i++){
    nodes.get(i).display();
  }
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);

  String question = String.format("What could the future of %s and %s look like considering climate change?",a1,a2);
  text(question,width/2,50);
  
}
void keyPressed() {
  if(key == ENTER){
    if(swit){
      
      String fullquestion = String.format("How could climate change look like if %s would support %s?",a1,a2);
      JSONObject response = openaiRequest(fullquestion);
      JSONArray choices = response.getJSONArray("choices");
      JSONObject choice = choices.getJSONObject(0);
      nodes.add(new Node(id,))
      nodes.add(new Node(0,choice.getString("text"),100,width/2,height/2));
    }else{
      swit = true;
    }
  }else{
    
    if(swit){
      if(a2 == "_"){a2 = "";}
      a2+=key;
    }else{
      if(a1 == "_"){a1 = "";}
      a1+=key;
    }
  }
}
