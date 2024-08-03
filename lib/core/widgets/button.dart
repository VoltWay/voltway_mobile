import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum Variant { primary, secondary, black }

class Button extends StatefulWidget {
  final String title;
  final VoidCallback? callback;
  final Variant variant;
  final IconData? icon;

  const Button(
      {super.key,
      required this.title,
      this.callback,
      required this.variant,
      this.icon});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Map<dynamic, Color> buttonVariationColors(Variant variant) {
    switch (variant) {
      case Variant.primary:
        return {
          "backgroundColor":
              AppTheme.isDarkMode(context) ? Colors.white : Colors.black,
          "foregroundColor":
              AppTheme.isDarkMode(context) ? Colors.black : Colors.white,
        };

      case Variant.secondary:
        return {
          "backgroundColor": Colors.blueAccent,
          "foregroundColor": Colors.white
        };
      case Variant.black:
        return {
          "backgroundColor": Colors.black,
          "foregroundColor": Colors.white
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.callback, // Added arrow function here
        style: ElevatedButton.styleFrom(
            backgroundColor:
                buttonVariationColors(widget.variant)["backgroundColor"],
            foregroundColor:
                buttonVariationColors(widget.variant)["foregroundColor"]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(widget.icon,
                    color: buttonVariationColors(
                        widget.variant)["foregroundColor"]),
              ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
