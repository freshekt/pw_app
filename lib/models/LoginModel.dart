import 'package:pwapp/models/BaseModel.dart';

class LoginModel extends BaseModel {
  final String username;
  final String password;

  LoginModel({this.username, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(username: json['username'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
