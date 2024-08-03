import 'package:voltway_mobile/app/welcome/controllers/welcome_controller.dart';
import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:voltway_mobile/configs/theme/palette.dart';
import 'package:voltway_mobile/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Image.asset('assets/logo/logo.png',
                        width: 250, height: 200),
                    const SizedBox(height: 20),
                    const Text(
                      "The smart way to charge",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    Button(
                      title: "Get Started",
                      variant: Variant.primary,
                      callback: () =>
                          welcomeController.handleGetStarted(context),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      title: "Login",
                      variant: Variant.secondary,
                      callback: () =>
                          welcomeController.handleGetStarted(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
