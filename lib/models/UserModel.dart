import 'dart:convert';

import 'package:pwapp/models/BaseModel.dart';

class UserModel extends BaseModel {
  final String username;
  final int id;

  UserModel({this.username, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], id: json['id']);
  }

  factory UserModel.fromToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    String output = parts[1].replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    final payload = jsonDecode(utf8.decode(base64Url.decode(output)));
    final user = payload['user'];
    return UserModel.fromJson(user);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'id': id};
  }
}
