import 'package:voltway_mobile/app/auth/login/controllers/login_controller.dart';
import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:voltway_mobile/configs/theme/palette.dart';
import 'package:voltway_mobile/core/utils/text_input_validators.dart';
import 'package:voltway_mobile/core/widgets/button.dart';
import 'package:voltway_mobile/core/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => Get.toNamed("/registration"),
                child: const Text(
                  "Not a member yet?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Image.asset("assets/logo/logo.png", width: 200),
                    const SizedBox(height: 50),
                    Form(
                        child: Column(
                      children: [
                        InputField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          value: loginController.email.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!isEmail(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            loginController.setEmail(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          hintText: 'Password',
                          password: true,
                          keyboardType: TextInputType.text,
                          value: loginController.password.value,
                          onChanged: (value) {
                            loginController.setPassword(value);
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              child: const Text(
                            "Forgot your password?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Button(
                            title: "Continue",
                            variant: Variant.primary,
                            callback: () => {})
                      ],
                    )),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
