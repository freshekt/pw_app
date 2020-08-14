import 'BaseModel.dart';

class ErrorModel extends BaseModel {
  final int code;
  final String message;
  ErrorModel({this.code, this.message});

  factory ErrorModel.fromJson(Map json) {
    return ErrorModel(code: json['code'], message: json['message']);
  }

  @override
  Map toJson() {
    return {'code': code, 'message': message};
  }
}
