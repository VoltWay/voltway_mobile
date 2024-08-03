import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactorController extends GetxController {
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> codeControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    // Dispose focus nodes and controllers
    for (int i = 0; i < 6; i++) {
      focusNodes[i].dispose();
      codeControllers[i].dispose();
    }
    super.dispose();
  }

  void codeChanged(int index) {
    final controller = codeControllers[index];
    final text = controller.text;
    print("input: ${index + 1}");
    if (text.length == 1) {
      // If a character is added and length is 1
      if (index < 5) {
        // Move focus to the next input field
        FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
      }
    } else if (text.isEmpty && index > 0) {
      // If text is deleted and the field is empty
      FocusScope.of(Get.context!).requestFocus(focusNodes[index - 1]);
      FocusScope.of(Get.context!).nextFocus();
    }
  }

  void verifyCode() {
    // Add your verification logic here
  }
}
