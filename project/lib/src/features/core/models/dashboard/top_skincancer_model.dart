import 'package:flutter/material.dart';
import 'package:project/src/constants/image_string.dart';

class DashboardTopSkinCancerModel {
  final String title;
  final String image;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardTopSkinCancerModel(
      this.title, this.image, this.heading, this.subHeading, this.onPress);

  static List<DashboardTopSkinCancerModel> list = [
    DashboardTopSkinCancerModel("Signs of Skin cancer", tBanner1, '3 Sections',
        "Skin cancer detection", null),
    DashboardTopSkinCancerModel("How can protect the skin cancer", tBanner1,
        '3 Sections', "Skin cancer detection", null),
    DashboardTopSkinCancerModel("How can protect the skin cancer", tBanner1,
        '3 Sections', "Skin cancer detection", null),
    DashboardTopSkinCancerModel("How can protect the skin cancer", tBanner1,
        '3 Sections', "Skin cancer detection", null),
  ];
}
