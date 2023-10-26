import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(splashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: tbackgroundColor,
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? 0 : -20,
              left: splashController.animate.value ? 0 : -20,
              child: const Image(image: AssetImage(tWelcomeScreenImageTop)),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 3000),
              top: splashController.animate.value ? 150 : 0,
              left: splashController.animate.value ? 0 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(tSlashImage),
                      width: width * 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      tWelcomeTitle,
                      style: GoogleFonts.bungee(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 5, 95, 169)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: splashController.animate.value ? 0 : -40,
              right: splashController.animate.value ? 0 : -40,
              child: const Image(image: AssetImage(tWelcomeScreenImageTop)),
            ),
          ),
        ],
      ),
    );
  }
}
