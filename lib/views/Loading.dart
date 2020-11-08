import 'dart:async';

import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:get/get.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () => Get.to(Login()));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              "JEMY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Squada',
              ),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              'Inspired by pure evil',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
