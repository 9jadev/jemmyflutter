import 'package:flutter/material.dart';
import 'package:jemy/views/Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:clipboard/clipboard.dart';
import 'package:sweetalert/sweetalert.dart';
import "main_drawer.dart";
import "package:get/instance_manager.dart";
import 'package:jemy/controllers/UserController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserController usercontroller = Get.put(UserController()); //
  // var user = Get.find<UserController>().user.value;
  String nickname = Get.find<UserController>().user.value.nickname;
  String image = Get.find<UserController>().user.value.image;
  _copylink() {
    FlutterClipboard.copy("https://www.thenetnaija.com/videos/$nickname").then(
      (value) => {
        Get.snackbar('Copied succesfully',
            ' Share your review link with friends and family ',
            snackPosition: SnackPosition.BOTTOM)
        // SweetAlert.show(context,
        //     title: "Review link copied.",
        //     subtitle: " Share with friends to see evil intentions",
        //     style: SweetAlertStyle.success)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.teal[200],
                    Colors.teal[300],
                    Colors.teal[600],
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "JEMY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Squada',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Inspired by pure evil.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                    width: double.infinity,
                    height: 370.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Obx(() => Text(
                              "${Get.find<UserController>().user.value.nickname}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.grey[800],
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          padding: EdgeInsets.all(10.0),
                          width: double.infinity,
                          height: 210.0,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is nd the like",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "https://www.thenetnaija.com/videos/$nickname",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  IconButton(
                    icon: Icon(Icons.copy),
                    iconSize: 40.0,
                    color: Colors.white,
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      _copylink();
                    },
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//         child: RaisedButton(
//           child: Text("FUCK YOU BITCH"),
//           onPressed: () async {
//             SharedPreferences authstorage =
//                 await SharedPreferences.getInstance();
//             authstorage.remove('user');
//             authstorage.remove('accessToken');
//             Get.to(Loading());
//           },
//         ),
//       ),
