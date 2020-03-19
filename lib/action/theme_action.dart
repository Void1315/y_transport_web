import 'package:redux/redux.dart';
import '../model/theme_model.dart';

class SetThemeAction {
  ThemeModel theme;

  SetThemeAction({this.theme}) : super();
  /**
   * 设置user
   */
  static ThemeModel setTheme(ThemeModel theme, SetThemeAction action) {
    return theme;
  }
}
/*
 * 绑定Action与动作
 */
final ThemeReducer = combineReducers<ThemeModel>([
  TypedReducer<ThemeModel, SetThemeAction>(SetThemeAction.setTheme),
]);
