import 'package:pwapp/models/BaseModel.dart';

class RegistrationModel extends BaseModel {
  final String username;
  final String password;

  RegistrationModel({this.username, this.password});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
        username: json['username'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
