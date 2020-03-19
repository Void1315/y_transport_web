import 'package:flutter/material.dart';
import 'action/index.dart';
import 'model/index.dart';

class AppState {
  UserModel userState; //用户数据
  ThemeModel themeState; // 主题数据
  AppState({this.userState, this.themeState});
  /*
   * 命名的构造方法
   * 这里用来初始化
   */
  AppState.initialState() {
    userState = UserModel();
    // themeState = ThemeModel(themeData: ThemeData.light());
    themeState = ThemeModel.lightTheme();
  }
}

/**
 * 定义Reducer
 */
AppState appReducer(AppState state, action) {
  return AppState(
      userState: UserReducer(state.userState, action),
      themeState: ThemeReducer(state.themeState, action));
}
