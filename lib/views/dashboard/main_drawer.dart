import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jemy/views/Loading.dart';
import 'package:get/get.dart';
import 'package:jemy/controllers/UserController.dart';

class MainDrawer extends StatelessWidget {
  final UserController usercontroller = Get.put(UserController());

  logout(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Logout Prompt",
      desc: "Are you sure you want to logout from Jemy",
      buttons: [
        DialogButton(
          child: Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            SharedPreferences authstorage =
                await SharedPreferences.getInstance();
            authstorage.remove('user');
            authstorage.remove('accessToken');
            Get.to(Loading());
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.teal,
            child: Center(
              child: Column(
                children: [
                  Obx(() => Container(
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Get.find<UserController>().user.value.image}"),
                              fit: BoxFit.fill),
                        ),
                      )),
                  Obx(() => Text(
                        "${Get.find<UserController>().user.value.nickname}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )),
                  Text(
                    "${Get.find<UserController>().user.value.email}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.article_sharp,
              size: 30.0,
              color: Colors.teal,
            ),
            title: const Text("Review"),
            onTap: () => print("ListTile"),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_a_photo,
              size: 30.0,
              color: Colors.teal,
            ),
            title: const Text("Edit Image"),
            onTap: () => print("ListTile"),
          ),
          ListTile(
            leading: const Icon(
              Icons.badge,
              size: 30.0,
              color: Colors.teal,
            ),
            title: const Text("Edit Bio"),
            onTap: () => print("ListTile"),
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_back,
              size: 30.0,
              color: Colors.teal,
            ),
            title: const Text("Logout"),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }
}
