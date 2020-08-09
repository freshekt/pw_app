import 'package:pwapp/models/TransactrionModel.dart';
import 'package:pwapp/shared/Action.dart';

enum TransactionAction { NEW, FETCH, RECIVED, RECIVED_LIST }

class TransactionActions {
  static Action create(TransactionModel model) =>
      Action(TransactionAction.NEW, payload: model);
  static Action recived(TransactionModel model) =>
      Action(TransactionAction.RECIVED, payload: model);
  static Action recivedList(List<TransactionModel> models) =>
      Action(TransactionAction.RECIVED_LIST, payload: models);
  static Action getAll() => Action(TransactionAction.FETCH);
}
