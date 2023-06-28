import 'package:flutter/material.dart';
import 'package:project/src/constants/image_string.dart';

class DashboardCategoriesModel {
  final String imageTitle;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
      this.imageTitle, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel(tAlgorithsm, "Algorithm", "Choose", null),
    DashboardCategoriesModel(
        tSearchInfor, "Looking for some symptoms", "Choose", null),
    DashboardCategoriesModel(tSearchInfor, "History", "Choose", null),
    DashboardCategoriesModel(tSearchInfor, "History", "Choose", null),
  ];
}
