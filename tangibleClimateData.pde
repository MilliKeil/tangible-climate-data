ArrayList<Link> links = new ArrayList<Link>();
ArrayList<Node> nodes = new ArrayList<Node>();
HashMap<String,Node> wordConnections = new HashMap<String,Node>();
boolean wordSwitch = false;
String a1 = "_";
String a2 = "_";
String answer = "";
int id = 0;
int id_link = 0;
void setup(){
//Window 1000px width 1000px height
size(1000,1000);
background(255);
startSocketServer();
PFont font = createFont("./Font/IBMPlexMono-SemiBold.ttf",128);
textFont(font);
}
//<!--- Draw function is called 30 times per second (due to 30 fps of the app) --!>
void draw(){
  background(255);
  //Iterate trough all Links and call their display function
  for(int i = 0; i < links.size(); i++){
    links.get(i).display();
    links.get(i).wordCloud();
  }
  //Format text
  fill(0);
  textSize(20);
  textAlign(CENTER,CENTER);
  //Fill in written text from User into String 
  String question = String.format("What could the future of %s and %s look like considering climate change? \n Type and press Enter.",a1,a2);
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
      //Get answer from the JSON Object in the response 
      callAPI();

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
public void callAPI(){
      String question = String.format("How could climate change look like if %s would support %s?",a1,a2);
      JSONObject response = openaiRequest(question);
      JSONArray choices = response.getJSONArray("choices");
      JSONObject choice = choices.getJSONObject(0);
      String answer = choice.getString("text");
      wss.sendMessage(answer);
}
public void createNodes(String a1, String a2,String link,HashMap<String,HashSet<String>> tokenizedWords){
  Node n1 = wordConnections.get(a1);
  Node n2 = wordConnections.get(a2);
  if(n1 == null){
    n1 = new Node(id,a1,random(100,width-100),random(100,height-100));
    wordConnections.put(a1,n1);
    id++;
  }else{
    n1.refUp();
  }
  if(n2 == null){
    n2 = new Node(id,a2,random(100,width-100),random(100,height-100));
    wordConnections.put(a2,n2);
    id++;
  }else{
    n2.refUp();
  }
  links.add(new Link(id_link,n1,n2,"",tokenizedWords));
  id_link++;

}
void cleanup(){
  //reset Queston builder
  wordSwitch = false;
  a1 = "_";
  a2 = "_";
  answer = "";
}
