import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:routesnap/Screens/DashBoard/dashBoard.dart';

import '../GetStarted/getStarted.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      bool isLoggedIn = checkLoginStatus();

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GetStarted()),
        );
      }
    });
  }

  bool checkLoginStatus() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}