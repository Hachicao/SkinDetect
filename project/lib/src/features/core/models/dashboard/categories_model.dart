import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/image_string.dart';
import 'package:project/src/features/core/screens/calendar/calendar_screen.dart';

class DashboardCategoriesModel {
  final String imageTitle;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
      this.imageTitle, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel(tSearchInfor, "History", "Check", null),
    DashboardCategoriesModel(tCalendar, "Calendar", "Check", () {
      Get.to(() => const CalendarScreen());
    }),
  ];
}


