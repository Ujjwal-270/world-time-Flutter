import 'dart:async';
import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Start a timer to hide the logo after 5 seconds
    Timer(Duration(seconds: 4), () async {
      setState(() {
        _isVisible = false;
      });
      // After fading out the logo, navigate to the home screen
      await Future.delayed(Duration(milliseconds: 300)); // Wait for the fade-out animation
      WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments:{
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime':instance.isDayTime,
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Image.asset('assets/logo.png'),
      ),
      ),
      backgroundColor: Colors.black,
    );
  }
}