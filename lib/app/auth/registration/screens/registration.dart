import 'package:voltway_mobile/app/auth/registration/controllers/registration_controller.dart';
import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:voltway_mobile/core/widgets/button.dart';
import 'package:voltway_mobile/core/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final registrationController = Get.put(RegistrationController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 32,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/logo/logo.png", width: 250),
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    children: <Widget>[
                      InputField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          // Handle email input changes
                        },
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          // Handle password input changes
                        },
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        hintText: 'Confirm password',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          // Handle password confirmation input changes
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () => {Get.offAndToNamed("/login")},
                            child: const Text(
                              "Already a member?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GetX<RegistrationController>(
                            builder: (_) => Checkbox(
                                value: registrationController.agreeTo.value,
                                onChanged: (value) => {
                                      registrationController
                                          .handleAgreeClick(value!)
                                    }),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle terms of service tap
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Handle terms of service tap
                                  },
                                  child: const Text.rich(
                                    TextSpan(
                                      text: 'I agree to the ',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: 'Terms of Service',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' and ',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Handle privacy policy tap
                                  },
                                  child: const Text.rich(
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Button(
                        title: "Continue",
                        variant: Variant.primary,
                        callback: () => {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
