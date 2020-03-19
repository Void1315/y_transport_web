import 'package:redux/redux.dart';
import '../model/user_model.dart';

class SetUserAction {
  UserModel user;

  SetUserAction({this.user}) : super();
  /**
   * 设置user
   */
  static UserModel setUser(UserModel user, SetUserAction action) {
    return user;
  }
}
/*
 * 绑定Action与动作
 */
final UserReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, SetUserAction>(SetUserAction.setUser),
]);
