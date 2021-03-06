import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../app_state.dart';
import '../../components/logo_text.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  var animationTime = 600;
  Widget makeLine(int delay, {child: Widget}) {
    return AnimatorSet(
      child: child,
      animationType: AnimationType.once,
      animatorSet: [
        Delay(duration: delay),
        Serial(duration: animationTime, serialList: [
          TY(
            from: -20.0,
            to: 0.0,
            duration: animationTime,
            curve: Curves.ease,
          ),
          O(
            from: 0,
            to: 1,
            duration: animationTime,
            curve: Curves.ease,
          ),
        ]),
      ],
    );
  }

  void initState() {
    super.initState();
  }
  _jumpToGuidePage(){
    Navigator.pushNamed(context, "/guide");
  }
  _jumpToSignInPage(){
    Navigator.pushNamed(context, "/sign_in");
  }
  _signUpButton(viewModel) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: MaterialButton(
            height: 60,
            minWidth: double.infinity,
            child: Text(
              "开始",
              style: TextStyle(fontSize: 20),
            ),
            color: viewModel.themeData.primaryColor,
            textColor: Colors.white,
            onPressed: _jumpToGuidePage,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.create(store),
        builder: (context, viewModel) {
          return Scaffold(
              body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(children: [
                  makeLine(
                    0,
                    child: Container(
                        margin: EdgeInsets.only(top: 115),
                        child: Image(
                            image: AssetImage("assets/images/logo0.png"),
                            height: 130)),
                  ),
                  makeLine(animationTime,
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: LogoText(
                              "Y出行",
                              style:
                                  TextStyle(fontSize: 36, color: Colors.white),
                            )),
                      )),
                  makeLine(animationTime * 2,
                      child: Center(
                          child: Text(
                        "陪伴您出行的最好方式",
                        style: TextStyle(color: Colors.white),
                      ))),
                ]),
                Column(
                  children: <Widget>[
                    _signUpButton(viewModel),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 75),
                        child: Row(children: <Widget>[
                          Text(
                            "已经有账号了？",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: _jumpToSignInPage,
                              child: Text("登录",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: viewModel.themeData.primaryColor)),
                            ),
                          )
                        ], mainAxisAlignment: MainAxisAlignment.center)),
                  ],
                ),
              ],
            ),
          ));
        });
  }
}

class _ViewModel {
  ThemeData themeData;
  _ViewModel({
    this.themeData,
  });
  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      themeData: store.state.themeState.themeData,
    );
  }
}
