import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ytransportweb/app_state.dart';
import 'package:ytransportweb/util/api.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  @override
  void initState() {
    super.initState();
  }

  _test(){
    API.instance.test().then((value) => null).catchError((err){
      print(err);
      return err;
    });
  }

  List<String> titleList = ["你的旅行计划", "你的出行方式", "你的旅行时光"];
  List<String> subTitleList = [
    "预订一间我们独一无二的酒店来逃离平凡",
    "享受我们贴心的出行服务",
    "陪伴您出行的最佳方案"
  ];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Container(
              color: Colors.white,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.vertical,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        height: 360,
                        child: Swiper(
                          autoplay: true,
                          scale: 0.5,
                          pagination: SwiperPagination(
                              builder: MySwiperPaginationBuilder(
                                  color: state.themeState.themeData.buttonColor,
                                  activeColor:
                                      state.themeState.themeData.primaryColor),
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 230)),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/swiper_${index + 1}.png",
                                    height: 220,
                                    fit: BoxFit.contain,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      titleList[index],
                                      style: TextStyle(
                                          color: state
                                              .themeState.themeData.accentColor,
                                          fontSize: 24,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      subTitleList[index],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 17),
                          child: MaterialButton(
                              height: 60,
                              minWidth: double.infinity,
                              child: Text(
                                "登录",
                                style: TextStyle(fontSize: 20),
                              ),
                              color: state.themeState.themeData.primaryColor,
                              textColor: Colors.white,
                              onPressed: () => {Navigator.pushNamed(context, "/sign_in")},
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)))),
                                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: MaterialButton(
                              height: 60,
                              minWidth: double.infinity,
                              child: Text(
                                "注册",
                                style: TextStyle(fontSize: 20),
                              ),
                              color: state.themeState.themeData.buttonColor,
                              textColor: Colors.white,
                              onPressed: _test,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))))
                    ],
                  ),
                ],
              ));
        });
  }
}

class MySwiperPaginationBuilder extends DotSwiperPaginationBuilder {
  final Color activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///Size of the dot when activate
  final double activeSize;

  ///Size of the dot
  final double size;

  /// Space between dots
  final double space;

  final Key key;

  MySwiperPaginationBuilder(
      {this.activeColor,
      this.color,
      this.key,
      this.size: 10.0,
      this.activeSize: 10.0,
      this.space: 3.0}) {}
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(space),
        child: ClipOval(
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: active ? activeSize : size,
          ),
        ),
      ));
    }
    return new Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
