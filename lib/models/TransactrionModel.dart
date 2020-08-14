import 'package:pwapp/models/BaseModel.dart';

class TransactionModel extends BaseModel {
  static String NEW = "NEW";
  static String PENDING = "PENDING";
  static String FAILED = "FAILED";
  static String COMPLETE = "COMPLETE";
  final int id;
  final String status;
  final double amount;
  final int fromWailetId;
  final int toWailetId;
  final DateTime date;
  final String correspondentName;
  final double fromBalance;
  final double toBalance;

  TransactionModel(
      {this.id,
      this.status,
      this.amount,
      this.fromWailetId,
      this.toWailetId,
      this.date,
      this.correspondentName,
      this.fromBalance,
      this.toBalance});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json['id'],
        status: json['status'],
        amount: double.parse(json['amount'].toString()),
        fromWailetId: json['fromWailetId'],
        toWailetId: json['toWailetId'],
        date: DateTime.parse(json['date']),
        correspondentName: json['correspondentName'],
        fromBalance: double.parse(json['fromBalance'].toString()),
        toBalance: double.parse(json['toBalance'].toString()));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'amount': amount,
      'fromWailetId': fromWailetId,
      'toWailetId': toWailetId,
      'date': date,
      'correspondentName': correspondentName,
      'fromBalance': fromBalance,
      'toBalance': toBalance
    };
  }
}
