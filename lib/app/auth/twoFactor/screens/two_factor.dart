import 'package:voltway_mobile/app/auth/twoFactor/controllers/two_factor_controller.dart';
import 'package:voltway_mobile/core/widgets/button.dart';
import 'package:voltway_mobile/core/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactor extends StatefulWidget {
  const TwoFactor({super.key});

  @override
  State<TwoFactor> createState() => _TwoFactorState();
}

class _TwoFactorState extends State<TwoFactor> {
  final TwoFactorController twoFactorController =
      Get.put(TwoFactorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Verify it's you",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
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
                    SvgPicture.asset(
                      Get.isDarkMode
                          ? "assets/logo/logo_darkmode.svg"
                          : "assets/logo/logo_lightmode.svg",
                      width: 190,
                    ),
                    const SizedBox(height: 20),
                    const Text("A code has been sent to +39 32* *** **32"),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Expanded(
                            child: InputField(
                                hintText: "",
                                twoFactor: true,
                                controller:
                                    twoFactorController.codeControllers[i],
                                focusNode: twoFactorController.focusNodes[i],
                                keyboardType: TextInputType.number,
                                onChanged: (_) =>
                                    {twoFactorController.codeChanged(i)}),
                          ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: const Text(
                          "Resend code",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GetBuilder<TwoFactorController>(
                      builder: (controller) {
                        return Button(
                          title: "Verify",
                          callback: () {
                            controller.verifyCode();
                          },
                          variant: Variant.primary,
                        );
                      },
                    ),
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
