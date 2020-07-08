

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class DIModule  {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}


final getIt = GetIt.instance;

@injectableInit 
void configureDependencies() => $initGetIt(getIt);

$initGetIt(GetIt g, {String environment}) {
  
}