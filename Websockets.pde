import websockets.*;
import java.util.HashSet;
WebsocketClient wsc;
WebsocketServer wss;
public void startSocketServer(){
  wss = new WebsocketServer(this,8025,"/john");
}
public void webSocketServerEvent(String msg){
  JSONArray j = parseJSONArray(msg);
  HashMap<String,HashSet<String>> tokenizedWords = new HashMap<String,HashSet<String>>();
  for(int i = 0; i< j.size();i++){
    HashSet<String> token = tokenizedWords.get(j.getJSONArray(i).getString(1));
    if(token != null){
      token.add(j.getJSONArray(i).getString(0));
    }else{
      token = new HashSet<String>();
      token.add(j.getJSONArray(i).getString(0));
      tokenizedWords.put(j.getJSONArray(i).getString(1),token);
    }
  }
  println(tokenizedWords);
  createNodes(a1,a2,answer,tokenizedWords);
}
