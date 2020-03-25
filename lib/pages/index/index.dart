import 'package:flutter/material.dart';
import './home/index.dart';
import './mine/index.dart';
import './order/index.dart';
class IndexNavigator extends StatelessWidget{
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home':
            builder = (BuildContext context) => HomeNavigator();
            break;
          case 'mine':
            builder = (BuildContext context) => MinePage();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }

        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>IndexPageState();

}
class IndexPageState extends State<IndexPage>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeNavigator(),
    OrderPage(),
    MinePage(),
  ];
  final List<String> _title = [
    "首页",
    "订单中心",
    "个人中心",
  ];
  onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("asd"),),
      body: _children[_currentIndex],
       bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(_title[0]),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text(_title[1]),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(_title[2]),
          ),
        ],
      ),
    );
  }
  
}
