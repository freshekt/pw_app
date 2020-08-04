import 'package:http/http.dart' as http;
import 'package:pwapp/models/BaseModel.dart';

abstract class BaseRestService<T extends BaseModel, TADD extends BaseModel,
    TUPDATE extends BaseModel, TDELETE extends BaseModel> {
  final String url;

  BaseRestService({this.url});

  Future<T> create(TADD data, {String urlPostfix = ""}) async {
    var uri = Uri.parse(url + urlPostfix);
    var response = await http.post(uri, body: data.toJson());
    return convertFromJson(response.body);
  }

  Future<T> update(TUPDATE data, {String urlPostfix = ""}) async {
    var response = await http.put(url + urlPostfix, body: data.toJson());
    return convertFromJson(response.body);
  }

  Future delete(TDELETE data, {String urlPostfix = ""}) async {
    return await http.delete(url + urlPostfix);
  }

  Future<T> find(String id) async {
    var response = await http.get("$url/$id");

    return convertFromJson(response.body);
  }

  T convertFromJson(String body);

  getAll() {}
}
