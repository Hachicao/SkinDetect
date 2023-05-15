import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:project/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                  side: const BorderSide(color: Colors.black),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white),
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
              onPressed: () => obController.Skip(),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 20),
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
                )),
          )
        ],
      ),
    );
  }
}
