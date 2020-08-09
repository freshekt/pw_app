import 'package:pwapp/models/BaseModel.dart';
import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/services/BaseRestService.dart';

class WailetsService
    extends BaseRestService<WailetModel, BaseModel, BaseModel, BaseModel> {
  WailetsService(apiUri) : super(url: apiUri);

  Future<List<WailetModel>> getUserWailets(int userId) {
    return findAll(urlPostfix: "/wailets/$userId");
  }

  @override
  WailetModel convertFromJson(Map data) {
    return WailetModel.fromJson(data);
  }
}
