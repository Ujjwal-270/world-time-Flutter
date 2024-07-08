import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/startvideo.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => LogoPage(),
    '/home':(context) => Home(),
    '/location':(context) =>ChooseLocation(),
    //'/': (context) => VideoScreen(),
  }
));
