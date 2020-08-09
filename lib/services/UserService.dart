import 'package:pwapp/models/BaseModel.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/services/BaseRestService.dart';

class UserService
    extends BaseRestService<UserModel, BaseModel, BaseModel, BaseModel> {
  UserService(apiUri) : super(url: apiUri);

  Future<List<UserModel>> search(String pattern) async {
    return await findAll(params: {"q": pattern}, urlPostfix: "/search");
  }

  @override
  UserModel convertFromJson(Map data) {
    return UserModel.fromJson(data);
  }
}
