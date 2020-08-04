import 'package:pwapp/models/BaseModel.dart';

class TokenModel extends BaseModel {
  final String accessToken;
  final int userId;

  TokenModel({this.accessToken, this.userId});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(accessToken: json['accessToken'], userId: json['userId']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken, 'userId': userId};
  }
}
