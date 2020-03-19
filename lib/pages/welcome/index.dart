import 'package:flutter/material.dart';
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
      animationType:AnimationType.once,
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
    // 创建 AnimationController，用于控制动画
    // 必须提供动画时间
    // animationController = new AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1500));
    // // 创建一个插值器，关联 AnimationController，返回一个新的 Animation 对象
    // animation = Tween<double>(begin: 100.0, end: 100.0 * 2.0)
    //     .animate(animationController);

    // animationController.addListener(() {
    //   // 当动画更新时会调用
    //   // 需要在这个函数中，调用 setState() 来触发视图刷新
    //   setState(() {});
    // });
    // // 开始播放动画
    // animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          Expanded(
            flex: 0,
            child: makeLine(
              0,
              child: Container(
                  margin: EdgeInsets.only(top: 115),
                  child: Image(
                      image: AssetImage("assets/images/logo0.png"),
                      height: 130)),
            ),
          ),
          Expanded(
            flex: 0,
            child: makeLine(animationTime,
                child: Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: LogoText(
                        "Y出行",
                        style: TextStyle(fontSize: 36),
                      )),
                )),
          ),
          Expanded(
            flex: 0,
            child: makeLine(animationTime*2, child: Center(child: Text("陪伴您出行的最好方式"))),
          )
        ],
      ),
    ));
  }
}
