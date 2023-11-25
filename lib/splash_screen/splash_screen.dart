import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/log_in/login_screen.dart';

import '../home_layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
      ),
    );
  }
}
