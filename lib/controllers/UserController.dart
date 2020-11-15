import 'package:get/state_manager.dart';
import 'package:jemy/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  void onInit() {
    getusers();
    super.onInit();
  }

  var user = User().obs;

  Future getusers() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    String userdata = authstorage.getString('user');
    print(userdata);
    user.value = userFromJson(userdata);
    // user.update((val) {
    //   val = userFromJson(userdata);
    // });
    // print(user.value.nickname);
  }
}
