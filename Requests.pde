import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.*;
import org.apache.commons.logging.*;
import java.io.UnsupportedEncodingException;
public JSONObject openaiRequest(String text){ 
        String apikey = loadJSONObject("apikey.json").getString("apikey");
        HttpClient httpClient = new HttpClient();
        PostMethod postMethod = new PostMethod("https://api.openai.com/v1/completions");
        postMethod.addRequestHeader("Content-Type", "application/json");
        postMethod.addRequestHeader("Accept", "application/json; charset=utf-8");
        postMethod.addRequestHeader("Authorization",String.format("Bearer %s",apikey));
        JSONObject j = parseJSONObject(String.format("{'model': 'text-davinci-003','prompt': %s,'max_tokens': 50,'temperature': 0}",text));
        try{
          StringRequestEntity requestEntity = new StringRequestEntity(
                j.toString(),
                "application/json",
                "utf-8");
          postMethod.setRequestEntity(requestEntity);
          httpClient.executeMethod(postMethod);
          httpClient.executeMethod(postMethod);
          println(postMethod.getResponseBodyAsString());
          JSONObject response = parseJSONObject(postMethod.getResponseBodyAsString());
          return response;
        }
        catch(UnsupportedEncodingException e){
          println(e);
          return null;
        }
        catch (IOException e) {
          println(e);
          return null;
        }finally{
          postMethod.releaseConnection();
        }      
}
