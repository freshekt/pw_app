import 'package:pwapp/models/BaseModel.dart';
import 'package:pwapp/models/TransactrionModel.dart';
import 'package:pwapp/services/BaseRestService.dart';

class TransactionsService extends BaseRestService<TransactionModel,
    TransactionModel, BaseModel, BaseModel> {
  TransactionsService(apiUri) : super(url: apiUri);

  Future<List<TransactionModel>> getRecent() {
    return findAll(urlPostfix: "/recent");
  }

  Future<TransactionModel> send(TransactionModel model) {
    return create(model, urlPostfix: "/send");
  }

  @override
  TransactionModel convertFromJson(Map data) {
    return TransactionModel.fromJson(data);
  }
}
