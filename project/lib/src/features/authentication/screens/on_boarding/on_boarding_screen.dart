import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:project/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:project/src/features/core/screens/detect/before_skin_detect_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  AnimationController? _forwardController;

  @override
  void initState() {
    super.initState();
    _forwardController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1));
    _startAnimation();
  }

  @override
  void dispose() {
    _forwardController?.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _forwardController?.reset();
    _forwardController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    // pages that will change when click
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            liquidController: obController.controller,
            onPageChangeCallback: obController.OnPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                obController.animateToNextSlide();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: TextButton(
              onPressed: () {
                Get.offAll(() => BeforeSkinDetectScreen());
              },
              child: Row(
                children: [
                  const Text(
                    "Continue as guest",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 20,
                    onPressed: () {
                      _startAnimation();
                      Get.offAll(() => BeforeSkinDetectScreen());
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Lottie.asset(Icons8.tap,
                          height: 50,
                          width: 50,
                          controller: _forwardController),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //animation
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: obController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Colors.black, dotHeight: 5.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
