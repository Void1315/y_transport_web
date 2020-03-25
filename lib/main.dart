import 'package:flutter/material.dart';
import 'package:ytransportweb/config/config.dart';
import 'package:ytransportweb/util/api.dart';
import 'app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'router.dart';
void main(){
  Config.env = Env.LOCAL;
  API();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(appReducer,
        initialState: AppState.initialState()); //创建 store
    return StoreProvider(
        store: store,
        child: StoreBuilder<AppState>(
          builder: (context, store) {
            return MaterialApp(
              title: 'Y出行',
              theme: store.state.themeState.themeData,
              routes: routes,
            );
          },
        ));
  }
}
