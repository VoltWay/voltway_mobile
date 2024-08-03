import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:voltway_mobile/configs/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final bool? password;
  final String? value;
  final TextCapitalization? capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final bool? twoFactor;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const InputField(
      {required this.hintText,
      required this.keyboardType,
      required this.onChanged,
      this.password,
      this.value,
      super.key,
      this.capitalization,
      this.inputFormatters,
      this.validator,
      this.twoFactor,
      this.controller,
      this.focusNode});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController controller;
  final FocusNode focusNode = FocusNode();
  @override
  initState() {
    controller = TextEditingController(text: widget.value ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.twoFactor != null && widget.twoFactor!
          ? Alignment.center
          : Alignment.centerLeft,
      height: 60,
      padding: EdgeInsets.symmetric(
          horizontal: widget.twoFactor != null && widget.twoFactor! ? 0 : 24.0),
      decoration: BoxDecoration(
          color: AppTheme.isDarkMode(context)
              ? DarkAppPalette.inputBackground
              : LightAppPalette.inputBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 2)),
      child: TextFormField(
        focusNode: widget.focusNode ?? focusNode,
        controller: widget.controller ?? controller,
        maxLength: 1,
        inputFormatters: widget.inputFormatters,
        textCapitalization: widget.capitalization ?? TextCapitalization.none,
        obscureText: widget.password ?? false,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: TextStyle(
          fontSize: widget.twoFactor != null && widget.twoFactor! ? 24 : 18,
          fontWeight: widget.twoFactor != null && widget.twoFactor!
              ? FontWeight.bold
              : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          counterText: "",
          labelStyle: const TextStyle(fontSize: 18),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
