import 'package:get/get.dart';

class LoginController extends GetxController {
  var loginMode = 'magicLink'.obs;
  var email = "".obs;
  var password = "".obs;

  void switchLoginMode() {
    if (loginMode.value == 'magicLink') {
      loginMode.value = 'credentials';
    } else {
      loginMode.value = 'magicLink';
    }
  }

  void setEmail(String value) {
    email = value.obs;
  }

  void setPassword(String value) {
    password = value.obs;
  }
}
