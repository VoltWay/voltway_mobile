import 'package:get/get.dart';

class RegistrationController extends GetxController {
  RxBool agreeTo = false.obs;

  RegistrationController() {
    agreeTo.value = false;
  }

  void handleAgreeClick(bool value) {
    agreeTo.value = value;
  }
}
