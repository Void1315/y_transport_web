/*
 * @Author: asahi 
 * @Date: 2020-03-24 17:50:55 
 * @Last Modified by: asahi
 * @Last Modified time: 2020-03-24 19:06:46
 */
/*
 * @Author: asahi 
 * @Date: 2020-03-24 16:34:19 
 * @Last Modified by: asahi
 * @Last Modified time: 2020-03-24 16:47:52
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../../util/api.dart';
import '../../util/regular.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginScreenState();
  
}

class LoginScreenState extends State<LoginScreen> {

  String sendCodeButton = '发送验证码';
  bool sendCodeDisable = false; 
  Timer _timer;
  int _countdownTime = 60;

  void startCountdownTimer() {
  const oneSec = const Duration(seconds: 1);
  var callback = (timer) => {
    setState(() {
      if (_countdownTime < 1) {
        _timer.cancel();
         setState(() {
          _countdownTime = 60;
          sendCodeDisable = false;
          sendCodeButton = '发送验证码';
        });
      } else {
        setState(() {
          _countdownTime = _countdownTime - 1;
          sendCodeButton = '($_countdownTime)';
        });
      }
    })
  };
  _timer = Timer.periodic(oneSec, callback);
}


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
  Future<String> _authSignUp(SignUpData data) {
    return API.instance.signUpCreate(phone: data.name, code: data.verificationCode, password: data.password).then((data)=>null).catchError((err) => err);
  }

  Future<String> _onSendCode(LoginData user){
    // startCountdownTimer(); // 打开计时器
    // setState(() {
    //   sendCodeDisable = true;
    // });
    return API.instance.signUpPhone(phone: user.name).then((data) {
      return null;
    });
  }

  String _mobileValidator(String mobile) {
    if (Regular.mobile.hasMatch(mobile))
      return null;
    else
      return "错误的手机号码格式!";
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
      emailValidator: _mobileValidator,
      onSignup: _authSignUp,
      onSendCode: _onSendCode,
      sendCodeDisable: sendCodeDisable,
      messages: LoginMessages(
        verificationCodeHint: "输入6位手机验证码",
        usernameHint: '您的手机号码',
        passwordHint: '您的密码',
        forgotPasswordButton: '忘记密码？',
        sendCodeButton: sendCodeButton,
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
