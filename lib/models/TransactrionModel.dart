import 'package:pwapp/models/BaseModel.dart';

class TransactionModel extends BaseModel {
  final int id;
  final String status;
  final double amount;
  final int fromWailetId;
  final int toWailetId;

  TransactionModel(
      {this.id, this.status, this.amount, this.fromWailetId, this.toWailetId});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      status: json['status'],
      amount: json['amount'],
      fromWailetId: json['fromWailetId'],
      toWailetId: json['toWailetId'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'amount': amount,
      'fromWailetId': fromWailetId,
      'toWailetId': toWailetId,
    };
  }
}
