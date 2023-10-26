import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(SkinDetectController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.light),
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(microseconds: 500),
      home: SplashScreen(),
    );
  }
}
