import 'package:flutter_redux_effects/Effect.dart';
import 'package:flutter_redux_effects/StoreService.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pwapp/services/AuthService.dart';
import 'package:pwapp/services/TransactionService.dart';
import 'package:pwapp/services/UserService.dart';
import 'package:pwapp/services/WSService.dart';
import 'package:pwapp/services/WailetsService.dart';
import 'package:pwapp/store/effects/AuthEffects.dart';
import 'package:pwapp/store/effects/TransactionEffect.dart';
import 'package:pwapp/store/effects/WailetEffects.dart';
import 'package:pwapp/store/reducers/AuthReducer.dart';
import 'package:pwapp/store/reducers/TransactionReducer.dart';
import 'package:pwapp/store/reducers/WailetReducer.dart';
import 'package:pwapp/store/selectors/AuthSelector.dart';
import 'package:pwapp/store/selectors/FormTransactionSelector.dart';
import 'package:pwapp/store/selectors/TransactionSelector.dart';
import 'package:pwapp/store/selectors/TransactionsWailetsSelector.dart';
import 'package:pwapp/store/selectors/WailetSelector.dart';
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

$initGetIt(GetIt g, {String environment}) async {
  try {
    final gh = GetItHelper(g, environment);

    gh.singleton<AuthService>(AuthService("http://192.168.1.65:3000"
        //"http://192.168.56.1:3000"
        ));

    gh.singleton<UserService>(UserService("http://192.168.1.65:3000"));

    gh.singleton<WailetsService>(WailetsService("http://192.168.1.65:3000"));

    gh.singleton<WSService>(WSService("http://192.168.1.65:3000"));

    gh.singleton<TransactionsService>(
        TransactionsService("http://192.168.1.65:3000"));

    // WidgetsFlutterBinding.ensureInitialized();
    // final registerModule = RegisterModule();
    // final sharedPreferences = await registerModule.prefs;
    // gh.factory<SharedPreferences>(() => sharedPreferences);

    gh.singleton<StoreService<MainState>>(StoreService<MainState>(
        [AuthReducer(), TransactionReducer(), WailetReducer()],
        MainState.initState(null),
        effects: combineEffects([
          AuthEffects().effect(),
          TransactionEffect().effect(),
          WailetsEffect().effect()
        ]),
        selectors: [
          AuthSelector(),
          TransactionSelector(),
          WailetSelector(),
          FormTransactionSelector(),
          TransactionWailetsSelector()
        ]));
  } catch (ex) {
    print(ex);
  }
}
