abstract class BaseModel{
 static BaseModel create();
  fromJson(String data);
  Map<String, dynamic> toJson();

}