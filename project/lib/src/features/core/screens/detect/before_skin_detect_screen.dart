import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/authentication/models/model_on_boarding.dart';
import 'package:project/src/features/authentication/screens/login/login_screen.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/controllers/user_controller.dart';

class BeforeSkinDetectScreen extends StatelessWidget {
  BeforeSkinDetectScreen({super.key});
  final List<OnBoardingModel> items = [
    OnBoardingModel(
      images: tOnBoardingImage1,
      title: tOnBoardingTitle1,
      subTitle: tOnBoardingSubTitle1,
      counterText: tOnBoardingCounter1,
      bgColor: tOnBoardingPage1Color,
    ),
    OnBoardingModel(
      images: tOnBoardingImage4,
      title: tOnBoardingTitle2,
      subTitle: tOnBoardingSubTitle2,
      counterText: tOnBoardingCounter2,
      bgColor: tOnBoardingPage3Color,
    ),
    OnBoardingModel(
      images: tOnBoardingImage5,
      title: tOnBoardingTitle3,
      subTitle: tOnBoardingSubTitle3,
      counterText: tOnBoardingCounter3,
      bgColor: tOnBoardingPage2Color,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Initialize the SkinDetectController
    final SkinDetectController imageController =
        Get.put(SkinDetectController());
    final UserController userController = Get.find<UserController>();
    final size = MediaQuery.of(context).size;
    final userModel = userController.getUserModel;
    final userId = userModel?.userId.toString();
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[50],
        title: const Text('Full check-up',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Get a full body skin',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                    'Self-Exam now!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: items
                .map((item) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: item.bgColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage(item.images),
                            height: 200,
                          ),
                          Column(
                            children: [
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                item.subTitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (userId != null) {
                  imageController.showImageSourceDialog();
                } else {
                  if (imageController.count.value <= 3) {
                    imageController.showImageSourceDialog();
                    print(" count ${imageController.count.value}");
                  } else {
                    Get.defaultDialog(
                      title:
                          'You have completed the full body skin self-exam of Guest!',
                      middleText:
                          'Sign in or Register if you want to have more experience!',
                      textConfirm: 'OK',
                      textCancel: 'Cancel',
                      onConfirm: () {
                        Get.to(() => const LoginScreen());
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  }
                }
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Start',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
