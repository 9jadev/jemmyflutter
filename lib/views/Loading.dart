import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard/Home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // Timer(Duration(seconds: 4), () => Get.to(Login()));
    _checkLogin();
    super.initState();
  }

  Future _checkLogin() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();

    String token = authstorage.getString("accessToken");
    // print(token);
    if (token != null) {
      // Map userdata = jsonDecode(authstorage.getString('user'));
      // print(userdata);
      // print(token);
      Timer(Duration(seconds: 4), () => Get.to(Home()));
    } else {
      Timer(Duration(seconds: 4), () => Get.to(Login()));
    }

    // if (token == null) {
    //   print("nulllllllllllllll");
    // }
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
