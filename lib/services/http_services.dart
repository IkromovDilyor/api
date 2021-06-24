import 'package:http/http.dart';

class Network{
  // ignore: non_constant_identifier_names
  static String BASE="https://jsonplaceholder.typicode.com";
  static Map<String ,String> headers={ 'Content-type': 'application/json; charset=UTF-8'};


  // ignore: non_constant_identifier_names
  static String API_LIST="/posts";
  static Future<String> Get(String api, Map<String, String> params)async{
    var uri=Uri.https(BASE , api , params);
    var response=await get(uri, headers:headers);
if(response.statusCode==200){
  return response.body;


}
return null;
  }

  static Map<String, String > paramsEmpty(){
    Map<String, String> params=new Map();
    return params;
  }
}