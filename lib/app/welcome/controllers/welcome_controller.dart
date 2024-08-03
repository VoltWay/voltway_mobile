import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WelcomeController extends GetxController {
  void handleGetStarted(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  void handleStartEarning(BuildContext context) {
    Navigator.pushNamed(context, "/start-earning");
  }
}
