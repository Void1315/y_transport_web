import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(child: Icon(Icons.arrow_back),onTap: ()=>Navigator.pop(context),),),
      body: Center(child: Text("data"),),
    );
  }
  
}