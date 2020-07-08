
import 'package:http/http.dart' as http;
import 'package:pwapp/models/BaseModel.dart';
import "dart:mirrors";

abstract class BaseRestService<T extends BaseModel> {
   final String url;
   
   BaseRestService( {this.url});

   create(T data ) async {
      return  await http.post(url, body: data.toJson() );
   }

   update(T data) async {
     var response =  await http.put(url , body: data);
     return data.fromJson(response.body);
   }
   
   delete(T data) async {
     return  await http.delete(url);
   }

   find(String id) async {
      var response = await http.get("$url/$id");
      
      return 
   }


   getAll() {

   }
  
}