import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    if (!isEmail(newText)) {
      return oldValue;
    }
    return newValue;
  }
}
