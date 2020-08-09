import 'package:http/http.dart' as http;
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/BaseModel.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'dart:convert' as json;

import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRestService<T extends BaseModel, TADD extends BaseModel,
    TUPDATE extends BaseModel, TDELETE extends BaseModel> {
  final String url;
  Map<String, String> headers = {};

  BaseRestService({this.url});

  Future prepareHeaders() async {
    var prefs = await SharedPreferences.getInstance();
    var token_str = prefs.getString('token');
    if (token_str != null && token_str.isNotEmpty) {
      TokenModel tokenModel = TokenModel.fromJson(json.jsonDecode(token_str));
      headers['Authorization'] = "Bearer ${tokenModel.accessToken}";
    }
  }

  Future<T> create(TADD data, {String urlPostfix = ""}) async {
    var uri = Uri.parse(url + urlPostfix);
    await prepareHeaders();
    var response = await http.post(uri, body: data.toJson(), headers: headers);
    if (response.statusCode < 399) {
      return convertFromJson(json.jsonDecode(response.body));
    } else
      throw Exception(response);
  }

  Future<T> update(TUPDATE data, {String urlPostfix = ""}) async {
    await prepareHeaders();
    var response =
        await http.put(url + urlPostfix, body: data.toJson(), headers: headers);
    if (response.statusCode < 400) {
      return convertFromJson(json.jsonDecode(response.body));
    } else
      throw Exception(response);
  }

  Future delete(TDELETE data, {String urlPostfix = ""}) async {
    prepareHeaders();
    var response = await http.delete(url + urlPostfix, headers: headers);
    if (response.statusCode < 400) {
      throw Exception(response);
    }
  }

  Future<T> find(String id) async {
    await prepareHeaders();
    var response = await http.get("$url/$id", headers: headers);

    if (response.statusCode == 200) {
      return convertFromJson(json.jsonDecode(response.body));
    } else
      throw Exception(response);
  }

  List<T> convertAllFromJson(List l) {
    return List.from(l).map((model) => convertFromJson(model)).toList();
  }

  T convertFromJson(Map body);

  Future<List<T>> getAll() async {
    await prepareHeaders();
    var response = await http.get("$url", headers: headers);
    if (response.statusCode < 400) {
      return convertAllFromJson(json.jsonDecode(response.body));
    } else
      throw Exception(response);
  }

  Future<List<T>> findAll({String urlPostfix = "", Map params = null}) async {
    var result_url = "$url$urlPostfix";
    if (params != null) {
      result_url += "?" +
          (params.entries.map((item) => "${item.key}=${item.value}")).join('&');
    }
    await prepareHeaders();
    var response = await http.get(result_url, headers: headers);

    if (response.statusCode < 400) {
      return convertAllFromJson(json.jsonDecode(response.body));
    } else
      throw Exception(response);
  }
}
