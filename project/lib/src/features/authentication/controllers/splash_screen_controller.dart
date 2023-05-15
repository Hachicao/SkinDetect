import 'package:get/get.dart';
import 'package:project/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

// ignore: camel_case_types
class splashScreenController extends GetxController {
  static splashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(OnBoardingScreen());
  }
}
