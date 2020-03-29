import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './help/index.dart';
import '../../../app_state.dart';

class MinePageNavigator extends StatelessWidget {
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: 'mine',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'mine':
              builder = (BuildContext context) => MinePage();
              break;
            case 'help':
              builder = (BuildContext context) => HelpPage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  List<Map<String, dynamic>> _operatingList = [
    {"icons": Icon(Icons.help), "title": "帮助中心", "routeName": "help"},
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                _topInfo(),
                _operatingListWidget(),
              ],
            ),
          );
        },
        converter: (store) => store.state);
  }

  Widget _buildOperating(Icon icons, String title, String routeName) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      trailing: icons,
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }

  Widget _operatingListWidget() {
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: _operatingList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildOperating(
                _operatingList[index]["icons"],
                _operatingList[index]['title'],
                _operatingList[index]['routeName']);
          }),
    );
  }

  Widget _topInfo() {
    return Container(child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "kono dio da",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "查看和编辑",
              style: TextStyle(fontSize: 14, color: Color(0xFFBFBFBF)),
            ),
          ],
        ),
        Container(
          width: 70,
          height: 70,
          child: CircleAvatar(
            //头像半径
            radius: 60,
            //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
            backgroundImage: NetworkImage(
                'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
          ),
        )
      ],
    ),);
  }
}
