import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/store/state/BaseState.dart';

import 'AuthState.dart';

class FromTransactionState extends AuthState {
  List<WailetModel> wailets;
  List<WailetModel> mywailets;
}
