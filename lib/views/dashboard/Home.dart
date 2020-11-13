import 'package:flutter/material.dart';
import 'package:jemy/views/Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: RaisedButton(
          child: Text("FUCK YOU BITCH"),
          onPressed: () async {
            SharedPreferences authstorage =
                await SharedPreferences.getInstance();
            authstorage.remove('user');
            authstorage.remove('accessToken');
            Get.to(Loading());
          },
        ),
      ),
    );
  }
}
