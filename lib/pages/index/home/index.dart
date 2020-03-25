import 'package:flutter/material.dart';
import './list.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HomePageState();

}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(onPressed: (){
        Navigator.of(context).pushNamed('list');
      },child: Text("click"),),
    );
  }
}

class HomeNavigator extends StatelessWidget{
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home':
            builder = (BuildContext context) => HomePage();
            break;
          case 'list':
            builder = (BuildContext context) => HomeListPage();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }

        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}