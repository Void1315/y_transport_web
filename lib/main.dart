import 'package:flutter/material.dart';
import 'app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

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
              title: 'Flutter Login',
              theme: store.state.themeState.themeData,
              home: LoginPage(),
            );
          },
        ));
  }
}
