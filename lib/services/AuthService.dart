import 'package:injectable/injectable.dart';
import 'package:pwapp/models/BaseModel.dart';
import 'package:pwapp/models/LoginModel.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/services/BaseRestService.dart';
import 'dart:convert' as json;

@singleton
class AuthService
    extends BaseRestService<TokenModel, LoginModel, BaseModel, BaseModel> {
  AuthService(apiUri) : super(url: apiUri);

  Future<TokenModel> login(LoginModel model) async {
    return await create(
        LoginModel(username: model.username, password: model.password),
        urlPostfix: "/login");
  }

  registration(String username, String password) async {
    return await create(LoginModel(username: username, password: password),
        urlPostfix: "/registration");
  }

  @override
  TokenModel convertFromJson(String body) {
    return TokenModel.fromJson(json.jsonDecode(body));
  }
}
