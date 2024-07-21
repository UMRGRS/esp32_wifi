import 'package:http/http.dart' as http;

class Api{
  static Future<String> get(String sensor) async{
    //Navegador
    http.Client client = http.Client();
    //URL
    Uri url = Uri.parse("http://192.168.100.93/$sensor");
    http.Response data;
    try{
      data = await client.get(url);
      if(data.statusCode == 200){
        return data.body;
      }
    }catch(error){
      return "Error";
    }
    finally{
      client.close();
    }
    return "Error";
  }
}