import 'package:flutter/material.dart';
import 'package:project/src/constants/image_string.dart';

class DashboardTopSkinCancerModel {
  final String title;
  final String image;
  final String heading;
  final String subHeading;
  final String videoUrl;
  final VoidCallback? onPress;

  DashboardTopSkinCancerModel(this.title, this.image, this.heading,
      this.subHeading, this.videoUrl, this.onPress);

  static List<DashboardTopSkinCancerModel> list = [
    DashboardTopSkinCancerModel("Signs of Skin cancer", tBanner1, '1 Section',
        "Skin cancer detection", 'assets/videos/video1.mp4', null),
    DashboardTopSkinCancerModel("How to prevent skin cancer", tBanner5,
        '1 Section', "Skin cancer detection", 'assets/videos/video2.mp4', null),
    DashboardTopSkinCancerModel(
        "How can protect the skin cancer",
        tBanner6,
        '1 Section2',
        "Skin cancer detection",
        'assets/videos/video3.mp4',
        null),
  ];
}
