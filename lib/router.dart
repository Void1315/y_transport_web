
import 'pages/index.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes={
  // "/":(context)=> WelcomePage(),
  "/":(context)=>IndexPage(),
  "/welcome":(context)=> WelcomePage(),
  "/guide": (context)=>GuidePage(),
  "/sign_in": (context)=>LoginScreen(),
};