ArrayList<Link> links = new ArrayList<Link>();
ArrayList<Node> nodes = new ArrayList<Node>();
HashMap<String,Node> wordConnections = new HashMap<String,Node>();
boolean wordSwitch = false;
String a1 = "_";
String a2 = "_";
int id = 0;
void setup(){
//Window 1000px width 1000px height
size(1000,1000);
background(255);
}
//<!--- Draw function is called 30 times per second (due to 30 fps of the app) --!>
void draw(){
  background(255);
  //Iterate trough all Links and call their display function
  for(int i = 0; i < links.size(); i++){
    links.get(i).display();
  }
  //Format text
  fill(0);
  textSize(25);
  textAlign(CENTER,CENTER);
  //Fill in written text from User into String 
  String question = String.format("What could the future of 1. %s and 2. %s look like considering climate change?",a1,a2);
  //Display text
  text(question,width/2,50);
}
//if user uses keyboard
void keyPressed() {
  //If enter is pressed...
  if(key == ENTER){
    //and the second word is written...
    if(wordSwitch){
      //create the question and call the OpenAI API with the question. 
      String question = String.format("How could climate change look like if %s would support %s?",a1,a2);
      //Get answer from the JSON Object in the response 
      //callAPI(question)
      //Create two nodes and one Link between them
      createNodes(a1,a2,"");
      wordSwitch = false;
      a1 = "_";
      a2 = "_";
    }else{
      //and the first word was finished, then change swit to true so the second word can be filled
      wordSwitch = true;
    }
  }else{
    //Fill first or second word with characters pressed by user regarding if they pressed enter or not.
    if(wordSwitch){
      if(a2 == "_"){a2 = "";}
      if(key == BACKSPACE && a2.length() > 0 ){
        a2 = a2.substring(0,a2.length()-1);
      }else if(key != BACKSPACE){
       a2+=key;
      }
    }else{
      if(a1 == "_"){a1 = "";}
      if(key == BACKSPACE && a1.length() > 0){
        a1 = a1.substring(0,a1.length()-1);
      }else if(key != BACKSPACE){
       a1+=key;
      }
    }
  }
}
public JSONObject callAPI(String question){
      JSONObject response = openaiRequest(question);
      JSONArray choices = response.getJSONArray("choices");
      JSONObject choice = choices.getJSONObject(0);
      return choice;
}
public void createNodes(String a1, String a2,String link){
  Node n1 = wordConnections.get(a1);
  Node n2 = wordConnections.get(a2);
  if(n1 == null){
    n1 = new Node(id,a1,random(100,width-100),random(100,height-100));
    wordConnections.put(a1,n1);
    id++;
  }
  if(n2 == null){
    n2 = new Node(id,a2,random(100,width-100),random(100,height-100));
    wordConnections.put(a2,n2);
    id++;
  }
  links.add(new Link(n1,n2,""));

}
