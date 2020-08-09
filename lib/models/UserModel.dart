import 'package:pwapp/models/BaseModel.dart';

class UserModel extends BaseModel {
  final String username;
  final int id;

  UserModel({this.username, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], id: json['id']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'id': id};
  }
}
