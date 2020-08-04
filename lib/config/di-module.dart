import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:pwapp/services/AuthService.dart';
import 'package:pwapp/shared/StoreService.dart';
import 'package:pwapp/store/effects/AuthEffects.dart';
import 'package:pwapp/store/reducers/AuthReducer.dart';
import 'package:pwapp/store/selectors/AuthSelector.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class DIModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);

$initGetIt(GetIt g, {String environment}) {
  try {
    final gh = GetItHelper(g, environment);
    gh.singleton<AuthService>(AuthService(
        //"http://192.168.1.65:3000"
        "http://192.168.56.1:3000"));
    gh.singleton<StoreService<MainState>>(StoreService<MainState>(
        [AuthReducer()], MainState.initState(null),
        effects: AuthEffects().effect(), selectors: [AuthSelector()]));
  } catch (ex) {
    print(ex);
  }
}
