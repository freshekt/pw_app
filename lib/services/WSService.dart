import 'dart:convert' as json;

import 'package:pwapp/models/TokenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

class WSService {
  Socket socket;
  String url;
  Map headers = {};

  WSService(this.url);

  void connect(TokenModel tokenModel) {
    try {
      socket = io(this.url, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'extraHeaders': {'Authorization': "Bearer ${tokenModel.accessToken}"}
      }).connect();
      socket.on('connect', (data) {
        print(data);
      });
    } catch (e) {
      print(e);
    }
  }

  void on(String event, Function callback) => socket.on(event, callback);

  emit<T>(String event, {T model}) async {
    return socket.emit(event, model);
  }
}
