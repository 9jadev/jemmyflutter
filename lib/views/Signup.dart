import 'package:flutter/material.dart';
import 'package:jemy/Mixins/validation_mixins.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with ValidationMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = '';
  String nickname = '';
  String about = '';
  String password = '';
  String confirmpassword = '';
  bool _enabled = true;

  void validate() {
    // EasyLoading.('Use in initState');
    setState(() => _enabled = false);
    EasyLoading.show(status: 'loading...');
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      print(
          'validated $email and $nickname and $password and $confirmpassword');
      _Signupmember(email, nickname, about, password, confirmpassword);
    } else {
      print("not validated");
    }
    // setState(() => _enabled = true);
  }

  Future _Signupmember(String email, String nickname, String about,
      String password, String confirmpassword) async {
    // make GET request
    String url = 'https://jemmy.herokuapp.com/api/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email": email, "nickname": nickname, "about": about, "password": password, "password_confirmation": confirmpassword}';
    Response response = await post(url, headers: headers, body: json);
    String body = response.body;
    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.teal[400],
                    Colors.teal[800],
                    Colors.teal[900],
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
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
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[50],
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Nick Name',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    validator: validateNickname,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        return 'Nick Name is requred';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      nickname = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    validator: validateEmail,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        return 'Email Name is requred';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      email = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: TextFormField(
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      hintText: 'Enter About Us',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: new OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.teal),
                                      ),
                                    ),
                                    validator: validateAbout,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        return 'About is requred';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      about = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    validator: validatePassword,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        return 'Password is requred';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    validator: validateConfirmpassword,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        return 'Confirm password is requred';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      confirmpassword = value;
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      child: Text(
                        'Already a memeber ?',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // print("somd");
                        // Get.toNamed("/Login");
                        Get.to(Login());
                        // Get.toNamed("/Login");
                      },
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: _enabled ? validate : null,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    Text(
                      'Inspired by pure evil.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
