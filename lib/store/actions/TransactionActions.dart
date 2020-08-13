import 'package:flutter_redux_effects/Action.dart';
import 'package:pwapp/models/TransactrionModel.dart';

enum TransactionAction { NEW, FETCH, RECIVED, RECIVED_LIST, TRANSACTION_UPDATE }

class TransactionActions {
  static Action create(TransactionModel model) =>
      Action(TransactionAction.NEW, payload: model);
  static Action transactionUpdate(TransactionModel model) =>
      Action(TransactionAction.TRANSACTION_UPDATE, payload: model);
  static Action recived(TransactionModel model) =>
      Action(TransactionAction.RECIVED, payload: model);
  static Action recivedList(List<TransactionModel> models) =>
      Action(TransactionAction.RECIVED_LIST, payload: models);
  static Action getAll() => Action(TransactionAction.FETCH);
}
