import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../../util/regular.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  /**
   * 登录判断
   */
  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }
  /**
   * 注册判断
   */
  Future<String> _authSignUp(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  String _emailValidator(String email) {
    if (Regular.email.hasMatch(email))
      return null;
    else
      return "错误的邮箱格式!";
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Y出行',
      logo: 'assets/images/logo.png',
      onLogin: _authUser,
      emailValidator: _emailValidator,
      onSignup: _authSignUp,
      messages: LoginMessages(
        usernameHint: '您的邮箱地址',
        passwordHint: '您的密码',
        forgotPasswordButton: '忘记密码？',
        loginButton: '登录',
        signupButton: '注册',
        confirmPasswordHint: '再次输入密码',
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => FlutterLogo(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
