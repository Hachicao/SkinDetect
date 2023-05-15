import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(splashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? -40 : -300,
              left: splashController.animate.value ? -30 : -300,
              child: const Image(image: AssetImage(tSlashImage)),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? 250 : -500,
              left: splashController.animate.value ? 50 : -500,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Column(children: [
                  Image(image: AssetImage(tLogo)),
                  Text(
                    "SKIN DETECT.AI",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ]),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: splashController.animate.value ? -30 : -400,
              right: splashController.animate.value ? -80 : -400,
              child: const Image(image: AssetImage(tSlashImage)),
            ),
          ),
        ],
      ),
    );
  }
}
