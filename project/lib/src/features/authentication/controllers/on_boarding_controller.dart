import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/color.dart';
import '../../../constants/image_string.dart';
import '../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      images: tOnBoardingImage1,
      title: tOnBoardingTitle1,
      subTitle: tOnBoardingSubTitle1,
      counterText: tOnBoardingCounter1,
      bgColor: tOnBoardingPage1Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      images: tOnBoardingImage4,
      title: tOnBoardingTitle2,
      subTitle: tOnBoardingSubTitle2,
      counterText: tOnBoardingCounter2,
      bgColor: tOnBoardingPage3Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      images: tOnBoardingImage5,
      title: tOnBoardingTitle3,
      subTitle: tOnBoardingSubTitle3,
      counterText: tOnBoardingCounter3,
      bgColor: tOnBoardingPage2Color,
    )),
  ];

  OnPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;

  Skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.jumpToPage(page: nextPage);
  }
}
