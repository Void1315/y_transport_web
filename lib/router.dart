import 'pages/index.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes={
  "/":(context)=> WelcomePage(),
  "/welcome":(context)=> WelcomePage(),
  "/guide": (context)=>GuidePage(),
};