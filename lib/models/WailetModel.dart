import 'package:pwapp/models/BaseModel.dart';

class WailetModel extends BaseModel {
  final int id;
  final String name;
  final double balance;
  final int userId;

  WailetModel({this.id, this.name, this.balance, this.userId});

  factory WailetModel.fromJson(Map<String, dynamic> json) {
    return WailetModel(
        id: json['id'],
        name: json['name'],
        balance: double.parse(json['balance'].toString()),
        userId: json['userId']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'balance': balance, 'userId': userId};
  }
}
