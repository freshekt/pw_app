import 'package:pwapp/models/TransactrionModel.dart';

import 'BaseState.dart';

class TransactionState extends BaseState<TransactionState> {
  List<TransactionModel> transactions = [];
  @override
  TransactionState clone() {
    return TransactionState();
  }

  static TransactionState initState(dynamic params) {
    return TransactionState()..transactions = [];
  }
}
