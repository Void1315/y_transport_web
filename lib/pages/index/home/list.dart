import 'package:flutter/material.dart';

class HomeListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: RaisedButton(child: Text('返回Home'),onPressed: (){
      Navigator.of(context).pushNamed('home');
    }),);
  }
  
}