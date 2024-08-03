import 'package:voltway_mobile/app/auth/login/screens/login.dart';
import 'package:voltway_mobile/app/auth/registration/screens/registration.dart';
import 'package:voltway_mobile/app/auth/twoFactor/screens/two_factor.dart';
import 'package:voltway_mobile/app/home/screens/home.dart';
import 'package:voltway_mobile/app/settings/car_add/screens/car_add.dart';
import 'package:voltway_mobile/app/welcome/screens/welcome.dart';
import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => const Welcome(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/',
          page: () => const Home(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/login',
          page: () => const Login(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/registration',
          page: () => const Registration(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/car_add',
          page: () => const CarAdd(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
